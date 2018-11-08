package com.kirin.modules.baseData.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.entity.*;
import com.kirin.modules.baseData.service.*;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.purchase.service.SuppierMtrService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;

import static java.math.BigDecimal.ROUND_HALF_UP;


/**
 *
 *
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-31 16:31:30
 */
@RestController
@RequestMapping("/baseData/bomdetail")
public class BomDetailController extends AbstractController {
	@Autowired
	private BomDetailService bomDetailService;

	@Autowired
	private BomInfoService bomInfoService;

	@Autowired
	private PrdDataService prdDataService;

	@Autowired
	private CommonUtilService commonUtilService;
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("baseData:bomdetail:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		PrdDataEntity prdDataEntity = null;
		List<BomDetailEntity> bomDetailList = bomDetailService.queryList(query);
		int total = bomDetailService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(bomDetailList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	@RequestMapping("/listByPrdId")
	public R listByPrdId(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);

		List<BomDetailEntity> bomDetailList = bomDetailService.queryListByPrdId(query);
		int total = bomDetailService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(bomDetailList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
//	@RequiresPermissions("baseData:bomdetail:info")
	public R info(@PathVariable("id") Long id){
		BomDetailEntity bomDetail = bomDetailService.queryObject(id);

		return R.ok().put("bomDetail", bomDetail);
	}

	@RequestMapping("/detailInfo/{id}")
	public R detailInfo(@PathVariable("id") Long id){
		BomDetailEntity bomDetail = bomDetailService.queryDetailObject(id);
		if(bomDetail.getMtrCutId() == null){
			bomDetail.setMtrCutId(0L);
		}
		return R.ok().put("bomDetail", bomDetail);
	}

	@Autowired
	MtrExtendService mtrExtendService;



	/**
	 * 保存
	 */
	@RequestMapping("/save")
//	@RequiresPermissions("baseData:bomdetail:save")
	public R save(@RequestBody BomDetailEntity bomDetail){

		BomInfoEntity bomInfoEntity = bomInfoService.queryObject(bomDetail.getBomId());



		if(bomDetail.getSemiFinished().equals("1")){//半成品
//			BigDecimal sumCost =  countBomInfoCost(bomDetail.getMtrId());
//			bomDetail.setCost(sumCost);
			//半成品要根据实际需求量来计算成本--公式=半成品成本*（需求净重/半成品总毛重）
			BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(bomDetail.getMtrId());
			if(bomInfo.getCost() == null || bomInfo.getCost().equals(0)){
				bomDetail.setCost(new BigDecimal(0));
			}else{
				BigDecimal netWgt = new BigDecimal(bomDetail.getNetWgt() == null ? "0" : bomDetail.getNetWgt().toString());
				BigDecimal grossWgt = new BigDecimal(0);
				Map<String,Object> queryMap = new HashMap<>();
				queryMap.put("prdId",bomDetail.getMtrId());
				List<BomDetailEntity> bomDetailEntities = bomDetailService.queryListByPrdId(queryMap);
				if(bomDetailEntities != null && bomDetailEntities.size() > 0){
					for (BomDetailEntity bomDetailEntity: bomDetailEntities) {
						BigDecimal detailGrossWgt = new BigDecimal(bomDetailEntity.getGrossWgt() == null ? "0" : bomDetailEntity.getGrossWgt().toString());
						grossWgt = grossWgt.add(detailGrossWgt);
					}
				}else{
					grossWgt = grossWgt.add(new BigDecimal(1));
				}
				BigDecimal cost = bomInfo.getCost().multiply(netWgt.divide(grossWgt,2,BigDecimal.ROUND_HALF_UP)).setScale(2,BigDecimal.ROUND_HALF_UP);
				bomDetail.setCost(cost);
			}
			//半成品的单价
			PrdDataEntity prdDataEntity = prdDataService.queryObject(bomDetail.getMtrId());
			bomDetail.setPrice(new BigDecimal(prdDataEntity.getReferencePrice()));


		}else{//原料
			//计算原料的成本
			MtrDataEntity mtrDataEntity = mtrDataService.queryObject(bomDetail.getMtrId());
			//配方里原料的单价=（原料的采购单价／原料的采购转换率）/最小转换率
			BigDecimal mtrPrice =  new BigDecimal(mtrDataEntity.getPrice() == null ? "0" : mtrDataEntity.getPrice());
			BigDecimal mtrPurchaseRate =  new BigDecimal(mtrDataEntity.getPurchaseRate() == null ? "0" : mtrDataEntity.getPurchaseRate());
			if(bomDetail.getMtrExtendId() != 0){
				MtrExtendEntity mtrExtendEntity = mtrExtendService.queryObject(bomDetail.getMtrExtendId());
				mtrPrice = new BigDecimal(mtrExtendEntity.getPrice() == null ? "0" : mtrExtendEntity.getPrice().toString());
				mtrPurchaseRate = new BigDecimal(mtrExtendEntity.getUnitRate() == null ? "0" : mtrExtendEntity.getUnitRate().toString());
			}

			BigDecimal bomDetailPrice = new BigDecimal(0);
			if(mtrPurchaseRate.compareTo(BigDecimal.ZERO)!=0){
				bomDetailPrice = mtrPrice.divide(mtrPurchaseRate,2,BigDecimal.ROUND_HALF_UP);
			}
			bomDetail.setPrice(bomDetailPrice);

			//成本=(配方里原料的单价／原料里配方单位转换率)*配方里原料的毛重
			BigDecimal mtrMiniRate =  new BigDecimal(mtrDataEntity.getMiniRate() == null ? "0" : mtrDataEntity.getMiniRate());
			BigDecimal bomDetailCost = new BigDecimal(0);
			if(mtrMiniRate.compareTo(BigDecimal.ZERO)!=0){
				bomDetailCost = bomDetailPrice.divide(mtrMiniRate,2,BigDecimal.ROUND_HALF_UP);
			}
			BigDecimal temp = new BigDecimal(bomDetail.getNetWgt() == null ? "0" : bomDetail.getNetWgt());
			BigDecimal detailCost = bomDetailCost.multiply(temp).setScale(2,BigDecimal.ROUND_HALF_UP);

			//有效计算
			BigDecimal newCost = new BigDecimal(0);
			if(mtrPurchaseRate.compareTo(BigDecimal.ZERO)!=0 && mtrMiniRate.compareTo(BigDecimal.ZERO)!=0 && temp.compareTo(BigDecimal.ZERO)!=0){
				newCost = mtrPrice.divide(mtrPurchaseRate,10,ROUND_HALF_UP).divide(mtrMiniRate,10,ROUND_HALF_UP).multiply(temp).setScale(2,BigDecimal.ROUND_HALF_UP);
			}
			bomDetail.setCost(newCost);
		}
		//成本率=(成本／产品售价)*100%
		PrdDataEntity prdDataEntity = prdDataService.queryObject(bomInfoEntity.getPrdId());//获取该配方对应产品的售价
		BigDecimal prdPrice = new BigDecimal(prdDataEntity.getReferencePrice() == null ? "0" : prdDataEntity.getReferencePrice());
		BigDecimal detailCostRate = new BigDecimal(0);
		if(prdPrice.compareTo(BigDecimal.ZERO)!=0 ){
			detailCostRate = bomDetail.getCost().divide(prdPrice,2,BigDecimal.ROUND_HALF_UP).divide(new BigDecimal(100),2,BigDecimal.ROUND_HALF_UP);
		}
		bomDetail.setCostRate(detailCostRate);

		//毛重=净重/净得率
		BigDecimal grossWgt = new BigDecimal(0);
		BigDecimal newWgt = bomDetail.getNetWgt() == null ? new BigDecimal(0) : new BigDecimal(bomDetail.getNetWgt());
		BigDecimal newRate = bomDetail.getNetRate() == null||bomDetail.getNetRate().equals("0") ? new BigDecimal(1) : new BigDecimal(bomDetail.getNetRate());

		grossWgt = newWgt.divide(newRate,2,BigDecimal.ROUND_HALF_UP);

		bomDetail.setGrossWgt(grossWgt.toString());

		SysUserEntity sysUserEntity =  getUser();
		bomDetail.setCreateUser(sysUserEntity.getUsername());
		bomDetail.setCreateDate(new Date());

		bomDetailService.save(bomDetail);

		updateCostNew(bomDetail.getBomId());

		return R.ok();
	}

	@RequestMapping("/newSave")
//	@RequiresPermissions("baseData:bomdetail:save")
	public R newSave(@RequestBody BomDetailEntity bomDetail){
		BomInfoEntity bomInfoEntity = bomInfoService.queryObject(bomDetail.getBomId());
		/*
		 * 更新明细信息
		 */
		//计算成本
		BomDetailEntity newBomDetail = computeCost(bomDetail);//计算成本
		//成本率=(成本／产品售价)*100%
//		PrdDataEntity prdDataEntity = prdDataService.queryObject(bomInfoEntity.getPrdId());//获取该配方对应产品的售价
//		BigDecimal prdPrice = new BigDecimal(prdDataEntity.getReferencePrice() == null ? "0" : prdDataEntity.getReferencePrice());
//		BigDecimal detailCostRate = new BigDecimal(0);
//		if(prdPrice.compareTo(BigDecimal.ZERO)!=0){
//			detailCostRate = bomDetail.getCost().divide(prdPrice,2,BigDecimal.ROUND_HALF_UP).divide(new BigDecimal(100),2,BigDecimal.ROUND_HALF_UP);
//		}
//		newBomDetail.setCostRate(detailCostRate);
		bomDetailService.save(newBomDetail);
		/*
		 * 更新配方信息
		 */
		//更新配方成本和配方各总重量
		updateCostNew(bomInfoEntity.getId());

//		commonUtilService.updatePrdPrice();
		/*
		 * 更新产品信息
		 */
		return R.ok();
	}

	/**
	 * 修改
	 */
	@RequestMapping("/update")
//	@RequiresPermissions("baseData:bomdetail:update")
	public R update(@RequestBody BomDetailEntity bomDetail){

		BomInfoEntity bomInfoEntity = bomInfoService.queryObject(bomDetail.getBomId());

		BigDecimal grossWgt = new BigDecimal(0);

		if(bomDetail.getSemiFinished().equals("1")){//半成品
//			BigDecimal sumCost =  countBomInfoCost(bomDetail.getMtrId());
//			bomDetail.setCost(sumCost);
			//半成品要根据实际需求量来计算成本--公式=半成品成本*（需求净重/半成品总毛重）
			BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(bomDetail.getMtrId());
			if(bomInfo.getCost() == null || bomInfo.getCost().equals(0)){
				bomDetail.setCost(new BigDecimal(0));
			}else{
				BigDecimal netWgt = new BigDecimal(bomDetail.getNetWgt() == null ? "0" : bomDetail.getNetWgt().toString());
//				BigDecimal grossWgt = new BigDecimal(0);
				Map<String,Object> queryMap = new HashMap<>();
				queryMap.put("prdId",bomDetail.getMtrId());
				List<BomDetailEntity> bomDetailEntities = bomDetailService.queryListByPrdId(queryMap);
				if(bomDetailEntities != null && bomDetailEntities.size() > 0){
					for (BomDetailEntity bomDetailEntity: bomDetailEntities) {
						BigDecimal detailGrossWgt = new BigDecimal(bomDetailEntity.getGrossWgt() == null ? "0" : bomDetailEntity.getGrossWgt().toString());
						grossWgt = grossWgt.add(detailGrossWgt);
					}
				}else{
					grossWgt = grossWgt.add(new BigDecimal(1));
				}
				bomDetail.setGrossWgt(grossWgt.toString());
				BigDecimal cost = bomInfo.getCost().multiply(netWgt.divide(grossWgt,2,BigDecimal.ROUND_HALF_UP)).setScale(2,BigDecimal.ROUND_HALF_UP);
				bomDetail.setCost(cost);
			}
			//半成品的单价
			PrdDataEntity prdDataEntity = prdDataService.queryObject(bomDetail.getMtrId());
			bomDetail.setPrice(new BigDecimal(prdDataEntity.getReferencePrice()));

		}else{//原料
			//计算原料的成本
			MtrDataEntity mtrDataEntity = mtrDataService.queryObject(bomDetail.getMtrId());
			//配方里原料的单价=原料的采购单价／原料的采购转换率
			BigDecimal mtrPrice =  new BigDecimal(mtrDataEntity.getPrice() == null ? "0" : mtrDataEntity.getPrice());
			BigDecimal mtrPurchaseRate =  new BigDecimal(mtrDataEntity.getPurchaseRate() == null ? "0" : mtrDataEntity.getPurchaseRate());

			//多规格时原料单价计算
			if(bomDetail.getMtrExtendId() != null && bomDetail.getMtrExtendId() != 0){
				MtrExtendEntity mtrExtendEntity = mtrExtendService.queryObject(bomDetail.getMtrExtendId());
				mtrPrice = mtrExtendEntity.getPrice();
				mtrPurchaseRate = mtrExtendEntity.getUnitRate();
			}

			BigDecimal bomDetailPrice = new BigDecimal(0);
			if(mtrPurchaseRate.compareTo(BigDecimal.ZERO)!=0){
				bomDetailPrice = mtrPrice.divide(mtrPurchaseRate,2,BigDecimal.ROUND_HALF_UP);
			}
			bomDetail.setPrice(bomDetailPrice);

			//成本=(配方里原料的单价*配方里原料的毛重)/原料里配方单位转换率
			BigDecimal mtrMiniRate =  new BigDecimal(mtrDataEntity.getMiniRate() == null ? "0" : mtrDataEntity.getMiniRate());
			BigDecimal bomDetailCost = new BigDecimal(0);
			if(mtrMiniRate.compareTo(BigDecimal.ZERO)!=0){
				bomDetailCost = bomDetailPrice.divide(mtrMiniRate,2,BigDecimal.ROUND_HALF_UP);
			}
			BigDecimal temp = new BigDecimal(bomDetail.getGrossWgt() == null ? "0" : bomDetail.getGrossWgt());
//			BigDecimal detailCost = bomDetailCost.multiply(temp).setScale(2,BigDecimal.ROUND_HALF_UP);

			BigDecimal detailCost = bomDetailPrice.multiply(temp).divide(mtrMiniRate).setScale(2,BigDecimal.ROUND_HALF_UP);

			//有效计算
//			BigDecimal newCost = new BigDecimal(0);
//			if(mtrPurchaseRate.compareTo(BigDecimal.ZERO)!=0 && mtrMiniRate.compareTo(BigDecimal.ZERO)!=0 && temp.compareTo(BigDecimal.ZERO)!=0){
//				newCost = mtrPrice.divide(mtrPurchaseRate,10,ROUND_HALF_UP).divide(mtrMiniRate,10,ROUND_HALF_UP).multiply(temp).setScale(2,BigDecimal.ROUND_HALF_UP);
//			}
			//第三次计算成本 = 单价*毛重
//			BigDecimal newCost2 = new BigDecimal(0);
//			newCost2 = bomDetailPrice.multiply(new BigDecimal(bomDetail.getGrossWgt())).setScale(2,BigDecimal.ROUND_HALF_UP);

			bomDetail.setCost(detailCost);

			//毛重=净重/净得率

			BigDecimal newWgt = bomDetail.getNetWgt() == null ? new BigDecimal(0) : new BigDecimal(bomDetail.getNetWgt());
			BigDecimal newRate = bomDetail.getNetRate() == null||bomDetail.getNetRate().equals("0") ? new BigDecimal(1) : new BigDecimal(bomDetail.getNetRate());
			grossWgt = newWgt.divide(newRate,2,BigDecimal.ROUND_HALF_UP);
			bomDetail.setGrossWgt(grossWgt.toString());
		}

		//成本率=(成本／产品售价)*100%
		PrdDataEntity prdDataEntity = prdDataService.queryObject(bomInfoEntity.getPrdId());//获取该配方对应产品的售价
		BigDecimal prdPrice = new BigDecimal(prdDataEntity.getReferencePrice() == null ? "0" : prdDataEntity.getReferencePrice());
		BigDecimal detailCostRate = new BigDecimal(0);
		if(prdPrice.compareTo(BigDecimal.ZERO)!=0){
			detailCostRate = bomDetail.getCost().divide(prdPrice,2,BigDecimal.ROUND_HALF_UP).divide(new BigDecimal(100),2,BigDecimal.ROUND_HALF_UP);
		}
		bomDetail.setCostRate(detailCostRate);

		SysUserEntity sysUserEntity =  getUser();
		bomDetail.setUpdateUser(sysUserEntity.getUsername());
		bomDetail.setUpdateDate(new Date());

		bomDetailService.update(bomDetail);

		updateCostNew(bomDetail.getBomId());

		return R.ok();
	}

	@RequestMapping("/newUpdate")
//	@RequiresPermissions("baseData:bomdetail:newUpdate")
	public R newUpdate(@RequestBody BomDetailEntity bomDetail){
		BomInfoEntity bomInfoEntity = bomInfoService.queryObject(bomDetail.getBomId());
		/*
		 * 更新明细信息
		 */
		//计算成本
		BomDetailEntity newBomDetail = computeCost(bomDetail);//计算成本

		//修改规格说明
		if(bomDetail.getSemiFinished().equals("0") && bomDetail.getMtrCutId() == 0){
			MtrDataEntity mtrDataEntity = mtrDataService.queryObject(bomDetail.getMtrId());
			String mtrExtendDesc = mtrDataEntity.getMiniUnitName()+"-"+mtrDataEntity.getPurchaseRate()+"-￥"+mtrDataEntity.getPrice();
			newBomDetail.setMtrExtendDesc(mtrExtendDesc);
		}else if(bomDetail.getSemiFinished().equals("1")){
			newBomDetail.setMtrExtendDesc("");
		}

		bomDetailService.update(newBomDetail);
		/*
		 * 更新配方信息
		 */
		//更新配方成本和配方各总重量
		updateCostNew(bomInfoEntity.getId());

//		commonUtilService.updatePrdPrice();

		/*
		 * 更新产品信息
		 */
		return R.ok();
	}


	/**
	 * 删除
	 */
	@RequestMapping("/delete/{id}")
//	@RequiresPermissions("baseData:bomdetail:delete")
	public R delete(@PathVariable("id") Long id){
		BomDetailEntity bomDetailEntity = bomDetailService.queryDetailObject(id);

		bomDetailService.delete(id);

		updateCostNew(bomDetailEntity.getBomId());

		return R.ok();
	}

	@Autowired
	private MtrDataService mtrDataService;

	//循环计算产品的成本
	private BigDecimal countBomInfoCost(Long prdId){
		BigDecimal sumCost = new BigDecimal(0);

		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("prdId",prdId);

		List<BomDetailEntity> bomDetailEntityList = bomDetailService.queryListByPrdId(paramMap);
		for (BomDetailEntity bomDetailEntity:bomDetailEntityList) {

			if(bomDetailEntity.getSemiFinished().equals("1")){//半成品
				sumCost = sumCost.add(countBomInfoCost(bomDetailEntity.getMtrId()));
			}else{//原料
				MtrDataEntity mtrDataEntity = mtrDataService.queryObject(bomDetailEntity.getMtrId());
				BigDecimal mtrCost1 = new BigDecimal(mtrDataEntity.getPrice()).divide(new BigDecimal(mtrDataEntity.getModiRate1()),2,BigDecimal.ROUND_HALF_UP);

				BigDecimal mtrCost = mtrCost1.divide(new BigDecimal(mtrDataEntity.getModiRate2()),2,BigDecimal.ROUND_HALF_UP);
				sumCost = sumCost.add(mtrCost);
			}
		}
		return sumCost;
	}

	//计算配方成本，并更新配方成本与产品成本
	public void updateCost(Long bomInfoId){
		BigDecimal sumCost = new BigDecimal(0);

		BomInfoEntity bomInfoEntity = bomInfoService.queryObject(bomInfoId);
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("bomInfoId",bomInfoId);
		List<BomDetailEntity> bomDetailEntityList = bomDetailService.queryList(paramMap);
		if(bomDetailEntityList != null && bomDetailEntityList.size() > 0){
			for (BomDetailEntity bomDetailEntity:bomDetailEntityList) {
				if(bomDetailEntity.getSemiFinished().equals("1")){//半成品
					BomInfoEntity bomInfoEntity1 = bomInfoService.queryObjectByPrdId(bomDetailEntity.getMtrId());
					sumCost = sumCost.add(bomInfoEntity1.getCost());
				}else{
					sumCost = sumCost.add(bomDetailEntity.getCost() == null ? new BigDecimal(0) : bomDetailEntity.getCost() );
				}
			}
		}
		bomInfoEntity.setCost(sumCost);
		bomInfoService.update(bomInfoEntity);
	}

	/**
	 * 更新配方成本
	 * @param bomInfoId
	 */
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
		//更新半成品配方的售价
		//1；熟菜得率=1时：半成品单价（kg/元）=组成此半成品所有物料成本之和÷总毛重
		//2；熟菜得率≠1时：半成品单价（kg/元）=组成此半成品所有物料成本之和÷总熟重

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
			BigDecimal bomInfoSumGrossWgt = new BigDecimal(prdDataEntity.getSumGrossWgt() == null ? "0" : prdDataEntity.getSumGrossWgt().toString());

            BigDecimal netWgt = new BigDecimal(bomDetailEntity.getNetWgt() == null ? "0" : bomDetailEntity.getNetWgt().toString());
            BigDecimal modiWgt = new BigDecimal(bomDetailEntity.getModiWgt() == null ? "0" : bomDetailEntity.getModiWgt().toString());
			BigDecimal cost = new BigDecimal("0");
			//半成品的单价=售价/毛重，4位小数
			BigDecimal price = new BigDecimal(prdDataEntity.getReferencePrice() == null ? "0" : prdDataEntity.getReferencePrice());
			BigDecimal grossWgt = new BigDecimal(bomDetailEntity.getGrossWgt() == null ? "0" : bomDetailEntity.getGrossWgt());
			//9月11日修改
			//半成品成本=（半成品所需毛重）*(售价/基本转换率）
			BigDecimal miniRate = new BigDecimal(bomDetailEntity.getMiniRate() == null ? "0" : bomDetailEntity.getMiniRate().toString());
//			BigDecimal bomInfoSumModiWgt = new BigDecimal(bomInfoEntity.getSumModiWgt() == null ? "0" : bomInfoEntity.getSumModiWgt().toString());
			if(miniRate.compareTo(BigDecimal.ZERO) != 0){
				cost = grossWgt.multiply(price.divide(miniRate,8,BigDecimal.ROUND_HALF_UP)).setScale(2,BigDecimal.ROUND_HALF_UP);
			}

			bomDetailEntity.setCost(cost);
			bomDetailEntity.setPrice(price);
		}else{//原料
			//计算原料的最小单价=采购单价/采购换算率，4位小数
			MtrDataEntity mtrDataEntity = mtrDataService.queryObject(bomDetailEntity.getMtrId());
			BigDecimal orderPrice = new BigDecimal(mtrDataEntity.getPrice() == null ? "0" : mtrDataEntity.getPrice().toString());
			BigDecimal orderRate = new BigDecimal(mtrDataEntity.getPurchaseRate() == null ? "0" : mtrDataEntity.getPurchaseRate().toString());
			BigDecimal grossWgt = new BigDecimal(bomDetailEntity.getGrossWgt() == null ? "0" : bomDetailEntity.getGrossWgt());
			BigDecimal miniRate = new BigDecimal(mtrDataEntity.getMiniRate() == null ? "0" : mtrDataEntity.getMiniRate().toString());
			BigDecimal miniPrice = new BigDecimal("0");
			if(orderRate.compareTo(BigDecimal.ZERO) != 0){
				miniPrice = (orderPrice.divide(orderRate,4,BigDecimal.ROUND_HALF_UP));
			}
			//9月11日修改
			//原料成本=（原料所需毛重/基本转换率）*基本单价（采购价格/采购转换率）
			BigDecimal cost = new BigDecimal("0");
			if(miniRate.compareTo(BigDecimal.ZERO) != 0){
				cost = (grossWgt.divide(miniRate,8,BigDecimal.ROUND_HALF_UP)).multiply(miniPrice).setScale(4,BigDecimal.ROUND_HALF_UP);
			}

			bomDetailEntity.setCost(cost);
			bomDetailEntity.setPrice(orderPrice.divide(orderRate,4,BigDecimal.ROUND_HALF_UP));
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
		BigDecimal a = new BigDecimal(0);
		BigDecimal b = new BigDecimal(0);
		BigDecimal c = new BigDecimal(0);
		BigDecimal d = new BigDecimal(0);

		System.out.println(b.divide(a).divide(c).setScale(2,BigDecimal.ROUND_HALF_UP));
		System.out.println(b.divide(a).divide(c).multiply(d).setScale(2,BigDecimal.ROUND_HALF_UP));

	}
}
