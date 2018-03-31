package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.MtrDataDao;
import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.service.MtrDataService;



@Service("mtrDataService")
public class MtrDataServiceImpl implements MtrDataService {
	@Autowired
	private MtrDataDao mtrDataDao;
	
	@Override
	public MtrDataEntity queryObject(Long id){
		return mtrDataDao.queryObject(id);
	}
	
	@Override
	public List<MtrDataEntity> queryList(Map<String, Object> map){
		return mtrDataDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return mtrDataDao.queryTotal(map);
	}
	
	@Override
	public void save(MtrDataEntity mtrData){
		mtrDataDao.save(mtrData);
	}
	
	@Override
	public void update(MtrDataEntity mtrData){
		mtrDataDao.update(mtrData);
	}
	
	@Override
	public void delete(Long id){
		mtrDataDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		mtrDataDao.deleteBatch(ids);
	}
	
}
