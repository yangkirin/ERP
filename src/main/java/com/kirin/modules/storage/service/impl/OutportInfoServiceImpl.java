package com.kirin.modules.storage.service.impl;

import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.service.MtrDataService;
import com.kirin.modules.storage.dao.OutportDetailDao;
import com.kirin.modules.storage.dao.OutportInfoDao;
import com.kirin.modules.storage.entity.OutportDetailEntity;
import com.kirin.modules.storage.entity.OutportInfoEntity;
import com.kirin.modules.storage.service.OutportDetailService;
import com.kirin.modules.storage.service.OutportInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;


@Service("outportInfoService")
public class OutportInfoServiceImpl implements OutportInfoService {
	@Autowired
	private OutportInfoDao outportInfoDao;
	
	@Override
	public OutportInfoEntity queryObject(Long id){
		return outportInfoDao.queryObject(id);
	}
	
	@Override
	public List<OutportInfoEntity> queryList(Map<String, Object> map){
		return outportInfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return outportInfoDao.queryTotal(map);
	}
	
	@Override
	public void save(OutportInfoEntity outportDetail){
		outportInfoDao.save(outportDetail);
	}
	
	@Override
	public void update(OutportInfoEntity outportDetail){
		outportInfoDao.update(outportDetail);
	}
	
	@Override
	public void delete(Long id){
		outportInfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		outportInfoDao.deleteBatch(ids);
	}

	@Override
	public OutportInfoEntity queryObjectByOrderId(Long orderId){
		return outportInfoDao.queryObjectByOrderId(orderId);
	}
}
