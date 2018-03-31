package com.kirin.modules.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.sales.dao.ProductionOrderDao;
import com.kirin.modules.sales.entity.ProductionOrderEntity;
import com.kirin.modules.sales.service.ProductionOrderService;



@Service("productionOrderService")
public class ProductionOrderServiceImpl implements ProductionOrderService {
	@Autowired
	private ProductionOrderDao productionOrderDao;
	
	@Override
	public ProductionOrderEntity queryObject(Long id){
		return productionOrderDao.queryObject(id);
	}
	
	@Override
	public List<ProductionOrderEntity> queryList(Map<String, Object> map){
		return productionOrderDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return productionOrderDao.queryTotal(map);
	}
	
	@Override
	public void save(ProductionOrderEntity productionOrder){
		productionOrderDao.save(productionOrder);
	}
	
	@Override
	public void update(ProductionOrderEntity productionOrder){
		productionOrderDao.update(productionOrder);
	}
	
	@Override
	public void delete(Long id){
		productionOrderDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		productionOrderDao.deleteBatch(ids);
	}
	
}
