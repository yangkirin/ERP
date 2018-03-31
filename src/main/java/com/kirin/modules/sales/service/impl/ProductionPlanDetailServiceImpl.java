package com.kirin.modules.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.sales.dao.ProductionPlanDetailDao;
import com.kirin.modules.sales.entity.ProductionPlanDetailEntity;
import com.kirin.modules.sales.service.ProductionPlanDetailService;



@Service("productionPlanDetailService")
public class ProductionPlanDetailServiceImpl implements ProductionPlanDetailService {
	@Autowired
	private ProductionPlanDetailDao productionPlanDetailDao;
	
	@Override
	public ProductionPlanDetailEntity queryObject(Long id){
		return productionPlanDetailDao.queryObject(id);
	}
	
	@Override
	public List<ProductionPlanDetailEntity> queryList(Map<String, Object> map){
		return productionPlanDetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return productionPlanDetailDao.queryTotal(map);
	}
	
	@Override
	public void save(ProductionPlanDetailEntity productionPlanDetail){
		productionPlanDetailDao.save(productionPlanDetail);
	}
	
	@Override
	public void update(ProductionPlanDetailEntity productionPlanDetail){
		productionPlanDetailDao.update(productionPlanDetail);
	}
	
	@Override
	public void delete(Long id){
		productionPlanDetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		productionPlanDetailDao.deleteBatch(ids);
	}
	
}
