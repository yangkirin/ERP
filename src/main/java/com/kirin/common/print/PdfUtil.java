package com.kirin.common.print;


import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import com.kirin.common.utils.DateUtils;
import nl.bitwalker.useragentutils.Browser;
import nl.bitwalker.useragentutils.UserAgent;
import nl.bitwalker.useragentutils.Version;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


public class PdfUtil {
    public static PdfFont helvetica = null;
    static PdfFont helveticaBold = null;
    static DecimalFormat df = new DecimalFormat("#0.00");


    public PdfUtil(){}

    public PdfUtil(HttpServletRequest request)throws IOException {
        if(request != null){
            createFont(request);
        }else{
            helvetica = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H", false);
        }
    }


    public String getUserAgent(HttpServletRequest request)
            throws IOException {
        // 获取浏览器信息
        Browser browser = UserAgent.parseUserAgentString(request.getHeader("User-Agent")).getBrowser();
        // 获取浏览器版本号
        Version version = browser.getVersion(request.getHeader("User-Agent"));
        String info = browser.getName();//+ "/" + version.getVersion();
        return info;
    }

    public PdfFont createFont(HttpServletRequest request) throws IOException{
        String browserName = getUserAgent(request);
        PdfFont font = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H",false);

        if(StringUtils.contains("CHROME/SAFARI",browserName.toUpperCase())){
            String fontPath = Thread.currentThread().getContextClassLoader().getResource("static/font/NotoSansCJKtc-Regular.otf").toString();
            font = PdfFontFactory.createFont(fontPath.replaceAll("file:",""), PdfEncodings.IDENTITY_H);
            helvetica = font;
        }
        return font;
    }

    /**
     * 打印PDF
     * @param request
     * @param response
     * @param tableArr
     */
    public void printPdf(HttpServletRequest request,HttpServletResponse response,List<Map<String,Object>> tableArr) throws Exception{
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/pdf;charset=utf-8");
        //处理中文问题
        helvetica = new PdfUtil().createFont(request);
        PdfWriter writer = new PdfWriter(response.getOutputStream());
        //Initialize PDF document
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf);
        //加载表格数据
        document.close();
        writer.close();
        pdf.close();
    }

    public static void createTable(Document document,List<Map<String,Object>> tableArr){
        if(tableArr != null && tableArr.size() > 0){
            for (Map<String,Object> tableMap : tableArr) {

                    float[] tableSize = (float[])tableMap.get("size");
                    Table table = new Table(tableSize).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
                    if((boolean)tableMap.get("sort")){//边框
                        table.setBorder(Border.NO_BORDER);
                    }
                    Map<String,Object> dataMap = (Map<String,Object>)tableMap.get("data");

                    List<String> columnName = (List<String>)dataMap.get("columnName");//标题行
                    for(String column : columnName){
                        table.addCell(new Cell().add(new Paragraph(column)).setFont(helvetica));
                    }

                    List<Map<String,Object>> culumnData = (List<Map<String,Object>>)dataMap.get("columnData");
                    for(Map<String,Object> data : culumnData){
                        for (String key : dataMap.keySet()) {
//                            table.addCell(new Cell().add(new Paragraph(field)));
                            System.out.println("Key = " + key);

                        }
                    }

            }
        }
    }

    public static void loadFormTable(Document document,List<Map<String,Object>> tableArr){

    }

    public static void exportPdf(HttpServletRequest request,String spreadhead, String subhead, HttpServletResponse response){
        try{
            // 设置response参数，可以打开下载页面
            response.reset();
            response.setContentType("application/pdf;charset=utf-8");
//            response.addHeader("Content-Disposition","attachment;filename="+ new String( fileName.getBytes("gb2312"), "ISO8859-1"));
            //处理中文问题
//            helvetica = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H", false);
            helveticaBold = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H", false);
            helvetica = new PdfUtil().createFont(request);
            PdfWriter writer = new PdfWriter(response.getOutputStream());
            //Initialize PDF document
            PdfDocument pdf = new PdfDocument(writer);
//            pdf.addEventHandler(PdfDocumentEvent.END_PAGE);
//             Initialize document
            Document document = new Document(pdf);
            //加载报告内容
            loadReport(spreadhead, subhead, document);
            document.close();
            writer.close();
            pdf.close();
        }catch(Exception e){
            e.printStackTrace();
        }

    }

    public static void loadReport(String spreadhead, String subhead, Document document){

        //大标题
        Paragraph p = new Paragraph(spreadhead).setTextAlignment(TextAlignment.CENTER).setFont(helvetica).setFontSize(16);
        document.add(p);
        //副标题
        document.add(new Paragraph(subhead).setTextAlignment(TextAlignment.CENTER).setFont(helvetica).setFontSize(8));
        //初始化详情内容


        Table table = new Table(new float[]{2,4,4}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
        Cell cell1=new Cell().add(new Paragraph("单号：")).setFont(helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell2=new Cell().add(new Paragraph("")).setFont(helvetica).setBorder(Border.NO_BORDER);
        Cell cell3=new Cell().add(new Paragraph("打印时间："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(helvetica).setBorder(Border.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);

        Cell cell4=new Cell().add(new Paragraph("到货日期："+DateUtils.format(new Date(),"yyyy年MM月dd日"))).setFont(helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell5=new Cell().add(new Paragraph("")).setFont(helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell6=new Cell().add(new Paragraph("下单日期："+DateUtils.format(new Date(),"yyyy年MM月dd日"))).setFont(helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell7=new Cell().add(new Paragraph("供应商：")).setFont(helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell8=new Cell().add(new Paragraph("")).setFont(helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
        Cell cell9=new Cell().add(new Paragraph("录入人员：")).setFont(helvetica).setBorder(Border.NO_BORDER);//向表格添加内容

        table.addCell(cell4);
        table.addCell(cell5);
        table.addCell(cell6);
        table.addCell(cell7);
        table.addCell(cell8);
        table.addCell(cell9);


        document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

    }

    public static void loadTitle(String text, Document document){
        document.add(new Paragraph(text).setFont(helvetica).setBold().setFontSize(12));
    }

    public static void process(Table table, String text, PdfFont font, boolean isHeader) {
        if (isHeader) {
            table.addHeaderCell(new Cell().add(new Paragraph(text).setFont(font)).setFontSize(9).setBorder(new SolidBorder(Color.BLACK, 0.5f)).setBold());
        } else {
            table.addCell(new Cell().add(new Paragraph(text).setFont(font)).setFontSize(9).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        }
    }

}
