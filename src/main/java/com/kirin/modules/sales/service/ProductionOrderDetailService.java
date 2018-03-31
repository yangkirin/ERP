package com.kirin.modules.sales.service;

import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 生产订单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-24 11:52:37
 */
public interface ProductionOrderDetailService {
	
	ProductionOrderDetailEntity queryObject(Long id);
	
	List<ProductionOrderDetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ProductionOrderDetailEntity productionOrderDetail);
	
	void update(ProductionOrderDetailEntity productionOrderDetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	void deleteByOrderId(Long orderId);
}
