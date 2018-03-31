package com.kirin.modules.purchase.controller;

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

import com.kirin.modules.purchase.entity.SupplierInfoEntity;
import com.kirin.modules.purchase.service.SupplierInfoService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 供应商信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
@RestController
@RequestMapping("/purchase/supplierinfo")
public class SupplierInfoController extends AbstractController {
	@Autowired
	private SupplierInfoService supplierInfoService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("purchase:supplierinfo:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<SupplierInfoEntity> supplierInfoList = supplierInfoService.queryList(query);
		int total = supplierInfoService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(supplierInfoList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("purchase:supplierinfo:info")
	public R info(@PathVariable("id") Long id){
		SupplierInfoEntity supplierInfo = supplierInfoService.queryObject(id);
		
		return R.ok().put("supplierInfo", supplierInfo);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("purchase:supplierinfo:save")
	public R save(@RequestBody SupplierInfoEntity supplierInfo){

		SysUserEntity sysUserEntity =  getUser();

		supplierInfo.setCreateUser(sysUserEntity.getUsername());
		supplierInfo.setCreateDate(new Date());

		supplierInfoService.save(supplierInfo);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("purchase:supplierinfo:update")
	public R update(@RequestBody SupplierInfoEntity supplierInfo){

		SysUserEntity sysUserEntity =  getUser();

		supplierInfo.setUpdateUser(sysUserEntity.getUsername());
		supplierInfo.setUpdateDate(new Date());

		supplierInfoService.update(supplierInfo);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("purchase:supplierinfo:delete")
	public R delete(@RequestBody Long[] ids){
		supplierInfoService.deleteBatch(ids);
		for (Long id:ids
			 ) {
			
		}
		return R.ok();
	}
	
}
