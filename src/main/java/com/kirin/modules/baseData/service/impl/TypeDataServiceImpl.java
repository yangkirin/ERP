package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.TypeDataDao;
import com.kirin.modules.baseData.entity.TypeDataEntity;
import com.kirin.modules.baseData.service.TypeDataService;



@Service("typeDataService")
public class TypeDataServiceImpl implements TypeDataService {
	@Autowired
	private TypeDataDao typeDataDao;
	
	@Override
	public TypeDataEntity queryObject(Long id){
		return typeDataDao.queryObject(id);
	}
	
	@Override
	public List<TypeDataEntity> queryList(Map<String, Object> map){
		return typeDataDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return typeDataDao.queryTotal(map);
	}
	
	@Override
	public void save(TypeDataEntity typeData){
		typeDataDao.save(typeData);
	}
	
	@Override
	public void update(TypeDataEntity typeData){
		typeDataDao.update(typeData);
	}
	
	@Override
	public void delete(Long id){
		typeDataDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		typeDataDao.deleteBatch(ids);
	}
	
}
