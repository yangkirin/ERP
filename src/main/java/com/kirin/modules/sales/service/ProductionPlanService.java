package com.kirin.modules.sales.service;

import com.kirin.modules.sales.entity.ProductionPlanEntity;

import java.util.List;
import java.util.Map;

/**
 * 生产计划
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
public interface ProductionPlanService {
	
	ProductionPlanEntity queryObject(Long id);
	
	List<ProductionPlanEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ProductionPlanEntity productionPlan);
	
	void update(ProductionPlanEntity productionPlan);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	Long saveId(ProductionPlanEntity productionPlan);
}
