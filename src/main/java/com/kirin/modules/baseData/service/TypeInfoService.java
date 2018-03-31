package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.TypeInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 类型信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-01 23:29:47
 */
public interface TypeInfoService {
	
	TypeInfoEntity queryObject(Long id);
	
	List<TypeInfoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TypeInfoEntity typeInfo);
	
	void update(TypeInfoEntity typeInfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	List<TypeInfoEntity> queryListForCommbom();

	List<TypeInfoEntity> queryListParentId(Long parentId);

	List<TypeInfoEntity> queryParentList(Long parentId);

	TypeInfoEntity getParentById(Long typeInfoId);
}
