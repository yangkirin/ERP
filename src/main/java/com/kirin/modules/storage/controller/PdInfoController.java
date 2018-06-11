package com.kirin.modules.storage.controller;

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

import com.kirin.modules.storage.entity.PdInfoEntity;
import com.kirin.modules.storage.service.PdInfoService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 盘点单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-06-09 18:02:45
 */
@RestController
@RequestMapping("/storage/pdinfo")
public class PdInfoController extends AbstractController {
	@Autowired
	private PdInfoService pdInfoService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("storage:pdinfo:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<PdInfoEntity> pdInfoList = pdInfoService.queryList(query);
		int total = pdInfoService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(pdInfoList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("storage:pdinfo:info")
	public R info(@PathVariable("id") Long id){
		PdInfoEntity pdInfo = pdInfoService.queryObject(id);
		
		return R.ok().put("pdInfo", pdInfo);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("storage:pdinfo:save")
	public R save(@RequestBody PdInfoEntity pdInfo){
		SysUserEntity sysUserEntity =  getUser();
		pdInfo.setCreateUser(sysUserEntity.getUsername());
		pdInfo.setPdStatus("1");
		pdInfo.setCreateDate(new Date());

		//开始盘点，根据选择的条件生成盘点明细
		//查询条件：	pdType		盘点类型:0-原料盘点，1-半成品盘点
		//			pdStartDate	开始日期
		//			pdEndDate	截止日期
		//			pdOrgId		盘点机构ID(仓库、站点）
		//盘点逻辑：根据条件查询出符合要求的原料或半成品，统计该段时间内的入库、出库，计算结余（本期盘点数量）
		//查询出符合要求的上次盘点数量，作为本期的期初数量


		pdInfoService.save(pdInfo);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("storage:pdinfo:update")
	public R update(@RequestBody PdInfoEntity pdInfo){
		pdInfoService.update(pdInfo);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("storage:pdinfo:delete")
	public R delete(@RequestBody Long[] ids){
		pdInfoService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
