package com.kirin.modules.storage.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kirin.common.utils.DateUtils;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.common.utils.CommonUtils;
import com.kirin.modules.purchase.entity.OrderDetailEntity;
import com.kirin.modules.purchase.entity.OrderInfoEntity;
import com.kirin.modules.purchase.entity.SupplierInfoEntity;
import com.kirin.modules.purchase.service.SupplierInfoService;
import com.kirin.modules.storage.entity.ImportEntity;
import com.kirin.modules.storage.service.ImportService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.storage.entity.ImportDetailEntity;
import com.kirin.modules.storage.service.ImportDetailService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 入库单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-28 06:18:42
 */
@RestController
@RequestMapping("/storage/importdetail")
public class ImportDetailController extends AbstractController {
	@Autowired
	private ImportDetailService importDetailService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("storage:importdetail:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ImportDetailEntity> importDetailList = importDetailService.queryList(query);
		int total = importDetailService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(importDetailList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("storage:importdetail:info")
	public R info(@PathVariable("id") Long id){
		ImportDetailEntity importDetail = importDetailService.queryObject(id);
		
		return R.ok().put("importDetail", importDetail);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("storage:importdetail:save")
	public R save(@RequestBody ImportDetailEntity importDetail){
		importDetailService.save(importDetail);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("storage:importdetail:update")
	public R update(@RequestBody ImportDetailEntity importDetail){
		importDetailService.update(importDetail);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("storage:importdetail:delete")
	public R delete(@RequestBody Long[] ids){
		importDetailService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/editDetail")
	public R editDetail(@RequestParam("id")Long detailId,@RequestParam(value="amount",required = false)String amount,@RequestParam("inCount")String inCount){
		ImportDetailEntity importDetail = importDetailService.queryObject(detailId);
		importDetail.setInCount(inCount);

		importDetail.setInDate(DateUtils.format(new Date(),DateUtils.DATE_TIME_PATTERN));
		importDetail.setInPrice(importDetail.getOrderPrice());
		importDetail.setInSumPrice(new BigDecimal(importDetail.getInPrice().toString()).multiply(new BigDecimal(importDetail.getInCount())).setScale(2,BigDecimal.ROUND_HALF_UP));

		BigDecimal baseWgt = importDetail.getOrderMtrWgt() == null ? new BigDecimal(0) : importDetail.getOrderMtrWgt();
		importDetail.setInWgt(new BigDecimal(importDetail.getInCount().toString()).multiply(baseWgt).toString());

		SysUserEntity sysUserEntity =  getUser();

//		importDetail.setUpdateUser(sysUserEntity.getUsername());
//		importDetail.setUpdateDate(new Date());

		importDetailService.update(importDetail);
		return R.ok();
	}

	@Autowired
	ImportService importService;
	@Autowired
	SupplierInfoService supplierInfoService;
	@Autowired
	CommonUtilService commonUtilService;

	@RequestMapping("/importConfirm")
	public R importConfirm(@RequestParam("importId") Long importId){
		ImportEntity importEntity = importService.queryObject(importId);
		SupplierInfoEntity supplierInfoEntity = supplierInfoService.queryObject(importEntity.getSupplierId());

		Long no = 0L;
		String currentNo = commonUtilService.getTableNewNo("TB_IMPORT","IMPORT_NO");
		if(currentNo != null && !currentNo.equals("")){
			//yyyyMMdd+0000
			no = Long.valueOf(currentNo.substring(8));
		}
		no = no+1;
		String newNo = new CommonUtils().createNoByDate(no);

		importEntity.setImportNo(newNo);
		importEntity.setImportDate(new Date(DateUtils.format(new Date(),DateUtils.DATE_TIME_PATTERN)));
		importEntity.setImportDate(new Date());
		importEntity.setStatus("2");
		System.out.println("----------->No="+newNo);
		importService.update(importEntity);

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("importId",importId);

		List<ImportDetailEntity> importDetailEntityList = importDetailService.queryList(map);
		for (ImportDetailEntity importDetailEntity:importDetailEntityList) {
			importDetailEntity.setInCount(importDetailEntity.getInCount());
//				importDetailEntity.setInDate(new Date(DateUtils.format(new Date(),DateUtils.DATE_TIME_PATTERN)));
//				importDetailEntity.setInDate(new Date());
//				importDetailEntity.setInPrice(orderDetailEntity.getInPrice());
//				importDetailEntity.setInRate(orderDetailEntity.getMtrRate());
//				if(orderDetailEntity.getInPrice() == null ){
//					orderDetailEntity.setInPrice(new BigDecimal(0));
//				}
//				if(orderDetailEntity.getInCount() == null ){
//					orderDetailEntity.setInCount("0");
//				}
//				importDetailEntity.setInSumPrice(new BigDecimal(orderDetailEntity.getInPrice().toString()).multiply(new BigDecimal(orderDetailEntity.getInCount())));
//				importDetailEntity.setInUnit(orderDetailEntity.getMtrUnit());
//				importDetailEntity.setInWgt(orderDetailEntity.getInWgt());
		}

		return R.ok();
	}
	
}
