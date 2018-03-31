package com.kirin.modules.baseData.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.baseData.entity.BomDataEntity;
import com.kirin.modules.baseData.service.BomDataService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 配方信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
@RestController
@RequestMapping("/baseData/bomdata")
public class BomDataController  {
	@Autowired
	private BomDataService bomDataService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("baseData:bomdata:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<BomDataEntity> bomDataList = bomDataService.queryList(query);
		int total = bomDataService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(bomDataList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("baseData:bomdata:info")
	public R info(@PathVariable("id") Long id){
		BomDataEntity bomData = bomDataService.queryObject(id);
		
		return R.ok().put("bomData", bomData);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("baseData:bomdata:save")
	public R save(@RequestBody BomDataEntity bomData){
		bomDataService.save(bomData);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("baseData:bomdata:update")
	public R update(@RequestBody BomDataEntity bomData){
		bomDataService.update(bomData);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("baseData:bomdata:delete")
	public R delete(@RequestBody Long[] ids){
		bomDataService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
