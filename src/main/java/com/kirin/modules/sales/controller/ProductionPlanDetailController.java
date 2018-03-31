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

import com.kirin.modules.sales.entity.ProductionPlanDetailEntity;
import com.kirin.modules.sales.service.ProductionPlanDetailService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 生产计划明细
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
@RestController
@RequestMapping("/sales/productionplandetail")
public class ProductionPlanDetailController {
	@Autowired
	private ProductionPlanDetailService productionPlanDetailService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sales:productionplandetail:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ProductionPlanDetailEntity> productionPlanDetailList = productionPlanDetailService.queryList(query);
		int total = productionPlanDetailService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(productionPlanDetailList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sales:productionplandetail:info")
	public R info(@PathVariable("id") Long id){
		ProductionPlanDetailEntity productionPlanDetail = productionPlanDetailService.queryObject(id);
		
		return R.ok().put("productionPlanDetail", productionPlanDetail);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sales:productionplandetail:save")
	public R save(@RequestBody ProductionPlanDetailEntity productionPlanDetail){
		productionPlanDetailService.save(productionPlanDetail);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sales:productionplandetail:update")
	public R update(@RequestBody ProductionPlanDetailEntity productionPlanDetail){
		productionPlanDetailService.update(productionPlanDetail);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sales:productionplandetail:delete")
	public R delete(@RequestBody Long[] ids){
		productionPlanDetailService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
