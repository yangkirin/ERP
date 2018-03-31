package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.BomDetailDao;
import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.service.BomDetailService;



@Service("bomDetailService")
public class BomDetailServiceImpl implements BomDetailService {
	@Autowired
	private BomDetailDao bomDetailDao;
	
	@Override
	public BomDetailEntity queryObject(Long id){
		return bomDetailDao.queryObject(id);
	}
	
	@Override
	public List<BomDetailEntity> queryList(Map<String, Object> map){
		return bomDetailDao.queryList(map);
	}

	@Override
	public List<BomDetailEntity> queryListByPrdId(Map<String, Object> map){
		return bomDetailDao.queryListByPrdId(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map){
		return bomDetailDao.queryTotal(map);
	}
	
	@Override
	public void save(BomDetailEntity bomDetail){
		bomDetailDao.save(bomDetail);
	}
	
	@Override
	public void update(BomDetailEntity bomDetail){
		bomDetailDao.update(bomDetail);
	}
	
	@Override
	public void delete(Long id){
		bomDetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		bomDetailDao.deleteBatch(ids);
	}

	@Override
	public BomDetailEntity queryDetailObject(Long id){
		return bomDetailDao.queryDetailObject(id);
	}
}
