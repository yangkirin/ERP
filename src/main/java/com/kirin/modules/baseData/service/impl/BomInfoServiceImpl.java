package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.BomInfoDao;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.service.BomInfoService;



@Service("bomInfoService")
public class BomInfoServiceImpl implements BomInfoService {
	@Autowired
	private BomInfoDao bomInfoDao;
	
	@Override
	public BomInfoEntity queryObject(Long id){
		return bomInfoDao.queryObject(id);
	}
	
	@Override
	public List<BomInfoEntity> queryList(Map<String, Object> map){
		return bomInfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return bomInfoDao.queryTotal(map);
	}
	
	@Override
	public void save(BomInfoEntity bomInfo){
		bomInfoDao.save(bomInfo);
	}
	
	@Override
	public void update(BomInfoEntity bomInfo){
		bomInfoDao.update(bomInfo);
	}
	
	@Override
	public void delete(Long id){
		bomInfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		bomInfoDao.deleteBatch(ids);
	}

	@Override
	public BomInfoEntity queryObjectByPrdId(Long prdId){
		return bomInfoDao.queryObjectByPrdId(prdId);
	}
	
}
