package com.kirin.modules.sales.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.entity.PrdDataEntity;
import com.kirin.modules.baseData.service.PrdDataService;
import com.kirin.modules.sales.entity.CustomerInfoEntity;
import com.kirin.modules.sales.service.CustomerInfoService;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.sales.entity.CustomerPrdEntity;
import com.kirin.modules.sales.service.CustomerPrdService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 客户采购产品信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
@RestController
@RequestMapping("/sales/customerprd")
public class CustomerPrdController {
	@Autowired
	private CustomerPrdService customerPrdService;

	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sales:customerprd:list")
	public R list(@RequestParam Map<String, Object> params){
		System.out.println("-------------->params="+params);
		//查询列表数据
        Query query = new Query(params);

		List<CustomerPrdEntity> customerPrdList = customerPrdService.queryList(query);
		int total = customerPrdService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(customerPrdList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
//	@RequiresPermissions("sales:customerprd:info")
	public R info(@PathVariable("id") Long id){
		CustomerPrdEntity customerPrd = customerPrdService.queryObject(id);
		
		return R.ok().put("customerPrd", customerPrd);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sales:customerprd:save")
	public R save(@RequestBody CustomerPrdEntity customerPrd){

        Long prdId = customerPrd.getPrdId();
		Long customerId = customerPrd.getCustomerId();
		if (prdId == null || customerId == null) {
            return R.error("未找到关联产品！");
//            return R.ok();
        }

        PrdDataEntity prdDataEntity = prdDataService.queryObject(prdId);
        String status = prdDataEntity.getStatus();
        switch (status) {
            case "1":    //启用
				if (!customerPrdSaveHelp(customerId, prdId)) {    //不存在
					customerPrdService.save(customerPrd);
					return R.ok();
				} else {
					return R.error("产品已存在！");
				}
            case "0":    //禁用
                return R.error("产品已被禁用！");
            case "2":    //编辑
                return R.error("产品处于编辑状态！");
            default:
                return R.error("产品状态未知");
        }
	}

	private boolean customerPrdSaveHelp(Long customerId, Long prdId) {    //判断客户是否已存在产品
		Map<String, Object> params = new HashMap<>();
		params.put("customerId", customerId);
		params.put("prdId", prdId);
		List<CustomerPrdEntity> list = customerPrdService.queryList(params);
		return !list.isEmpty();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sales:customerprd:update")
	public R update(@RequestBody CustomerPrdEntity customerPrd){
		customerPrdService.update(customerPrd);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sales:customerprd:delete")
	public R delete(@RequestBody Long[] ids){
		customerPrdService.deleteBatch(ids);
		
		return R.ok();
	}

	@Autowired
	private PrdDataService prdDataService;

	@RequestMapping("/getCustomerPrdById")
	public R getCustomerPrdById(@RequestParam("customerId")Long customerId,@RequestParam("prdId")Long prdId){
		Map<String,Object> returnMap = new HashMap<>();
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("customerId",customerId);
		paramMap.put("prdId",prdId);
		PrdDataEntity prdDataEntity = prdDataService.queryObject(prdId);
		List<CustomerPrdEntity> customerPrdEntityList = customerPrdService.queryList(paramMap);
		if(customerPrdEntityList != null && customerPrdEntityList.size() > 0){
//			if(customerPrdEntityList.size() == 1){
				CustomerPrdEntity customerPrdEntity = customerPrdEntityList.get(0);
				returnMap.put("prdName",customerPrdEntity.getPrdName());
				returnMap.put("prdId",customerPrdEntity.getPrdId());
				returnMap.put("price1",prdDataEntity.getReferencePrice());
				returnMap.put("price2",customerPrdEntity.getPrdPrice());
				returnMap.put("cost",prdDataEntity.getCost());
				returnMap.put("prdNo",prdDataEntity.getPrdCode());
				returnMap.put("prdTypeId",prdDataEntity.getTypeId());
				returnMap.put("prdTypeName",prdDataEntity.getTypeName());
//			}
		}
		return R.ok().put("data",returnMap);
	}

	@Autowired
	private CustomerInfoService customerInfoService;

	@RequestMapping("/copy")
//	@RequiresPermissions("purchase:suppiermtr:delete")
	public R copy(@RequestParam("selectId") Long selectId,@RequestParam("targetId") Long targetId) {

		CustomerInfoEntity customerInfoEntity = customerInfoService.queryObject(targetId);

		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("customerId",selectId);
		List<CustomerPrdEntity> selectCustomerPrdEntityList = customerPrdService.queryList(paramMap);
		if(selectCustomerPrdEntityList != null && selectCustomerPrdEntityList.size() > 0){
			paramMap.put("customerId",targetId);
			List<CustomerPrdEntity> targetCustomerPrdEntityList = customerPrdService.queryList(paramMap);
			if(targetCustomerPrdEntityList != null && targetCustomerPrdEntityList.size() > 0){
				Long[] targetTableId = new Long[targetCustomerPrdEntityList.size()];
				for (int i=0;i<targetCustomerPrdEntityList.size();i++) {
					CustomerPrdEntity customerPrdEntity = targetCustomerPrdEntityList.get(i);
					targetTableId[i] = customerPrdEntity.getId();
				}
				customerPrdService.deleteBatch(targetTableId);
			}

			List<CustomerPrdEntity> insertList = new ArrayList<>();
			for (CustomerPrdEntity customerPrdEntity:selectCustomerPrdEntityList) {
				customerPrdEntity.setCustomerId(targetId);
				customerPrdEntity.setCustomerName(customerInfoEntity.getCustomerName());

				insertList.add(customerPrdEntity);
			}
			customerPrdService.batchInsert(insertList);
		}
		return R.ok();
	}
}
