package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.TypeInfoDao;
import com.kirin.modules.baseData.entity.TypeInfoEntity;
import com.kirin.modules.baseData.service.TypeInfoService;



@Service("typeInfoService")
public class TypeInfoServiceImpl implements TypeInfoService {
	@Autowired
	private TypeInfoDao typeInfoDao;
	
	@Override
	public TypeInfoEntity queryObject(Long id){
		return typeInfoDao.queryObject(id);
	}
	
	@Override
	public List<TypeInfoEntity> queryList(Map<String, Object> map){
		return typeInfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return typeInfoDao.queryTotal(map);
	}
	
	@Override
	public void save(TypeInfoEntity typeInfo){
		typeInfoDao.save(typeInfo);
	}
	
	@Override
	public void update(TypeInfoEntity typeInfo){
		typeInfoDao.update(typeInfo);
	}
	
	@Override
	public void delete(Long id){
		typeInfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		typeInfoDao.deleteBatch(ids);
	}

	@Override
	public List<TypeInfoEntity> queryListForCommbom() {
		return typeInfoDao.queryListForCommbom();
	}

	@Override
	public List<TypeInfoEntity> queryListParentId(Long parentId){
		return typeInfoDao.queryListParentId(parentId);
	}

	@Override
	public List<TypeInfoEntity> queryParentList(Long parentId){
		return typeInfoDao.queryParentList(parentId);
	}

	@Override
	public TypeInfoEntity getParentById(Long typeInfoId){
		return typeInfoDao.getParentById(typeInfoId);
	}
}
