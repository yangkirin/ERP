package com.kirin.modules.purchase.service;

import com.kirin.modules.purchase.entity.SupplierInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 供应商信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
public interface SupplierInfoService {
	
	SupplierInfoEntity queryObject(Long id);
	
	List<SupplierInfoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(SupplierInfoEntity supplierInfo);
	
	void update(SupplierInfoEntity supplierInfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
