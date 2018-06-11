package com.kirin.modules.purchase.controller;

import java.math.BigDecimal;
import java.util.*;

import com.kirin.common.utils.DateUtils;
import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.entity.MtrExtendEntity;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.modules.baseData.service.MtrExtendService;
import com.kirin.modules.common.controller.CommonUtil;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.common.utils.CommonUtils;
import com.kirin.modules.purchase.entity.OrderInfoEntity;
import com.kirin.modules.purchase.entity.SuppierMtrEntity;
import com.kirin.modules.purchase.entity.SupplierInfoEntity;
import com.kirin.modules.purchase.service.OrderInfoService;
import com.kirin.modules.purchase.service.SuppierMtrService;
import com.kirin.modules.purchase.service.SupplierInfoService;
import com.kirin.modules.storage.entity.ImportDetailEntity;
import com.kirin.modules.storage.entity.ImportEntity;
import com.kirin.modules.storage.service.ImportDetailService;
import com.kirin.modules.storage.service.ImportService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.purchase.entity.OrderDetailEntity;
import com.kirin.modules.purchase.service.OrderDetailService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 订单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
@RestController
@RequestMapping("/purchase/orderdetail")
public class OrderDetailController  extends AbstractController {
	@Autowired
	private OrderDetailService orderDetailService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
//	@RequiresPermissions("purchase:orderdetail:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<OrderDetailEntity> orderDetailList = orderDetailService.queryList(query);
		int total = orderDetailService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(orderDetailList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
//	@RequiresPermissions("purchase:orderdetail:info")
	public R info(@PathVariable("id") Long id){
		OrderDetailEntity orderDetail = orderDetailService.queryObject(id);
		
		return R.ok().put("orderDetail", orderDetail);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
//	@RequiresPermissions("purchase:orderdetail:save")
	public R save(@RequestBody OrderDetailEntity orderDetail){
		SysUserEntity sysUserEntity =  getUser();

		orderDetail.setCreateUser(sysUserEntity.getUsername());
		orderDetail.setCreateDate(new Date());
		orderDetailService.save(orderDetail);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
//	@RequiresPermissions("purchase:orderdetail:update")
	public R update(@RequestBody OrderDetailEntity orderDetail){
		SysUserEntity sysUserEntity =  getUser();

		orderDetail.setUpdateUser(sysUserEntity.getUsername());
		orderDetail.setUpdateDate(new Date());
		orderDetailService.update(orderDetail);
		
		return R.ok();
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
//	@RequiresPermissions("purchase:orderdetail:delete")
	public R delete(@RequestBody Long[] ids){
		orderDetailService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/editDetail")
	public R editDetail(@RequestParam("id")Long detailId,@RequestParam("amount")String amount,@RequestParam("inCount")String inCount){
		OrderDetailEntity orderDetail = orderDetailService.queryObject(detailId);
		orderDetail.setAmount(Double.valueOf(amount));
		orderDetail.setInCount(inCount);

		SysUserEntity sysUserEntity =  getUser();

		orderDetail.setUpdateUser(sysUserEntity.getUsername());
		orderDetail.setUpdateDate(new Date());

		orderDetailService.update(orderDetail);
		return R.ok();
	}


	@RequestMapping("/addDetail")
	public R addDetail(@RequestParam("suppilerId")Long suppilerId,@RequestParam("orderId")Long orderId,@RequestParam("mtrId")Long mtrId,@RequestParam("amount")Double amount,@RequestParam("price")String price){
		MtrDataEntity mtrData = mtrDataService.queryObject(mtrId);

		List<SuppierMtrEntity> suppierMtrEntityList = suppierMtrService.querySupplierByMtrId(mtrId,suppilerId);
		if(suppierMtrEntityList != null){
			for (SuppierMtrEntity suppierMtrEntity:suppierMtrEntityList) {
				if(suppierMtrEntity.getMtrId().equals(mtrData.getId())){

					OrderDetailEntity orderDetailEntity = new OrderDetailEntity();

					orderDetailEntity.setMtrId(mtrData.getId());
					orderDetailEntity.setMtrCode(mtrData.getMtrCode());
					orderDetailEntity.setMtrName(mtrData.getMtrName());
					orderDetailEntity.setMtrTypeId(Long.valueOf(mtrData.getTypeId()));
					orderDetailEntity.setMtrTypeName(mtrData.getTypeName());
					orderDetailEntity.setMtrUnit(mtrData.getPurchaseUnitName());
					orderDetailEntity.setMtrRate(mtrData.getPurchaseRate());
					orderDetailEntity.setWarehoseId(Long.valueOf(mtrData.getWarehouseId()));
					orderDetailEntity.setWarehoseName(mtrData.getWarehouseName());
					orderDetailEntity.setWgtUnit1(mtrData.getWgtUnit1());
					orderDetailEntity.setWgtUnit2(mtrData.getWgtUnit2());
					orderDetailEntity.setCostTypeId(Long.valueOf(mtrData.getCostType()));
					orderDetailEntity.setCostTypeName(mtrData.getCostTypeName());

					orderDetailEntity.setPurchaseNo(suppierMtrEntity.getPurchaseNo());
					//新增数据
					orderDetailEntity.setOrderId(orderId);
					orderDetailEntity.setPrice(new BigDecimal(price));
					orderDetailEntity.setAmount(amount);
//					orderDetailEntity.setInPrice(new BigDecimal(price));

					orderDetailService.save(orderDetailEntity);

					break;
				}
			}
		}
		return R.ok();
	}

	@Autowired
	private SuppierMtrService suppierMtrService;
	@Autowired
	private MtrDataService mtrDataService;
	@Autowired
	private MtrExtendService mtrExtendService;

	@RequestMapping("/getSupplierMtrById")
	public R getSupplierMtrDetail(@RequestParam("mtrId")Long mtrId,@RequestParam("supplierId") Long supplierId,@RequestParam("supplierMtrId") Long supplierMtrId){
		OrderDetailEntity orderDetailEntity = new OrderDetailEntity();

		SuppierMtrEntity suppierMtrEntity = null;
		MtrDataEntity mtrData = null;
		MtrExtendEntity mtrExtendEntity = null;
		if(supplierMtrId != null){
			suppierMtrEntity = suppierMtrService.queryObject(supplierMtrId);
			mtrData = mtrDataService.queryObject(suppierMtrEntity.getMtrId());
		}else{
			mtrData = mtrDataService.queryObject(mtrId);
			List<SuppierMtrEntity> suppierMtrEntityList = suppierMtrService.querySupplierByMtrId(mtrId,supplierId);
			if(suppierMtrEntityList != null && suppierMtrEntityList.size() > 0) {
				suppierMtrEntity = suppierMtrEntityList.get(0);
			}
		}

		if(suppierMtrEntity.getMtrExtendId() != null && suppierMtrEntity.getMtrExtendId() != 0){
			mtrExtendEntity = mtrExtendService.queryObject(suppierMtrEntity.getMtrExtendId());
		}

		orderDetailEntity.setMtrId(mtrData.getId());
		orderDetailEntity.setMtrCode(mtrData.getMtrCode());
		orderDetailEntity.setMtrName(mtrData.getMtrName());
		orderDetailEntity.setMtrTypeId(Long.valueOf(mtrData.getTypeId()));
		orderDetailEntity.setMtrTypeName(mtrData.getTypeName());

		if(mtrExtendEntity != null){
			orderDetailEntity.setMtrUnit(mtrExtendEntity.getUnitName());
			orderDetailEntity.setMtrRate(mtrExtendEntity.getUnitRate().toString());
		}else{
			orderDetailEntity.setMtrUnit(mtrData.getPurchaseUnitName());
			orderDetailEntity.setMtrRate(mtrData.getPurchaseRate());
		}

		orderDetailEntity.setWarehoseId(Long.valueOf(mtrData.getWarehouseId()));
		orderDetailEntity.setWarehoseName(mtrData.getWarehouseName());
		orderDetailEntity.setWgtUnit1(mtrData.getWgtUnit1());
		orderDetailEntity.setWgtUnit2(mtrData.getWgtUnit2());
		orderDetailEntity.setCostTypeId(Long.valueOf(mtrData.getCostType()));
		orderDetailEntity.setCostTypeName(mtrData.getCostTypeName());

		orderDetailEntity.setPurchaseNo(suppierMtrEntity.getPurchaseNo());
		orderDetailEntity.setPrice(suppierMtrEntity.getPrice());

		return R.ok().put("data",orderDetailEntity);
	}

	@Autowired
	private OrderInfoService orderInfoService;
	@Autowired
	private CommonUtilService commonUtilService;
	@Autowired
	private SupplierInfoService supplierInfoService;
	@Autowired
	private ImportService importService;
	@Autowired
	private ImportDetailService importDetailService;

	@RequestMapping("/orderConfirm")
	public R orderConfirm(@RequestParam("orderId") Long orderId){
		OrderInfoEntity orderInfoEntity = orderInfoService.queryObject(orderId);
		SupplierInfoEntity supplierInfoEntity = supplierInfoService.queryObject(orderInfoEntity.getSupplierId());

		/*
		ImportEntity importEntity = new ImportEntity();
//		importEntity.setImportNo(newNo);
		importEntity.setOrderId(orderInfoEntity.getId());
//		importEntity.setImportDate(new Date(DateUtils.format(new Date(),DateUtils.DATE_TIME_PATTERN)));
//		importEntity.setImportDate(new Date());
		importEntity.setStatus("1");
		importEntity.setSupplierId(orderInfoEntity.getSupplierId());
		importEntity.setSupplierName(orderInfoEntity.getSupplierName());
		importEntity.setSupplierNo(supplierInfoEntity.getSuppierCode());

		importService.save(importEntity);
		*/
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("orderId",orderId);
//
//		List<OrderDetailEntity> orderDetailEntityList = orderDetailService.queryList(map);

//		saveImportDetail(orderDetailEntityList,importEntity);

		orderInfoEntity.setStatus("2");
		orderInfoService.update(orderInfoEntity);
		return R.ok();
	}


	public R storgConfirm(@RequestParam("orderId") Long orderId){
		OrderInfoEntity orderInfoEntity = orderInfoService.queryObject(orderId);
		SupplierInfoEntity supplierInfoEntity = supplierInfoService.queryObject(orderInfoEntity.getSupplierId());

		Long no = 0L;
		String currentNo = commonUtilService.getTableNewNo("TB_IMPORT","IMPORT_NO");
		if(currentNo != null && !currentNo.equals("")){
			//yyyyMMdd+0000
			no = Long.valueOf(currentNo.substring(8));
		}
		no = no+1;
		String newNo = new CommonUtils().createNoByDate(no);

		ImportEntity importEntity = new ImportEntity();
		importEntity.setImportNo(newNo);
		importEntity.setOrderId(orderInfoEntity.getId());
//		importEntity.setImportDate(new Date(DateUtils.format(new Date(),DateUtils.DATE_TIME_PATTERN)));
		importEntity.setImportDate(new Date());
		importEntity.setStatus("1");
		importEntity.setSupplierId(orderInfoEntity.getSupplierId());
		importEntity.setSupplierName(orderInfoEntity.getSupplierName());
		importEntity.setSupplierNo(supplierInfoEntity.getSuppierCode());

		importService.save(importEntity);

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderId",orderId);

		List<OrderDetailEntity> orderDetailEntityList = orderDetailService.queryList(map);

		saveImportDetail(orderDetailEntityList,importEntity);

		orderInfoEntity.setStatus("2");
		orderInfoService.update(orderInfoEntity);
		return R.ok();
	}

	private List<ImportDetailEntity> saveImportDetail(List<OrderDetailEntity> orderDetailEntityList,ImportEntity importEntity){
		if(orderDetailEntityList != null && orderDetailEntityList.size() > 0){
			for (OrderDetailEntity orderDetailEntity: orderDetailEntityList) {
				ImportDetailEntity importDetailEntity = new ImportDetailEntity();
				importDetailEntity.setMtrId(orderDetailEntity.getMtrId());
				importDetailEntity.setMtrNo(orderDetailEntity.getMtrCode());
				importDetailEntity.setMtrName(orderDetailEntity.getMtrName());
				importDetailEntity.setImportId(importEntity.getId());
//				importDetailEntity.setInCount(orderDetailEntity.getInCount());
//				importDetailEntity.setInDate(new Date(DateUtils.format(new Date(),DateUtils.DATE_TIME_PATTERN)));
//				importDetailEntity.setInDate(new Date());
//				importDetailEntity.setInPrice(orderDetailEntity.getInPrice());
				importDetailEntity.setInRate(orderDetailEntity.getMtrRate());
//				if(orderDetailEntity.getInPrice() == null ){
//					orderDetailEntity.setInPrice(new BigDecimal(0));
//				}
				if(StringUtils.isEmpty(orderDetailEntity.getInCount())){
					orderDetailEntity.setInCount("0");
				}
//				importDetailEntity.setInSumPrice(new BigDecimal(orderDetailEntity.getInPrice().toString()).multiply(new BigDecimal(orderDetailEntity.getInCount())));
				importDetailEntity.setInUnit(orderDetailEntity.getMtrUnit());
//				importDetailEntity.setInWgt(orderDetailEntity.getInWgt());
				importDetailEntity.setOrderCount(orderDetailEntity.getAmount().toString());
				importDetailEntity.setOrderPrice(orderDetailEntity.getPrice());
				importDetailEntity.setOrderSumPrice(new BigDecimal(orderDetailEntity.getPrice().toString()).multiply(new BigDecimal(orderDetailEntity.getAmount())).setScale(2,BigDecimal.ROUND_HALF_UP));
				System.out.println("---------------------.>>>==="+orderDetailEntity.getWgtUnit1());
				if(StringUtils.isEmpty(orderDetailEntity.getWgtUnit1())){
					importDetailEntity.setOrderMtrWgt(new BigDecimal(0));
				}else{
					importDetailEntity.setOrderMtrWgt(new BigDecimal(orderDetailEntity.getWgtUnit1().toString()));
				}
				importDetailEntity.setStatus("1");

				importDetailService.save(importDetailEntity);

			}
		}

		return null;
	}

	/**
	 * 财务确认
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/financeConfirm")
	public R financeConfirm(@RequestParam("orderId") Long orderId){
		OrderInfoEntity orderInfoEntity = orderInfoService.queryObject(orderId);
		orderInfoEntity.setStatus("3");
		orderInfoService.update(orderInfoEntity);
		ImportEntity importEntity = importService.queryObjectByOrderId(orderId);
		importEntity.setStatus("3");
		importService.update(importEntity);

		return R.ok();
	}

	/**
	 * 反确认
	 * 逻辑：需要判断此订单是否做了入库，并且入库的原料没有进行出库，才能完成反确认，否则无法完成反确认
	 * @param orderId
	 * @return
	 */
	@RequestMapping("/backConfirm")
	public R backConfirm(@RequestParam("orderId") Long orderId){
		OrderInfoEntity orderInfoEntity = orderInfoService.queryObject(orderId);
		orderInfoEntity.setStatus("1");
		orderInfoService.update(orderInfoEntity);

		//TODO - 需要完善反确认逻辑
		//查询此订单的原料是否做了出库，通过入库记录关联出库来进行查询。


		//反确认 ，删除关联的入库记录，确认时重新生成
		ImportEntity importEntity = importService.queryObjectByOrderId(orderId);
		if(importEntity != null){

			Map<String,Object> param = new HashMap();
			param.put("importId",importEntity.getId());
			List<ImportDetailEntity> importDetailEntityList = importDetailService.queryList(param);
			List<Long> detailId = new ArrayList<>();

			for (ImportDetailEntity importDetailEntity:importDetailEntityList) {
				detailId.add(importDetailEntity.getId());
			}
			int size = detailId.size();
			Long[] ids = detailId.toArray(new Long[size]);
	//		for (int i=0;i<importDetailEntityList.size();i++) {
	//			ids[i] = importDetailEntityList.get(i).getId();
	//		}
			importDetailService.deleteBatch(ids);
			importService.delete(importEntity.getId());
		}
		return R.ok();
	}
}
