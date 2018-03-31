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
import com.kirin.common.utils.DateUtils;
import com.kirin.common.utils.Query;
import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.entity.TypeInfoEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.baseData.service.TypeInfoService;
import com.kirin.modules.businessPrint.service.SearchDataService;
import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sales.service.ProductionOrderDetailService;
import com.kirin.modules.storage.service.OutportDetailService;
import com.kirin.modules.sys.controller.AbstractController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.*;

@RestController
@RequestMapping("/businessPrint/print")
public class PrintController extends AbstractController {

    @Autowired
    SearchDataService searchDataService;
    @Autowired
    ProductionOrderDetailService productionOrderDetailService;
    @Autowired
    TypeInfoService typeInfoService;

    protected PdfFont pdfFont = null;

    @RequestMapping(value="/ckph",produces="application/pdf;charset=UTF-8")
    public void print(HttpServletRequest request, HttpServletResponse response, @RequestParam("ids")Long[] orderIds,@RequestParam(value="wareHouseId",required = false)Long wareHouseId) throws Exception{
        List<Map> resultList = new ArrayList<>();
        if(orderIds != null && orderIds.length > 0){
            resultList = searchDataService.chpkSearch(orderIds,null,wareHouseId);
        }


        List<TypeInfoEntity> typeInfoEntityList = typeInfoService.queryListParentId(19L);


        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/pdf;charset=utf-8");
        //处理中文问题
        PdfUtil.helvetica = new PdfUtil().createFont(request);
        PdfWriter writer = new PdfWriter(response.getOutputStream());
        //Initialize PDF document
        PdfDocument pdf = new PdfDocument(writer);

        Document document = new Document(pdf,new PageSize(PageSize.A4));//.rotate());
//        Document document = new Document(pdf,new PageSize(PageSize.A3).rotate());

        //加载表格数据
        Paragraph p = new Paragraph("仓库配货表").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(16);
        document.add(p);
        //副标题
        document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(9));

        Table table = new Table(new float[]{4,5,1}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
        Cell cell1=new Cell().add(new Paragraph("需求日期："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell2=new Cell().add(new Paragraph("所属仓库：")).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        Cell cell3=new Cell().add(new Paragraph("打印时间："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);

        document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

        float[] cellNum = new float[typeInfoEntityList.size()+3];
        for(int i=0;i<typeInfoEntityList.size()+3;i++){
            if(i == 0){
                cellNum[i] = 4;
            }else if(i == 1){
                cellNum[i] = 1;
            }else if(i == typeInfoEntityList.size()+2){
                cellNum[i] = 1;
            }else{
                cellNum[i] = 1;
            }

        }

//        Table table2 = new Table(typeInfoEntityList.size()+3).setWidth(UnitValue.createPercentValue(100));
        Table table2 = new Table(cellNum).setWidth(UnitValue.createPercentValue(100));


        Cell c1 = new Cell(2, 1).add("物料名称").setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell(c1).setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        Cell c2 = new Cell(2, 1).add("单位").setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell(c2).setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        Cell c3 = new Cell(1, typeInfoEntityList.size()).add("领料站点").setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell(c3).setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        Cell c4 = new Cell(2, 1).add("实发数量").setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell(c4).setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);

        for (TypeInfoEntity typeInfoEntity:typeInfoEntityList) {
            table2.addHeaderCell(typeInfoEntity.getTypeName()).setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        }

        if(resultList !=null && resultList.size() > 0){
            for (Map<String,Object> map :resultList) {
                table2.addCell(map.get("mtrName").toString()).setFontSize(10).setKeepTogether(true).setTextAlignment(TextAlignment.LEFT);
                table2.addCell(map.get("unitName").toString()).setFontSize(10).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
                for (TypeInfoEntity typeInfoEntity:typeInfoEntityList) {
                    if(typeInfoEntity.getTypeName().equals(map.get("takeStnName").toString())){
                        BigDecimal wgt = new BigDecimal(map.get("wgt").toString());
                        BigDecimal showWgt = wgt.divide(new BigDecimal(1000)).setScale(2,BigDecimal.ROUND_HALF_UP);
                        table2.addCell(showWgt.toString()).setFontSize(10).setKeepTogether(true).setTextAlignment(TextAlignment.RIGHT);
                    }else{
                        table2.addCell("");
                    }
                }
                table2.addCell("");
            }
        }


        document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));

        document.close();
        writer.close();
        pdf.close();

    }

    @RequestMapping(value="/ll",produces="application/pdf;charset=UTF-8")
    public void ll(HttpServletRequest request, HttpServletResponse response, @RequestParam("createDate")String createDate,@RequestParam(value="takeStn",required = false)String takeStn,@RequestParam(value="warehouse",required = false)String warehouse) throws Exception {
        List<Map> resultList = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        map.put("createDate",createDate);
        map.put("takeStn",takeStn != null ? takeStn : null);
        map.put("warehouse",warehouse != null ? warehouse : null);
        List<Map> listMap = searchDataLL(map);

        pdfFont = new PdfUtil().createFont(request);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/pdf;charset=utf-8");
        //处理中文问题
        PdfUtil.helvetica = new PdfUtil().createFont(request);
        PdfWriter writer = new PdfWriter(response.getOutputStream());
        //Initialize PDF document
        PdfDocument pdf = new PdfDocument(writer);
        Footer footer = new Footer();
        footer.footMsg = "仓管：                                部门主管：                                领料人：                               ";
        pdf.addEventHandler(PdfDocumentEvent.END_PAGE, footer);

        Document document = new Document(pdf,new PageSize(PageSize.A4).rotate());
//        Document document = new Document(pdf,new PageSize(PageSize.A3).rotate());

        //加载表格数据
        Paragraph p = new Paragraph("仓库配货表").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(16);
        document.add(p);
        //副标题
        document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(9));

        Table table = new Table(new float[]{4,5,1}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
        Cell cell1=new Cell().add(new Paragraph("需求日期："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell2=new Cell().add(new Paragraph("所属仓库：")).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        Cell cell3=new Cell().add(new Paragraph("打印时间："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        Cell cell4=new Cell().add(new Paragraph("领料站点：")).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        table.addCell(cell4);

        document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

        UnitValue[] unitValue = new UnitValue[]{
                UnitValue.createPercentValue((float) 30),
                UnitValue.createPercentValue((float) 8),
                UnitValue.createPercentValue((float) 8),
                UnitValue.createPercentValue((float) 9),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 10),
                UnitValue.createPercentValue((float) 15)};
        Table table2 = new Table(unitValue).setWidthPercent(100);

        table2.addHeaderCell("物料名称").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("需求总量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("单件重量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("件数").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("实际领量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
        table2.addHeaderCell("备注").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);

        for (Map dataMap :listMap) {
            table2.addCell(dataMap.get("mtrName") == null ? "" : dataMap.get("mtrName").toString());
            table2.addCell(dataMap.get("outUnit") == null ? "" : dataMap.get("outUnit").toString());
            table2.addCell(dataMap.get("orderCount") == null ? "" : dataMap.get("orderCount").toString());
            table2.addCell("");
            table2.addCell("");
            table2.addCell("");
            table2.addCell("");
        }

        document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));

        document.close();
        writer.close();
        pdf.close();
    }

    public List<Map> searchDataLL(Map<String, Object> params){
        Long takeStn = params.get("takeStn") == null ? null : Long.valueOf(params.get("takeStn").toString());
        Long warehouse = params.get("warehouse") == null ? null :Long.valueOf(params.get("warehouse").toString());
        List<Map> returnList = new ArrayList<>();
        List<ProductionOrderDetailEntity> productionOrderDetailEntityList = searchDataService.queryOrderPrd(params);
        if(productionOrderDetailEntityList != null && productionOrderDetailEntityList.size() > 0){
            List<Map> mapList = new ArrayList<>();
            for (ProductionOrderDetailEntity productionOrderDetailEntity:productionOrderDetailEntityList) {
                List<Map> mapListTemp = findAllMtrByPrd(productionOrderDetailEntity.getPrdId(),takeStn,warehouse);
                mapList.addAll(mapListTemp);
                //完善客户信息和产品信息与计算数量
                for (Map mapTemp:mapList) {

                    BigDecimal mtrGrossWgt = new BigDecimal(mapTemp.get("mtrGrossWgt") == null ? "0" : mapTemp.get("mtrGrossWgt").toString());
                    BigDecimal orderAmount = new BigDecimal(productionOrderDetailEntity.getAmount() == null ? "0" : productionOrderDetailEntity.getAmount().toString());

                    BigDecimal mtrAmount = mtrGrossWgt.multiply(orderAmount).setScale(2,BigDecimal.ROUND_HALF_UP);
                    mtrAmount = mtrAmount.divide(new BigDecimal(1000)).setScale(2,BigDecimal.ROUND_HALF_UP);
                    mapTemp.put("orderCount",mtrAmount);
                }
            }

            for (Map mapTemp:mapList) {
                if(returnList.size()<=0){
                    returnList.add(mapTemp);
                }
                for (int i=0;i < returnList.size(); i++) {
                    Map temp = returnList.get(i);
                    if(mapTemp.get("mtrId").toString().equals(temp.get("mtrId").toString())){
                        BigDecimal newCount = new BigDecimal(temp.get("orderCount").toString());
                        BigDecimal oldCount = new BigDecimal(temp.get("orderCount").toString());
                        BigDecimal sumCount = newCount.add(oldCount).setScale(2,BigDecimal.ROUND_HALF_UP);
                        temp.put("orderCount",sumCount);
                    }else{
                        returnList.add(mapTemp);
                    }
                }
            }
        }
        return returnList;
    }


    @Autowired
    BomDetailService bomDetailService;
    @Autowired
    BomInfoService bomInfoService;
    @Autowired
    OutportDetailService outportDetailService;

    //根据所选订单查询产品配方所需原料信息
    public List<Map> findAllMtrByPrd(Long prdId,Long takeStnId,Long warehouseId){
        BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdId);
        if(bomInfoEntity == null){
            return null;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("bomInfoId",bomInfoEntity.getId());
        List<BomDetailEntity> bomDetailEntityList = bomDetailService.queryList(map);
        if(bomDetailEntityList == null || bomDetailEntityList.size() <= 0){
            return null;
        }

        List<Map> mapList = outportDetailService.queryMtrByPrdId(prdId,takeStnId,warehouseId);

        for (BomDetailEntity bomDetailEntity:bomDetailEntityList) {
            if(bomDetailEntity.getSemiFinished().equals("1")){//半成品
                List<Map> subMapList = findAllMtrByPrd(bomDetailEntity.getMtrId(),takeStnId,warehouseId);
                mapList.addAll(subMapList);
            }
        }

        return mapList;
    }

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
}

