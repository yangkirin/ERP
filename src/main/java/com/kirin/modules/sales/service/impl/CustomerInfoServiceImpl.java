package com.kirin.modules.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.sales.dao.CustomerInfoDao;
import com.kirin.modules.sales.entity.CustomerInfoEntity;
import com.kirin.modules.sales.service.CustomerInfoService;



@Service("customerInfoService")
public class CustomerInfoServiceImpl implements CustomerInfoService {
	@Autowired
	private CustomerInfoDao customerInfoDao;
	
	@Override
	public CustomerInfoEntity queryObject(Long id){
		return customerInfoDao.queryObject(id);
	}
	
	@Override
	public List<CustomerInfoEntity> queryList(Map<String, Object> map){
		return customerInfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return customerInfoDao.queryTotal(map);
	}
	
	@Override
	public void save(CustomerInfoEntity customerInfo){
		customerInfoDao.save(customerInfo);
	}
	
	@Override
	public void update(CustomerInfoEntity customerInfo){
		customerInfoDao.update(customerInfo);
	}
	
	@Override
	public void delete(Long id){
		customerInfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		customerInfoDao.deleteBatch(ids);
	}
	
}
