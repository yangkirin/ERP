package com.kirin.modules.storage.controller;

import java.math.BigDecimal;
import java.util.*;

import com.kirin.common.utils.*;
import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sales.entity.ProductionOrderEntity;
import com.kirin.modules.sales.service.ProductionOrderDetailService;
import com.kirin.modules.sales.service.ProductionOrderService;
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
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("storage:outportdetail:save")
	public R save(@RequestBody OutportDetailEntity outportDetail){
		SysUserEntity sysUserEntity =  getUser();

		outportDetail.setCreateUser(sysUserEntity.getUsername());
		outportDetail.setOutDate(new Date());

		outportDetail.setOutportNo(CommonUtils.createBillNo("LLCK"));

		outportDetailService.save(outportDetail);
		
		return R.ok();
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

	@RequestMapping("/confirmOrder")
	public R confirmOrder(@RequestBody Long[] ids){
		for (Long id:ids) {
			ProductionOrderEntity productionOrderEntity = productionOrderService.queryObject(id);
			List<Map> map = createOutPortDetail(id);
			String no = "L"+productionOrderEntity.getProductionNo();
			for (Map temp:map) {
				OutportDetailEntity outportDetailEntity = new OutportDetailEntity();
				outportDetailEntity.setOrderId(id);
				outportDetailEntity.setCustomerId(Long.valueOf(temp.get("customerId").toString()));
				outportDetailEntity.setCustomerName(temp.get("customerName").toString());
				outportDetailEntity.setCustomerNo(temp.get("customerNo").toString());
				outportDetailEntity.setPrdId(Long.valueOf(temp.get("prdId").toString()));
				outportDetailEntity.setPrdName(temp.get("prdName").toString());
				outportDetailEntity.setPrdNo(temp.get("prdCode").toString());
				outportDetailEntity.setPrdTypeName(temp.get("prdTypeName").toString());
				outportDetailEntity.setMtrId(Long.valueOf(temp.get("mtrId").toString()));
				outportDetailEntity.setMtrName(temp.get("mtrName").toString());
				outportDetailEntity.setMtrNo(temp.get("mtrCode").toString());
				outportDetailEntity.setMtrTypeName(temp.get("mtrTypeName").toString());
				outportDetailEntity.setOrderCount(new BigDecimal(temp.get("orderCount").toString()));
				outportDetailEntity.setOutUnit(temp.get("outUnit") == null ? "" : temp.get("outUnit").toString());
				outportDetailEntity.setOutportNo(no);
				outportDetailService.save(outportDetailEntity);
			}
			productionOrderEntity.setStatus("2");
			productionOrderService.update(productionOrderEntity);
		}
		return R.ok();
	}


	@Autowired
	ProductionOrderDetailService productionOrderDetailService;
	@Autowired
	ProductionOrderService productionOrderService;

	public List<Map> createOutPortDetail(Long orderId){
		ProductionOrderEntity productionOrderEntity = productionOrderService.queryObject(orderId);
		Map<String,Object> objectMap = new HashMap<>();
		objectMap.put("productionOrderId",orderId);
		List<ProductionOrderDetailEntity> productionOrderEntityList = productionOrderDetailService.queryList(objectMap);

		List<Map> mapList = new ArrayList<>();
		for (ProductionOrderDetailEntity productionOrderDetailEntity:productionOrderEntityList) {
			List<Map> mapListTemp = findAllMtrByPrd(productionOrderDetailEntity.getPrdId(),null,null);
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
				mtrAmount = mtrAmount.divide(new BigDecimal(1000)).setScale(2,BigDecimal.ROUND_HALF_UP);
				mapTemp.put("orderCount",mtrAmount);
			}
		}
		List<Map> returnList = new ArrayList<>();
		for (Map mapTemp:mapList) {
			if(returnList.size()<=0){
				returnList.add(mapTemp);
			}
			boolean flag = false;
			for (int i=0;i < returnList.size(); i++) {
				Map temp = returnList.get(i);
				if(mapTemp.get("mtrId").toString().equals(temp.get("mtrId").toString())){
					flag = true;
					break;
				}
			}
			if(flag){
				for (int i=0;i < returnList.size(); i++) {
					Map temp = returnList.get(i);
					if(mapTemp.get("mtrId").toString().equals(temp.get("mtrId").toString())){
						BigDecimal newCount = new BigDecimal(temp.get("orderCount").toString());
						BigDecimal oldCount = new BigDecimal(mapTemp.get("orderCount").toString());
						BigDecimal sumCount = newCount.add(oldCount).setScale(2,BigDecimal.ROUND_HALF_UP);
						temp.put("orderCount",sumCount);

						returnList.remove(i);
						returnList.add(temp);
					}
				}
			}else{
				returnList.add(mapTemp);
			}

		}

		return returnList;
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




}
