package com.kirin.modules.storage.service;

import com.kirin.modules.storage.entity.PdInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 盘点单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-06-09 18:02:45
 */
public interface PdInfoService {
	
	PdInfoEntity queryObject(Long id);
	
	List<PdInfoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PdInfoEntity pdInfo);
	
	void update(PdInfoEntity pdInfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
