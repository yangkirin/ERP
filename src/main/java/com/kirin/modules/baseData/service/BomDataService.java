package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.BomDataEntity;

import java.util.List;
import java.util.Map;

/**
 * 配方信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
public interface BomDataService {
	
	BomDataEntity queryObject(Long id);
	
	List<BomDataEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BomDataEntity bomData);
	
	void update(BomDataEntity bomData);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
