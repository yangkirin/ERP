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
            System.out.println("-------->pages="+pages);

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
                    BigDecimal detailPrdGrossWgt = new BigDecimal(bomInfo.getSumGrossWgt() == null ? "1" : bomInfo.getSumGrossWgt().toString());
                    //计算所需要半成品的份数
                    //（【产品配方中半成品所需毛重】*【产品所需数量】）/【半成品配方单份毛重】
                    BigDecimal cpoies = (grossWgt.multiply(orderAmount).setScale(4,BigDecimal.ROUND_HALF_UP)).divide(detailPrdGrossWgt,2,BigDecimal.ROUND_HALF_UP);//份数
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
        String createDate = "";
        if(params.get("createDate") == null || params.get("createDate").toString().equals("")){
            createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
            params.put("createDate",createDate);
        }

//        List<Map> allPrdList = new ArrayList<>();
        List<Map> returnList = new ArrayList<>();
        HashMap<String, Map> returnMap = new HashMap<>();
        //已确认状态的订单才产生领料报表
        params.put("status",new String[]{"2"});
        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
        if(productionOrderEntityList != null && productionOrderEntityList.size() > 0){
            Map<String,Object> queryMap = new HashMap<>();
            for (ProductionOrderEntity productionOrderEntity:productionOrderEntityList) {
                queryMap.clear();
                queryMap.put("productionOrderId",productionOrderEntity.getId());
//                queryMap.put("takeStn",params.get("takeStn"));
                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
//                System.out.println("size: "+productionOrderDetailEntityList.size());
                for (ProductionOrderDetailEntity orderDetailEntity:productionOrderDetailEntityList){
//                    List<Map> listData = commonUtilService.eachGetPrd(orderDetailEntity.getPrdId(),Long.valueOf(orderDetailEntity.getAmount()),queryMap);
//                    allPrdList.addAll(listData);
                    DataSearchQCLZYHelp(returnMap, orderDetailEntity.getPrdId(), new BigDecimal(orderDetailEntity.getAmount()), null);
                }
            }
        }
//        System.out.println(returnMap.size());
//
//        System.out.println(returnMap.values().toString());

        if (returnMap.size() > 0) {
//            returnList = commonUtilService.distinctListData(allPrdList);
            returnList.addAll(returnMap.values());
        }
        int total = 0;
        if(returnList != null && returnList.size() > 0){
            total = returnList.size();
        }
        Query query = new Query(params);
        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);
        return R.ok().put("page", pageUtil);
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
                    BigDecimal detailPrdGrossWgt = new BigDecimal(bomInfo.getSumGrossWgt() == null ? "1" : bomInfo.getSumGrossWgt().toString());
                    //计算所需要半成品的份数
                    //（【产品配方中半成品所需毛重】*【产品所需数量】）/【半成品配方单份毛重】
                    BigDecimal cpoies = (grossWgt.multiply(orderAmount).setScale(4, BigDecimal.ROUND_HALF_UP)).divide(detailPrdGrossWgt, 2, BigDecimal.ROUND_HALF_UP);//份数
//                    List<Map> mapList = findAllMtrByPrd2(Long.valueOf(map.get("mtrId").toString()),takeStnId,warehouseId,cpoies);
                    DataSearchQCLZYHelp(returnMap, Long.valueOf(map.get("mtrId").toString()), cpoies, takeStnId);
//                    if(mapList != null && mapList.size() > 0){
//                        mtrList.addAll(mapList);
//                    }

                } else {//原料则直接运算后存入集合
                    BigDecimal miniRate = new BigDecimal(map.get("miniRate") == null ? "1" : map.get("miniRate").toString());
                    BigDecimal bomWgt = (grossWgt.multiply(orderAmount).setScale(4, BigDecimal.ROUND_HALF_UP));  //.divide(miniRate,2,BigDecimal.ROUND_HALF_UP);
                    //需求重量需要转换为库存单位重量，需求重量=重量/原料最小转换率
//                    System.out.println(bomWgt);
                    //配方重量
                    map.put("bomWgt", bomWgt);
                    Object mtrCut = map.get("mtrCut");
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

    @RequestMapping(value="/DataSearchDetailQCLZY")
    public R DataSearchDetailQCLZY(@RequestParam Map<String, Object> params){
        Long prdId = Long.valueOf(params.get("prdId").toString());
        Long prdCount = Long.valueOf(params.get("prdCount").toString());

        List<Map> returnList = new ArrayList<>();
        List<Map> listData = commonUtilService.eachGetPrdMtr(prdId,prdCount,params);
        if(listData.size() > 0){
            returnList = commonUtilService.distinctListData(listData);
        }
        int total = 0;
        if(returnList != null && returnList.size() > 0){
            total = returnList.size();
        }
        Query query = new Query(params);
        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);
        return R.ok().put("page", pageUtil);
    }

    @RequestMapping(value="/PrintQCLZY")
    public void PrintQCLZY(HttpServletRequest request, HttpServletResponse response,@RequestParam("createDate")String createDate,@RequestParam(value="pdcStn",required = false)String pdcStn,@RequestParam(value="orderNo",required = false)String orderNo)throws Exception{

        if(createDate == null || createDate.equals("")){
            createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
        }

        //已确认状态的订单才产生领料报表
        Map<String, Object> params = new HashMap<>();
        params.put("status",new String[]{"2"});
        params.put("createDate",createDate);
        params.put("pdcStn",pdcStn);
        params.put("productionNo",orderNo);

        //已确认状态的订单才产生领料报表
        List<Map> allPrdList = new ArrayList<>();
        HashMap<String, Map> returnMap = new HashMap<>();
        params.put("status",new String[]{"2"});
        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
        if(productionOrderEntityList != null && productionOrderEntityList.size() > 0){
            Map<String,Object> queryMap = new HashMap<>();
            for (ProductionOrderEntity productionOrderEntity:productionOrderEntityList) {
                queryMap.clear();
                queryMap.put("productionOrderId",productionOrderEntity.getId());
//                queryMap.put("takeStn",params.get("takeStn"));
                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
                for (ProductionOrderDetailEntity orderDetailEntity:productionOrderDetailEntityList){
//                    List<Map> listData = commonUtilService.eachGetPrd(orderDetailEntity.getPrdId(),Long.valueOf(orderDetailEntity.getAmount()),queryMap);
//                    allPrdList.addAll(listData);
                    DataSearchQCLZYHelp(returnMap, orderDetailEntity.getPrdId(), new BigDecimal(orderDetailEntity.getAmount()), null);
                }
            }
        }
        allPrdList.addAll(returnMap.values());

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
        Cell cell1=new Cell().add(new Paragraph("生产站点："+ pdcStn)).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);//向表格添加内容
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
        String createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
        if(params.get("createDate") != null && !params.get("createDate").toString().equals("")){
            createDate = params.get("createDate").toString();
        }
        params.put("createDate",createDate);
        //已确认状态的订单
        params.put("status",new String[]{"2"});
//        List<Map> returnList = searchPLFX(params);

        HashMap<String, Map> returnMap = new HashMap<>();
        List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(params);
//        System.out.println(productionOrderEntityList.size());
        if (productionOrderEntityList != null && productionOrderEntityList.size() > 0) {
            Map<String, Object> queryMap = new HashMap<>();
            for (ProductionOrderEntity productionOrderEntity : productionOrderEntityList) {
                queryMap.clear();
                queryMap.put("productionOrderId", productionOrderEntity.getId());
//                queryMap.put("takeStn",params.get("takeStn"));
                List<ProductionOrderDetailEntity> productionOrderDetailEntityList = productionOrderDetailService.queryList(queryMap);
//                System.out.println("productionOrderDetailEntityList: "+productionOrderDetailEntityList.toString());
                for (ProductionOrderDetailEntity orderDetailEntity : productionOrderDetailEntityList) {
//                    List<Map> listData = commonUtilService.eachGetPrd(orderDetailEntity.getPrdId(),Long.valueOf(orderDetailEntity.getAmount()),queryMap);
//                    allPrdList.addAll(listData);
                    DataSearchPLFXHelp(returnMap, orderDetailEntity.getPrdId(), new BigDecimal(orderDetailEntity.getAmount()), null);
                }
            }
        }

        List<Map> returnList = new ArrayList<>();
        returnList.addAll(returnMap.values());

        int total = 0;
        if(returnList.size() > 0){
            total = returnList.size();
        }
        PageUtils pageUtil = new PageUtils(returnList, total, 9999999, 1);
        return R.ok().put("page", pageUtil);
    }

    private void DataSearchPLFXHelp(HashMap<String, Map> returnMap, Long prdId, BigDecimal orderAmount, Long takeStnId) {
//        List<Map> mtrList = new ArrayList<>();
        BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdId);
        if (bomInfoEntity == null) {
            return;
        }

        List<Map> detailMapList = outportDetailService.queryMtrByPrdId(prdId, takeStnId, null);
        if (detailMapList != null && detailMapList.size() > 0) {
            for (Map map : detailMapList) {
                BigDecimal grossWgt = new BigDecimal(map.get("mtrGrossWgt") == null ? "0" : map.get("mtrGrossWgt").toString());
                BigDecimal modiWgt = new BigDecimal(map.get("mtrModiWgt") == null ? "0" : map.get("mtrModiWgt").toString());
                //半成品则循环进行计算
                if (map.get("semiFinished").equals("1")) {//半成品
                    BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(Long.valueOf(map.get("mtrId").toString()));

                    BigDecimal detailPrdGrossWgt = new BigDecimal(bomInfo.getSumGrossWgt() == null ? "1" : bomInfo.getSumGrossWgt().toString());
                    //计算所需要半成品的份数
                    //（【产品配方中半成品所需毛重】*【产品所需数量】）/【半成品配方单份毛重】
                    BigDecimal cpoies = (grossWgt.multiply(orderAmount).setScale(4, BigDecimal.ROUND_HALF_UP)).divide(detailPrdGrossWgt, 2, BigDecimal.ROUND_HALF_UP);//份数

                    //锅数 = 总毛重 / 锅重
                    BigDecimal potCount = grossWgt.multiply(orderAmount).divide(new BigDecimal(bomInfo.getPotWgt()));
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

                    DataSearchPLFXHelp(returnMap, Long.valueOf(map.get("mtrId").toString()), cpoies, takeStnId);
                } else {  //原料则直接返回
                    continue;
                }
            }
        }
    }

    public List<Map> searchPLFX(Map<String,Object> params){
        List<Map> returnList = new ArrayList<>();
        List<Map> productionOrderEntityList = productionOrderDetailService.searchPrd(params);
        if(productionOrderEntityList != null && productionOrderEntityList.size() > 0){
            Map<String,Object> queryMap = new HashMap<>();
            for (Map map:productionOrderEntityList) {
                Map<String,Object> detailMap = new HashMap<>();

                Long prdId = Long.valueOf(map.get("prdId").toString());
                BigDecimal orderCount = new BigDecimal(map.get("orderCount") == null ? "0" : map.get("orderCount").toString());

                detailMap.put("prdId",prdId);
                detailMap.put("orderCount",orderCount);

                PrdDataEntity prdDataEntity = prdDataService.queryObject(prdId);

                detailMap.put("prdCode",prdDataEntity.getPrdCode());
                detailMap.put("prdName",prdDataEntity.getPrdName());
                detailMap.put("prdTypeName",prdDataEntity.getTypeName());
                detailMap.put("pdcStnName",prdDataEntity.getPdcStnName());
                BigDecimal prdGrossWgt = new BigDecimal(prdDataEntity.getSumGrossWgt() == null ? "0" : prdDataEntity.getSumGrossWgt());
                BigDecimal prdNetWgt = new BigDecimal(prdDataEntity.getSumNetWgt() == null ? "0" : prdDataEntity.getSumNetWgt());
                BigDecimal prdCookedWgt = new BigDecimal(prdDataEntity.getSumCookedWgt() == null ? "0" : prdDataEntity.getSumCookedWgt());
                BigDecimal prdBoxWgt = new BigDecimal(prdDataEntity.getBoxWeight() == null ? "0" : prdDataEntity.getBoxWeight());

                detailMap.put("prdGrossWgt",prdGrossWgt);
                detailMap.put("prdNetWgt",prdNetWgt);
                detailMap.put("prdCookedWgt",prdCookedWgt);
                detailMap.put("prdBoxWgt",prdBoxWgt);

                detailMap.put("prdSumGrossWgt",prdGrossWgt.multiply(orderCount).setScale(2,BigDecimal.ROUND_HALF_UP));
                detailMap.put("prdSumNetWgt",prdNetWgt.multiply(orderCount).setScale(2,BigDecimal.ROUND_HALF_UP));
                detailMap.put("prdSumCookedWgt",prdCookedWgt.multiply(orderCount).setScale(2,BigDecimal.ROUND_HALF_UP));

                BigDecimal prdSumBoxWgt = prdBoxWgt.multiply(orderCount).setScale(2,BigDecimal.ROUND_HALF_UP);
                detailMap.put("prdSumBoxWgt",prdSumBoxWgt);
                BigDecimal prdBoxCount = new BigDecimal("0");
                if(prdBoxWgt.compareTo(BigDecimal.ZERO) != 0){
                    prdBoxCount = prdSumBoxWgt.divide(prdBoxWgt,2,BigDecimal.ROUND_HALF_UP);
                }
                detailMap.put("prdBoxCount",prdBoxCount);


                returnList.add(detailMap);
            }
        }
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

        List<Map> returnList = new ArrayList<>();
//        = searchDetailPLFX(params);

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
                System.out.println(netWgt + " " + prdDataEntity.getPotWeight() + " " + prdDataEntity.getSumNetWgt());
                BigDecimal pot = netWgt.multiply(new BigDecimal(prdDataEntity.getPotWeight())).divide(new BigDecimal(prdDataEntity.getSumNetWgt()));
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
        BigDecimal count = new BigDecimal(params.get("prdCount") == null ? "0" : params.get("prdCount").toString());
        List<Map> dataList = bomDetailService.searchMtrByPrdId(params);
        if(dataList != null && dataList.size() > 0){
            for (Map<String,Object> map:dataList) {
                if(map.get("semiFinished").toString().equals("1")){//半成品
                    PrdDataEntity prdDataEntity = prdDataService.queryObject((Long)map.get("mtrId"));
                    map.put("grossWgt",prdDataEntity.getSumGrossWgt());
                    map.put("netWgt",prdDataEntity.getSumNetWgt());
                    map.put("cookedWgt",prdDataEntity.getSumCookedWgt());

                    map.put("mtrCode",prdDataEntity.getPrdCode());
                    map.put("mtrName",prdDataEntity.getPrdName());
                    map.put("mtrTypeName","半成品");

                    BigDecimal prdGrossWgt = new BigDecimal(prdDataEntity.getSumGrossWgt() == null ? "0" : prdDataEntity.getSumGrossWgt());
                    BigDecimal prdNetWgt = new BigDecimal(prdDataEntity.getSumNetWgt() == null ? "0" : prdDataEntity.getSumNetWgt());
                    BigDecimal prdCookedWgt = new BigDecimal(prdDataEntity.getSumCookedWgt() == null ? "0" : prdDataEntity.getSumCookedWgt());

                    map.put("grossWgt",prdGrossWgt.multiply(count).setScale(2,BigDecimal.ROUND_HALF_UP));
                    map.put("netWgt",prdNetWgt.multiply(count).setScale(2,BigDecimal.ROUND_HALF_UP));
                    map.put("cookedWgt",prdCookedWgt.multiply(count).setScale(2,BigDecimal.ROUND_HALF_UP));


                }else{
                    BigDecimal mtrGrossWgt = new BigDecimal(map.get("grossWgt") == null ? "0" : map.get("grossWgt").toString());
                    BigDecimal mtrNetRate = new BigDecimal(map.get("netRate") == null ? "0" : map.get("netRate").toString());
                    BigDecimal mtrCookedRate = new BigDecimal(map.get("cookedRate") == null ? "0" : map.get("cookedRate").toString());

                    BigDecimal mtrNetWgt = mtrGrossWgt.multiply(mtrNetRate).multiply(count).setScale(2,BigDecimal.ROUND_HALF_UP);
                    BigDecimal mtrCookedWgt = mtrNetWgt.multiply(mtrCookedRate).multiply(count).setScale(2,BigDecimal.ROUND_HALF_UP);

                    map.put("netWgt",mtrNetWgt);
                    map.put("cookedWgt",mtrCookedWgt);
                }
                returnList.add(map);
            }
        }
        return returnList;
    }


    @RequestMapping(value="/PrintPLFX")
    public void PrintPLFX(HttpServletRequest request, HttpServletResponse response,@RequestParam("createDate")String createDate,@RequestParam(value="prdType",required = false)String prdType,@RequestParam(value="orderNo",required = false)String orderNo)throws Exception{
        if(createDate == null || createDate.equals("")){
            createDate = DateUtils.format(new Date(),DateUtils.DATE_PATTERN);
        }

        //已确认状态的订单才产生领料报表
        Map<String, Object> params = new HashMap<>();
        params.put("status",new String[]{"2"});
        params.put("createDate",createDate);
        params.put("prdType",prdType);
        params.put("productionNo",orderNo);

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
        Paragraph p = new Paragraph("配料分析表").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(16);
        document.add(p);
        //副标题
        document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(9));

        Table table = new Table(new float[]{4,5,1}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
        Cell cell1=new Cell().add(new Paragraph("产品类别："+ prdType)).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell2=new Cell().add(new Paragraph("打印时间："+DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);

        document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

        UnitValue[] unitValue = new UnitValue[]{
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 5),
                UnitValue.createPercentValue((float) 10)};
        Table table2 = new Table(unitValue).setWidthPercent(100);

        table2.addHeaderCell("成品名称").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("配料名称").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("需求量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("盒重").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("份数").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("总净重").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("总毛重").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("总熟重").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("类型").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);
        table2.addHeaderCell("备注").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER).setFontSize(14);

        if(allPrdList != null && allPrdList.size() > 0){
            for (Map prdMap:allPrdList) {
                table2.addCell(prdMap.get("prdName") == null ? "" : prdMap.get("prdName").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(prdMap.get("orderCount") == null ? "" : prdMap.get("orderCount").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                table2.addCell(prdMap.get("prdSumBoxWgt") == null ? "" : prdMap.get("prdSumBoxWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell(prdMap.get("prdBoxCount") == null ? "" : prdMap.get("prdBoxCount").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell(prdMap.get("prdSumNetWgt") == null ? "" : prdMap.get("prdSumNetWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);

                table2.addCell(prdMap.get("prdSumGrossWgt") == null ? "" : prdMap.get("prdSumGrossWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell(prdMap.get("prdSumCookedWgt") == null ? "" : prdMap.get("prdSumCookedWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);

                params.clear();
                params.put("prdId",prdMap.get("prdId"));
                params.put("prdCount",prdMap.get("orderCount"));
                List<Map> detailList = searchDetailPLFX(params);
                if(detailList != null && detailList.size() > 0){
                    for (Map detailMap:detailList) {
                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                        table2.addCell(detailMap.get("mtrName") == null ? "" : detailMap.get("mtrName").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                        table2.addCell(detailMap.get("formulaUnitName") == null ? "" : detailMap.get("formulaUnitName").toString()).setTextAlignment(TextAlignment.CENTER).setFontSize(10);

                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.RIGHT).setFontSize(10);

                        table2.addCell(detailMap.get("netWgt") == null ? "" : detailMap.get("netWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("grossWgt") == null ? "" : detailMap.get("grossWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("cookedWgt") == null ? "" : detailMap.get("cookedWgt").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell(detailMap.get("mtrTypeName") == null ? "" : detailMap.get("mtrTypeName").toString()).setTextAlignment(TextAlignment.RIGHT).setFontSize(10);
                        table2.addCell("").setTextAlignment(TextAlignment.CENTER).setFontSize(10);
                    }
                }
            }
        }

        document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));

        document.close();
        writer.close();
        pdf.close();
    }



}
