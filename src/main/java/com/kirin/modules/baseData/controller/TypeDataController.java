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

import com.kirin.modules.baseData.entity.TypeDataEntity;
import com.kirin.modules.baseData.service.TypeDataService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 类型数据信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-01 23:29:47
 */
@RestController
@RequestMapping("/baseData/typedata")
public class TypeDataController {
	@Autowired
	private TypeDataService typeDataService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("baseData:typedata:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		query.setLimit(999999);
		List<TypeDataEntity> typeDataList = typeDataService.queryList(query);
		int total = typeDataService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(typeDataList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("baseData:typedata:info")
	public R info(@PathVariable("id") Long id){
		TypeDataEntity typeData = typeDataService.queryObject(id);
		
		return R.ok().put("typeData", typeData);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("baseData:typedata:save")
	public R save(@RequestBody TypeDataEntity typeData){
		typeDataService.save(typeData);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("baseData:typedata:update")
	public R update(@RequestBody TypeDataEntity typeData){
		typeDataService.update(typeData);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("baseData:typedata:delete")
	public R delete(@RequestBody Long[] ids){
		typeDataService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
