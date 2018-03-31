package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.MtrDataEntity;

import java.util.List;
import java.util.Map;

/**
 * 原料基础数据表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-15 00:43:36
 */
public interface MtrDataService {
	
	MtrDataEntity queryObject(Long id);
	
	List<MtrDataEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(MtrDataEntity mtrData);
	
	void update(MtrDataEntity mtrData);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
