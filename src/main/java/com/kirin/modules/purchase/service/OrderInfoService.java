package com.kirin.modules.purchase.service;

import com.kirin.modules.purchase.entity.OrderInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 订单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
public interface OrderInfoService {
	
	OrderInfoEntity queryObject(Long id);
	
	List<OrderInfoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(OrderInfoEntity orderInfo);

	Long saveId(OrderInfoEntity orderInfo);
	
	void update(OrderInfoEntity orderInfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
