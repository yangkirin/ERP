package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.PrdDataDao;
import com.kirin.modules.baseData.entity.PrdDataEntity;
import com.kirin.modules.baseData.service.PrdDataService;



@Service("prdDataService")
public class PrdDataServiceImpl implements PrdDataService {
	@Autowired
	private PrdDataDao prdDataDao;
	
	@Override
	public PrdDataEntity queryObject(Long id){
		return prdDataDao.queryObject(id);
	}
	
	@Override
	public List<PrdDataEntity> queryList(Map<String, Object> map){
		return prdDataDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return prdDataDao.queryTotal(map);
	}
	
	@Override
	public void save(PrdDataEntity prdData){
		prdDataDao.save(prdData);
	}
	
	@Override
	public void update(PrdDataEntity prdData){
		prdDataDao.update(prdData);
	}
	
	@Override
	public void delete(Long id){
		prdDataDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		prdDataDao.deleteBatch(ids);
	}

	@Override
	public int queryByPrdName(String prdName) {
		return prdDataDao.queryByPrdName(prdName);
	}

}
