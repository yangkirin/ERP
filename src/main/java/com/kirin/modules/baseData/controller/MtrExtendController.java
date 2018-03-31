package com.kirin.modules.baseData.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.service.MtrDataService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.baseData.entity.MtrExtendEntity;
import com.kirin.modules.baseData.service.MtrExtendService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 原料扩展信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-12-08 21:30:27
 */
@RestController
@RequestMapping("/baseData/mtrextend")
public class MtrExtendController {
	@Autowired
	private MtrExtendService mtrExtendService;
	@Autowired
	private MtrDataService mtrDataService;

	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("baseData:mtrextend:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<MtrExtendEntity> mtrExtendList = mtrExtendService.queryList(query);
		int total = mtrExtendService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(mtrExtendList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("baseData:mtrextend:info")
	public R info(@PathVariable("id") Long id){
		MtrExtendEntity mtrExtend = mtrExtendService.queryObject(id);
		
		return R.ok().put("mtrExtend", mtrExtend);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("baseData:mtrextend:save")
	public R save(@RequestBody MtrExtendEntity mtrExtend){
		Map<String, Object> params = new HashMap<>();
		params.put("mtrId",mtrExtend.getMtrId());
		int total = mtrExtendService.queryTotal(params);
		if(total == 0){
			mtrExtend.setExtendCode("01");
		}else if(total < 10){
			mtrExtend.setExtendCode(String.format("%02d", total+1));
		}else{
			mtrExtend.setExtendCode(String.valueOf(total+1));
		}
		mtrExtendService.save(mtrExtend);
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("baseData:mtrextend:update")
	public R update(@RequestBody MtrExtendEntity mtrExtend){
		mtrExtendService.update(mtrExtend);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("baseData:mtrextend:delete")
	public R delete(@RequestBody Long[] ids){
		mtrExtendService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/getDataToCommbox")
	public R getDataToCommbox(@RequestParam("mtrId")Long mtrId){
		List<Map> map = mtrExtendService.createCommbox(mtrId);

		MtrDataEntity mtrDataEntity = mtrDataService.queryObject(mtrId);

		Map<String,String> map_empty = new HashMap<>();
		map_empty.put("value","0");
		map_empty.put("text",mtrDataEntity.getPurchaseUnitName()+"-"+mtrDataEntity.getPurchaseRate()+"-¥:"+mtrDataEntity.getPrice());

		map.add(map_empty);
		return R.ok().put("data",map);
	}
}
