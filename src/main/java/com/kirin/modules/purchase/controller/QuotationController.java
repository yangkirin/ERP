package com.kirin.modules.purchase.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.purchase.entity.QuotationEntity;
import com.kirin.modules.purchase.service.QuotationService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 供应商原料报价信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
@RestController
@RequestMapping("/purchase/quotation")
public class QuotationController {
	@Autowired
	private QuotationService quotationService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("purchase:quotation:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<QuotationEntity> quotationList = quotationService.queryList(query);
		int total = quotationService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(quotationList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("purchase:quotation:info")
	public R info(@PathVariable("id") Long id){
		QuotationEntity quotation = quotationService.queryObject(id);
		
		return R.ok().put("quotation", quotation);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("purchase:quotation:save")
	public R save(@RequestBody QuotationEntity quotation){
		quotationService.save(quotation);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("purchase:quotation:update")
	public R update(@RequestBody QuotationEntity quotation){
		quotationService.update(quotation);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("purchase:quotation:delete")
	public R delete(@RequestBody Long[] ids){
		quotationService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
