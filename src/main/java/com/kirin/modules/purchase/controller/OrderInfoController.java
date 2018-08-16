package com.kirin.modules.purchase.controller;

import java.io.*;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.*;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.events.Event;
import com.itextpdf.kernel.events.IEventHandler;
import com.itextpdf.kernel.events.PdfDocumentEvent;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.layout.Canvas;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import com.itextpdf.layout.renderer.DrawContext;
import com.itextpdf.layout.renderer.IRenderer;
import com.itextpdf.layout.renderer.ParagraphRenderer;
import com.kirin.common.print.PdfUtil;
import com.kirin.common.utils.DateUtils;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.purchase.entity.OrderDetailEntity;
import com.kirin.modules.purchase.entity.SuppierMtrEntity;
import com.kirin.modules.purchase.entity.SupplierInfoEntity;
import com.kirin.modules.purchase.service.OrderDetailService;
import com.kirin.modules.purchase.service.SuppierMtrService;
import com.kirin.modules.purchase.service.SupplierInfoService;
import com.kirin.modules.storage.entity.ImportDetailEntity;
import com.kirin.modules.storage.entity.ImportEntity;
import com.kirin.modules.storage.service.ImportDetailService;
import com.kirin.modules.storage.service.ImportService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.kirin.modules.purchase.entity.OrderInfoEntity;
import com.kirin.modules.purchase.service.OrderInfoService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * 订单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
@RestController
@RequestMapping("/purchase/orderinfo")
public class OrderInfoController extends AbstractController {
	@Autowired
	private OrderInfoService orderInfoService;

	@Autowired
	private SuppierMtrService suppierMtrService;

	@Autowired
	private SupplierInfoService supplierInfoService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private ImportService importService;

	@Autowired
	private ImportDetailService importDetailService;

    @Autowired
    private CommonUtilService commonUtilService;

	/**
	 * 列表
	 */
	@RequestMapping("/searchList")
	@RequiresPermissions("purchase:orderinfo:searchList")
	public R searchList(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);

		List<OrderInfoEntity> orderInfoList = orderInfoService.searchList(query);

		PageUtils pageUtil = new PageUtils(orderInfoList, orderInfoList.size(), query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("purchase:orderinfo:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<OrderInfoEntity> orderInfoList = orderInfoService.queryList(query);
		int total = orderInfoService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(orderInfoList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("purchase:orderinfo:info")
	public R info(@PathVariable("id") Long id){
		OrderInfoEntity orderInfo = orderInfoService.queryObject(id);
		
		return R.ok().put("orderInfo", orderInfo);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("purchase:orderinfo:save")
	public R save(@RequestBody OrderInfoEntity orderInfo){

        orderInfo.setOrderNo(commonUtilService.createBillNo("0"));

		SysUserEntity sysUserEntity =  getUser();

		orderInfo.setCreateUser(sysUserEntity.getUsername());
		orderInfo.setCreateDate(new Date());

//		if(orderInfo.getExceptionDate() != null && !orderInfo.getExceptionDate().equals("")){
//			orderInfo.setExceptionDate(new Date(orderInfo.getExceptionDate().toString()));
//		}

		orderInfoService.save(orderInfo);
		
		return R.ok().put("orderInfo",orderInfo);
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("purchase:orderinfo:update")
	public R update(@RequestBody OrderInfoEntity orderInfo){
		SysUserEntity sysUserEntity =  getUser();

		orderInfo.setUpdateUser(sysUserEntity.getUsername());
		orderInfo.setUpdateDate(new Date());

		orderInfoService.update(orderInfo);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("purchase:orderinfo:delete")
	public R delete(@RequestBody Long[] ids){
		orderInfoService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/querySupplierMtr")
	public R querySupplierMtr(@RequestParam("supplierId") Long supplierId,@RequestParam("searchWord") String searchWord){
		Map<String, Object> params = new HashMap<>();
		params.put("suppierId",supplierId);
		List<SuppierMtrEntity>  supplierMtrList = suppierMtrService.queryList(params);
		List<SuppierMtrEntity> returnList = new ArrayList<>();
		for (SuppierMtrEntity sme:supplierMtrList) {
			if(sme.getSuppierId() == supplierId && ((sme.getMtrIdName().indexOf(searchWord.toUpperCase())>0) || (sme.getMtrPy().indexOf(searchWord.toUpperCase())>0))){
				returnList.add(sme);
			}
		}
		return R.ok().put("data",returnList);
	}

	@RequestMapping("/queryByIdAndPy")
	public R queryByIdAndPy(@RequestParam("supplierId") Long supplierId,@RequestParam("searchWord") String searchWord){
		List<SuppierMtrEntity>  supplierMtrList = suppierMtrService.queryByIdAndPy(null,supplierId,searchWord);
		return R.ok().put("data",supplierMtrList);
	}

	protected PdfFont pdfFont = null;

	@RequestMapping(value="/printPdf",produces="application/pdf;charset=UTF-8")
	public void printPdf(HttpServletRequest request, HttpServletResponse response,@RequestParam("orderId")Long orderId) throws ServletException, IOException{

		OrderInfoEntity order = orderInfoService.queryObject(orderId);

		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/pdf;charset=utf-8");
		//处理中文问题
		PdfUtil.helvetica = new PdfUtil().createFont(request);
		pdfFont = new PdfUtil().createFont(request);
		PdfWriter writer = new PdfWriter(response.getOutputStream());
		//Initialize PDF document
		PdfDocument pdf = new PdfDocument(writer);
		Footer footer = new Footer();
		footer.footMsg = "采购主管：                                采购员：                                仓库主管：                                收货员：                                ";
		pdf.addEventHandler(PdfDocumentEvent.END_PAGE, footer);

//		Document document = new Document(pdf,new PageSize(PageSize.A5).rotate());
		Document document = new Document(pdf,new PageSize(new Rectangle(672f, 397.6f)));
		document.setTopMargin(0);
		//加载表格数据
		Paragraph p = new Paragraph("采购订单").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica);
		document.add(p).setTopMargin(0);
		//副标题
		document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica)).setTopMargin(0);
		document.setMargins(0,0,0,0);
		document.setFontSize(9);

		Table table = new Table(new float[]{2,4,4,4}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
		Cell cell1=new Cell().add(new Paragraph("单号："+order.getOrderNo())).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
		Cell cell4=new Cell().add(new Paragraph("到货日期："+DateUtils.format(new Date(),"yyyy年MM月dd日"))).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
		Cell cell6=new Cell().add(new Paragraph("下单日期："+DateUtils.format(new Date(),"yyyy年MM月dd日"))).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
		Cell cell3=new Cell().add(new Paragraph("打印时间："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
		Cell cell7=new Cell().add(new Paragraph("供应商："+order.getSupplierName())).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
		Cell cell9=new Cell().add(new Paragraph("录入人员：")).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容

		table.addCell(cell1);
		table.addCell(cell4);
		table.addCell(cell6);
		table.addCell(cell3);
		table.addCell(cell7);
		table.addCell(cell9);

		document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

		Map<String,Object> map = new HashMap<>();
		map.put("orderId",order.getId());
		List<OrderDetailEntity> detailList = orderDetailService.queryList(map);
		UnitValue[] unitValue = new UnitValue[]{
				UnitValue.createPercentValue((float) 7),
				UnitValue.createPercentValue((float) 32),
				UnitValue.createPercentValue((float) 5),
				UnitValue.createPercentValue((float) 7),
				UnitValue.createPercentValue((float) 8),
				UnitValue.createPercentValue((float) 8),
				UnitValue.createPercentValue((float) 8),
				UnitValue.createPercentValue((float) 10),
				UnitValue.createPercentValue((float) 15)};
//		Table table2 = new Table(new float[]{12,4,12,12,12,12,12,12,12}).setWidthPercent(100);
		Table table2 = new Table(unitValue).setWidthPercent(100);

		table2.addHeaderCell("编码").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("物料名称").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("件含量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("采购单价").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("采购数量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("到货数量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("采购金额").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("备注").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);

		Double sum = 0D;

		DecimalFormat df = new DecimalFormat("#.00");

			for (OrderDetailEntity detail: detailList) {
				table2.addCell(detail.getMtrCode());
				table2.addCell(detail.getMtrName());
				table2.addCell(detail.getMtrUnit());
				table2.addCell(detail.getMtrRate());
				table2.addCell(detail.getPrice().toString());
				table2.addCell(detail.getAmount().toString());
				table2.addCell("");
				table2.addCell((new BigDecimal(detail.getAmount()).multiply(detail.getPrice())).toString());
				table2.addCell("");

				sum += Double.valueOf((new BigDecimal(detail.getAmount()).multiply(detail.getPrice())).toString());
			}

//		table2.addFooterCell(new Cell(1, 2).add("采购主管：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
//		table2.addFooterCell(new Cell(1, 2).add("采购员：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
//		table2.addFooterCell(new Cell(1, 2).add("仓库主管：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
//		table2.addFooterCell(new Cell(1, 2).add("收货员：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
		table2.addFooterCell(new Cell(1, 8).add(""));
		table2.addFooterCell(new Cell(1, 1).add("总计："+df.format(sum))).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);



		document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));

//		Table table3 = new Table(new float[]{33,33,33,33}).setWidthPercent(100);
//		table3.addCell(new Cell().add("采购主管：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
//		table3.addCell(new Cell().add("采购员：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
//		table3.addCell(new Cell().add("仓库主管：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
//		table3.addCell(new Cell().add("收货员：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
//
//		int pageNumber = pdf.getNumberOfPages();
//		for(int i=1;i<=pageNumber;i++){
//			table3.setMarginTop(pdf.getPage(i).getPageSize().getHeight()-55);
//			document.add(table3.setHorizontalAlignment(HorizontalAlignment.CENTER));
//		}

		document.close();
		writer.close();
		pdf.close();

	}

	//打印入库单
	@RequestMapping(value="/inputPrint",produces="image/*;charset=UTF-8")
	public void inputPrint(HttpServletRequest request, HttpServletResponse response,@RequestParam("orderId")Long orderId)throws IOException{
		Map<String,Object> map = new HashMap();
		ImportEntity importEntity = importService.queryObjectByOrderId(orderId);
		SupplierInfoEntity supplierInfoEntity = supplierInfoService.queryObject(importEntity.getSupplierId());

		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/pdf;charset=utf-8");
		//处理中文问题
		PdfUtil.helvetica = new PdfUtil().createFont(request);
		pdfFont = new PdfUtil().createFont(request);
		PdfWriter writer = new PdfWriter(response.getOutputStream());
		//Initialize PDF document
		PdfDocument pdf = new PdfDocument(writer);
		Footer footer = new Footer();
		footer.footMsg = "采购主管：                                制单人：                                财务确认：                               ";
		pdf.addEventHandler(PdfDocumentEvent.END_PAGE, footer);

//		Document document = new Document(pdf,new PageSize(PageSize.A4));//.rotate());
		Document document = new Document(pdf,new PageSize(new Rectangle(672f, 397.6f)));
		document.setTopMargin(0);
		document.setFontSize(9);

		//加载表格数据
		Paragraph p = new Paragraph("入库单").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica);
		document.add(p).setTopMargin(0);
		//副标题
		document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica));

		Table table = new Table(new float[]{2,4,4}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
		Cell cell1=new Cell().add(new Paragraph("单号："+importEntity.getImportNo())).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容

		table.addCell(cell1);

		Cell cell4=new Cell().add(new Paragraph("到货日期："+DateUtils.format(new Date(),"yyyy年MM月dd日"))).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
		Cell cell6=new Cell().add(new Paragraph("下单日期："+DateUtils.format(new Date(),"yyyy年MM月dd日"))).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
		Cell cell3=new Cell().add(new Paragraph("打印时间："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
		Cell cell7=new Cell().add(new Paragraph("供应商："+supplierInfoEntity.getSuppierName())).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容
		Cell cell9=new Cell().add(new Paragraph("录入人员："+importEntity.getCreateUser())).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);//向表格添加内容

		table.addCell(cell4);
		table.addCell(cell6);
		table.addCell(cell3);
		table.addCell(cell7);
		table.addCell(cell9);

		document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

		Map<String,Object> mapImport = new HashMap<>();
		mapImport.put("importId",importEntity.getId());
		List<ImportDetailEntity> detailList = importDetailService.queryList(mapImport);
		UnitValue[] unitValue = new UnitValue[]{
				UnitValue.createPercentValue((float) 7),
				UnitValue.createPercentValue((float) 30),
				UnitValue.createPercentValue((float) 5),
				UnitValue.createPercentValue((float) 7),
				UnitValue.createPercentValue((float) 5),
				UnitValue.createPercentValue((float) 8),
				UnitValue.createPercentValue((float) 8),
				UnitValue.createPercentValue((float) 8),
				UnitValue.createPercentValue((float) 5),
				UnitValue.createPercentValue((float) 10),
				UnitValue.createPercentValue((float) 15)};
		Table table2 = new Table(unitValue).setWidth(UnitValue.createPercentValue(100));

		table2.addHeaderCell("编码").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("物料名称").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("件含量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("单价").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("采购数量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("到货数量").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("含税金额").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("税率").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("不含税金额").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("备注").setFont(PdfUtil.helvetica).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);

		Double sumOrder = 0D;
		Double sumIn = 0D;
		Double sumTaxPrice = 0D;
		Double sumNoTaxPrice = 0D;

		for (ImportDetailEntity detail: detailList) {
			table2.addCell(detail.getMtrNo());
			table2.addCell(detail.getMtrName());
			table2.addCell(detail.getInUnit());
			table2.addCell(detail.getInRate());

			if(detail.getInPrice() == null ){
				detail.setInPrice(new BigDecimal(0));
			}
			if(detail.getOrderCount() == null ){
				detail.setOrderCount("0");
			}
			if(detail.getInCount() == null ){
				detail.setInCount("0");
			}
			if(detail.getTaxRate() == null ){
				detail.setTaxRate("0");
			}

			table2.addCell(detail.getInPrice().toString());
			table2.addCell(detail.getOrderCount().toString());
			table2.addCell(detail.getInCount().toString());
			table2.addCell(new BigDecimal(detail.getInCount()).multiply(detail.getInPrice()).toString());

			table2.addCell(detail.getTaxRate());
			//不含税金额=含税金额-（含税金额*税率）
			BigDecimal taxSumPrice = new BigDecimal(detail.getInCount()).multiply(detail.getInPrice());
			BigDecimal priceTemp = taxSumPrice.subtract(taxSumPrice.multiply(new BigDecimal(detail.getTaxRate())).setScale(2,BigDecimal.ROUND_HALF_UP));
			table2.addCell(priceTemp.toString());
			table2.addCell("");

			sumOrder += Double.valueOf(detail.getOrderCount());
			sumIn += Double.valueOf(detail.getInCount());
			sumTaxPrice += Double.valueOf(new BigDecimal(detail.getInCount()).multiply(detail.getInPrice()).toString());
			sumNoTaxPrice += Double.valueOf(0);
		}

		table2.addCell("合计");
		table2.addCell("");
		table2.addCell("");
		table2.addCell("");
		table2.addCell("");
		table2.addCell(sumOrder.toString());
		table2.addCell(sumIn.toString());
		table2.addCell(sumTaxPrice.toString());
		table2.addCell(sumNoTaxPrice.toString());
		table2.addCell("");
		table2.addCell("");


//		table2.addFooterCell(new Cell(1, 3).add("仓库主管：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
//		table2.addFooterCell(new Cell(1, 3).add("制单人：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);
//		table2.addFooterCell(new Cell(1, 5).add("财务确认：")).setTextAlignment(TextAlignment.LEFT).setFont(PdfUtil.helvetica).setBorder(Border.NO_BORDER);

		document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));


		document.close();
		writer.close();
		pdf.close();

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
