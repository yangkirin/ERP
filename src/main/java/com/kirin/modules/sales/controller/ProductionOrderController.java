package com.kirin.modules.sales.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
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
import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.entity.TypeInfoEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.modules.baseData.service.TypeInfoService;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.sales.entity.CustomerInfoEntity;
import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sales.service.CustomerInfoService;
import com.kirin.modules.sales.service.ProductionOrderDetailService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.sales.entity.ProductionOrderEntity;
import com.kirin.modules.sales.service.ProductionOrderService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 生产订单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-24 11:52:37
 */
@RestController
@RequestMapping("/sales/productionorder")
public class ProductionOrderController extends AbstractController {
	@Autowired
	private ProductionOrderService productionOrderService;

	@Autowired
	private CustomerInfoService customerInfoService;

	@Autowired
	private TypeInfoService typeInfoService;

    @Autowired
    private CommonUtilService commonUtilService;

	/**
	 * 列表
	 */
	@RequestMapping("/list")
//	@RequiresPermissions("sales:productionorder:list")
	public R list(@RequestParam Map<String, Object> params){

		String queryType = params.get("type") == null ? "" : params.get("type").toString();
		if(queryType.equals("allow_outport")){
			params.put("status",new String[]{"2"});
		}

		//查询列表数据
        Query query = new Query(params);

		List<ProductionOrderEntity> productionOrderList = productionOrderService.queryList(query);
		int total = productionOrderService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(productionOrderList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
//	@RequiresPermissions("sales:productionorder:info")
	public R info(@PathVariable("id") Long id){
		ProductionOrderEntity productionOrder = productionOrderService.queryObject(id);
		
		return R.ok().put("productionOrder", productionOrder);
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
//	@RequiresPermissions("sales:productionorder:save")
	public R save(@RequestBody ProductionOrderEntity productionOrder){

        productionOrder.setProductionNo(commonUtilService.createBillNo("3"));

		TypeInfoEntity typeInfoEntity1 = typeInfoService.queryObject(productionOrder.getOrderTypeId());
		productionOrder.setOrderTypeName(typeInfoEntity1.getTypeName());

        TypeInfoEntity typeInfoEntity2 = typeInfoService.queryObject(productionOrder.getPlaceId());
		productionOrder.setPlaceName(typeInfoEntity2.getTypeName());

		CustomerInfoEntity customerInfoEntity = customerInfoService.queryObject(productionOrder.getCustomerId());
		productionOrder.setCustomerNo(customerInfoEntity.getCustomerCode());
		productionOrder.setCustomerName(customerInfoEntity.getCustomerName());

		SysUserEntity sysUserEntity =  getUser();

		productionOrder.setCreateUser(sysUserEntity.getUsername());
		productionOrder.setCreateDate(new Date());

		productionOrderService.save(productionOrder);

		return R.ok().put("data",productionOrder);
	}

	@RequestMapping("/save2")
//	@RequiresPermissions("sales:productionorder:save")
	public R save2(@RequestParam Map<String, Object> params){
		String isDH = params.get("isDH").toString();
		String customerId = params.get("customerId").toString();
		String orderTypeId = params.get("orderTypeId").toString();
		String placeId = params.get("placeId").toString();

		ProductionOrderEntity productionOrder = new ProductionOrderEntity();
		if(isDH.equals("0")){//不是低值易耗领料
			TypeInfoEntity typeInfoEntity1 = typeInfoService.queryObject(Long.valueOf(orderTypeId));
			productionOrder.setOrderTypeName(typeInfoEntity1.getTypeName());

			TypeInfoEntity typeInfoEntity2 = typeInfoService.queryObject(Long.valueOf(placeId));
			productionOrder.setPlaceName(typeInfoEntity2.getTypeName());

			CustomerInfoEntity customerInfoEntity = customerInfoService.queryObject(Long.valueOf(customerId));
			productionOrder.setCustomerNo(customerInfoEntity.getCustomerCode());
			productionOrder.setCustomerName(customerInfoEntity.getCustomerName());
		}else{
			productionOrder.setRemakr("低值易耗领料单");
		}

		SysUserEntity sysUserEntity =  getUser();

		productionOrder.setCreateUser(sysUserEntity.getUsername());
		productionOrder.setCreateDate(new Date());

		productionOrderService.save(productionOrder);

		return R.ok().put("data",productionOrder);
	}


    /**
     * 复制订单
     */
    @RequestMapping("/copyOrder")
//	@RequiresPermissions("sales:productionorder:save")
    public R copyOrder(@RequestBody Map<String, Object> params) {
        Long oldId = Long.valueOf(String.valueOf(params.get("oldId")));

//        String productionNo = String.valueOf(params.get("productionNo"));
//		System.out.println(oldId + " " + productionNo);

        //查找被复制订单
        ProductionOrderEntity productionOrder = productionOrderService.queryObject(oldId);
        //设置新订单id为空
        productionOrder.setId(null);

        //设置订单类型
        productionOrder.setOrderTypeId(Long.valueOf(String.valueOf(params.get("orderTypeId"))));
        TypeInfoEntity typeInfoEntity1 = typeInfoService.queryObject(productionOrder.getOrderTypeId());
        productionOrder.setOrderTypeName(typeInfoEntity1.getTypeName());

        //设置客户信息
        productionOrder.setCustomerId(Long.valueOf(String.valueOf(params.get("customerId"))));
        CustomerInfoEntity customerInfoEntity = customerInfoService.queryObject(productionOrder.getCustomerId());
        productionOrder.setCustomerNo(customerInfoEntity.getCustomerCode());
        productionOrder.setCustomerName(customerInfoEntity.getCustomerName());

        //设置售点信息
        productionOrder.setPlaceId(Long.valueOf(String.valueOf(params.get("placeId"))));
        TypeInfoEntity typeInfoEntity2 = typeInfoService.queryObject(productionOrder.getPlaceId());
        productionOrder.setPlaceName(typeInfoEntity2.getTypeName());

        String tmp = String.valueOf(params.get("remakr"));
        productionOrder.setRemakr(tmp == "null" ? "" : tmp);


        productionOrder.setStatus(String.valueOf(params.get("status")));
        productionOrder.setTypeId(Long.valueOf(String.valueOf(params.get("typeId"))));

        productionOrder.setUpdateDate(null);
        productionOrder.setUpdateUser(null);

        SysUserEntity sysUserEntity = getUser();

        productionOrder.setCreateUser(sysUserEntity.getUsername());
        productionOrder.setCreateDate(new Date());


        //生成新的订单编号
        String productionNo = commonUtilService.createBillNo("3");
        productionOrder.setProductionNo(productionNo);
        //保存新订单
        productionOrderService.save(productionOrder);

        ProductionOrderEntity newOrder = productionOrderService.queryObjectByPONo(productionNo);
        Map<String, Object> newparams = new HashMap<>();
        newparams.put("productionOrderId", oldId);
        List<ProductionOrderDetailEntity> productionOrderDetailList = productionOrderDetailService.queryList(newparams);
        for (ProductionOrderDetailEntity productionOrderEntity : productionOrderDetailList) {
            productionOrderEntity.setId(null);
            productionOrderEntity.setProductionOrderId(newOrder.getId());
            productionOrderEntity.setProductionOrderNo(productionNo);
            productionOrderDetailService.save(productionOrderEntity);
        }

//
//		return R.ok().put("data",productionOrder);
        return R.ok().put("productionNo", productionNo);
    }


	/**
	 * 修改
	 */
	@RequestMapping("/update")
//	@RequiresPermissions("sales:productionorder:update")
	public R update(@RequestBody ProductionOrderEntity productionOrder){
		SysUserEntity sysUserEntity =  getUser();

		productionOrder.setUpdateUser(sysUserEntity.getUsername());
		productionOrder.setUpdateDate(new Date());

		productionOrderService.update(productionOrder);
		
		return R.ok().put("data",productionOrder);
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sales:productionorder:delete")
	public R delete(@RequestBody Long[] ids){
		productionOrderService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/updateStatus")
	public R updateStatus(@RequestParam("orderId")Long orderId,@RequestParam("status")String status){
		ProductionOrderEntity productionOrder = productionOrderService.queryObject(orderId);

		SysUserEntity sysUserEntity =  getUser();

		productionOrder.setUpdateUser(sysUserEntity.getUsername());
		productionOrder.setUpdateDate(new Date());

		productionOrder.setStatus(status);
		productionOrderService.update(productionOrder);

		return R.ok();
	}


	@Autowired
	ProductionOrderDetailService productionOrderDetailService;

	@Autowired
	BomInfoService bomInfoService;

	@Autowired
	BomDetailService bomDetailService;

	@Autowired
	MtrDataService mtrDataService;

	@RequestMapping(value="/print",produces="application/pdf;charset=UTF-8")
	public void print(HttpServletRequest request, HttpServletResponse response, @RequestParam("ids")String orderId) throws Exception{


		Map<String,Map> newMap1 = new ConcurrentHashMap<>();

		List<Map> dataList = new ArrayList<>();
		if(orderId != null && orderId.length() > 0){
			String[] orderIds = orderId.split(",");
			List<ProductionOrderDetailEntity> sumListEntity = new ArrayList<>();
			for (String item:orderIds) {//根据订单号来查询订单明细，获取所需要的产品
				Map<String,Object> param = new HashMap<>();
				param.put("productionOrderId",Long.valueOf(item));
				List<ProductionOrderDetailEntity> listEntity =  productionOrderDetailService.queryList(param);
				sumListEntity.addAll(listEntity);
			}

			//找到产品的配方，取得所有原料

			if(sumListEntity != null && sumListEntity.size() > 0){
				for (ProductionOrderDetailEntity productionOrderDetailEntity:sumListEntity) {
					Map<String,Map> map = createMtrByPrdId(productionOrderDetailEntity.getPrdId(),productionOrderDetailEntity);
//					for (String key2 : map.keySet()) {
//						System.out.println(productionOrderDetailEntity.getPrdId()+"-----||||||------------->return---->key= " + key2 + " and value= " + map.get(key2));
//					}
					dataList.add(map);
				}
				int i = 0;

				for (Map<String,Map> map :dataList) {

					for (String key2 : map.keySet()) {
						if(i == 0){
							newMap1.put(key2,map.get(key2));
						}else{
							boolean isExists = false;
							for (String key3 : newMap1.keySet()) {
								if(key2.equals(key3)){
									isExists = true;
									break;
								}
							}
							if(isExists){
								Map<String,Object> newTemp = newMap1.get(key2);
								Map<String,Object> oldTemp = map.get(key2);


								BigDecimal oldDWgt = (BigDecimal)oldTemp.get(("dWgt"));
								BigDecimal oldPieceCount = (BigDecimal)oldTemp.get(("pieceCount"));

								BigDecimal newWgt = (BigDecimal)newTemp.get(("dWgt"));
								BigDecimal newPieceCount = (BigDecimal)newTemp.get(("pieceCount"));


								newTemp.put("dWgt",oldDWgt.add(newWgt));//需求重量
								newTemp.put("pieceCount",oldPieceCount.add(newPieceCount));//件数

								newMap1.put(key2,newTemp);
								isExists = false;
							}else{
								newMap1.put(key2,map.get(key2));
							}

						}

					}
					i++;
				}
				for (String key : newMap1.keySet()) {
					System.out.println("---------》结果==="+key+"---value="+newMap1.get(key));
				}
			}
		}


		// 设置response参数，可以打开下载页面
		response.reset();
		response.setContentType("application/pdf;charset=utf-8");
		//处理中文问题
		PdfUtil.helvetica = new PdfUtil().createFont(request);
		PdfWriter writer = new PdfWriter(response.getOutputStream());
		//Initialize PDF document
		PdfDocument pdf = new PdfDocument(writer);

		Document document = new Document(pdf,new PageSize(PageSize.A4).rotate());

		//加载表格数据
		Paragraph p = new Paragraph("采购订单").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(16);
		document.add(p);
		//副标题
		document.add(new Paragraph("武汉中百古唐美膳").setTextAlignment(TextAlignment.CENTER).setFont(PdfUtil.helvetica).setFontSize(9));

		Table table = new Table(new float[]{2,4,4}).setWidth(UnitValue.createPercentValue(100)).setBorder(Border.NO_BORDER);//构建表格以100%的宽度
		Cell cell1=new Cell().add(new Paragraph("需求日期："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);//向表格添加内容
		Cell cell2=new Cell().add(new Paragraph("所属仓库：")).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
		Cell cell3=new Cell().add(new Paragraph("打印时间："+ DateUtils.format(new Date(),"yyyy年MM月dd日 hh:mm:ss"))).setFont(PdfUtil.helvetica).setFontSize(10).setBorder(Border.NO_BORDER);
		table.addCell(cell1);
		table.addCell(cell2);
		table.addCell(cell3);

		document.add(table.setHorizontalAlignment(HorizontalAlignment.CENTER));

		Table table2 = new Table(8).setWidth(UnitValue.createPercentValue(100));

		table2.addHeaderCell("物料名称").setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("最小单位").setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("需求量").setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("件含量").setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("件数").setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("单位").setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("发货数量").setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
		table2.addHeaderCell("备注").setFont(PdfUtil.helvetica).setFontSize(10).setBold().setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);


		for (String key : newMap1.keySet()) {

			Map<String,Object> valueMap = newMap1.get(key);

			table2.addCell(valueMap.get("mtrName").toString()).setFontSize(10).setKeepTogether(true).setTextAlignment(TextAlignment.LEFT);
			table2.addCell(valueMap.get("miniUnit")==null ? "" :valueMap.get("miniUnit").toString().toString()).setFontSize(10).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
			table2.addCell(valueMap.get("dWgt").toString()).setFontSize(10).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
			table2.addCell(valueMap.get("pieceWgt").toString()).setFontSize(10).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
			table2.addCell(valueMap.get("pieceCount").toString()).setFontSize(10).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
			table2.addCell(valueMap.get("purchaseUnit") == null ? "" : valueMap.get("purchaseUnit").toString()).setFontSize(10).setKeepTogether(true).setTextAlignment(TextAlignment.CENTER);
			table2.addCell("");
			table2.addCell("");
		}

		document.add(table2.setHorizontalAlignment(HorizontalAlignment.CENTER));

		document.close();
		writer.close();
		pdf.close();
	}

	private List<BomDetailEntity> findBomDetailByPrdId(Long prdId){
		List<BomDetailEntity> returnList= new ArrayList<BomDetailEntity>();
		BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdId);
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("bomInfoId",bomInfoEntity.getId());
		List<BomDetailEntity> bomDetailEntityList = bomDetailService.queryList(paramMap);
		if(bomDetailEntityList != null && bomDetailEntityList.size() > 0){
			for (BomDetailEntity bomDetailEntity:bomDetailEntityList) {
				if(bomDetailEntity.getSemiFinished().equals("1")){//半成品
					findBomDetailByPrdId(bomDetailEntity.getMtrId());
				}else{
					returnList.add(bomDetailEntity);
				}
			}
		}
		return returnList;
	}

	private Map<String,Map> createMtrByPrdId(Long prdId,ProductionOrderDetailEntity pode){
//		List<Map<String,Map>> returnList = new ArrayList<>();
		Map<String,Map> returnMap = new ConcurrentHashMap<>();
//		System.out.println("createMtrByPrdId------------->prdId="+prdId);
		List<BomDetailEntity> bomDetailEntityList = findBomDetailByPrdId(prdId);
		if(bomDetailEntityList != null && bomDetailEntityList.size() > 0){
			for (BomDetailEntity bomDetailEntity:bomDetailEntityList) {
				MtrDataEntity mtrDataEntity = mtrDataService.queryObject(bomDetailEntity.getMtrId());

				if(returnMap.size() > 0 && returnMap.keySet().size() > 0){
					for (String key : returnMap.keySet()) {
						if(key.equals(mtrDataEntity.getId().toString())){//存在
							//需求重量
							BigDecimal amountWgt = new BigDecimal(bomDetailEntity.getGrossWgt()).multiply(new BigDecimal(pode.getAmount()));
							BigDecimal dWgt = amountWgt.divide(new BigDecimal(mtrDataEntity.getMiniRate()),2,BigDecimal.ROUND_HALF_UP);
							//件数
							BigDecimal pieceCount = dWgt.divide(new BigDecimal(mtrDataEntity.getPurchaseRate()),2,BigDecimal.ROUND_HALF_UP);

							Map<String,Object> map = returnMap.get(key);

							BigDecimal oldDWgt = (BigDecimal)map.get("dWgt");
							BigDecimal oldPieceCount = (BigDecimal)map.get("pieceCount");

							map.put("dWgt",oldDWgt.add(dWgt));//需求重量
							map.put("pieceCount",oldPieceCount.add(pieceCount));//件数

							map.put("mtrId",mtrDataEntity.getId());
							map.put("mtrName",mtrDataEntity.getMtrName());
							map.put("miniUnit",mtrDataEntity.getMiniUnitName());//最小单位
							map.put("pieceWgt",mtrDataEntity.getPurchaseRate());//件重
							map.put("purchaseUnit",mtrDataEntity.getPurchaseUnitName());//库存单位=采购单位

							returnMap.put(key,map);
						}else{
							Map<String,Object> map = new HashMap<>();
							map.put("mtrId",mtrDataEntity.getId());
							map.put("mtrName",mtrDataEntity.getMtrName());
							map.put("miniUnit",mtrDataEntity.getMiniUnitName());//最小单位
							BigDecimal amountWgt = new BigDecimal(bomDetailEntity.getGrossWgt()).multiply(new BigDecimal(pode.getAmount()));
							BigDecimal dWgt = amountWgt.divide(new BigDecimal(mtrDataEntity.getMiniRate()),2,BigDecimal.ROUND_HALF_UP);
							map.put("dWgt",dWgt);//需求重量
							map.put("pieceWgt",mtrDataEntity.getPurchaseRate());//件重
							BigDecimal pieceCount = dWgt.divide(new BigDecimal(mtrDataEntity.getPurchaseRate()),2,BigDecimal.ROUND_HALF_UP);
							map.put("pieceCount",pieceCount);//件数
							map.put("purchaseUnit",mtrDataEntity.getPurchaseUnitName());//库存单位=采购单位

							returnMap.put(mtrDataEntity.getId().toString(),map);
						}
					}
				}else{
					System.out.println("--------------2----------------->");
					Map<String,Object> map = new HashMap<>();
					map.put("mtrId",mtrDataEntity.getId());
					map.put("mtrName",mtrDataEntity.getMtrName());
					map.put("miniUnit",mtrDataEntity.getMiniUnitName());//最小单位
					BigDecimal amountWgt = new BigDecimal(bomDetailEntity.getGrossWgt()).multiply(new BigDecimal(pode.getAmount()));
					BigDecimal dWgt = amountWgt.divide(new BigDecimal(mtrDataEntity.getMiniRate()),2,BigDecimal.ROUND_HALF_UP);
					map.put("dWgt",dWgt);//需求重量
					map.put("pieceWgt",mtrDataEntity.getPurchaseRate());//件重
					BigDecimal pieceCount = dWgt.divide(new BigDecimal(mtrDataEntity.getPurchaseRate()),2,BigDecimal.ROUND_HALF_UP);
					map.put("pieceCount",pieceCount);//件数
					map.put("purchaseUnit",mtrDataEntity.getPurchaseUnitName());//库存单位=采购单位

					returnMap.put(mtrDataEntity.getId().toString(),map);
				}



//				if(returnMap.get("mtrId") != null && returnMap.get("mtrId").equals(mtrDataEntity.getId().toString())){//存在
//					//需求重量
//					BigDecimal amountWgt = new BigDecimal(bomDetailEntity.getGrossWgt()).multiply(new BigDecimal(pode.getAmount()));
//					BigDecimal dWgt = amountWgt.divide(new BigDecimal(mtrDataEntity.getMiniRate()),2,BigDecimal.ROUND_HALF_UP);
//					//件数
//					BigDecimal pieceCount = dWgt.divide(new BigDecimal(mtrDataEntity.getPurchaseRate()),2,BigDecimal.ROUND_HALF_UP);
//
//					Map<String,Object> map = returnMap.get(mtrDataEntity.getId().toString());
//
//					map.put("mtrId",mtrDataEntity.getId());
//					map.put("mtrName",mtrDataEntity.getMtrName());
//					map.put("miniUnit",mtrDataEntity.getId());//最小单位
//					map.put("pieceWgt",mtrDataEntity.getPurchaseRate());//件重
//					map.put("purchaseUnit",mtrDataEntity.getPurchaseUnit());//库存单位=采购单位
//
//
//					BigDecimal oldDWgt = (BigDecimal)map.get("dWgt");
//					BigDecimal oldPieceCount = (BigDecimal)map.get("pieceCount");
//
//					map.put("dWgt",oldDWgt.add(dWgt));//需求重量
//					map.put("pieceCount",oldPieceCount.add(pieceCount));//件数
//
//					returnMap.put(mtrDataEntity.getId().toString(),map);
//				}else{//不存在
//					Map<String,Object> map = new HashMap<>();
//					map.put("mtrId",mtrDataEntity.getId());
//					map.put("mtrName",mtrDataEntity.getMtrName());
//					map.put("miniUnit",mtrDataEntity.getId());//最小单位
//					BigDecimal amountWgt = new BigDecimal(bomDetailEntity.getGrossWgt()).multiply(new BigDecimal(pode.getAmount()));
//					BigDecimal dWgt = amountWgt.divide(new BigDecimal(mtrDataEntity.getMiniRate()),2,BigDecimal.ROUND_HALF_UP);
//					map.put("dWgt",dWgt);//需求重量
//					map.put("pieceWgt",mtrDataEntity.getPurchaseRate());//件重
//					BigDecimal pieceCount = dWgt.divide(new BigDecimal(mtrDataEntity.getPurchaseRate()),2,BigDecimal.ROUND_HALF_UP);
//					map.put("pieceCount",pieceCount);//件数
//					map.put("purchaseUnit",mtrDataEntity.getPurchaseUnit());//库存单位=采购单位
//
//					returnMap.put(mtrDataEntity.getId().toString(),map);
//				}
			}
		}
//		System.out.println("returnMap.size---->returnMap.size="+returnMap.size());
//		for (String key : returnMap.keySet()) {
//			System.out.println("return---->key= "+ key + " and value= " + returnMap.get(key));
//		}

		return returnMap;
	}

	private Map<String,Object> groupData(List<Map<String,Object>> data){
		if(data != null && data.size() > 0 ){
			Map<String,Object> newMap = new HashMap<>();
			for (Map<String,Object> map :data) {
				if(newMap.get("mtrId")!=null && newMap.get("mtrId").equals(map.get("mtrId"))){
					newMap = map;
				}else{
//					Map<String,Object> tempMap = map.get(key);
				}
			}
		}

		return null;
	}

	public static void main(String[] args){
		Map<String,Object> map = new ConcurrentHashMap<>();

//		map.put("1","1-1-1");
//		map.put("2","1-1-2");
//		map.put("3","1-1-3");

		for(int i=1;i<=3;i++){
			Map<String,Object> mapTemp = new HashMap<>();
			mapTemp.put("mtrId","222-"+i);
			mapTemp.put("mtrName","222-222-"+i);
			mapTemp.put("miniUnit","222-222-222-"+i);//最小单位
			mapTemp.put("dWgt",15);//需求重量
			mapTemp.put("pieceWgt",1.5);//件重
			mapTemp.put("pieceCount",10);//件数
			mapTemp.put("purchaseUnit","222-222-222-2222-"+i);//库存单位=采购单位

			if(map.size() > 0){
				System.out.println("---------1");
				for (String key : map.keySet()) {
					if(key.equals(String.valueOf(i))){
						map.put(String.valueOf(i+1),mapTemp);
					}else{
						map.put(String.valueOf(i),mapTemp);
					}
				}
			}else{
				map.put(String.valueOf(i+99),mapTemp);
			}



		}


		for (String key : map.keySet()) {
			System.out.println("return---->key= "+ key + " and value= " + map.get(key));
		}
	}


}
