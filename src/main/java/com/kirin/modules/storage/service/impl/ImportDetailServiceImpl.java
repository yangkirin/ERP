package com.kirin.modules.storage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.storage.dao.ImportDetailDao;
import com.kirin.modules.storage.entity.ImportDetailEntity;
import com.kirin.modules.storage.service.ImportDetailService;



@Service("importDetailService")
public class ImportDetailServiceImpl implements ImportDetailService {
	@Autowired
	private ImportDetailDao importDetailDao;
	
	@Override
	public ImportDetailEntity queryObject(Long id){
		return importDetailDao.queryObject(id);
	}
	
	@Override
	public List<ImportDetailEntity> queryList(Map<String, Object> map){
		return importDetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return importDetailDao.queryTotal(map);
	}
	
	@Override
	public void save(ImportDetailEntity importDetail){
		importDetailDao.save(importDetail);
	}
	
	@Override
	public void update(ImportDetailEntity importDetail){
		importDetailDao.update(importDetail);
	}
	
	@Override
	public void delete(Long id){
		importDetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		importDetailDao.deleteBatch(ids);
	}
	
}
