package com.kirin.modules.baseData.controller;

import java.math.BigDecimal;
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

import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 原料基础数据表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-15 00:43:36
 */
@RestController
@RequestMapping("/baseData/mtrdata")
public class MtrDataController extends AbstractController {
	@Autowired
	private MtrDataService mtrDataService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("baseData:mtrdata:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<MtrDataEntity> mtrDataList = mtrDataService.queryList(query);
		int total = mtrDataService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(mtrDataList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("baseData:mtrdata:info")
	public R info(@PathVariable("id") Long id){
		MtrDataEntity mtrData = mtrDataService.queryObject(id);
		
		return R.ok().put("mtrData", mtrData);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("baseData:mtrdata:save")
	public R save(@RequestBody MtrDataEntity mtrData){
		SysUserEntity sysUserEntity =  getUser();

		mtrData.setCreateUser(sysUserEntity.getUsername());
		mtrData.setCreateDate(new Date());

		BigDecimal price = new BigDecimal(new Double(mtrData.getPrice()).doubleValue()).setScale(2,BigDecimal.ROUND_HALF_UP);
		mtrData.setPrice(price.toString());

		mtrDataService.save(mtrData);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("baseData:mtrdata:update")
	public R update(@RequestBody MtrDataEntity mtrData){
		SysUserEntity sysUserEntity =  getUser();

		mtrData.setUpdateUser(sysUserEntity.getUsername());
		mtrData.setUpdateDate(new Date());

		BigDecimal price = new BigDecimal(new Double(mtrData.getPrice()).doubleValue()).setScale(2,BigDecimal.ROUND_HALF_UP);
		mtrData.setPrice(price.toString());

		mtrDataService.update(mtrData);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete/{id}")
	@RequiresPermissions("baseData:mtrdata:delete")
	public R delete(@PathVariable("id") Long id){
		mtrDataService.delete(id);
		
		return R.ok();
	}

	public static void main(String[] args){
		String a = "2.0";
		BigDecimal b = new BigDecimal(new Double(a).doubleValue()).setScale(2);
		System.out.println(b.toString());
	}

}
