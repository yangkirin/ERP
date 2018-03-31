package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.PrdNcInfoDao;
import com.kirin.modules.baseData.entity.PrdNcInfoEntity;
import com.kirin.modules.baseData.service.PrdNcInfoService;



@Service("prdNcInfoService")
public class PrdNcInfoServiceImpl implements PrdNcInfoService {
	@Autowired
	private PrdNcInfoDao prdNcInfoDao;
	
	@Override
	public PrdNcInfoEntity queryObject(Long id){
		return prdNcInfoDao.queryObject(id);
	}

	@Override
	public PrdNcInfoEntity queryObjectForPrdId(Long id){
		return prdNcInfoDao.queryObjectForPrdId(id);
	}
	
	@Override
	public List<PrdNcInfoEntity> queryList(Map<String, Object> map){
		return prdNcInfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return prdNcInfoDao.queryTotal(map);
	}
	
	@Override
	public void save(PrdNcInfoEntity prdNcInfo){
		prdNcInfoDao.save(prdNcInfo);
	}
	
	@Override
	public void update(PrdNcInfoEntity prdNcInfo){
		prdNcInfoDao.update(prdNcInfo);
	}
	
	@Override
	public void delete(Long id){
		prdNcInfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		prdNcInfoDao.deleteBatch(ids);
	}
	
}
