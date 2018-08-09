package com.kirin.modules.storage.controller;

import java.math.BigDecimal;
import java.util.*;

import com.kirin.modules.storage.entity.PdDetailEntity;
import com.kirin.modules.storage.service.PdDetailService;
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
	@Autowired
	private PdDetailService pdDetailService;
	
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

		pdInfoService.save(pdInfo);
		//开始盘点，根据选择的条件生成盘点明细
		//查询条件：	pdType		盘点类型:0-原料盘点，1-半成品盘点
		//			pdStartDate	开始日期
		//			pdEndDate	截止日期
		//			pdOrgId		盘点机构ID(仓库、站点）
		//盘点逻辑：根据条件查询出符合要求的原料或半成品，统计该段时间内的入库、出库，计算结余（本期盘点数量）
		Map<String,Object> params = new HashMap<>();
		params.put("pdStartDate",pdInfo.getPdStartDate());
		params.put("pdEndDate",pdInfo.getPdEndDate());
		params.put("pdOrgId",pdInfo.getPdOrgId());
		List<Map> mapList = new ArrayList<>();
		if(pdInfo.getPdType().equals("0")){
			mapList = pdDetailService.createPdMtrDetail(params);
		}
		if(mapList.size() > 0){
			for (Map map : mapList) {
				PdDetailEntity pdDetailEntity = new PdDetailEntity();
				pdDetailEntity.setPdInfoId(pdInfo.getId());
				pdDetailEntity.setMtrId(Long.valueOf(map.get("id").toString()));
				pdDetailEntity.setMtrCode(map.get("MTR_CODE").toString());
//MTR_NAME，mini_unit_name，type_name，sum_in_count，sum_out_count,PRICE
				pdDetailEntity.setMtrName(map.get("MTR_NAME").toString());
				pdDetailEntity.setMiniUnitName(map.get("mini_unit_name") == null ? "" :map.get("mini_unit_name").toString());
				pdDetailEntity.setTypeName(map.get("type_name") == null ? "" :map.get("type_name").toString());

				BigDecimal price = new BigDecimal(map.get("PRICE") == null ? "0" : map.get("PRICE").toString());
				BigDecimal inCount = new BigDecimal(map.get("sum_in_count") == null ? "0" : map.get("sum_in_count").toString());
				BigDecimal outCount = new BigDecimal(map.get("sum_out_count") == null ? "0" : map.get("sum_out_count").toString());

				pdDetailEntity.setPrice(price);
				pdDetailEntity.setCurrentIn(inCount);
				pdDetailEntity.setCurrentOut(outCount);

				BigDecimal currentCount = inCount.subtract(outCount);
				BigDecimal currentAmt = currentCount.multiply(price).setScale(2,BigDecimal.ROUND_HALF_UP);

				pdDetailEntity.setCurrentCount(currentCount);
				pdDetailEntity.setCurrentAmt(currentAmt);

				pdDetailService.save(pdDetailEntity);

			}

		}

		//查询出符合要求的上次盘点数量，作为本期的期初数量

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

	@RequestMapping("/updateDetailCount")
	@RequiresPermissions("storage:pdinfo:updateDetailCount")
	public R updateDetailCount(@RequestParam Map<String, Object> params){
		if(params.get("detailId") != null ) {
			Long pdDetailId = Long.valueOf(params.get("detailId").toString());
			PdDetailEntity pdDetailEntity = pdDetailService.queryObject(pdDetailId);
			BigDecimal realCount = new BigDecimal(params.get("realCount") == null ? "0" : params.get("realCount").toString());
			BigDecimal currentCount = new BigDecimal(pdDetailEntity.getCurrentCount() == null ? "0" : pdDetailEntity.getCurrentCount().toString());

			BigDecimal dValue = currentCount.subtract(realCount).setScale(2,BigDecimal.ROUND_HALF_UP);
			if(dValue.compareTo(BigDecimal.ZERO) == 1){//大于
				pdDetailEntity.setProfttCount(dValue);
			}else if(dValue.compareTo(BigDecimal.ZERO) == -1){//小于
				pdDetailEntity.setLossCount(dValue);
			}

			if(pdDetailEntity.getPrice() != null){
				pdDetailEntity.setRealAmtlossCount(pdDetailEntity.getPrice().multiply(realCount).setScale(2,BigDecimal.ROUND_HALF_UP));
			}

			pdDetailEntity.setRealCount(realCount);
			pdDetailService.update(pdDetailEntity);
		}

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

	/**
	 * 修改状态及其它属性
	 */
	@RequestMapping("/w")
//	@RequiresPermissions("storage:pdinfo:update")
	public R updateStatus(@RequestParam Map<String, Object> params){
		if(params.get("pdInfoId") != null ) {
			Long pdInfoId = Long.valueOf(params.get("pdInfoId").toString());
			PdInfoEntity pdInfo = pdInfoService.queryObject(pdInfoId);
			String status = params.get("status").toString();
			pdInfo.setPdStatus(status);

			pdInfoService.update(pdInfo);
		}

		return R.ok();
	}

}
