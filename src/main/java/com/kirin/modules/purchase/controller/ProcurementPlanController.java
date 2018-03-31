package com.kirin.modules.purchase.controller;

import java.math.BigDecimal;
import java.util.*;

import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.modules.common.controller.CommonUtil;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.common.utils.CommonUtils;
import com.kirin.modules.purchase.entity.*;
import com.kirin.modules.purchase.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 采购计划表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
@RestController
@RequestMapping("/purchase/procurementplan")
public class ProcurementPlanController {
	@Autowired
	private ProcurementPlanService procurementPlanService;
	@Autowired
	private ProcurementDetailService procurementDetailService;
	@Autowired
	private SupplierInfoService supplierInfoService;
	@Autowired
	private CommonUtilService commonUtilService;
	@Autowired
	private OrderInfoService orderInfoService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private MtrDataService mtrDataService;


	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("purchase:procurementplan:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ProcurementPlanEntity> procurementPlanList = procurementPlanService.queryList(query);
		int total = procurementPlanService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(procurementPlanList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("purchase:procurementplan:info")
	public R info(@PathVariable("id") Long id){
		ProcurementPlanEntity procurementPlan = procurementPlanService.queryObject(id);
		
		return R.ok().put("procurementPlan", procurementPlan);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("purchase:procurementplan:save")
	public R save(@RequestBody ProcurementPlanEntity procurementPlan){
		procurementPlanService.save(procurementPlan);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("purchase:procurementplan:update")
	public R update(@RequestBody ProcurementPlanEntity procurementPlan){
		procurementPlanService.update(procurementPlan);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("purchase:procurementplan:delete")
	public R delete(@RequestBody Long[] ids){
		procurementPlanService.deleteBatch(ids);
		
		return R.ok();
	}

	public String getTableNewNoStr(String tableName,String noField){
		Long no = 0L;
		String currentNo = commonUtilService.getTableNewNo(tableName,noField);
		if(currentNo != null && !currentNo.equals("")){
			//yyyyMMdd+0000
			no = Long.valueOf(currentNo.substring(8));
		}
		no = no+1;
		return new CommonUtils().createNoByDate(no);
	}

	@RequestMapping("/createOrder/{id}")
	@RequiresPermissions("purchase:procurementplan:createOrder")
	public R createOrder(@PathVariable("id") Long id){
		ProcurementPlanEntity ppe = procurementPlanService.queryObject(id);
		List<ProcurementDetailEntity> list = procurementDetailService.queryListByProcurementId(id);
		//按供应商进行原料分组
		List<Map<String,Object>> supplierList = new ArrayList<Map<String,Object>>();
		Set set = new HashSet();
		List<Long> supplierId = new ArrayList<Long>();
		for(ProcurementDetailEntity pde : list){
			if(set.add(pde.getSupplierId())){
				supplierId.add(pde.getSupplierId());
			}
		}

		for(Long supId : supplierId){
			SupplierInfoEntity se = supplierInfoService.queryObject(supId);

			String orderNo = getTableNewNoStr("TB_ORDER_INFO","ORDER_NO");
			OrderInfoEntity order = new OrderInfoEntity();
			order.setOrderNo(orderNo);
			order.setSupplierId(se.getId());
//			order.setExceptionDate(ppe.getExpectDate());
			order.setProcurementId(ppe.getId());
			order.setStatus("1");

			Long orderId = orderInfoService.saveId(order);

//			List<OrderDetailEntity> detailList = new ArrayList<OrderDetailEntity>();
			for(ProcurementDetailEntity pde : list){
				MtrDataEntity mtr = mtrDataService.queryObject(pde.getMtrId());
				if(supId == pde.getSupplierId()){
					OrderDetailEntity detail = new OrderDetailEntity();
					detail.setOrderId(orderId);
					detail.setMtrId(pde.getMtrId());
					detail.setMtrCode(mtr.getMtrCode());
					detail.setMtrName(mtr.getMtrName());
					detail.setMtrTypeId(Long.valueOf(mtr.getTypeId() == null ? 0 : mtr.getTypeId()));
					detail.setMtrTypeName(mtr.getTypeName());
					detail.setMtrUnit(pde.getUnit() == null ? "" : pde.getUnit().toString());
					detail.setMtrRate(pde.getRate());
					detail.setWarehoseId(Long.valueOf(mtr.getWarehouseId() == null ? 0L : mtr.getWarehouseId()));
					detail.setWarehoseName(mtr.getWarehouseName());
					detail.setWgtUnit1(mtr.getWgtUnit1());
					detail.setWgtUnit2(mtr.getWgtUnit2());
					detail.setPurchaseNo(pde.getPurchaseNo());
					detail.setAmount(Double.valueOf(pde.getCount() == null ? 0 : pde.getCount().doubleValue()));
					detail.setPrice(new BigDecimal(mtr.getPrice() == null ? "0" : mtr.getPrice()));
					detail.setCostTypeId(Long.valueOf(mtr.getCostType() == null ? "0" : mtr.getCostType()));
					detail.setCostTypeName(mtr.getCostTypeName());

//					detailList.add(detail);

					orderDetailService.save(detail);
				}
			}

		}

		return R.ok();
	}
}
