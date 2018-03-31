package com.kirin.modules.storage.service;

import com.kirin.modules.storage.entity.ImportDetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 入库单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-28 06:18:42
 */
public interface ImportDetailService {
	
	ImportDetailEntity queryObject(Long id);
	
	List<ImportDetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ImportDetailEntity importDetail);
	
	void update(ImportDetailEntity importDetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
