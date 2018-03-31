package com.kirin.modules.sales.service;

import com.kirin.modules.sales.entity.CustomerInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 客户信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
public interface CustomerInfoService {
	
	CustomerInfoEntity queryObject(Long id);
	
	List<CustomerInfoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CustomerInfoEntity customerInfo);
	
	void update(CustomerInfoEntity customerInfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
