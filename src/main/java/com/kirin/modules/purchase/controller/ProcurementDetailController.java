package com.kirin.modules.purchase.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.purchase.entity.ProcurementDetailEntity;
import com.kirin.modules.purchase.service.ProcurementDetailService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 采购计划明细
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
@RestController
@RequestMapping("/purchase/procurementdetail")
public class ProcurementDetailController {
	@Autowired
	private ProcurementDetailService procurementDetailService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
//	@RequiresPermissions("purchase:procurementdetail:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ProcurementDetailEntity> procurementDetailList = procurementDetailService.queryList(query);
		int total = procurementDetailService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(procurementDetailList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
//	@RequiresPermissions("purchase:procurementdetail:info")
	public R info(@PathVariable("id") Long id){
		ProcurementDetailEntity procurementDetail = procurementDetailService.queryObject(id);
		
		return R.ok().put("procurementDetail", procurementDetail);
	}

	@RequestMapping("/saveOrUpdate")
	public R saveOrUpdate(@RequestParam Map<String, Object> params){
		String oper = params.get("oper").toString();
		String pdJson = params.get("detail").toString();
		JSONObject jsonObject = JSONObject.fromObject(pdJson);
		ProcurementDetailEntity pd = (ProcurementDetailEntity) JSONObject.toBean(jsonObject,ProcurementDetailEntity.class);
		if(oper.equals("edit")){
			update(pd);
		}
		return R.ok();
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
//	@RequiresPermissions("purchase:procurementdetail:save")
	public R save(@RequestBody ProcurementDetailEntity procurementDetail){
		procurementDetailService.save(procurementDetail);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
//	@RequiresPermissions("purchase:procurementdetail:update")
	public R update(@RequestBody ProcurementDetailEntity procurementDetail){
		procurementDetailService.update(procurementDetail);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
//	@RequiresPermissions("purchase:procurementdetail:delete")
	public R delete(@RequestBody Long[] ids){
		procurementDetailService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
