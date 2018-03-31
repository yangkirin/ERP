package com.kirin.modules.sales.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kirin.common.utils.DateUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.sales.entity.ProductionPlanEntity;
import com.kirin.modules.sales.service.ProductionPlanService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 生产计划
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
@RestController
@RequestMapping("/sales/productionplan")
public class ProductionPlanController {
	@Autowired
	private ProductionPlanService productionPlanService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sales:productionplan:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ProductionPlanEntity> productionPlanList = productionPlanService.queryList(query);
		int total = productionPlanService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(productionPlanList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sales:productionplan:info")
	public R info(@PathVariable("id") Long id){
		ProductionPlanEntity productionPlan = productionPlanService.queryObject(id);
		
		return R.ok().put("productionPlan", productionPlan);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sales:productionplan:save")
	public R save(@RequestBody ProductionPlanEntity productionPlan){
		productionPlan.setCreateDate(new Date());
		productionPlanService.save(productionPlan);
		
		return R.ok().put("data",productionPlan);
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sales:productionplan:update")
	public R update(@RequestBody ProductionPlanEntity productionPlan){
		productionPlanService.update(productionPlan);
		
		return R.ok().put("data",productionPlan);
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sales:productionplan:delete")
	public R delete(@RequestBody Long[] ids){
		productionPlanService.deleteBatch(ids);
		
		return R.ok();
	}

}
