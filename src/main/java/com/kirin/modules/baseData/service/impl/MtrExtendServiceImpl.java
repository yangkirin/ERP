package com.kirin.modules.baseData.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.dao.MtrExtendDao;
import com.kirin.modules.baseData.entity.MtrExtendEntity;
import com.kirin.modules.baseData.service.MtrExtendService;



@Service("mtrExtendService")
public class MtrExtendServiceImpl implements MtrExtendService {
	@Autowired
	private MtrExtendDao mtrExtendDao;
	
	@Override
	public MtrExtendEntity queryObject(Long id){
		return mtrExtendDao.queryObject(id);
	}
	
	@Override
	public List<MtrExtendEntity> queryList(Map<String, Object> map){
		return mtrExtendDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return mtrExtendDao.queryTotal(map);
	}
	
	@Override
	public void save(MtrExtendEntity mtrExtend){
		mtrExtendDao.save(mtrExtend);
	}
	
	@Override
	public void update(MtrExtendEntity mtrExtend){
		mtrExtendDao.update(mtrExtend);
	}
	
	@Override
	public void delete(Long id){
		mtrExtendDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		mtrExtendDao.deleteBatch(ids);
	}

	@Override
	public List<Map> createCommbox(Long mtrId){
		return mtrExtendDao.createCommbox(mtrId);
	}
	
}
