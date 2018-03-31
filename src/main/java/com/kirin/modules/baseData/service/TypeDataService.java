package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.TypeDataEntity;

import java.util.List;
import java.util.Map;

/**
 * 类型数据信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-01 23:29:47
 */
public interface TypeDataService {
	
	TypeDataEntity queryObject(Long id);
	
	List<TypeDataEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TypeDataEntity typeData);
	
	void update(TypeDataEntity typeData);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
