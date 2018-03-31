package com.kirin.modules.baseData.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-31 16:31:30
 */
@RestController
@RequestMapping("/baseData/bominfo")
public class BomInfoController extends AbstractController {
	@Autowired
	private BomInfoService bomInfoService;

	@Autowired
	private BomDetailService bomDetailService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("baseData:bominfo:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<BomInfoEntity> bomInfoList = bomInfoService.queryList(query);
		int total = bomInfoService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(bomInfoList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("baseData:bominfo:info")
	public R info(@PathVariable("id") Long id){
		BomInfoEntity bomInfo = bomInfoService.queryObject(id);
		
		return R.ok().put("bomInfo", bomInfo);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("baseData:bominfo:save")
	public R save(@RequestBody BomInfoEntity bomInfo){
		SysUserEntity sysUserEntity =  getUser();

		bomInfo.setCreateUser(sysUserEntity.getUsername());
		bomInfo.setCreateDate(new Date());


		bomInfoService.save(bomInfo);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("baseData:bominfo:update")
	public R update(@RequestBody BomInfoEntity bomInfo){
		SysUserEntity sysUserEntity =  getUser();

		bomInfo.setUpdateUser(sysUserEntity.getUsername());
		bomInfo.setUpdateDate(new Date());

		bomInfoService.update(bomInfo);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("baseData:bominfo:delete")
	public R delete(@RequestBody Long[] ids){
		bomInfoService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/detailConfig")
	@RequiresPermissions("baseData:bominfo:detailConfig")
	public R detailConfig(){
		return R.ok();
	}





}
