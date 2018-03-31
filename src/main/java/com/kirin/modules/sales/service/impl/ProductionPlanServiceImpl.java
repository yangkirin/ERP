package com.kirin.modules.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.sales.dao.ProductionPlanDao;
import com.kirin.modules.sales.entity.ProductionPlanEntity;
import com.kirin.modules.sales.service.ProductionPlanService;



@Service("productionPlanService")
public class ProductionPlanServiceImpl implements ProductionPlanService {
	@Autowired
	private ProductionPlanDao productionPlanDao;
	
	@Override
	public ProductionPlanEntity queryObject(Long id){
		return productionPlanDao.queryObject(id);
	}
	
	@Override
	public List<ProductionPlanEntity> queryList(Map<String, Object> map){
		return productionPlanDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return productionPlanDao.queryTotal(map);
	}
	
	@Override
	public void save(ProductionPlanEntity productionPlan){
		productionPlanDao.save(productionPlan);
	}

	@Override
	public Long saveId(ProductionPlanEntity productionPlan){
		return productionPlanDao.saveId(productionPlan);
	}

	@Override
	public void update(ProductionPlanEntity productionPlan){
		productionPlanDao.update(productionPlan);
	}
	
	@Override
	public void delete(Long id){
		productionPlanDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		productionPlanDao.deleteBatch(ids);
	}

}
