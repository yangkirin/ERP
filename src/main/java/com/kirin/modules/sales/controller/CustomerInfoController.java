package com.kirin.modules.sales.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.sales.entity.CustomerInfoEntity;
import com.kirin.modules.sales.service.CustomerInfoService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 客户信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
@RestController
@RequestMapping("/sales/customerinfo")
public class CustomerInfoController extends AbstractController {
	@Autowired
	private CustomerInfoService customerInfoService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sales:customerinfo:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<CustomerInfoEntity> customerInfoList = customerInfoService.queryList(query);
		int total = customerInfoService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(customerInfoList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sales:customerinfo:info")
	public R info(@PathVariable("id") Long id){
		CustomerInfoEntity customerInfo = customerInfoService.queryObject(id);
		
		return R.ok().put("customerInfo", customerInfo);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sales:customerinfo:save")
	public R save(@RequestBody CustomerInfoEntity customerInfo){
		SysUserEntity sysUserEntity =  getUser();

		customerInfo.setCreateUser(sysUserEntity.getUsername());
		customerInfo.setCreateDate(new Date());

		customerInfoService.save(customerInfo);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sales:customerinfo:update")
	public R update(@RequestBody CustomerInfoEntity customerInfo){
		SysUserEntity sysUserEntity =  getUser();

		customerInfo.setUpdateUser(sysUserEntity.getUsername());
		customerInfo.setUpdateDate(new Date());

		customerInfoService.update(customerInfo);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sales:customerinfo:delete")
	public R delete(@RequestBody Long[] ids){
		customerInfoService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
