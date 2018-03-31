package com.kirin.modules.purchase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.purchase.dao.ProcurementDetailDao;
import com.kirin.modules.purchase.entity.ProcurementDetailEntity;
import com.kirin.modules.purchase.service.ProcurementDetailService;



@Service("procurementDetailService")
public class ProcurementDetailServiceImpl implements ProcurementDetailService {
	@Autowired
	private ProcurementDetailDao procurementDetailDao;
	
	@Override
	public ProcurementDetailEntity queryObject(Long id){
		return procurementDetailDao.queryObject(id);
	}
	
	@Override
	public List<ProcurementDetailEntity> queryList(Map<String, Object> map){
		return procurementDetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return procurementDetailDao.queryTotal(map);
	}
	
	@Override
	public void save(ProcurementDetailEntity procurementDetail){
		procurementDetailDao.save(procurementDetail);
	}
	
	@Override
	public void update(ProcurementDetailEntity procurementDetail){
		procurementDetailDao.update(procurementDetail);
	}
	
	@Override
	public void delete(Long id){
		procurementDetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		procurementDetailDao.deleteBatch(ids);
	}

	@Override
	public List<ProcurementDetailEntity> queryListByProcurementId(Long procurementId){
		return procurementDetailDao.queryListByProcurementId(procurementId);
	}
	
}
