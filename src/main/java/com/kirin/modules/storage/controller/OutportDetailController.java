package com.kirin.modules.storage.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

import com.kirin.common.fileUtils.ExcelDataEntity;
import com.kirin.common.fileUtils.ExcelUtils;
import com.kirin.common.utils.*;
import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.entity.TypeInfoEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.modules.baseData.service.TypeInfoService;
import com.kirin.modules.common.controller.CommonUtil;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.sales.entity.CustomerInfoEntity;
import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sales.entity.ProductionOrderEntity;
import com.kirin.modules.sales.service.CustomerInfoService;
import com.kirin.modules.sales.service.ProductionOrderDetailService;
import com.kirin.modules.sales.service.ProductionOrderService;
import com.kirin.modules.storage.entity.OutportInfoEntity;
import com.kirin.modules.storage.service.OutportInfoService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.storage.entity.OutportDetailEntity;
import com.kirin.modules.storage.service.OutportDetailService;

import javax.servlet.http.HttpServletResponse;


/**
 * 出库记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-12-25 23:45:15
 */
@RestController
@RequestMapping("/storage/outportdetail")
public class OutportDetailController extends AbstractController {
	@Autowired
	private OutportDetailService outportDetailService;
	@Autowired
	private OutportInfoService outportInfoService;

	@Autowired
	private ProductionOrderService productionOrderService;

	/**
	 * 查询可用于出库的订单列表
	 */
	@RequestMapping("/orderList")
//	@RequiresPermissions("storage:outportdetail:list")
	public R orderList(@RequestParam Map<String, Object> params){
		//查询列表数据
		params.put("status",new String[]{"2","3"});

		Query query = new Query(params);

		List<ProductionOrderEntity> productionOrderEntityList = productionOrderService.queryList(query);
		int total = productionOrderService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(productionOrderEntityList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 列表
	 */
	@RequestMapping("/outportInfoList")
//	@RequiresPermissions("storage:outportdetail:list")
	public R outportInfoList(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);

		List<OutportInfoEntity> outportInfoEntityList = outportInfoService.queryList(query);

//		List<OutportDetailEntity> outportDetailList = outportDetailService.queryList(query);
		int total = outportInfoService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(outportInfoEntityList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("storage:outportdetail:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<OutportDetailEntity> outportDetailList = outportDetailService.queryList(query);
		int total = outportDetailService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(outportDetailList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("storage:outportdetail:info")
	public R info(@PathVariable("id") Long id){
		OutportDetailEntity outportDetail = outportDetailService.queryObject(id);
		
		return R.ok().put("outportDetail", outportDetail);
	}

	/**
	 * 根据订单Id查询出库单信息
	 */
	@RequestMapping("/outportInfo/{id}")
//	@RequiresPermissions("storage:outportdetail:outportInfo")
	public R outportInfo(@PathVariable("id") Long id){
		OutportInfoEntity outportInfoEntity = outportInfoService.queryObjectByOrderId(id);

		return R.ok().put("outportInfo", outportInfoEntity);
	}

	@RequestMapping("/outportInfoByOutId/{id}")
//	@RequiresPermissions("storage:outportdetail:outportInfo")
	public R outportInfoByOutId(@PathVariable("id") Long id){
		OutportInfoEntity outportInfoEntity = outportInfoService.queryObject(id);
		if(outportInfoEntity.getCustomerId() != null ){
			CustomerInfoEntity customerInfoEntity = customerInfoService.queryObject(Long.valueOf(outportInfoEntity.getCustomerId().toString()));
			outportInfoEntity.setCustomerName(customerInfoEntity.getCustomerName());
		}
		if(outportInfoEntity.getPlaceId() != null ){
			TypeInfoEntity typeInfoEntity = typeInfoService.queryObject(Long.valueOf(outportInfoEntity.getPlaceId().toString()));
			outportInfoEntity.setCustomerName(typeInfoEntity.getTypeName());
		}
		if(outportInfoEntity.getOrderId() != null ){
			ProductionOrderEntity productionOrderEntity = productionOrderService.queryObject(outportInfoEntity.getOrderId());
			outportInfoEntity.setProductionNo(productionOrderEntity.getProductionNo());
		}

		return R.ok().put("outportInfo", outportInfoEntity);
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("storage:outportdetail:save")
	public R save(@RequestBody OutportDetailEntity outportDetail){
		SysUserEntity sysUserEntity =  getUser();

		outportDetail.setCreateUser(sysUserEntity.getUsername());
		outportDetail.setOutDate(new Date());

		outportDetailService.save(outportDetail);
		
		return R.ok();
	}

	@Autowired
	TypeInfoService typeInfoService;

	@Autowired
	CustomerInfoService customerInfoService;

	@RequestMapping("/save2")
//	@RequiresPermissions("storage:outportdetail:save")
	public R save2(@RequestParam Map<String, Object> params){

		String isDH = params.get("isDH").toString();
		String outportNo = params.get("outportNo").toString();
		String customerId = params.get("customerId").toString();
		String orderTypeId = params.get("orderTypeId").toString();
		String placeId = params.get("placeId").toString();

		OutportInfoEntity outportInfoEntity = new OutportInfoEntity();
		outportInfoEntity.setOutporrtNo(outportNo);
		outportInfoEntity.setStatus("1");

		if(isDH.equals("0")){//不是低值易耗领料
			TypeInfoEntity typeInfoEntity1 = typeInfoService.queryObject(Long.valueOf(orderTypeId));
			outportInfoEntity.setOrderTypeId(Long.valueOf(orderTypeId));
			outportInfoEntity.setOrderTypeName(typeInfoEntity1.getTypeName());

			TypeInfoEntity typeInfoEntity2 = typeInfoService.queryObject(Long.valueOf(placeId));
			outportInfoEntity.setPlaceId(Long.valueOf(placeId));
			outportInfoEntity.setPlaceName(typeInfoEntity2.getTypeName());

			CustomerInfoEntity customerInfoEntity = customerInfoService.queryObject(Long.valueOf(customerId));
			outportInfoEntity.setCustomerId(Long.valueOf(customerId));
			outportInfoEntity.setCustomerNo(customerInfoEntity.getCustomerCode());
			outportInfoEntity.setCustomerName(customerInfoEntity.getCustomerName());
		}else{
			outportInfoEntity.setRemark("低值易耗单");
		}

		SysUserEntity sysUserEntity =  getUser();

		outportInfoEntity.setCreateUser(sysUserEntity.getUsername());
		outportInfoEntity.setCreateDate(new Date());

		outportInfoService.save(outportInfoEntity);

		return R.ok().put("data",outportInfoEntity);
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("storage:outportdetail:update")
	public R update(@RequestBody OutportDetailEntity outportDetail){
		outportDetailService.update(outportDetail);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("storage:outportdetail:delete")
	public R delete(@RequestBody Long[] ids){
		outportDetailService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/deleteDetail/{id}")
//	@RequiresPermissions("storage:outportdetail:delete")
	public R deleteDetail(@PathVariable("id") Long id){
		outportDetailService.delete(id);
		return R.ok();
	}

	/**
	 * 删除
	 */
	@RequestMapping("/deleteInfo/{id}")
//	@RequiresPermissions("storage:outportdetail:delete")
	public R deleteInfo(@PathVariable("id") Long id){
		outportInfoService.delete(id);
		outportDetailService.deleteByInfoId(id);

		return R.ok();
	}

	@Autowired
	private CommonUtilService commonUtilService;

	/**
	 * 根据订单ID来生成出库单信息
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/createOutportInfo")
	public R createOutportInfo(@RequestParam("orderId")Long orderId,@RequestParam("billNo")String billNo){
		ProductionOrderEntity productionOrderEntity = productionOrderService.queryObject(orderId);

		SysUserEntity sysUserEntity =  getUser();
		if(productionOrderEntity != null){
			OutportInfoEntity outportInfoEntity = new OutportInfoEntity();
			outportInfoEntity.setOrderId(productionOrderEntity.getId());

//			String likeDateStr = DateUtils.format(new Date(),"yyyyMMdd");
//			String currentMaxNo = commonUtilService.getTableMaxNo("OUTPORRT_NO","tb_outport_info",likeDateStr);

			outportInfoEntity.setOutporrtNo(billNo);
			outportInfoEntity.setCustomerId(productionOrderEntity.getCustomerId());
			outportInfoEntity.setOrderTypeId(productionOrderEntity.getOrderTypeId());
			outportInfoEntity.setOutDate(DateUtils.format(new Date(),"yyyy-MM-dd HH:mm:ss"));
			outportInfoEntity.setStatus("1");
			outportInfoEntity.setCreateUser(sysUserEntity.getUsername());
			outportInfoEntity.setCreateDate(new Date());

			outportInfoService.save(outportInfoEntity);
			//修改订单状态
			productionOrderEntity.setStatus("3");
			productionOrderService.update(productionOrderEntity);
		}
		return R.ok();
	}

	@RequestMapping("/getOrderMtrList")
	public R getOrderMtrList(@RequestParam Map<String, Object> params){

		List<OutportDetailEntity> outportDetailEntityList = new ArrayList<>();

		if(params.get("orderId").toString().equals("0")){

			Query query = new Query(params);
			outportDetailEntityList = outportDetailService.queryList(query);
			PageUtils pageUtil = new PageUtils(outportDetailEntityList, 0, query.getLimit(), query.getPage());
			return R.ok().put("page", pageUtil);
		}

		Long orderId = Long.valueOf(params.get("orderId").toString());

		List<Map> map = createOutPortDetail(orderId);
		for (Map temp:map) {
			OutportDetailEntity outportDetailEntity = new OutportDetailEntity();
			outportDetailEntity.setMtrId(Long.valueOf(temp.get("mtrId").toString()));
			outportDetailEntity.setMtrName(temp.get("mtrName").toString());
			outportDetailEntity.setMtrNo(temp.get("mtrCode").toString());
			outportDetailEntity.setMtrTypeName(temp.get("mtrTypeName").toString());

			outportDetailEntity.setOutUnit(temp.get("outUnit") == null ? "" : temp.get("outUnit").toString());

			BigDecimal miniRate = new BigDecimal(temp.get("miniRate") == null ? "0" : temp.get("miniRate").toString());
			BigDecimal orderCount = new BigDecimal(temp.get("orderCount") == null ? "0" : temp.get("orderCount").toString());
			//计算已领数量
			String outCountTemp = compOutCount(orderId,Long.valueOf(temp.get("mtrId").toString()));
			BigDecimal outCount = new BigDecimal(outCountTemp == null ? "0" : outCountTemp);
			if(temp.get("miniRate") == null || temp.get("miniRate").toString().equals("0")){
				outportDetailEntity.setOrderCount(new BigDecimal("0"));
				outportDetailEntity.setOutCount(new BigDecimal("0"));
			}else{
				outportDetailEntity.setOrderCount(orderCount.divide(miniRate,4,BigDecimal.ROUND_HALF_UP));
				outportDetailEntity.setOutCount(outCount.divide(miniRate,4,BigDecimal.ROUND_HALF_UP));
			}
			outportDetailEntityList.add(outportDetailEntity);
		}
		Query query = new Query(params);

		int total = outportDetailEntityList.size();
		PageUtils pageUtil = new PageUtils(outportDetailEntityList, total, query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}


	public String compOutCount(Long orderId,Long mtrId){
		//根据订单ID以及原料ID查询该原料的已领数量
		BigDecimal outCount = new BigDecimal("0");
		//根据订单查询出库单明细
		List<OutportDetailEntity> outportDetailEntityList =	outportDetailService.queryDetailListByOrderId(orderId,mtrId);
		if(outportDetailEntityList != null && outportDetailEntityList.size() > 0){
			for (OutportDetailEntity outportDetailEntity:outportDetailEntityList) {
				outCount = outCount.add(outportDetailEntity.getOutCount());
			}
		}
		return outCount.toString();
	}

	/**
	 * 根据订单ID以及原料Id来查询已出库的明细信息
	 * @param params
	 * @return
	 */
	@RequestMapping("/getOutportDetailList")
	public R getOutportDetailList(@RequestParam Map<String, Object> params){
		Long orderId = null;
		if(!params.get("orderId").toString().equals("null")){
			orderId = Long.valueOf(params.get("orderId").toString());
		}
		Long mtrId = Long.valueOf(params.get("mtrId").toString());
		Long outportId = Long.valueOf(params.get("outportId").toString());



		List<Map> map = outportDetailService.getOutportDetailList(orderId,mtrId,outportId);

		Query query = new Query(params);

		PageUtils pageUtil = new PageUtils(map, map.size(), query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}

	@RequestMapping("/updateOutportInfoStatus")
	public R updateOutportInfoStatus(@RequestParam("orderId")Long orderId,@RequestParam("status")String status){
		OutportInfoEntity outportInfoEntity = outportInfoService.queryObjectByOrderId(orderId);
		outportInfoEntity.setStatus(status);

		outportInfoService.update(outportInfoEntity);
		return R.ok();
	}


	@RequestMapping("/confirmOrder")
	public R confirmOrder(@RequestBody Long[] ids){
		for (Long id:ids) {
			ProductionOrderEntity productionOrderEntity = productionOrderService.queryObject(id);
			List<Map> map = createOutPortDetail(id);
			String no = "L"+productionOrderEntity.getProductionNo();
			for (Map temp:map) {
				OutportDetailEntity outportDetailEntity = new OutportDetailEntity();
//				outportDetailEntity.setOrderId(id);
//				outportDetailEntity.setCustomerId(Long.valueOf(temp.get("customerId").toString()));
//				outportDetailEntity.setCustomerName(temp.get("customerName").toString());
//				outportDetailEntity.setCustomerNo(temp.get("customerNo").toString());
//				outportDetailEntity.setPrdId(Long.valueOf(temp.get("prdId").toString()));
//				outportDetailEntity.setPrdName(temp.get("prdName").toString());
//				outportDetailEntity.setPrdNo(temp.get("prdCode").toString());
//				outportDetailEntity.setPrdTypeName(temp.get("prdTypeName").toString());
				outportDetailEntity.setMtrId(Long.valueOf(temp.get("mtrId").toString()));
				outportDetailEntity.setMtrName(temp.get("mtrName").toString());
				outportDetailEntity.setMtrNo(temp.get("mtrCode").toString());
				outportDetailEntity.setMtrTypeName(temp.get("mtrTypeName").toString());
				outportDetailEntity.setOrderCount(new BigDecimal(temp.get("orderCount").toString()));
				outportDetailEntity.setOutUnit(temp.get("outUnit") == null ? "" : temp.get("outUnit").toString());
//				outportDetailEntity.setOutportNo(no);
//				outportDetailService.save(outportDetailEntity);
			}
//			productionOrderEntity.setStatus("2");
//			productionOrderService.update(productionOrderEntity);
		}
		return R.ok();
	}


	@Autowired
	ProductionOrderDetailService productionOrderDetailService;


	/**
	 * 根据订单创建原料出库明细
	 * @param orderId
	 * @return
	 */
	public List<Map> createOutPortDetail(Long orderId){
		ProductionOrderEntity productionOrderEntity = productionOrderService.queryObject(orderId);//订单信息
		Map<String,Object> objectMap = new HashMap<>();
		objectMap.put("productionOrderId",orderId);
		List<ProductionOrderDetailEntity> productionOrderEntityList = productionOrderDetailService.queryList(objectMap);//订单明细信息

		List<Map> mapList = new ArrayList<>();
		for (ProductionOrderDetailEntity productionOrderDetailEntity:productionOrderEntityList) {
//			List<Map> mapListTemp = findAllMtrByPrd(productionOrderDetailEntity.getPrdId(),null,null);//递归查询这个产品所需要的所有原料信息
			List<Map> mapListTemp = findAllMtrByPrd2(productionOrderDetailEntity.getPrdId(),null,null,new BigDecimal(productionOrderDetailEntity.getAmount().toString()));//递归查询这个产品所需要的所有原料信息
			mapList.addAll(mapListTemp);



			//完善客户信息和产品信息与计算数量
			for (Map mapTemp:mapList) {
				mapTemp.put("orderId",productionOrderEntity.getId());
				mapTemp.put("customerId",productionOrderEntity.getCustomerId());
				mapTemp.put("customerName",productionOrderEntity.getCustomerName());
				mapTemp.put("customerNo",productionOrderEntity.getCustomerNo());

//				BigDecimal mtrGrossWgt = new BigDecimal(mapTemp.get("mtrGrossWgt") == null ? "0" : mapTemp.get("mtrGrossWgt").toString());
//				BigDecimal orderAmount = new BigDecimal(productionOrderDetailEntity.getAmount() == null ? "0" : productionOrderDetailEntity.getAmount().toString());

//				BigDecimal mtrAmount = mtrGrossWgt.multiply(orderAmount).setScale(2,BigDecimal.ROUND_HALF_UP);
//				mtrAmount = mtrAmount.divide(new BigDecimal(1000)).setScale(2,BigDecimal.ROUND_HALF_UP);


				mapTemp.put("orderCount",mapTemp.get("orderWgt"));
			}
		}
		/**
		 * 集合去重算法
		 */
//		List<Map> returnList = new ArrayList<>();
//		for (Map mapTemp:mapList) {
//			if(returnList.size()<=0){
//				returnList.add(mapTemp);
//			}
//			boolean flag = false;
//			for (int i=0;i < returnList.size(); i++) {
//				Map temp = returnList.get(i);
//				if(mapTemp.get("mtrId").toString().equals(temp.get("mtrId").toString())){
//					flag = true;
//					break;
//				}
//			}
//			if(flag){
//				for (int i=0;i < returnList.size(); i++) {
//					Map temp = returnList.get(i);
//					if(mapTemp.get("mtrId").toString().equals(temp.get("mtrId").toString())){
//						BigDecimal newCount = new BigDecimal(temp.get("orderCount").toString());
//						BigDecimal oldCount = new BigDecimal(mapTemp.get("orderCount").toString());
//						BigDecimal sumCount = newCount.add(oldCount).setScale(2,BigDecimal.ROUND_HALF_UP);
//						temp.put("orderCount",sumCount);
//
//						returnList.remove(i);
//						returnList.add(temp);
//					}
//				}
//			}else{
//				returnList.add(mapTemp);
//			}
//
//		}
//
		return mapList;
	}

	@Autowired
	MtrDataService mtrDataService;

	@RequestMapping("/findOutMtrByOrderId")
	public R findOutMtrByOrderId(@RequestParam(value="orderId")Long orderId,@RequestParam(value="takeStnId",required = false)Long takeStnId,@RequestParam(value="wearhouseId",required = false)Long wearhouseId){
		List<Map> returnList = new ArrayList<>();

		ProductionOrderEntity productionOrderEntity = productionOrderService.queryObject(orderId);
		Map<String,Object> objectMap = new HashMap<>();
		objectMap.put("productionOrderId",orderId);
		List<ProductionOrderDetailEntity> productionOrderEntityList = productionOrderDetailService.queryList(objectMap);

		List<Map> mapList = new ArrayList<>();
		for (ProductionOrderDetailEntity productionOrderDetailEntity:productionOrderEntityList) {
			List<Map> mapListTemp = findAllMtrByPrd(productionOrderDetailEntity.getPrdId(),takeStnId,wearhouseId);
			mapList.addAll(mapListTemp);
			//完善客户信息和产品信息与计算数量
			for (Map mapTemp:mapList) {
				mapTemp.put("orderId",productionOrderEntity.getId());
				mapTemp.put("customerId",productionOrderEntity.getCustomerId());
				mapTemp.put("customerName",productionOrderEntity.getCustomerName());
				mapTemp.put("customerNo",productionOrderEntity.getCustomerNo());

				BigDecimal mtrGrossWgt = new BigDecimal(mapTemp.get("mtrGrossWgt") == null ? "0" : mapTemp.get("mtrGrossWgt").toString());
				BigDecimal orderAmount = new BigDecimal(productionOrderDetailEntity.getAmount() == null ? "0" : productionOrderDetailEntity.getAmount().toString());

				BigDecimal mtrAmount = mtrGrossWgt.multiply(orderAmount).setScale(2,BigDecimal.ROUND_HALF_UP);
				mapTemp.put("orderCount",mtrAmount);
			}
		}

		//计算是否存在重复原料。
		Object[] objectArr = new CommonUtils().findRepeat(mapList,"mtrId");
		if(objectArr != null && objectArr.length > 0) {//存在重复项
			List<Map> mapListTemp = new CommonUtils().clearRepeat(mapList, "mtrId");

			for (int i = 0; i < objectArr.length; i++) {
				Map mapObj = new HashMap();
				BigDecimal count = new BigDecimal("0");
				for (Map mapTemp : mapList) {
					if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
						count = count.add(new BigDecimal(mapTemp.get("orderCount").toString()));
					}
				}
				for (Map mapTemp : mapListTemp) {
					if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
						mapTemp.put("orderCount", count);
					}
				}
			}
			returnList.addAll(mapListTemp);
		}else{
			returnList.addAll(mapList);
		}

		//计算此订单各原料已出库的数量
		for (int i=0;i < returnList.size(); i++) {
			Map temp = returnList.get(i);
			Long mtrId = Long.valueOf(temp.get("mtrId").toString());
			BigDecimal haveOutboundCount = outportDetailService.getOutboundCount(mtrId,orderId);
			//转换为配方单位用量
//			MtrDataEntity mtrData = mtrDataService.queryObject(mtrId);
//			haveOutboundCount = haveOutboundCount.multiply(new BigDecimal(mtrData.getMiniRate())).setScale(BigDecimal.ROUND_HALF_DOWN,4);
//			haveOutboundCount = haveOutboundCount.multiply(new BigDecimal(mtrData.getPurchaseRate())).setScale(BigDecimal.ROUND_HALF_DOWN,4);

			temp.put("outCount",haveOutboundCount);
		}


//		for (Map mapTemp:mapList) {
//			if(returnList.size()<=0){
//				returnList.add(mapTemp);
//			}
//			for (int i=0;i < returnList.size(); i++) {
//				Map temp = returnList.get(i);
//				if(mapTemp.get("mtrId").toString().equals(temp.get("mtrId").toString())){
//					BigDecimal newCount = new BigDecimal(temp.get("orderCount").toString());
//					BigDecimal oldCount = new BigDecimal(temp.get("orderCount").toString());
//					BigDecimal sumCount = newCount.add(oldCount).setScale(2,BigDecimal.ROUND_HALF_UP);
//					temp.put("orderCount",sumCount);
//				}else{
//					returnList.add(mapTemp);
//				}
//			}
//		}
		int total = returnList.size();

		PageUtils pageUtil = new PageUtils(returnList, total, 99, 1);

		return R.ok().put("page", pageUtil);
	}

	@Autowired
	BomDetailService bomDetailService;
	@Autowired
	BomInfoService bomInfoService;

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

	/**
	 * @Date 2018-07-16
	 * @param prdId
	 * @param takeStnId
	 * @param warehouseId
	 * @param orderAmount
	 * @return
	 */
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
					BigDecimal orderWgt = grossWgt.multiply(orderAmount).setScale(2,BigDecimal.ROUND_HALF_UP);
					map.put("orderWgt",orderWgt);
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
							count = count.add(new BigDecimal(mapTemp.get("orderWgt").toString()));
						}
					}
					for (Map mapTemp : mapListTemp) {
						if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
							mapTemp.put("orderWgt", count);
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

	@RequestMapping("/export")
	public void exportExcel(HttpServletResponse response, @RequestParam Map<String, Object> params) throws Exception {

		for(Object key : params.keySet()){
			System.out.print(key.toString()+"-----"+params.get(key));
		}


		ExcelDataEntity data = new ExcelDataEntity();
		List<String> titles = new ArrayList();

		data.setSheetName("领料凭证");
		titles.add("公司");//SX02
		titles.add("记账日期");//入库日期
		titles.add("业务日期");//入库日期
		titles.add("会计期间");//月份
		titles.add("凭证类型");//记
		titles.add("凭证号");//028
		titles.add("分录号");//序号
		titles.add("摘要");//领料单号-客户订单号
		titles.add("科目");//5001.01.01代表生产成本食材科目代码 5001.01.02代表生产成本包材科目代码 1403.02.01代表原材料食材科目代码 1403.02.03代表包材科目代码
		titles.add("币种");//BB01
		titles.add("汇率");//1
		titles.add("方向");//2202.01.01.01时为0.其它为1
		titles.add("原币金额");
		titles.add("数量");//0
		titles.add("单价");//0
		titles.add("借方金额");
		titles.add("贷方金额");
		titles.add("制单人");//胡艳芳
		titles.add("过账人");
		titles.add("审核人");
		titles.add("附件数量");//0
		titles.add("过账标记");//FALSE
		titles.add("机制凭证模板");
		titles.add("删除标记");//FALSE
		titles.add("凭证序号");//1516931982828--0
		titles.add("单位");
		titles.add("参考信息");
		titles.add("是否有现金流量");
		titles.add("现金流量标记");//0
		titles.add("业务编号");
		titles.add("结算方式");
		titles.add("结算号");
		titles.add("辅助账摘要");//领料单号-客户订单号
		for (int i=1;i<=8;i++){
			titles.add("核算项目"+i);
			titles.add("编码"+i);
			titles.add("名称"+i);
		}
		titles.add("换票证号");
		titles.add("发票号");
		titles.add("客户");
		titles.add("费用类别");
		titles.add("收款人");
		titles.add("物料");
		titles.add("财务组织");
		titles.add("供应商");
		titles.add("辅助账业务日期");//领料日期
		titles.add("到期日");

		data.setTitles(titles);

		List<List<Object>> rows = new ArrayList();


		data.setRows(rows);
		//生成本地
		/*File f = new File("c:/test.xlsx");
		FileOutputStream out = new FileOutputStream(f);
		ExportExcelUtils.exportExcel(data, out);
		out.close();*/
		SimpleDateFormat fdate=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String fileName=fdate.format(new Date())+"-领料凭证.xlsx";
		ExcelUtils.exportExcel(response,fileName,data);
	}

}
