package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.MtrCutDao;
import com.kirin.modules.baseData.entity.MtrCutEntity;
import com.kirin.modules.baseData.service.MtrCutService;



@Service("mtrCutService")
public class MtrCutServiceImpl implements MtrCutService {
	@Autowired
	private MtrCutDao mtrCutDao;
	
	@Override
	public MtrCutEntity queryObject(Long id){
		return mtrCutDao.queryObject(id);
	}
	
	@Override
	public List<MtrCutEntity> queryList(Map<String, Object> map){
		return mtrCutDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return mtrCutDao.queryTotal(map);
	}
	
	@Override
	public void save(MtrCutEntity mtrCut){
		mtrCutDao.save(mtrCut);
	}
	
	@Override
	public void update(MtrCutEntity mtrCut){
		mtrCutDao.update(mtrCut);
	}
	
	@Override
	public void delete(Long id){
		mtrCutDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		mtrCutDao.deleteBatch(ids);
	}
	
}
