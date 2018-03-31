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

import com.kirin.modules.baseData.entity.PrdNcInfoEntity;
import com.kirin.modules.baseData.service.PrdNcInfoService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 产品营养成分信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
@RestController
@RequestMapping("/baseData/prdncinfo")
public class PrdNcInfoController {
	@Autowired
	private PrdNcInfoService prdNcInfoService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("baseData:prdncinfo:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<PrdNcInfoEntity> prdNcInfoList = prdNcInfoService.queryList(query);
		int total = prdNcInfoService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(prdNcInfoList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("baseData:prdncinfo:info")
	public R info(@PathVariable("id") Long id){
		PrdNcInfoEntity prdNcInfo = prdNcInfoService.queryObject(id);
		
		return R.ok().put("prdNcInfo", prdNcInfo);
	}


	@RequestMapping("/infoByPrdId/{prdId}")
	public R infoByPrdId(@PathVariable("prdId") Long prdId){
		PrdNcInfoEntity prdNcInfo = prdNcInfoService.queryObjectForPrdId(prdId);

		return R.ok().put("prdNcInfo", prdNcInfo);
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("baseData:prdncinfo:save")
	public R save(@RequestBody PrdNcInfoEntity prdNcInfo){
		prdNcInfoService.save(prdNcInfo);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("baseData:prdncinfo:update")
	public R update(@RequestBody PrdNcInfoEntity prdNcInfo){
		prdNcInfoService.update(prdNcInfo);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("baseData:prdncinfo:delete")
	public R delete(@RequestBody Long[] ids){
		prdNcInfoService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/updateInfo")
	public R updateInfo(@RequestBody PrdNcInfoEntity prdNcInfo){
		if(null == prdNcInfo.getId()){
			save(prdNcInfo);
		}else{
			update(prdNcInfo);
		}
		return R.ok();
	}
}
