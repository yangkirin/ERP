package com.kirin.modules.storage.service;

import com.kirin.modules.storage.entity.ImportEntity;

import java.util.List;
import java.util.Map;

/**
 * 入库主记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-28 06:18:42
 */
public interface ImportService {
	
	ImportEntity queryObject(Long id);
	
	List<ImportEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ImportEntity importInfo);
	
	void update(ImportEntity importInfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	ImportEntity queryObjectByOrderId(Long orderId);
}
