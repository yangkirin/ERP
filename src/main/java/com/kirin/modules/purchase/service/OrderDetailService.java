package com.kirin.modules.purchase.service;

import com.kirin.modules.purchase.entity.OrderDetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 订单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
public interface OrderDetailService {
	
	OrderDetailEntity queryObject(Long id);
	
	List<OrderDetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(OrderDetailEntity orderDetail);
	
	void update(OrderDetailEntity orderDetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
