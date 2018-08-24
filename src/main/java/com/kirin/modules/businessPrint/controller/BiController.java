package com.kirin.modules.businessPrint.controller;

import com.itextpdf.kernel.events.Event;
import com.itextpdf.kernel.events.IEventHandler;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.Canvas;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import com.kirin.common.print.PdfUtil;
import com.kirin.common.utils.*;
import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.entity.PrdDataEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.baseData.service.PrdDataService;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sales.entity.ProductionOrderEntity;
import com.kirin.modules.sales.service.ProductionOrderDetailService;
import com.kirin.modules.sales.service.ProductionOrderService;
import com.kirin.modules.storage.service.OutportDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.*;

@RestController
@RequestMapping("/businessPrint/biSearch")
public class BiController {
    protected PdfFont pdfFont = null;
    protected class Footer implements IEventHandler {

        String footMsg = "";

        @Override
        public void handleEvent(Event event) {

            PdfDocumentEvent docEvent = (PdfDocumentEvent) event;
            PdfDocument pdf = docEvent.getDocument();

            int pages = pdf.getNumberOfPages();
//            System.out.println("-------->pages="+pages);

            PdfPage page = docEvent.getPage();
            Rectangle pageSize = page.getPageSize();
            PdfCanvas pdfCanvas = new PdfCanvas(page.getLastContentStream(), page.getResources(), pdf);
            Canvas canvas = new Canvas(pdfCanvas, pdf, pageSize).setFont(pdfFont);
            float x = (pageSize.getLeft() + pageSize.getRight()) / 2;
            float y = pageSize.getBottom() + 15;
            canvas.showTextAligned(
                    "第"+String.valueOf(pdf.getPageNumber(page))+"页/共"+pages+"页",
                    x, y, TextAlignment.CENTER);

            if(footMsg != null && !footMsg.equals("")){
                PdfCanvas pdfCanvas2 = new PdfCanvas(page.getLastContentStream(), page.getResources(), pdf);
                Canvas canvas2 = new Canvas(pdfCanvas2, pdf, pageSize).setFont(pdfFont);
                float x2 = (pageSize.getLeft() + pageSize.getRight()) / 2;
                float y2 = pageSize.getBottom() + 30;
                canvas2.showTextAligned(footMsg,x2, y2, TextAlignment.CENTER);
            }
        }
    }

    @Autowired
    CommonUtilService commonUtilService;
    @Autowired
    ProductionOrderService productionOrderService;
    @Autowired
    ProductionOrderDetailService productionOrderDetailService;
    @Autowired
    OutportDetailService outportDetailService;

    /**
     * 根据条件查询出原料的领料信息
     * @param params
     * @return
     */
    @RequestMapping(value="/DataSearchLL")
    public R DataSearchLL(@RequestParam Map<String, Object> params){
//        String createDate = "";
//        if(params.get("createDate") == null || params.get("createDate").toString().equals("")){
//            createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
//            params.put("createDate",createDate);
//        }

        List<Map> mtrList = new ArrayList<>();
        List<Map> returnList = new ArrayList<>();
        //已确认状态的订单才产生领料报表
        params.put("status",new String[]{"2"});
        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
        if(productionOrderEntityList != null && productionOrderEntityList.size() > 0){
            Map<String,Object> queryMap = new HashMap<>();
            for (ProductionOrderEntity productionOrderEntity : productionOrderEntityList) {   //遍历订单
                queryMap.clear();
                queryMap.put("productionOrderId",productionOrderEntity.getId());
                queryMap.put("takeStn", params.get("takeStn"));  //领料站点
                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
                for (ProductionOrderDetailEntity orderDetailEntity : productionOrderDetailEntityList) {    //遍历一个订单中的所有原料（包括半成品）
//                    List<Map> listData = commonUtilService.eachGetPrdMtr(orderDetailEntity.getPrdId(),Long.valueOf(orderDetailEntity.getAmount()),queryMap);
//                    allMtrList.addAll(listData);
                    List<Map> mapListTemp = findAllMtrByPrd2(orderDetailEntity.getPrdId(),Long.valueOf(params.get("takeStn").toString()),null,new BigDecimal(orderDetailEntity.getAmount()));//单各产品所需要的原料重量
                    mtrList.addAll(mapListTemp);


                }
            }

            //所有产品原料集合去重
            if(mtrList !=null && mtrList.size() > 0){
                Object[] objectArr = new CommonUtils().findRepeat(mtrList,"mtrId");
                if(objectArr != null && objectArr.length > 0) {//存在重复项
                    List<Map> mapListTemp = new CommonUtils().clearRepeat(mtrList, "mtrId");

                    for (int i = 0; i < objectArr.length; i++) {
                        Map mapObj = new HashMap();
                        BigDecimal count = new BigDecimal("0");
                        for (Map mapTemp : mtrList) {
                            if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
                                count = count.add(new BigDecimal(mapTemp.get("bomWgt").toString()));
                            }
                        }
                        for (Map mapTemp : mapListTemp) {
                            if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
                                mapTemp.put("bomWgt", count);
                            }
                        }
                    }
                    returnList.addAll(mapListTemp);
                }else{
                    returnList.addAll(mtrList);
                }
                //TODO --统计个原料当前库存数，换算重量
                for (Map tmp : returnList) {
                    Long mtrId = Long.valueOf(tmp.get("mtrId").toString());
                    List<Map> listMap = commonUtilService.inventorySearch(mtrId);
                    Object storeCount = listMap.get(0).get("STORE_COUNT");
                    tmp.put("storeCount", storeCount == null ? "0" : storeCount);
                    String formulaUnit = listMap.get(0).get("FORMULA_UNIT").toString();
                    tmp.put("formulaUnit", formulaUnit);


                    BigDecimal miniRate = new BigDecimal(tmp.get("miniRate") == null ? "1" : tmp.get("miniRate").toString());
                    BigDecimal orderWgt = new BigDecimal(tmp.get("bomWgt").toString());
                    orderWgt = orderWgt.divide(miniRate, 2, BigDecimal.ROUND_HALF_UP);
                    tmp.put("orderWgt", orderWgt);

                    BigDecimal purchaseRate = new BigDecimal(tmp.get("purchaseRate") == null ? "1" : tmp.get("purchaseRate").toString());
                    BigDecimal purchaseWgt = new BigDecimal(tmp.get("bomWgt").toString());
                    purchaseWgt = purchaseWgt.divide(miniRate.multiply(purchaseRate), 4, BigDecimal.ROUND_HALF_UP);
                    tmp.put("purchaseWgt", purchaseWgt);
                }

            }
        }
//        if(allMtrList.size() > 0){
//            returnList = commonUtilService.distinctListData(allMtrList);
//        }
        int total = 0;
        if(returnList != null && returnList.size() > 0){
            total = returnList.size();
        }
        Query query = new Query(params);
        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);
        return R.ok().put("page", pageUtil);
    }


    public List<Map> findAllMtrByPrd2(Long prdId,Long takeStnId,Long warehouseId,BigDecimal orderAmount){
        List<Map> mtrList = new ArrayList<>();
        BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdId);
        if(bomInfoEntity == null){
            return null;
        }

        List<Map> detailMapList = outportDetailService.queryMtrByPrdId(prdId,takeStnId,warehouseId);

        if(detailMapList != null && detailMapList.size() > 0){
            for (Map map : detailMapList) {
                BigDecimal grossWgt = new BigDecimal(map.get("mtrGrossWgt") == null ? "0" : map.get("mtrGrossWgt").toString());
                //半成品则循环进行计算
                if(map.get("semiFinished").equals("1")){//半成品
                    BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(Long.valueOf(map.get("mtrId").toString()));
                    BigDecimal detailPrdNetWgt = new BigDecimal(bomInfo.getSumNetWgt() == null ? "1" : bomInfo.getSumNetWgt().toString());
                    //计算所需要半成品的份数
                    //（【产品配方中半成品所需毛重】*【产品所需数量】）/【半成品配方单份净重】
                    BigDecimal cpoies = (grossWgt.multiply(orderAmount).setScale(4, BigDecimal.ROUND_HALF_UP)).divide(detailPrdNetWgt, 2, BigDecimal.ROUND_HALF_UP);//份数
                    List<Map> mapList = findAllMtrByPrd2(Long.valueOf(map.get("mtrId").toString()),takeStnId,warehouseId,cpoies);
                    if(mapList != null && mapList.size() > 0){
                        mtrList.addAll(mapList);
                    }

                }else{//原料则直接运算后存入集合
                    BigDecimal miniRate = new BigDecimal(map.get("miniRate")==null ? "1":map.get("miniRate").toString());
                    BigDecimal bomWgt = (grossWgt.multiply(orderAmount).setScale(4, BigDecimal.ROUND_HALF_UP));  //.divide(miniRate,2,BigDecimal.ROUND_HALF_UP);
                    //需求重量需要转换为库存单位重量，需求重量=重量/原料最小转换率
//                    System.out.println(bomWgt);
                    //配方重量
                    map.put("bomWgt", bomWgt);
                    mtrList.add(map);
                }
            }
        }
        //重复的原料进行累加，形成唯一结果集
        List<Map> returnList = new ArrayList<>();
        if(mtrList !=null && mtrList.size() > 0){
            Object[] objectArr = new CommonUtils().findRepeat(mtrList,"mtrId");
            if(objectArr != null && objectArr.length > 0) {//存在重复项
                List<Map> mapListTemp = new CommonUtils().clearRepeat(mtrList, "mtrId");

                for (int i = 0; i < objectArr.length; i++) {
                    Map mapObj = new HashMap();
                    BigDecimal count = new BigDecimal("0");
                    for (Map mapTemp : mtrList) {
                        if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
                            count = count.add(new BigDecimal(mapTemp.get("bomWgt").toString()));
                        }
                    }
                    for (Map mapTemp : mapListTemp) {
                        if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
                            mapTemp.put("bomWgt", count);
                        }
                    }
                }
                returnList.addAll(mapListTemp);
            }else{
                returnList.addAll(mtrList);
            }
        }
        return returnList;
    }

    public List<Map> findAllMtrByPrd3(Map<String, Object> params) {
        List<Map> mtrList = new ArrayList<>();
        List<Map> returnList = new ArrayList<>();
        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
        if (productionOrderEntityList != null && productionOrderEntityList.size() > 0) {
            Map<String, Object> queryMap = new HashMap<>();
            for (ProductionOrderEntity productionOrderEntity : productionOrderEntityList) {   //遍历订单
                queryMap.clear();
                queryMap.put("productionOrderId", productionOrderEntity.getId());
                queryMap.put("takeStn", params.get("takeStn"));  //领料站点
                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
                for (ProductionOrderDetailEntity orderDetailEntity : productionOrderDetailEntityList) {    //遍历一个订单中的所有原料（包括半成品）
//                    List<Map> listData = commonUtilService.eachGetPrdMtr(orderDetailEntity.getPrdId(),Long.valueOf(orderDetailEntity.getAmount()),queryMap);
//                    allMtrList.addAll(listData);
                    List<Map> mapListTemp = findAllMtrByPrd2(orderDetailEntity.getPrdId(), Long.valueOf(params.get("takeStn").toString()), null, new BigDecimal(orderDetailEntity.getAmount()));//单各产品所需要的原料重量
                    mtrList.addAll(mapListTemp);


                }
            }

            //所有产品原料集合去重
            if (mtrList != null && mtrList.size() > 0) {
                Object[] objectArr = new CommonUtils().findRepeat(mtrList, "mtrId");
                if (objectArr != null && objectArr.length > 0) {//存在重复项
                    List<Map> mapListTemp = new CommonUtils().clearRepeat(mtrList, "mtrId");

                    for (int i = 0; i < objectArr.length; i++) {
                        Map mapObj = new HashMap();
                        BigDecimal count = new BigDecimal("0");
                        for (Map mapTemp : mtrList) {
                            if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
                                count = count.add(new BigDecimal(mapTemp.get("bomWgt").toString()));
                            }
                        }
                        for (Map mapTemp : mapListTemp) {
                            if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
                                mapTemp.put("bomWgt", count);
                            }
                        }
                    }
                    returnList.addAll(mapListTemp);
                } else {
                    returnList.addAll(mtrList);
                }
                //TODO --统计个原料当前库存数，换算重量
                for (Map tmp : returnList) {
                    Long mtrId = Long.valueOf(tmp.get("mtrId").toString());
                    List<Map> listMap = commonUtilService.inventorySearch(mtrId);
                    Object storeCount = listMap.get(0).get("STORE_COUNT");
                    tmp.put("storeCount", storeCount == null ? "0" : storeCount);
//                    String formulaUnit = listMap.get(0).get("FORMULA_UNIT").toString();
//                    tmp.put("formulaUnit", formulaUnit);


                    BigDecimal miniRate = new BigDecimal(tmp.get("miniRate") == null ? "1" : tmp.get("miniRate").toString());
                    BigDecimal orderWgt = new BigDecimal(tmp.get("bomWgt").toString());
                    orderWgt = orderWgt.divide(miniRate, 2, BigDecimal.ROUND_HALF_UP);
                    tmp.put("orderWgt", orderWgt);

                    BigDecimal purchaseRate = new BigDecimal(tmp.get("purchaseRate") == null ? "1" : tmp.get("purchaseRate").toString());
                    BigDecimal purchaseWgt = new BigDecimal(tmp.get("bomWgt").toString());
                    purchaseWgt = purchaseWgt.divide(miniRate.multiply(purchaseRate), 4, BigDecimal.ROUND_HALF_UP);
                    tmp.put("purchaseWgt", purchaseWgt);
                }

            }
        }
//        if(allMtrList.size() > 0){
//            returnList = commonUtilService.distinctListData(allMtrList);
//        }
        int total = 0;
        if (returnList != null && returnList.size() > 0) {
            total = returnList.size();
        }
        return returnList;
    }

    @RequestMapping(value="/PrintLL")
    public void PrintLL(HttpServletRequest request, HttpServletResponse response, @RequestParam("demandDate") String demandDate,
                        @RequestParam("createDate") String createDate, @RequestParam(value = "takeStn", required = false) String takeStn,
                        @RequestParam(value = "orderNo", required = false) String orderNo, @RequestParam(value = "typeId") String typeId) throws Exception {

//        if(createDate == null || createDate.equals("")){
//            createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
//        }

        String takeStnName = takeStn.equals("0") ? "空" : commonUtilService.getDataToCommbox("tb_type_info", "ID=" + takeStn, "TYPE_NAME").get(0).get("TYPE_NAME").toString();

        //查询数据
//        List<Map> allMtrList = new ArrayList<>();
        List<Map> returnList = new ArrayList<>();
        //已确认状态的订单才产生领料报表
        Map<String, Object> params = new HashMap<>();
        params.put("status",new String[]{"2"});
        if (!createDate.equals("null")) {
            params.put("createDate", createDate);
        }
        if (!demandDate.equals("null")) {
            params.put("demandDate", demandDate);
        }
        if (!orderNo.equals("null")) {
            params.put("productionNo", orderNo);
        }
        params.put("typeId", typeId);
        params.put("takeStn",takeStn);
//        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
//        if(productionOrderEntityList != null && productionOrderEntityList.size() > 0){
//            Map<String,Object> queryMap = new HashMap<>();
//            for (ProductionOrderEntity productionOrderEntity:productionOrderEntityList) {
//                queryMap.clear();
//                queryMap.put("productionOrderId",productionOrderEntity.getId());
//                queryMap.put("takeStn",takeStn);
//                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
//                for (ProductionOrderDetailEntity orderDetailEntity:productionOrderDetailEntityList){
//                    List<Map> listData = commonUtilService.eachGetPrdMtr(orderDetailEntity.getPrdId(),Long.valueOf(orderDetailEntity.getAmount()),queryMap);
//                    allMtrList.addAll(listData);
//                }
//
//            }
//        }
//        System.out.println("allMtrListSize: "+allMtrList.size());
//        if(allMtrList.size() > 0){
//            returnList = commonUtilService.distinctListData(allMtrList);
//        }

        returnList = findAllMtrByPrd3(params);

        pdfFont = new PdfUtil().createFont(request);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/pdf;charset=utf-8");
        //处理中文问题
        PdfUtil.helvetica = new PdfUtil().createFont(request);
        PdfWriter writer = new PdfWriter(response.getOutputStream());
        //Initialize PDF document
        PdfDocument pdf = new PdfDocument(writer);
        BiController.Footer footer = new BiController.Footer();
        footer.footMsg = "仓管：                                部门主管：                                领料人：                               ";
        pdf.addEventHandler(PdfDocumentEvent.END_PAGE, footer);

        Document document = new Document(pdf,new PageSize(PageSize.A4).rotate());
//        Document document = new Document(pdf,new PageSize(PageSize.A3).rotate());

        //加载表格数据
        Paragraph p = new Paragraph("领料报表").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(16);
        document.add(p);
        //副标题
        document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(9));

        Table table = new Table(new float[]{4,5,1}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
        Cell cell1 = new Cell().add(new Paragraph("需求日期：" + (demandDate.equals("null") ? "空" : demandDate))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);//向表格添加内容
//        Cell cell2=new Cell().add(new Paragraph("所属仓库：")).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        Cell cell3=new Cell().add(new Paragraph("打印时间："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        Cell cell4 = new Cell().add(new Paragraph("领料站点：" + takeStnName)).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        table.addCell(cell1);
//        table.addCell(cell2);
        table.addCell(cell4);
        table.addCell(cell3);

        document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

        UnitValue[] unitValue = new UnitValue[]{
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 15),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 7),
                UnitValue.createPercentValue((float) 9),
                UnitValue.createPercentValue((float) 9),
                UnitValue.createPercentValue((float) 9),
                UnitValue.createPercentValue((float) 15),
                UnitValue.createPercentValue((float) 9),
                UnitValue.createPercentValue((float) 7)};
        Table table2 = new Table(unitValue).setWidthPercent(100);

        table2.addHeaderCell("原料编号").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("原料名称").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("需求量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("锅数").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("单锅量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("不足锅量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("品名").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("总用量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);

        if(returnList.size() > 0){
            for (Map dataMap :returnList) {
                table2.addCell(dataMap.get("mtrCode") == null ? "" : dataMap.get("mtrCode").toString()).setTextAlignment(TextAlignment.CENTER);
                table2.addCell(dataMap.get("mtrName") == null ? "" : dataMap.get("mtrName").toString()).setTextAlignment(TextAlignment.CENTER);
                table2.addCell(dataMap.get("orderWgt") == null ? "" : dataMap.get("orderWgt").toString()).setTextAlignment(TextAlignment.CENTER);
                table2.addCell(dataMap.get("outUnit") == null ? "" : dataMap.get("outUnit").toString()).setTextAlignment(TextAlignment.RIGHT);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER);
                table2.addCell(dataMap.get("outUnit") == null ? "" : dataMap.get("outUnit").toString()).setTextAlignment(TextAlignment.RIGHT);
            }
        }

        document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));

        document.close();
        writer.close();
        pdf.close();
    }


    /**
     * 根据条件查询前处理作业数据：半成品
     * @param params：订单日期，订单号，生产站点
     * @return
     */
    @RequestMapping(value="/DataSearchQCLZY")
    public R DataSearchQCLZY(@RequestParam Map<String, Object> params){
        List<Map> returnList = searchQCLZY(params);

        int total = 0;
        if(returnList != null && returnList.size() > 0){
            total = returnList.size();
        }
        Query query = new Query(params);
        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);
        return R.ok().put("page", pageUtil);
    }

    public List<Map> searchQCLZY(Map<String, Object> params) {

        Long takeStn = params.get("takeStn") == null ? null : (Long.valueOf(params.get("takeStn").toString()));
        List<Map> returnList = new ArrayList<>();
        HashMap<String, Map> returnMap = new HashMap<>();
        //已确认状态的订单才产生领料报表
        params.put("status", new String[]{"2"});
        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
        if (productionOrderEntityList != null && productionOrderEntityList.size() > 0) {
            Map<String, Object> queryMap = new HashMap<>();
            for (ProductionOrderEntity productionOrderEntity : productionOrderEntityList) {
                queryMap.clear();
                queryMap.put("productionOrderId", productionOrderEntity.getId());
//                queryMap.put("takeStn",params.get("takeStn"));
                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
                for (ProductionOrderDetailEntity orderDetailEntity : productionOrderDetailEntityList) {
                    DataSearchQCLZYHelp(returnMap, orderDetailEntity.getPrdId(), new BigDecimal(orderDetailEntity.getAmount()), takeStn);
                }
            }
        }
        if (returnMap.size() > 0) {
            returnList.addAll(returnMap.values());
        }
        return returnList;
    }

    private void DataSearchQCLZYHelp(HashMap<String, Map> returnMap, Long prdId, BigDecimal orderAmount, Long takeStnId) {
//        List<Map> mtrList = new ArrayList<>();
        BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdId);
        if (bomInfoEntity == null) {
            return;
        }

        List<Map> detailMapList = outportDetailService.queryMtrByPrdId(prdId, takeStnId, null);

        if (detailMapList != null && detailMapList.size() > 0) {
            for (Map map : detailMapList) {
                BigDecimal grossWgt = new BigDecimal(map.get("mtrGrossWgt") == null ? "0" : map.get("mtrGrossWgt").toString());
                //半成品则循环进行计算
                if (map.get("semiFinished").equals("1")) {//半成品
                    BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(Long.valueOf(map.get("mtrId").toString()));
                    BigDecimal detailPrdNetWgt = new BigDecimal(bomInfo.getSumNetWgt() == null ? "1" : bomInfo.getSumNetWgt().toString());
                    //计算所需要半成品的份数
                    //（【产品配方中半成品所需毛重】*【产品所需数量】）/【半成品配方单份净重】
                    BigDecimal cpoies = (grossWgt.multiply(orderAmount).setScale(4, BigDecimal.ROUND_HALF_UP)).divide(detailPrdNetWgt, 2, BigDecimal.ROUND_HALF_UP);//份数
//                    List<Map> mapList = findAllMtrByPrd2(Long.valueOf(map.get("mtrId").toString()),takeStnId,warehouseId,cpoies);
                    DataSearchQCLZYHelp(returnMap, Long.valueOf(map.get("mtrId").toString()), cpoies, takeStnId);
//                    if(mapList != null && mapList.size() > 0){
//                        mtrList.addAll(mapList);
//                    }

                } else {//原料则直接运算后存入集合
                    Object mtrCut = map.get("mtrCut");
                    if (mtrCut == null) {
                        //没有切割形状，
                        continue;
                    }
                    BigDecimal miniRate = new BigDecimal(map.get("miniRate") == null ? "1" : map.get("miniRate").toString());
                    BigDecimal bomWgt = (grossWgt.multiply(orderAmount).setScale(4, BigDecimal.ROUND_HALF_UP));  //.divide(miniRate,2,BigDecimal.ROUND_HALF_UP);
                    //需求重量需要转换为库存单位重量，需求重量=重量/原料最小转换率
//                    System.out.println(bomWgt);
                    //配方重量
                    map.put("bomWgt", bomWgt);
                    String key = map.get("mtrName").toString() + (mtrCut == null ? "" : mtrCut.toString());
                    map.put("key", key);
                    if (returnMap.containsKey(key)) {
                        BigDecimal wgt = new BigDecimal(returnMap.get(key).get("bomWgt").toString());
                        wgt.add(bomWgt);
                        returnMap.get(key).put("bomWgt", wgt);
                    } else {
                        returnMap.put(key, map);
                    }
                }
            }
        }
    }

//    @RequestMapping(value="/DataSearchDetailQCLZY")
//    public R DataSearchDetailQCLZY(@RequestParam Map<String, Object> params){
//        List<Map> returnList = searchDetailQCLZY(params);
//        int total = 0;
//        if(returnList != null && returnList.size() > 0){
//            total = returnList.size();
//        }
//        Query query = new Query(params);
//        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);
//        return R.ok().put("page", pageUtil);
//    }
//
//    public List<Map> searchDetailQCLZY(Map<String,Object> params) {
//        List<Map> returnList = new ArrayList<>();
//
//        Long prdId = Long.valueOf(params.get("prdId").toString());
//        Long prdCount = Long.valueOf(params.get("prdCount").toString());
//
//        List<Map> listData = commonUtilService.eachGetPrdMtr(prdId,prdCount,params);
//        if(listData.size() > 0){
//            returnList = commonUtilService.distinctListData(listData);
//        }
//
//        return returnList;
//    }

    @RequestMapping(value="/PrintQCLZY")
    public void PrintQCLZY(HttpServletRequest request, HttpServletResponse response, @RequestParam("createDate") String createDate, @RequestParam(value = "takeStn") String takeStn, @RequestParam(value = "orderNo", required = false) String orderNo) throws Exception {

//        if(createDate == null || createDate.equals("")){
//            createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
//        }

        //已确认状态的订单才产生领料报表
        Map<String, Object> params = new HashMap<>();
        params.put("status",new String[]{"2"});
        params.put("createDate",createDate);
        params.put("takeStn", takeStn);
        params.put("productionNo",orderNo);
        String takeStnName = "";
        if (takeStn.equals("0")) {
            takeStnName = "空";
        } else {
            takeStnName = commonUtilService.getDataToCommbox("tb_type_info", "ID=" + takeStn, "TYPE_NAME").get(0).get("TYPE_NAME").toString();
        }

        //已确认状态的订单才产生领料报表
        List<Map> allPrdList = searchQCLZY(params);
//                new ArrayList<>();
//        HashMap<String, Map> returnMap = new HashMap<>();
//        params.put("status",new String[]{"2"});
//        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
//        if(productionOrderEntityList != null && productionOrderEntityList.size() > 0){
//            Map<String,Object> queryMap = new HashMap<>();
//            for (ProductionOrderEntity productionOrderEntity:productionOrderEntityList) {
//                queryMap.clear();
//                queryMap.put("productionOrderId",productionOrderEntity.getId());
////                queryMap.put("takeStn",params.get("takeStn"));
//                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
//                for (ProductionOrderDetailEntity orderDetailEntity:productionOrderDetailEntityList){
////                    List<Map> listData = commonUtilService.eachGetPrd(orderDetailEntity.getPrdId(),Long.valueOf(orderDetailEntity.getAmount()),queryMap);
////                    allPrdList.addAll(listData);
//                    DataSearchQCLZYHelp(returnMap, orderDetailEntity.getPrdId(), new BigDecimal(orderDetailEntity.getAmount()), null);
//                }
//            }
//        }
//        allPrdList.addAll(returnMap.values());

        pdfFont = new PdfUtil().createFont(request);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/pdf;charset=utf-8");
        //处理中文问题
        PdfUtil.helvetica = new PdfUtil().createFont(request);
        PdfWriter writer = new PdfWriter(response.getOutputStream());
        //Initialize PDF document
        PdfDocument pdf = new PdfDocument(writer);
        BiController.Footer footer = new BiController.Footer();
        footer.footMsg = "班组长：                                部门主管：                                ";
        pdf.addEventHandler(PdfDocumentEvent.END_PAGE, footer);

        Document document = new Document(pdf,new PageSize(PageSize.A4).rotate());
//        Document document = new Document(pdf,new PageSize(PageSize.A3).rotate());

        //加载表格数据
        Paragraph p = new Paragraph("前处理报表").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(16);
        document.add(p);
        //副标题
        document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(9));

        Table table = new Table(new float[]{4,5,1}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
        Cell cell1 = new Cell().add(new Paragraph("生产站点：" + takeStnName)).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell2=new Cell().add(new Paragraph("打印时间："+DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);

        document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

        UnitValue[] unitValue = new UnitValue[]{
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 15),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 15),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 5)};
        Table table2 = new Table(unitValue).setWidthPercent(100);

        table2.addHeaderCell("原料编号").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("品名").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("生产量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("配方单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("总锅数").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("单锅重").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("尾锅重").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("品名").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("总用量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);

        if(allPrdList.size() > 0){
            for (Map dataMap :allPrdList) {
                table2.addCell(dataMap.get("mtrCode") == null ? "" : dataMap.get("mtrCode").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(dataMap.get("key") == null ? "" : dataMap.get("key").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(dataMap.get("bomWgt") == null ? "" : dataMap.get("bomWgt").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(dataMap.get("formulaUnit") == null ? "" : dataMap.get("formulaUnit").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(dataMap.get("mtrName") == null ? "" : dataMap.get("mtrName").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell(dataMap.get("bomWgt") == null ? "" : dataMap.get("bomWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell(dataMap.get("formulaUnit") == null ? "" : dataMap.get("formulaUnit").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
//                orderCount
//                Long prdId = Long.valueOf(dataMap.get("prdId").toString());
//                Long prdCount = Long.valueOf(dataMap.get("orderCount").toString());
//                List<Map> returnList = new ArrayList<>();
//                List<Map> listData = commonUtilService.eachGetPrdMtr(prdId,prdCount,params);
//                if(listData.size() > 0){
//                    returnList = commonUtilService.distinctListData(listData);
//                }
//                for (Map dataMtrDetailMap :returnList) {
//                    table2.addCell("").setTextAlignment(TextAlignment.CENTER);
//                    table2.addCell(dataMtrDetailMap.get("mtrName") == null ? "" : dataMtrDetailMap.get("mtrName").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
//                    table2.addCell(dataMtrDetailMap.get("formulaUnitName") == null ? "" : dataMtrDetailMap.get("formulaUnitName").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
//                    table2.addCell(dataMtrDetailMap.get("netWgt") == null ? "" : dataMtrDetailMap.get("netWgt").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
//                    table2.addCell("").setTextAlignment(TextAlignment.RIGHT);
//                    table2.addCell(dataMtrDetailMap.get("grossWgt") == null ? "" : dataMtrDetailMap.get("grossWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
//                    table2.addCell(dataMtrDetailMap.get("cookedWgt") == null ? "" : dataMtrDetailMap.get("cookedWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
//
//                    table2.addCell("").setTextAlignment(TextAlignment.RIGHT);
//                    table2.addCell("").setTextAlignment(TextAlignment.RIGHT);
//                    table2.addCell("").setTextAlignment(TextAlignment.RIGHT);
//                    table2.addCell("").setTextAlignment(TextAlignment.RIGHT);
//                    table2.addCell("").setTextAlignment(TextAlignment.CENTER);
//                }
            }
        }

        document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));

        document.close();
        writer.close();
        pdf.close();
    }

    @RequestMapping(value="/DataSearchPLFX")
    public R DataSearchPLFX(@RequestParam Map<String, Object> params){
//        String createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
//        if(params.get("createDate") != null && !params.get("createDate").toString().equals("")){
//            createDate = params.get("createDate").toString();
//        }
//        params.put("createDate",createDate);
        //已确认状态的订单
        params.put("status",new String[]{"2"});

        List<Map> returnList = searchPLFX(params);

        int total = 0;
        if(returnList.size() > 0){
            total = returnList.size();
        }
        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);
        return R.ok().put("page", pageUtil);
    }

    private void DataSearchPLFXHelp(HashMap<String, Map> returnMap, Long prdId, BigDecimal orderAmount, Integer pdcStn) {
        BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdId);
        if (bomInfoEntity == null) {
            return;
        }

        List<Map> detailMapList = outportDetailService.queryMtrByPrdId(prdId, null, null);
        if (detailMapList != null && detailMapList.size() > 0) {
            for (Map map : detailMapList) {
                BigDecimal grossWgt = new BigDecimal(map.get("mtrGrossWgt") == null ? "0" : map.get("mtrGrossWgt").toString());
                BigDecimal modiWgt = new BigDecimal(map.get("mtrModiWgt") == null ? "0" : map.get("mtrModiWgt").toString());
                //半成品则循环进行计算
                if (map.get("semiFinished").equals("1")) {//半成品
                    PrdDataEntity prdDataEntity = prdDataService.queryObject(Long.valueOf(map.get("mtrId").toString()));
                    if (pdcStn != 0 && !prdDataEntity.getPdcStn().equals(pdcStn)) {   //站点不为空且该产品的站点不等于查询站点，跳过
                        continue;
                    }

                    BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(Long.valueOf(map.get("mtrId").toString()));

                    BigDecimal detailPrdNetWgt = new BigDecimal(bomInfo.getSumNetWgt() == null ? "1" : bomInfo.getSumNetWgt().toString());
                    //计算所需要半成品的份数
                    //（【产品配方中半成品所需毛重】*【产品所需数量】）/【半成品配方单份净重】
                    BigDecimal cpoies = (grossWgt.multiply(orderAmount).setScale(4, BigDecimal.ROUND_HALF_UP)).divide(detailPrdNetWgt, 2, BigDecimal.ROUND_HALF_UP);//份数

                    //锅数 = 总毛重 / 锅重
                    BigDecimal potCount = grossWgt.multiply(orderAmount).divide(new BigDecimal(bomInfo.getPotWgt()), 4, BigDecimal.ROUND_HALF_UP);
                    map.put("potCount", potCount);

                    map.put("orderCount", cpoies);

                    map.put("mtrprdName", bomInfo.getBomName());
                    map.put("mtrprdCode", bomInfo.getPrdCode());


                    map.put("grossWgt", grossWgt.multiply(orderAmount));
                    map.put("modiWgt", modiWgt.multiply(orderAmount));
                    if (returnMap.containsKey(map.get("mtrId").toString())) {
                        BigDecimal tmp = new BigDecimal(returnMap.get(map.get("mtrId").toString()).get("grossWgt").toString());
                        tmp.add(grossWgt.multiply(orderAmount));
                        returnMap.get(map.get("mtrId").toString()).put("grossWgt", tmp);
                        BigDecimal tmp2 = new BigDecimal(returnMap.get(map.get("mtrId").toString()).get("modiWgt").toString());
                        tmp2.add(modiWgt.multiply(orderAmount));
                        returnMap.get(map.get("mtrId").toString()).put("modiWgt", tmp2);
                        BigDecimal tmp3 = new BigDecimal(returnMap.get(map.get("mtrId").toString()).get("orderCount").toString());
                        tmp3.add(cpoies);
                        returnMap.get(map.get("mtrId").toString()).put("orderCount", tmp3);

                        BigDecimal tmp4 = new BigDecimal(returnMap.get(map.get("mtrId").toString()).get("potCount").toString());
                        tmp4.add(potCount);
                        returnMap.get(map.get("mtrId").toString()).put("potCount", tmp4);

                    } else {
                        returnMap.put(map.get("mtrId").toString(), map);
                    }

                    DataSearchPLFXHelp(returnMap, Long.valueOf(map.get("mtrId").toString()), cpoies, pdcStn);
                } else {  //原料则直接返回
                    continue;
                }
            }
        }
    }

    public List<Map> searchPLFX(Map<String,Object> params){
        HashMap<String, Map> returnMap = new HashMap<>();
        Integer pdcStn = new Integer(params.get("pdcStn") == null ? "0" : params.get("pdcStn").toString());
        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
        if (productionOrderEntityList != null && productionOrderEntityList.size() > 0) {
            Map<String, Object> queryMap = new HashMap<>();
            for (ProductionOrderEntity productionOrderEntity : productionOrderEntityList) {
                queryMap.clear();
                queryMap.put("productionOrderId", productionOrderEntity.getId());
//                queryMap.put("takeStn",params.get("takeStn"));
                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
                for (ProductionOrderDetailEntity orderDetailEntity : productionOrderDetailEntityList) {
                    DataSearchPLFXHelp(returnMap, orderDetailEntity.getPrdId(), new BigDecimal(orderDetailEntity.getAmount()), pdcStn);
                }
            }
        }

        List<Map> returnList = new ArrayList<>();
        returnList.addAll(returnMap.values());
        return returnList;
    }

    @Autowired
    PrdDataService prdDataService;
    @Autowired
    BomInfoService bomInfoService;
    @Autowired
    BomDetailService bomDetailService;

    /**
     * 根据产品以及其数量来计算其配方中的各用量
     * @param params
     * @return
     */
    @RequestMapping(value="/DataSearchDetailPLFX")
    public R DataSearchDetailPLFX(@RequestParam Map<String, Object> params){

        List<Map> returnList = searchDetailPLFX(params);




        int total = 0;
        if(returnList != null && returnList.size() > 0){
            total = returnList.size();
        }
        Query query = new Query(params);
        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);

        return R.ok().put("page", pageUtil);
    }

    public List<Map> searchDetailPLFX(Map<String,Object> params){
        List<Map> returnList = new ArrayList<>();
        Long prdId = Long.valueOf(params.get("prdId").toString());
        //份数
        BigDecimal orderCount = new BigDecimal(params.get("prdCount").toString());
        List<Map> detailMapList = outportDetailService.queryMtrByPrdId(prdId, null, null);
        PrdDataEntity prdDataEntity = prdDataService.queryObject(prdId);

        if (detailMapList != null && detailMapList.size() > 0) {
            for (Map map : detailMapList) {
                BigDecimal netWgt = new BigDecimal(map.get("netWgt") == null ? "0" : map.get("netWgt").toString());

                map.put("totalWgt", netWgt.multiply(orderCount));
                //单锅重 = 原料净重/产品净重*单品单锅重
//                System.out.println(netWgt + " " + prdDataEntity.getPotWeight() + " " + prdDataEntity.getSumNetWgt());
                BigDecimal pot = netWgt.multiply(new BigDecimal(prdDataEntity.getPotWeight())).divide(new BigDecimal(prdDataEntity.getSumNetWgt()), 4, BigDecimal.ROUND_HALF_UP);
                map.put("pot", pot);
                //不足锅量
                BigDecimal lastPot = netWgt.multiply(orderCount).remainder(pot);
                map.put("lastPot", lastPot);

                if (map.get("semiFinished").equals("1")) {//半成品
                    BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(Long.valueOf(map.get("mtrId").toString()));
                    map.put("mtrName", bomInfo.getBomName());
                    map.put("mtrCode", bomInfo.getPrdCode());

                }
                returnList.add(map);
            }
        }
        return returnList;
    }


    @RequestMapping(value="/PrintPLFX")
    public void PrintPLFX(HttpServletRequest request, HttpServletResponse response, @RequestParam("createDate") String createDate, @RequestParam(value = "pdcStn") String pdcStn, @RequestParam(value = "orderNo", required = false) String orderNo) throws Exception {
//        if(createDate == null || createDate.equals("")){
//            createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
//        }

        //已确认状态的订单才产生领料报表
        Map<String, Object> params = new HashMap<>();
        params.put("status",new String[]{"2"});
        params.put("createDate",createDate);
        params.put("productionNo",orderNo);
        params.put("pdcStn", pdcStn);

        String pdcStnName = "";
        if (pdcStn.equals("0")) {
            pdcStnName = "空";
        } else {
            pdcStnName = commonUtilService.getDataToCommbox("tb_type_info", "ID=" + pdcStn, "TYPE_NAME").get(0).get("TYPE_NAME").toString();
        }
//        System.out.println(pdcStnName);
        //已确认状态的订单才产生领料报表
        List<Map> allPrdList = searchPLFX(params);

        pdfFont = new PdfUtil().createFont(request);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/pdf;charset=utf-8");
        //处理中文问题
        PdfUtil.helvetica = new PdfUtil().createFont(request);
        PdfWriter writer = new PdfWriter(response.getOutputStream());
        //Initialize PDF document
        PdfDocument pdf = new PdfDocument(writer);
        BiController.Footer footer = new BiController.Footer();
        footer.footMsg = "班组长：                                部门主管：                                ";
        pdf.addEventHandler(PdfDocumentEvent.END_PAGE, footer);

        Document document = new Document(pdf,new PageSize(PageSize.A4).rotate());
//        Document document = new Document(pdf,new PageSize(PageSize.A3).rotate());

        //加载表格数据
        Paragraph p = new Paragraph("产品用料分析报表").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(16);
        document.add(p);
        //副标题
        document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(9));

        Table table = new Table(new float[]{4,5,1}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
        Cell cell1 = new Cell().add(new Paragraph("生产站点：" + pdcStnName)).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell2=new Cell().add(new Paragraph("打印时间："+DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);

        document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

        UnitValue[] unitValue = new UnitValue[]{
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 15),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 15),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 5)};
        Table table2 = new Table(unitValue).setWidthPercent(100);

        table2.addHeaderCell("产品编号").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("品名").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("生产量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("锅数").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);

        table2.addHeaderCell("单锅量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("不足锅量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("品名").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("总用量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);

        if(allPrdList != null && allPrdList.size() > 0){
            for (Map prdMap:allPrdList) {
                table2.addCell(prdMap.get("mtrprdCode") == null ? "" : prdMap.get("mtrprdCode").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(prdMap.get("mtrprdName") == null ? "" : prdMap.get("mtrprdName").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(prdMap.get("modiWgt") == null ? "" : prdMap.get("modiWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell(prdMap.get("formulaUnit") == null ? "" : prdMap.get("formulaUnit").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell(prdMap.get("potCount") == null ? "" : prdMap.get("potCount").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);


                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);

                params.clear();
                params.put("prdId", prdMap.get("mtrId"));
                params.put("prdCount",prdMap.get("orderCount"));
                List<Map> detailList = searchDetailPLFX(params);
                if(detailList != null && detailList.size() > 0){
                    for (Map detailMap:detailList) {
                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);

                        table2.addCell(detailMap.get("pot") == null ? "" : detailMap.get("pot").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("lastPot") == null ? "" : detailMap.get("lastPot").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("mtrName") == null ? "" : detailMap.get("mtrName").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("totalWgt") == null ? "" : detailMap.get("totalWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("formulaUnit") == null ? "" : detailMap.get("formulaUnit").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                    }
                }
            }
        }

        document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));

        document.close();
        writer.close();
        pdf.close();
    }


    @RequestMapping(value = "/DataSearchCPBZ")
    public R DataSearchCPBZ(@RequestParam Map<String, Object> params) {
//        String createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
//        if(params.get("createDate") != null && !params.get("createDate").toString().equals("")){
//            createDate = params.get("createDate").toString();
//        }
//        params.put("createDate",createDate);
        //已确认状态的订单
        params.put("status", new String[]{"2"});

        List<Map> returnList = searchCPBZ(params);

        int total = 0;
        if (returnList.size() > 0) {
            total = returnList.size();
        }
        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);
        return R.ok().put("page", pageUtil);
    }

    /**
     * 根据产品以及其数量来计算其配方中的各用量
     *
     * @param params
     * @return
     */
    @RequestMapping(value = "/DataSearchDetailCPBZ")
    public R DataSearchDetailCPBZ(@RequestParam Map<String, Object> params) {

        List<Map> returnList = searchDetailCPBZ(params);


        int total = 0;
        if (returnList != null && returnList.size() > 0) {
            total = returnList.size();
        }
        Query query = new Query(params);
        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);

        return R.ok().put("page", pageUtil);
    }

    @RequestMapping(value = "/PrintCPBZ")
    public void PrintCPBZ(HttpServletRequest request, HttpServletResponse response, @RequestParam("createDate") String createDate, @RequestParam(value = "pdcStn") String pdcStn, @RequestParam(value = "orderNo", required = false) String orderNo) throws Exception {
//        if(createDate == null || createDate.equals("")){
//            createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
//        }

        //已确认状态的订单才产生领料报表
        Map<String, Object> params = new HashMap<>();
        params.put("status", new String[]{"2"});
        params.put("createDate", createDate);
        params.put("pdcStn", pdcStn);
        params.put("productionNo", orderNo);

        //已确认状态的订单才产生领料报表
        List<Map> allPrdList = searchCPBZ(params);
//        System.out.println("allPrdList = searchCPBZ(params): "+ allPrdList.size());

        pdfFont = new PdfUtil().createFont(request);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/pdf;charset=utf-8");
        //处理中文问题
        PdfUtil.helvetica = new PdfUtil().createFont(request);
        PdfWriter writer = new PdfWriter(response.getOutputStream());
        //Initialize PDF document
        PdfDocument pdf = new PdfDocument(writer);
        BiController.Footer footer = new BiController.Footer();
        footer.footMsg = "班组长：                                部门主管：                                ";
        pdf.addEventHandler(PdfDocumentEvent.END_PAGE, footer);

        Document document = new Document(pdf, new PageSize(PageSize.A4).rotate());
//        Document document = new Document(pdf,new PageSize(PageSize.A3).rotate());

        //加载表格数据
        Paragraph p = new Paragraph("产品组装分析报表").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(16);
        document.add(p);
        //副标题
        document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(9));

        Table table = new Table(new float[]{4, 5, 1}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
        Cell cell1 = new Cell().add(new Paragraph("生产站点：" + pdcStn)).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell2 = new Cell().add(new Paragraph("打印时间：" + DateUtils.format(new Date(), "yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);

        document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

        UnitValue[] unitValue = new UnitValue[]{
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 15),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 15),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 5)};
        Table table2 = new Table(unitValue).setWidthPercent(100);

        table2.addHeaderCell("产品编号").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("产品名称").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("生产量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("锅数").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("单锅量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("不足锅量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("品名").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("总用量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);

        if (allPrdList != null && allPrdList.size() > 0) {
            for (Map prdMap : allPrdList) {
                table2.addCell(prdMap.get("prdNo") == null ? "" : prdMap.get("prdNo").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(prdMap.get("prdName") == null ? "" : prdMap.get("prdName").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(prdMap.get("amount") == null ? "" : prdMap.get("amount").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(prdMap.get("unit") == null ? "" : prdMap.get("unit").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(prdMap.get("potCount") == null ? "" : prdMap.get("potCount").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);

                table2.addCell("").setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);

                params.clear();
                params.put("prdId", prdMap.get("prdId"));
                params.put("amount", prdMap.get("amount"));
                List<Map> detailList = searchDetailCPBZ(params);
                if (detailList != null && detailList.size() > 0) {
                    for (Map detailMap : detailList) {
                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.RIGHT).setFontSize(10);

                        table2.addCell(detailMap.get("pot") == null ? "" : detailMap.get("pot").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("lastPot") == null ? "" : detailMap.get("lastPot").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("mtrName") == null ? "" : detailMap.get("mtrName").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("totalWgt") == null ? "" : detailMap.get("totalWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("formulaUnit") == null ? "" : detailMap.get("formulaUnit").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                    }
                }
            }
        }

        document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));

        document.close();
        writer.close();
        pdf.close();
    }

    public List<Map> searchCPBZ(Map<String, Object> params) {
        HashMap<Long, Map> returnMap = new HashMap<>();
        Integer pdcStn = new Integer(params.get("pdcStn") == null ? "0" : params.get("pdcStn").toString());
        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
        if (productionOrderEntityList != null && productionOrderEntityList.size() > 0) {
            Map<String, Object> queryMap = new HashMap<>();
            for (ProductionOrderEntity productionOrderEntity : productionOrderEntityList) {
                queryMap.clear();
                queryMap.put("productionOrderId", productionOrderEntity.getId());
                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
                for (ProductionOrderDetailEntity orderDetailEntity : productionOrderDetailEntityList) {
                    PrdDataEntity prdDataEntity = prdDataService.queryObject(orderDetailEntity.getPrdId());
//                    System.out.println("pdcStn: " + pdcStn);
//                    System.out.println("pdcGetPdc: "+ prdDataEntity.getPdcStn());
//                    System.out.println(pdcStn!=0 && prdDataEntity.getPdcStn().equals(pdcStn));
                    if (pdcStn != 0 && !prdDataEntity.getPdcStn().equals(pdcStn)) {   //站点不为空且该产品的站点不等于查询站点，跳过
                        continue;
                    }
                    BigDecimal pot = new BigDecimal(prdDataEntity.getPotWeight());
                    BigDecimal netWgt = new BigDecimal(prdDataEntity.getSumNetWgt());
                    BigDecimal amount = new BigDecimal(orderDetailEntity.getAmount());
                    BigDecimal potCount = netWgt.multiply(amount).divide(pot, 4, BigDecimal.ROUND_HALF_UP);
                    if (returnMap.containsKey(orderDetailEntity.getPrdId())) {
                        //集合中已存在改产品，合并数量即可
                        amount.add(new BigDecimal(returnMap.get(orderDetailEntity.getPrdId()).get("amount").toString()));
                        returnMap.get(orderDetailEntity.getPrdId()).put("amount", amount);
                        potCount.add(new BigDecimal(returnMap.get(orderDetailEntity.getPrdId()).get("potCount").toString()));
                        returnMap.get(orderDetailEntity.getPrdId()).put("potCount", potCount);
                    } else {
                        //集合中不存在该产品
                        Map tmp = new HashMap();
                        tmp.put("prdId", orderDetailEntity.getPrdId());
                        tmp.put("prdNo", orderDetailEntity.getPrdNo());
                        tmp.put("prdName", orderDetailEntity.getPrdName());
                        tmp.put("amount", amount);
                        tmp.put("unit", "份");
                        tmp.put("potCount", potCount);
                        returnMap.put(orderDetailEntity.getPrdId(), tmp);

                    }
                }
            }
        }

        List<Map> returnList = new ArrayList<>();
        returnList.addAll(returnMap.values());
        return returnList;
    }

    public List<Map> searchDetailCPBZ(Map<String, Object> params) {
        List<Map> returnList = new ArrayList<>();

        Long prdId = Long.valueOf(params.get("prdId").toString());
        //份数
        BigDecimal amount = new BigDecimal(params.get("amount").toString());
        List<Map> detailMapList = outportDetailService.queryMtrByPrdId(prdId, null, null);
        PrdDataEntity prdDataEntity = prdDataService.queryObject(prdId);
        if (detailMapList != null && detailMapList.size() > 0) {
            for (Map map : detailMapList) {
                BigDecimal netWgt = new BigDecimal(map.get("netWgt") == null ? "0" : map.get("netWgt").toString());

                map.put("totalWgt", netWgt.multiply(amount));
                //单锅重 = 原料净重/产品净重*单品单锅重
//                System.out.println(netWgt + " " + prdDataEntity.getPotWeight() + " " + prdDataEntity.getSumNetWgt());
                BigDecimal pot = netWgt.multiply(new BigDecimal(prdDataEntity.getPotWeight())).divide(new BigDecimal(prdDataEntity.getSumNetWgt()), 4, BigDecimal.ROUND_HALF_UP);
                map.put("pot", pot);
                //不足锅量
                BigDecimal lastPot = netWgt.multiply(amount).remainder(pot);
                map.put("lastPot", lastPot);

                if (map.get("semiFinished").equals("1")) {//半成品
                    BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(Long.valueOf(map.get("mtrId").toString()));
                    map.put("mtrName", bomInfo.getBomName());
                    map.put("mtrCode", bomInfo.getPrdCode());
                } else {    //原料
                    if (map.get("mtrCut") != null) {
                        String name = map.get("mtrName").toString() + "（" + map.get("mtrCut").toString() + "）";
                        map.put("mtrName", name);
                    }
                }

                returnList.add(map);
            }
        }
        return returnList;
    }

}
