package com.kirin.modules.purchase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.purchase.dao.ProcurementPlanDao;
import com.kirin.modules.purchase.entity.ProcurementPlanEntity;
import com.kirin.modules.purchase.service.ProcurementPlanService;



@Service("procurementPlanService")
public class ProcurementPlanServiceImpl implements ProcurementPlanService {
	@Autowired
	private ProcurementPlanDao procurementPlanDao;
	
	@Override
	public ProcurementPlanEntity queryObject(Long id){
		return procurementPlanDao.queryObject(id);
	}
	
	@Override
	public List<ProcurementPlanEntity> queryList(Map<String, Object> map){
		return procurementPlanDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return procurementPlanDao.queryTotal(map);
	}
	
	@Override
	public void save(ProcurementPlanEntity procurementPlan){
		procurementPlanDao.save(procurementPlan);
	}
	
	@Override
	public void update(ProcurementPlanEntity procurementPlan){
		procurementPlanDao.update(procurementPlan);
	}
	
	@Override
	public void delete(Long id){
		procurementPlanDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		procurementPlanDao.deleteBatch(ids);
	}
	
}
