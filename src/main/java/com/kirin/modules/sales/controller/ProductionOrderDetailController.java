package com.kirin.modules.sales.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sales.service.ProductionOrderDetailService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 生产订单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-24 11:52:37
 */
@RestController
@RequestMapping("/sales/productionorderdetail")
public class ProductionOrderDetailController {
	@Autowired
	private ProductionOrderDetailService productionOrderDetailService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
//	@RequiresPermissions("sales:productionorderdetail:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ProductionOrderDetailEntity> productionOrderDetailList = productionOrderDetailService.queryList(query);
		int total = productionOrderDetailService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(productionOrderDetailList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
//	@RequiresPermissions("sales:productionorderdetail:info")
	public R info(@PathVariable("id") Long id){
		ProductionOrderDetailEntity productionOrderDetail = productionOrderDetailService.queryObject(id);
		
		return R.ok().put("productionOrderDetail", productionOrderDetail);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
//	@RequiresPermissions("sales:productionorderdetail:save")
	public R save(@RequestBody ProductionOrderDetailEntity productionOrderDetail){
		productionOrderDetailService.save(productionOrderDetail);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
//	@RequiresPermissions("sales:productionorderdetail:update")
	public R update(@RequestBody ProductionOrderDetailEntity productionOrderDetail){
		productionOrderDetailService.update(productionOrderDetail);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sales:productionorderdetail:delete")
	public R delete(@RequestBody Long[] ids){
		productionOrderDetailService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/deleteById")
	public R delete(@RequestParam("id")Long id){
		Long[] ids = new Long[]{id};
		productionOrderDetailService.deleteBatch(ids);

		return R.ok();
	}

	@RequestMapping("/deleteByOrderId")
	public R deleteByOrderId(@RequestParam("orderId")Long orderId){
		productionOrderDetailService.deleteByOrderId(orderId);
		return R.ok();
	}
}
