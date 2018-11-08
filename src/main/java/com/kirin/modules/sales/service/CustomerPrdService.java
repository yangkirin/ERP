package com.kirin.modules.sales.service;

import com.kirin.modules.sales.entity.CustomerPrdEntity;

import java.util.List;
import java.util.Map;

/**
 * 客户采购产品信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
public interface CustomerPrdService {
	
	CustomerPrdEntity queryObject(Long id);
	
	List<CustomerPrdEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CustomerPrdEntity customerPrd);
	
	void update(CustomerPrdEntity customerPrd);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	int batchInsert(List<CustomerPrdEntity> customerPrdEntityList);

	CustomerPrdEntity queryObjectMap(Map<String,Object> params);
}
