package com.kirin.modules.baseData.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.entity.PrdDataEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.baseData.service.PrdDataService;
import com.kirin.modules.common.service.CommonUtilService;
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

	@Autowired
	private CommonUtilService commonUtilService;

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
		String no_old = mtrData.getMtrCode().substring(0,mtrData.getMtrCode().length()-4);

		String no = commonUtilService.getTableNewNo("MTR_DATA WHERE TYPE_ID="+mtrData.getTypeId(),"MTR_CODE");
		int b = 1;
		if(no != null && !no.equals("")){
			b = Integer.valueOf(no.substring(no.length()-4));
			b += 1;
		}

		String idStr = String.format("%04d",b);

		mtrData.setMtrCode(no_old+idStr);

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

		//原料修改时，重新计算使用该原料的配方信息
		recomputeBomInfo(mtrData.getId());
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

	@Autowired
	BomInfoService bomInfoService;

	//原料信息修改时，重新计算引用该原料的配方信息
	public void recomputeBomInfo(Long mtrId){
		//查询引用该原料的配方信息进行重新计算
		List<BomInfoEntity> bomInfoEntityList = bomInfoService.queryObjectByMtrId(mtrId, "0");
		//重新计算该原料作为半成品配方信息
		if(bomInfoEntityList!=null && bomInfoEntityList.size() > 0){
			Map map = new HashMap();
			for (BomInfoEntity bomInfoEntity:bomInfoEntityList) {
				map.put("bomInfoId",bomInfoEntity.getId());
				List<BomDetailEntity> bomDetailEntityList = bomDetailService.queryList(map);
				if(bomDetailEntityList != null && bomDetailEntityList.size() > 0){
					for (BomDetailEntity bomDetailEntity:bomDetailEntityList) {
						BomDetailEntity newBomDetail = computeCost(bomDetailEntity);//计算成本
						bomDetailService.update(newBomDetail);
						updateCostNew(bomInfoEntity.getId());
					}
				}

			}
		}
	}

	@Autowired
	PrdDataService prdDataService;
	@Autowired
	BomDetailService bomDetailService;

	public void updateCostNew(Long bomInfoId){
		BigDecimal sumCost = new BigDecimal(0);

		BigDecimal sumModiWgt = new BigDecimal(0);
		BigDecimal sumNetWgt = new BigDecimal(0);
		BigDecimal sumGrossWgt = new BigDecimal(0);
		BigDecimal sumCostRate = new BigDecimal(0);

		BomInfoEntity bomInfoEntity = bomInfoService.queryObject(bomInfoId);
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("bomInfoId",bomInfoId);
		List<BomDetailEntity> bomDetailEntityList = bomDetailService.queryList(paramMap);
		if(bomDetailEntityList != null && bomDetailEntityList.size() > 0) {
			for (BomDetailEntity bomDetailEntity : bomDetailEntityList) {
				sumCost = sumCost.add(bomDetailEntity.getCost() == null ? new BigDecimal(0) : bomDetailEntity.getCost() );

				sumModiWgt = sumModiWgt.add(bomDetailEntity.getModiWgt() == null ? new BigDecimal(0):new BigDecimal(bomDetailEntity.getModiWgt().toString()));
				sumNetWgt = sumNetWgt.add(bomDetailEntity.getNetWgt() == null ? new BigDecimal(0):new BigDecimal(bomDetailEntity.getNetWgt().toString()));
				sumGrossWgt = sumGrossWgt.add(bomDetailEntity.getGrossWgt() == null ? new BigDecimal(0):new BigDecimal(bomDetailEntity.getGrossWgt().toString()));
//				sumCostRate = sumCostRate.add(bomDetailEntity.getCostRate() == null ? new BigDecimal(0):new BigDecimal(bomDetailEntity.getCostRate().toString()));
			}
		}
		bomInfoEntity.setCost(sumCost);
		//更新配方各总重量
		bomInfoEntity.setSumGrossWgt(sumGrossWgt);
		bomInfoEntity.setSumNetWgt(sumNetWgt);
		bomInfoEntity.setSumModiWgt(sumModiWgt);

		//更新配方成本率
		//半成品成本率=（半成品配方成本/半成品的价格）*100%
		PrdDataEntity prdData = prdDataService.queryObject(bomInfoEntity.getPrdId());
		if(prdData != null && prdData.getReferencePrice() != null){
			BigDecimal prdPrice = new BigDecimal(prdData.getReferencePrice().toString());
			sumCostRate = sumCost.divide(prdPrice,5,BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)).setScale(2,BigDecimal.ROUND_HALF_UP);
			bomInfoEntity.setSumCostRate(sumCostRate);
		}

		bomInfoService.update(bomInfoEntity);
	}


	//计算配方明细的成本
	//最小单价=(采购单价/采购换算率)/最小转换率，保留4位小数，再四舍五入
	//成本=毛重*最小单价/最小换算率，保留两位小数
	//成本率=(成本／产品售价)*100%
	//------7月26日修改计算公式
	//最小单价=（采购单价/采购换算率）
	//成本=毛重*最小单价/最小换算率
	public BomDetailEntity computeCost(BomDetailEntity bomDetailEntity){
		if(bomDetailEntity == null){
			return null;
		}
		//判断原料类型
		if(bomDetailEntity.getSemiFinished().equals("1")){//半成品
			//计算本成品
			//半成品成本=（半成品配方成本/半成品配方总毛重）*需求净重
			BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(bomDetailEntity.getMtrId());
			PrdDataEntity prdDataEntity = prdDataService.queryObject(bomDetailEntity.getMtrId());
			BigDecimal bomInfoCost = new BigDecimal(bomInfoEntity.getCost() == null ? "0" : bomInfoEntity.getCost().toString());
			BigDecimal bomInfoSumGrossWgt = new BigDecimal(prdDataEntity.getSumGrossWgt() == null ? "1" : prdDataEntity.getSumGrossWgt().toString());

			BigDecimal netWgt = new BigDecimal(bomDetailEntity.getNetWgt() == null ? "1" : bomDetailEntity.getNetWgt().toString());
			BigDecimal cost = bomInfoCost.divide(bomInfoSumGrossWgt,3,BigDecimal.ROUND_HALF_UP).multiply(netWgt);
			//半成品的单价=售价/毛重，4位小数
			BigDecimal price = new BigDecimal(prdDataEntity.getReferencePrice() == null ? "0" : prdDataEntity.getReferencePrice());
			BigDecimal grossWgt = new BigDecimal(bomDetailEntity.getGrossWgt() == null ? "1" : bomDetailEntity.getGrossWgt());
			BigDecimal miniPrice = price.divide(grossWgt,4,BigDecimal.ROUND_HALF_UP);

			bomDetailEntity.setCost(cost);
			bomDetailEntity.setPrice(miniPrice);
		}else{//原料
			//计算原料的最小单价=采购单价/采购换算率，4位小数
			MtrDataEntity mtrDataEntity = mtrDataService.queryObject(bomDetailEntity.getMtrId());
			BigDecimal orderPrice = new BigDecimal(mtrDataEntity.getPrice() == null ? "0" : mtrDataEntity.getPrice().toString());
			BigDecimal orderRate = new BigDecimal(mtrDataEntity.getPurchaseRate() == null ? "1" : mtrDataEntity.getPurchaseRate().toString());
			BigDecimal grossWgt = new BigDecimal(bomDetailEntity.getGrossWgt() == null ? "1" : bomDetailEntity.getGrossWgt());
			BigDecimal miniRate = new BigDecimal(mtrDataEntity.getMiniRate() == null ? "1" : mtrDataEntity.getMiniRate().toString());
			BigDecimal miniPrice = (orderPrice.divide(orderRate,4,BigDecimal.ROUND_HALF_UP));//.divide(miniRate,4,BigDecimal.ROUND_HALF_UP);
			//成本=毛重*最小单价/最小换算率，保留两位小数
			BigDecimal cost = ((grossWgt.multiply(miniPrice)).setScale(2,BigDecimal.ROUND_HALF_UP)).divide(miniRate,2,BigDecimal.ROUND_HALF_UP);
			bomDetailEntity.setCost(cost);
			bomDetailEntity.setPrice(miniPrice);
		}
		//成本率=(成本／产品售价)*100%
		BomInfoEntity bomInfoEntity = bomInfoService.queryObject(bomDetailEntity.getBomId());
		PrdDataEntity bomPrdInfo = prdDataService.queryObject(bomInfoEntity.getPrdId());
		BigDecimal prdPrice = new BigDecimal(bomPrdInfo.getReferencePrice() == null ? "0" : bomPrdInfo.getReferencePrice());
		BigDecimal costRate = new BigDecimal(0);
		if(prdPrice.compareTo(BigDecimal.ZERO)!=0){
			costRate = (bomDetailEntity.getCost().divide(prdPrice,4,BigDecimal.ROUND_HALF_UP)).multiply(new BigDecimal(100)).setScale(2,BigDecimal.ROUND_HALF_UP);
		}
		bomDetailEntity.setCostRate(costRate);
		return bomDetailEntity;
	}




	public static void main(String[] args){
		String a = "A0201406";
//		BigDecimal b = new BigDecimal(new Double(a).doubleValue()).setScale(2);
		System.out.println(a.substring(a.length()-4));
		int b = Integer.valueOf(a.substring(a.length()-4));
		b += 1;
		String idStr = String.format("%04d",b);
		System.out.println(idStr);
	}

}
