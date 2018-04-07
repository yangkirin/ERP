package com.kirin.modules.baseData.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.baseData.entity.PrdDataEntity;
import com.kirin.modules.baseData.service.PrdDataService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 产品基础信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
@RestController
@RequestMapping("/baseData/prddata")
public class PrdDataController extends AbstractController {
	@Autowired
	private PrdDataService prdDataService;
	@Autowired
	private BomInfoService bomInfoService;
	@Autowired
	private BomDetailService bomDetailService;



	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("baseData:prddata:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<PrdDataEntity> prdDataList = prdDataService.queryList(query);
//		for (PrdDataEntity prdDataEntity:prdDataList) {
//			BomInfoEntity bomInfoEntity = bomInfoService.queryObject(prdDataEntity.getId());
//			if(bomInfoEntity != null){
//				prdDataEntity.setCost(bomInfoEntity.getCost()==null?"0":bomInfoEntity.getCost().toString());
//			}
//		}
		int total = prdDataService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(prdDataList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	public Float getPrdCost(Long prdId){
		float prd_cost = 0;
		Map<String,Object> map = new HashMap<>();
		map.put("prdId",prdId);
		//取得这个产品的配方
		List<BomDetailEntity> list =  bomDetailService.queryListByPrdId(map);
		if(list != null && list.size() > 0){
			for (BomDetailEntity bomDetailEntity:list) {
				if(bomDetailEntity.getSemiFinished().equals("0")){
					prd_cost += Float.valueOf(bomDetailEntity.getCost()==null?"0": bomDetailEntity.getCost().toString());
				}else{
					prd_cost += getPrdCost(bomDetailEntity.getMtrId());
				}
			}
		}
		//计算所有原料的成本
		//计算所有半成品的成本
		return prd_cost;
	}
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("baseData:prddata:info")
	public R info(@PathVariable("id") Long id){
		PrdDataEntity prdData = prdDataService.queryObject(id);
//		prdData.setCost(getPrdCost(prdData.getId()).toString());
		BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdData.getId());
		if(bomInfoEntity != null){
			prdData.setCost(bomInfoEntity.getCost().toString());
			Map<String,Object> countMap = countBomInfo(bomInfoEntity.getId());
			prdData.setSumGrossWgt(countMap.get("sumGrossWgt").toString());
			prdData.setSumNetWgt(countMap.get("sumNetWgt").toString());
			prdData.setSumCookedWgt(countMap.get("sumCookedWgt").toString());

		}

		return R.ok().put("prdData", prdData);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("baseData:prddata:save")
	public R save(@RequestBody PrdDataEntity prdData){
		SysUserEntity sysUserEntity =  getUser();

		// 验证产品名称是否重复，如果名称重复，不能使用
		if (prdDataService.queryByPrdName(prdData.getPrdName()) > 0) {
			return R.error("产品的名称不能重复");
		}

		prdData.setCreateUser(sysUserEntity.getUsername());
		prdData.setCreateDate(new Date());

		prdData.setStatus("1");
		prdDataService.save(prdData);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("baseData:prddata:update")
	public R update(@RequestBody PrdDataEntity prdData){

		PrdDataEntity oldPrdData = prdDataService.queryObject(prdData.getId());
		String prdName = "";
		//如果只变更是否半成品，则只需对产品名称的*号进行增减
		if(!oldPrdData.getSemiFinished().equals(prdData.getSemiFinished()) && oldPrdData.getPrdName().equals(prdData.getPrdName())){
			prdName = prdData.getPrdName();
			if(prdData.getSemiFinished().equals("1")){
				prdName = "*"+prdName;
			}else{
				prdName = prdName.substring(1,oldPrdData.getPrdName().length());
			}
		}
		//如果只修改了产品名称，则需要判断当前类型是否为半成品，如为半成品，则需要在修改的名称前加*号
		if(!oldPrdData.getPrdName().equals(prdData.getPrdName()) && oldPrdData.getSemiFinished().equals(prdData.getSemiFinished())){
			prdName = prdData.getPrdName();
			if(prdData.getSemiFinished().equals("1")){
				prdName = "*"+prdName;
			}
		}
		//如果即修改了产品名称，同时又修改了产品类型，则只需将半成品的名称前面增加*号即可
		if(!oldPrdData.getPrdName().equals(prdData.getPrdName()) && !oldPrdData.getSemiFinished().equals(prdData.getSemiFinished())){
			prdName = prdData.getPrdName();
			if(prdData.getSemiFinished().equals("1")){
				prdName = "*"+prdName;
			}
		}
		//如果修改的其它，则判断产品名称及类型是否匹配，即半成品名称前需要添加*号
		//产品名称及类型与原数据保持一致
		if(oldPrdData.getPrdName().equals(prdData.getPrdName()) && oldPrdData.getSemiFinished().equals(prdData.getSemiFinished())){
			prdName = oldPrdData.getPrdName();
			if(prdData.getSemiFinished().equals("1") ) {
				if(!prdData.getPrdName().startsWith("*")){
					prdName = "*" + oldPrdData.getPrdName();
				}
//				else{
//					prdName = oldPrdData.getPrdName();
//				}
			}else{
				if(prdData.getPrdName().startsWith("*")){
					prdName = oldPrdData.getPrdName().substring(1);
				}
			}
		}
		prdData.setPrdName(prdName);
//
//		if(!oldPrdData.getPrdName().equals(prdData.getPrdName()) && !oldPrdData.getSemiFinished().equals(prdData.getSemiFinished())){
//			String prdName = prdData.getPrdName();
//			if(oldPrdData.getSemiFinished().equals("1")){//半成品
//				prdName = prdName.substring(1,oldPrdData.getPrdName().length());
//			}else{
//				prdName = oldPrdData.getPrdName();
//			}
//
//			if(prdData.getSemiFinished().equals("1")) {//半成品
//				prdName = "*"+prdData.getPrdName();
//			}
//
//			prdData.setPrdName(prdName);
//		}

		SysUserEntity sysUserEntity =  getUser();

		prdData.setUpdateUser(sysUserEntity.getUsername());
		prdData.setUpdateDate(new Date());
		prdDataService.update(prdData);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete/{id}")
	@RequiresPermissions("baseData:prddata:delete")
	public R delete(@PathVariable("id") Long id){
		prdDataService.delete(id);
		
		return R.ok();
	}

	public Map<String,Object> countBomInfo(Long bomId){
		Double sumGrossWgt = new Double(0);//总毛重
		Double sumNetWgt = new Double(0);//总净重
		Double sumCookedWgt = new Double(0);//总熟重
		Map<String,Object> param = new HashMap<>();
		param.put("bomInfoId",bomId);
		List<BomDetailEntity> bomDetailEntityList = bomDetailService.queryList(param);
		if(bomDetailEntityList != null && bomDetailEntityList.size() > 0){
			for (BomDetailEntity bomDetail: bomDetailEntityList) {
				if(bomDetail.getSemiFinished().equals("1")){//半成品
					countBomInfo(bomDetail.getId());
				}else{
					sumGrossWgt += (bomDetail.getGrossWgt()==null?0:Double.valueOf(bomDetail.getGrossWgt()));
					sumNetWgt += (bomDetail.getNetWgt()==null?0:Double.valueOf(bomDetail.getNetWgt()));
					sumCookedWgt += (bomDetail.getModiWgt()==null?0:Double.valueOf(bomDetail.getModiWgt()));
				}
			}
		}
		Map<String,Object> returnMap = new HashMap<>();
		returnMap.put("sumGrossWgt",sumGrossWgt);
		returnMap.put("sumNetWgt",sumNetWgt);
		returnMap.put("sumCookedWgt",sumCookedWgt);
		return returnMap;
	}
	
}
