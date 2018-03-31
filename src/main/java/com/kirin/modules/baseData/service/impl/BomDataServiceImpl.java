package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.BomDataDao;
import com.kirin.modules.baseData.entity.BomDataEntity;
import com.kirin.modules.baseData.service.BomDataService;



@Service("bomDataService")
public class BomDataServiceImpl implements BomDataService {
	@Autowired
	private BomDataDao bomDataDao;
	
	@Override
	public BomDataEntity queryObject(Long id){
		return bomDataDao.queryObject(id);
	}
	
	@Override
	public List<BomDataEntity> queryList(Map<String, Object> map){
		return bomDataDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return bomDataDao.queryTotal(map);
	}
	
	@Override
	public void save(BomDataEntity bomData){
		bomDataDao.save(bomData);
	}
	
	@Override
	public void update(BomDataEntity bomData){
		bomDataDao.update(bomData);
	}
	
	@Override
	public void delete(Long id){
		bomDataDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		bomDataDao.deleteBatch(ids);
	}
	
}
