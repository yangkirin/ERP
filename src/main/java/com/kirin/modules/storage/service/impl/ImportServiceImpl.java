package com.kirin.modules.storage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.storage.dao.ImportDao;
import com.kirin.modules.storage.entity.ImportEntity;
import com.kirin.modules.storage.service.ImportService;



@Service("importService")
public class ImportServiceImpl implements ImportService {
	@Autowired
	private ImportDao importDao;
	
	@Override
	public ImportEntity queryObject(Long id){
		return importDao.queryObject(id);
	}
	
	@Override
	public List<ImportEntity> queryList(Map<String, Object> map){
		return importDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return importDao.queryTotal(map);
	}
	
	@Override
	public void save(ImportEntity importInfo){
		importDao.save(importInfo);
	}
	
	@Override
	public void update(ImportEntity importInfo){
		importDao.update(importInfo);
	}
	
	@Override
	public void delete(Long id){
		importDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		importDao.deleteBatch(ids);
	}

	@Override
	public ImportEntity queryObjectByOrderId(Long orderId){
		return importDao.queryObjectByOrderId(orderId);
	}
}
