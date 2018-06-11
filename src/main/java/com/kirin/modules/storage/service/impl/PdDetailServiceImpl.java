package com.kirin.modules.storage.service.impl;

import com.kirin.modules.storage.dao.PdDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.storage.entity.PdDetailEntity;
import com.kirin.modules.storage.service.PdDetailService;


@Repository
@Service("pdDetailService")
public class PdDetailServiceImpl implements PdDetailService {
	@Autowired
	private PdDetailDao pdDetailDao;
	
	@Override
	public PdDetailEntity queryObject(Long id){
		return pdDetailDao.queryObject(id);
	}
	
	@Override
	public List<PdDetailEntity> queryList(Map<String, Object> map){
		return pdDetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return pdDetailDao.queryTotal(map);
	}
	
	@Override
	public void save(PdDetailEntity pdDetail){
		pdDetailDao.save(pdDetail);
	}
	
	@Override
	public void update(PdDetailEntity pdDetail){
		pdDetailDao.update(pdDetail);
	}
	
	@Override
	public void delete(Long id){
		pdDetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		pdDetailDao.deleteBatch(ids);
	}
	
}
