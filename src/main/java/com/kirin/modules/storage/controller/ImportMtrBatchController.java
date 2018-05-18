package com.kirin.modules.storage.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kirin.common.utils.DateUtils;
import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.entity.MtrExtendEntity;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.modules.baseData.service.MtrExtendService;
import com.kirin.modules.purchase.entity.OrderDetailEntity;
import com.kirin.modules.purchase.entity.SuppierMtrEntity;
import com.kirin.modules.purchase.entity.SupplierInfoEntity;
import com.kirin.modules.purchase.service.OrderDetailService;
import com.kirin.modules.purchase.service.OrderInfoService;
import com.kirin.modules.purchase.service.SupplierInfoService;
import com.kirin.modules.storage.entity.ImportDetailEntity;
import com.kirin.modules.storage.entity.ImportEntity;
import com.kirin.modules.storage.entity.OutportDetailEntity;
import com.kirin.modules.storage.service.ImportDetailService;
import com.kirin.modules.storage.service.ImportService;
import com.kirin.modules.storage.service.OutportDetailService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.storage.entity.ImportMtrBatchEntity;
import com.kirin.modules.storage.service.ImportMtrBatchService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 入库原料批次信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-01-21 15:12:02
 */
@RestController
@RequestMapping("/storage/importmtrbatch")
public class ImportMtrBatchController {
	@Autowired
	private ImportMtrBatchService importMtrBatchService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("storage:importmtrbatch:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ImportMtrBatchEntity> importMtrBatchList = importMtrBatchService.queryList(query);
		int total = importMtrBatchService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(importMtrBatchList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("storage:importmtrbatch:info")
	public R info(@PathVariable("id") Long id){
		ImportMtrBatchEntity importMtrBatch = importMtrBatchService.queryObject(id);
		
		return R.ok().put("importMtrBatch", importMtrBatch);
	}

	@Autowired
	ImportDetailService importDetailService;

	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("storage:importmtrbatch:save")
	public R save(@RequestBody ImportMtrBatchEntity importMtrBatch){

		ImportDetailEntity importDetailEntity = new ImportDetailEntity();
		importDetailEntity.setImportId(importMtrBatch.getImportId());
		importDetailEntity.setMtrId(importMtrBatch.getMtrId());
		importDetailEntity.setInUnit(importMtrBatch.getInUnitName());
		System.out.println("-------------------------------------------"+importMtrBatch.getInUnitName());
		System.out.println("-------------------------------------------"+importDetailEntity.getInUnit());
//		importDetailEntity.setInUnit(importMtrBatch.getInUnitId().toString());
		importDetailEntity.setInRate(importMtrBatch.getInUnitRate() == null ? "0" : importMtrBatch.getInUnitRate().toString());
		importDetailEntity.setOrderCount(importMtrBatch.getOrderCount() == null ? "0" : importMtrBatch.getOrderCount().toString());
		importDetailEntity.setOrderPrice(importMtrBatch.getOrderPrice());
		//根据入库单ID与原料ID查询入库明细ID
		ImportDetailEntity importDetailEntity2 = importDetailService.queryObject2(importDetailEntity);
		importMtrBatch.setImportDetailId(importDetailEntity2.getId());

		importMtrBatchService.save(importMtrBatch);
		importMtrBatch.setStatus("1");

		//更新入库明细当中该原料的入库数量
		updateDetailInCount(importMtrBatch.getImportDetailId());

		//更新订单明细中的入库数量
		updateOrderDetailInCount(importMtrBatch);
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("storage:importmtrbatch:update")
	public R update(@RequestBody ImportMtrBatchEntity importMtrBatch){
		importMtrBatchService.update(importMtrBatch);

		//更新入库明细当中该原料的入库数量
		updateDetailInCount(importMtrBatch.getImportDetailId());
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("storage:importmtrbatch:delete")
	public R delete(@RequestBody Long[] ids){
		Long detailId = 0L;
		for(Long id : ids){
			ImportMtrBatchEntity importMtrBatch = importMtrBatchService.queryObject(id);
			detailId = importMtrBatch.getImportDetailId();
			break;
		}
		importMtrBatchService.deleteBatch(ids);

		updateDetailInCount(detailId);

		return R.ok();
	}

	@Autowired
	private ImportService importService;

	@Autowired
	private OrderDetailService orderDetailService;

	public void updateOrderDetailInCount(ImportMtrBatchEntity importMtrBatchEntity){
		//更新订单的某个原料的实际入库数量
		ImportEntity importEntity = importService.queryObject(importMtrBatchEntity.getImportId());

		ImportDetailEntity importDetailEntity = importDetailService.queryObject(importMtrBatchEntity.getImportDetailId());

		Map<String,Object> param = new HashMap<>();
		param.put("orderId",importEntity.getOrderId());
		List<OrderDetailEntity> orderDetailEntityList = orderDetailService.queryList(param);
		if(orderDetailEntityList != null && orderDetailEntityList.size() > 0){
			for (OrderDetailEntity orderDetailEntity:orderDetailEntityList) {
				if(orderDetailEntity.getMtrId().equals(importMtrBatchEntity.getMtrId())){
					orderDetailEntity.setInCount(importDetailEntity.getInCount().toString());
					orderDetailService.update(orderDetailEntity);
				}
			}
		}
	}


	//更新入库明细入库数量，在进行入库批次的增删以及更新后的操作
	public void updateDetailInCount(Long detailId){
		ImportDetailEntity importDetailEntity = importDetailService.queryObject(detailId);
		//1.查询该明细下的所有入库批次信息
		Map<String,Object> queryMap = new HashMap<>();
		queryMap.put("importDetailId",detailId);
		List<ImportMtrBatchEntity> importMtrBatchEntityList = importMtrBatchService.queryList(queryMap);
		if(importMtrBatchEntityList != null && importMtrBatchEntityList.size() > 0){
			BigDecimal sumInCount = new BigDecimal("0");
			for(ImportMtrBatchEntity importMtrBatchEntity : importMtrBatchEntityList){
				BigDecimal inCount = importMtrBatchEntity.getInCount();
				sumInCount = sumInCount.add(inCount);
			}
			importDetailEntity.setInCount(sumInCount.toString());
		}else{
			importDetailEntity.setInCount("0.00");
		}
		importDetailService.update(importDetailEntity);
	}


	@Autowired
	private SupplierInfoService supplierInfoService;
	@Autowired
	private MtrDataService mtrDataService;
	@Autowired
	private MtrExtendService mtrExtendService;
	//创建批次号
	@RequestMapping("/createBatchNo")
	public R createBatchNo(@RequestParam("mtrId")Long mtrId,@RequestParam("detailId")Long detailId){
		StringBuffer no = new StringBuffer();
		Map<String,Object> params = new HashMap<>();
		params.put("importDetailId",detailId);
		params.put("mtrId",mtrId);
		List<ImportMtrBatchEntity> importMtrBatchList = importMtrBatchService.queryList(params);
		String strNo = "00";
		String dateStr = DateUtils.format(new Date(),"yyyyMMdd");
		if(importMtrBatchList != null && importMtrBatchList.size() > 0){
			for (ImportMtrBatchEntity importMtrBatch :importMtrBatchList) {
				String subStrDate = importMtrBatch.getBatchNo().substring(0,8);
				String subStrNo = importMtrBatch.getBatchNo().substring(8,10);
				if(subStrDate.equals(dateStr) && (Integer.parseInt(subStrNo) > Integer.parseInt(strNo))){
					strNo = subStrNo;
				}
			}
			strNo = String.format("%02d",Integer.parseInt(strNo) + 1);
		}
		no.append(dateStr);
		no.append(strNo);
		return R.ok().put("no",no);
	}

	@Autowired
	private OutportDetailService outportDetailService;

	/**
	 * 实时计算原料当前库存
	 * 可用库存=入库-出库
	 */
	@RequestMapping("/getCurrentCount")
	public R countInventory(@RequestParam("mtrId")Long mtrId,@RequestParam("batchNo")String batchNo){
		BigDecimal inCount = new BigDecimal(0);//计算总入库量
		List<ImportMtrBatchEntity> listBatch = importMtrBatchService.queryByAttr(mtrId,batchNo);
		if(listBatch != null && listBatch.size() > 0){
			for (ImportMtrBatchEntity entity:listBatch) {
				BigDecimal count =  entity.getInCount();
				inCount = inCount.add(count);
			}
		}
		BigDecimal outCount = new BigDecimal(0);//计算总出库量
		List<OutportDetailEntity> listOutMtr = outportDetailService.queryListByMtrId(mtrId);
		if(listOutMtr != null && listOutMtr.size() > 0){
			for (OutportDetailEntity entity:listOutMtr) {
				String outBatchNo = entity.getBatchNo() == null ? "" : entity.getBatchNo();
				if(outBatchNo.equals(batchNo)){
					BigDecimal count =  entity.getOutCount() == null ? new BigDecimal(0) : entity.getOutCount();
					outCount = outCount.add(count);
				}
			}
		}
		BigDecimal currentCount = new BigDecimal(0);//当前库存
		currentCount = inCount.subtract(outCount);
		return R.ok().put("currentCount",currentCount);
	}



	public static void main(String[] args){
		String a = "2018012200";
		String subStrDate = a.substring(0,8);
		String subStrNo = a.substring(8,10);

		System.out.println(subStrDate+"---"+subStrNo);
	}

}
