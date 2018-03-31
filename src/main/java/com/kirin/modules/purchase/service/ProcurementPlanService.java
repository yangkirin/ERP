package com.kirin.modules.purchase.service;

import com.kirin.modules.purchase.entity.ProcurementPlanEntity;

import java.util.List;
import java.util.Map;

/**
 * 采购计划表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
public interface ProcurementPlanService {
	
	ProcurementPlanEntity queryObject(Long id);
	
	List<ProcurementPlanEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ProcurementPlanEntity procurementPlan);
	
	void update(ProcurementPlanEntity procurementPlan);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
