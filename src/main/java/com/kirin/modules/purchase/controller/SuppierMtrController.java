package com.kirin.modules.purchase.controller;

import java.util.*;

import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.entity.MtrExtendEntity;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.modules.baseData.service.MtrExtendService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.purchase.entity.SuppierMtrEntity;
import com.kirin.modules.purchase.service.SuppierMtrService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 供应商供应产品信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
@RestController
@RequestMapping("/purchase/suppiermtr")
public class SuppierMtrController extends AbstractController {
	@Autowired
	private SuppierMtrService suppierMtrService;
	@Autowired
	private MtrDataService mtrDataService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
//	@RequiresPermissions("purchase:suppiermtr:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<SuppierMtrEntity> suppierMtrList = suppierMtrService.queryList(query);
		int total = suppierMtrService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(suppierMtrList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	@RequestMapping("/querySupplierByMtrId/{mtrId}")
	public R querySupplierByMtrId(@PathVariable("mtrId") Long mtrId){
		List<SuppierMtrEntity> suppierMtrList = suppierMtrService.querySupplierByMtrId(mtrId,null);
		return R.ok().put("data", suppierMtrList);
	}

	@Autowired
	private	MtrExtendService mtrExtendService;

	@RequestMapping("/queryExtendMtrComb")
	public R queryExtendMtrComb(@RequestParam("supplierId") Long supplierId,@RequestParam("mtrId") Long mtrId){
		List<Map> map = new ArrayList<>();

		List<SuppierMtrEntity> suppierMtrList = suppierMtrService.querySupplierByMtrId(mtrId,supplierId);

		if(suppierMtrList != null && suppierMtrList.size() > 0){
			for (SuppierMtrEntity suppierMtr:suppierMtrList) {
				if(suppierMtr.getMtrExtendId() != 0){
					MtrExtendEntity mtrExtendEntity = mtrExtendService.queryObject(suppierMtr.getMtrExtendId());
					Map<String,String> map_temp = new HashMap<>();
					map_temp.put("value",mtrExtendEntity.getId().toString());
					map_temp.put("text",mtrExtendEntity.getUnitName()+"-"+mtrExtendEntity.getUnitRate()+"-¥:"+mtrExtendEntity.getPrice());
					map.add(map_temp);
				}
			}
		}

		MtrDataEntity mtrDataEntity = mtrDataService.queryObject(mtrId);

		Map<String,String> map_empty = new HashMap<>();
		map_empty.put("value","0");
		map_empty.put("text",mtrDataEntity.getPurchaseUnitName()+"-"+mtrDataEntity.getPurchaseRate()+"-¥:"+mtrDataEntity.getPrice());

		map.add(map_empty);
		return R.ok().put("data",map);
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
//	@RequiresPermissions("purchase:suppiermtr:info")
	public R info(@PathVariable("id") Long id){
		SuppierMtrEntity suppierMtr = suppierMtrService.queryObject(id);
		MtrDataEntity mtrData = mtrDataService.queryObject(suppierMtr.getMtrId());
		return R.ok().put("suppierMtr", suppierMtr).put("mtrData",mtrData);
	}


	@RequestMapping("/getCommbox/{id}")
	//	@RequiresPermissions("purchase:suppiermtr:info")
	public R getCommbox(@PathVariable("id") Long id){
		List<SuppierMtrEntity> suppierMtrList = suppierMtrService.querySupplierByMtrId(id,null);
		List<Map> returnList = new ArrayList<Map>();
		if(suppierMtrList != null && suppierMtrList.size() > 0){
			for (SuppierMtrEntity suppierMtr:suppierMtrList){
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("value",suppierMtr.getSuppierId());
				map.put("text",suppierMtr.getSuppierIdName());
				returnList.add(map);
			}
		}
		return R.ok().put("data",returnList);
	}

	@RequestMapping("/getSuppierMtrEntity")
	public R getSuppierMtrEntity(@RequestParam("supplierId") Long supplierId,@RequestParam("mtrId") Long mtrId){
		List<SuppierMtrEntity> suppierMtrList = suppierMtrService.querySupplierByMtrId(mtrId,supplierId);
		return R.ok().put("data",suppierMtrList);
	}


	/**
	 * 保存
	 */
	@RequestMapping("/save")
//	@RequiresPermissions("purchase:suppiermtr:save")
	public R save(@RequestBody SuppierMtrEntity suppierMtr){

		SysUserEntity sysUserEntity =  getUser();

		suppierMtr.setCreateUser(sysUserEntity.getUsername());
		suppierMtr.setCreateDate(new Date());

		suppierMtrService.save(suppierMtr);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
//	@RequiresPermissions("purchase:suppiermtr:update")
	public R update(@RequestBody SuppierMtrEntity suppierMtr){
		SysUserEntity sysUserEntity =  getUser();

		suppierMtr.setLastEditUser(sysUserEntity.getUsername());
		suppierMtr.setLastEditDate(new Date());

		suppierMtrService.update(suppierMtr);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
//	@RequiresPermissions("purchase:suppiermtr:delete")
	public R delete(@RequestBody Long[] ids){
		suppierMtrService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/copy")
//	@RequiresPermissions("purchase:suppiermtr:delete")
	public R copy(@RequestParam("selectId") Long selectId,@RequestParam("targetId") Long targetId){
		SysUserEntity sysUserEntity =  getUser();


		List<SuppierMtrEntity> selectSuppierMtrList = suppierMtrService.querySupplierByMtrId(null,selectId);
		if(selectSuppierMtrList != null && selectSuppierMtrList.size() > 0){
			List<SuppierMtrEntity> targetSuppierMtrList = suppierMtrService.querySupplierByMtrId(null,targetId);
			if(targetSuppierMtrList != null && targetSuppierMtrList.size() > 0){
				Long[] targetTableId = new Long[targetSuppierMtrList.size()];
				for (int i=0;i<targetSuppierMtrList.size();i++) {
					SuppierMtrEntity suppierMtrEntity = targetSuppierMtrList.get(i);
					targetTableId[i] = suppierMtrEntity.getId();
				}
				suppierMtrService.deleteBatch(targetTableId);
			}
			List<SuppierMtrEntity> insertList = new ArrayList<>();
			for (SuppierMtrEntity suppierMtrEntity:selectSuppierMtrList) {
				suppierMtrEntity.setCreateDate(new Date());
				suppierMtrEntity.setCreateUser(sysUserEntity.getUsername());
				suppierMtrEntity.setSuppierId(targetId);

				insertList.add(suppierMtrEntity);
			}
			suppierMtrService.batchInsert(insertList);
		}

		return R.ok();
	}
	
}
