package com.kirin.modules.sales.service;

import com.kirin.modules.sales.entity.ProductionOrderEntity;

import java.util.List;
import java.util.Map;

/**
 * 生产订单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-24 11:52:37
 */
public interface ProductionOrderService {
	
	ProductionOrderEntity queryObject(Long id);
	
	List<ProductionOrderEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ProductionOrderEntity productionOrder);
	
	void update(ProductionOrderEntity productionOrder);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
