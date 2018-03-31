package com.kirin.modules.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.sales.dao.ProductionOrderDetailDao;
import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sales.service.ProductionOrderDetailService;



@Service("productionOrderDetailService")
public class ProductionOrderDetailServiceImpl implements ProductionOrderDetailService {
	@Autowired
	private ProductionOrderDetailDao productionOrderDetailDao;
	
	@Override
	public ProductionOrderDetailEntity queryObject(Long id){
		return productionOrderDetailDao.queryObject(id);
	}
	
	@Override
	public List<ProductionOrderDetailEntity> queryList(Map<String, Object> map){
		return productionOrderDetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return productionOrderDetailDao.queryTotal(map);
	}
	
	@Override
	public void save(ProductionOrderDetailEntity productionOrderDetail){
		productionOrderDetailDao.save(productionOrderDetail);
	}
	
	@Override
	public void update(ProductionOrderDetailEntity productionOrderDetail){
		productionOrderDetailDao.update(productionOrderDetail);
	}
	
	@Override
	public void delete(Long id){
		productionOrderDetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		productionOrderDetailDao.deleteBatch(ids);
	}

	@Override
	public void deleteByOrderId(Long orderId){
		productionOrderDetailDao.deleteByOrderId(orderId);
	}
}
