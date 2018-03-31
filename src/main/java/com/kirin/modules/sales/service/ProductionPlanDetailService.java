package com.kirin.modules.sales.service;

import com.kirin.modules.sales.entity.ProductionPlanDetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 生产计划明细
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
public interface ProductionPlanDetailService {
	
	ProductionPlanDetailEntity queryObject(Long id);
	
	List<ProductionPlanDetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ProductionPlanDetailEntity productionPlanDetail);
	
	void update(ProductionPlanDetailEntity productionPlanDetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
