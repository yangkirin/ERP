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

import com.kirin.modules.purchase.entity.ContractEntity;
import com.kirin.modules.purchase.service.ContractService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 合同信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
@RestController
@RequestMapping("/purchase/contract")
public class ContractController {
	@Autowired
	private ContractService contractService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("purchase:contract:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ContractEntity> contractList = contractService.queryList(query);
		int total = contractService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(contractList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("purchase:contract:info")
	public R info(@PathVariable("id") Long id){
		ContractEntity contract = contractService.queryObject(id);
		
		return R.ok().put("contract", contract);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("purchase:contract:save")
	public R save(@RequestBody ContractEntity contract){
		contractService.save(contract);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("purchase:contract:update")
	public R update(@RequestBody ContractEntity contract){
		contractService.update(contract);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("purchase:contract:delete")
	public R delete(@RequestBody Long[] ids){
		contractService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
