package com.kirin.modules.storage.service.impl;

import com.kirin.modules.storage.dao.PdInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.storage.entity.PdInfoEntity;
import com.kirin.modules.storage.service.PdInfoService;



@Service("pdInfoService")
public class PdInfoServiceImpl implements PdInfoService {
	@Autowired
	private PdInfoDao pdInfoDao;
	
	@Override
	public PdInfoEntity queryObject(Long id){
		return pdInfoDao.queryObject(id);
	}
	
	@Override
	public List<PdInfoEntity> queryList(Map<String, Object> map){
		return pdInfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return pdInfoDao.queryTotal(map);
	}
	
	@Override
	public void save(PdInfoEntity pdInfo){
		pdInfoDao.save(pdInfo);
	}
	
	@Override
	public void update(PdInfoEntity pdInfo){
		pdInfoDao.update(pdInfo);
	}
	
	@Override
	public void delete(Long id){
		pdInfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		pdInfoDao.deleteBatch(ids);
	}
	
}
