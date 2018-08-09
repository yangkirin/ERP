package com.kirin.modules.storage.controller;

import java.util.List;
import java.util.Map;

import com.kirin.common.annotation.SysLog;
import com.kirin.modules.storage.entity.PdDetailEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.storage.service.PdDetailService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 盘点单明细表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-06-09 18:02:45
 */
@RestController
@RequestMapping("/storage/pddetail")
public class PdDetailController {


	@Autowired
	private PdDetailService pdDetailService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("storage:pddetail:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<PdDetailEntity> pdDetailList = pdDetailService.queryList(query);
		int total = pdDetailService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(pdDetailList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("storage:pddetail:info")
	public R info(@PathVariable("id") Long id){
		PdDetailEntity pdDetail = pdDetailService.queryObject(id);
		
		return R.ok().put("pdDetail", pdDetail);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("storage:pddetail:save")
	public R save(@RequestBody PdDetailEntity pdDetail){
		pdDetailService.save(pdDetail);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("storage:pddetail:update")
	public R update(@RequestBody PdDetailEntity pdDetail){
		pdDetailService.update(pdDetail);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("storage:pddetail:delete")
	public R delete(@RequestBody Long[] ids){
		pdDetailService.deleteBatch(ids);
		
		return R.ok();
	}


}
