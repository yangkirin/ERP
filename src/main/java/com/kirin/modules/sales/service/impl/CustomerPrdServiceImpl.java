package com.kirin.modules.sales.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.sales.dao.CustomerPrdDao;
import com.kirin.modules.sales.entity.CustomerPrdEntity;
import com.kirin.modules.sales.service.CustomerPrdService;



@Service("customerPrdService")
public class CustomerPrdServiceImpl implements CustomerPrdService {
	@Autowired
	private CustomerPrdDao customerPrdDao;
	
	@Override
	public CustomerPrdEntity queryObject(Long id){
		return customerPrdDao.queryObject(id);
	}
	
	@Override
	public List<CustomerPrdEntity> queryList(Map<String, Object> map){
		return customerPrdDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return customerPrdDao.queryTotal(map);
	}
	
	@Override
	public void save(CustomerPrdEntity customerPrd){
		customerPrdDao.save(customerPrd);
	}
	
	@Override
	public void update(CustomerPrdEntity customerPrd){
		customerPrdDao.update(customerPrd);
	}
	
	@Override
	public void delete(Long id){
		customerPrdDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		customerPrdDao.deleteBatch(ids);
	}

	@Override
	public int batchInsert(List<CustomerPrdEntity> customerPrdEntityList){return customerPrdDao.batchInsert(customerPrdEntityList);}

	@Override
	public CustomerPrdEntity queryObjectMap(Map<String,Object> params){return customerPrdDao.queryObjectMap(params);}
	
}
