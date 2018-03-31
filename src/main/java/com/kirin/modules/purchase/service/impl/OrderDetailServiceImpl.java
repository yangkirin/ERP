package com.kirin.modules.purchase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.purchase.dao.OrderDetailDao;
import com.kirin.modules.purchase.entity.OrderDetailEntity;
import com.kirin.modules.purchase.service.OrderDetailService;



@Service("orderDetailService")
public class OrderDetailServiceImpl implements OrderDetailService {
	@Autowired
	private OrderDetailDao orderDetailDao;
	
	@Override
	public OrderDetailEntity queryObject(Long id){
		return orderDetailDao.queryObject(id);
	}
	
	@Override
	public List<OrderDetailEntity> queryList(Map<String, Object> map){
		return orderDetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return orderDetailDao.queryTotal(map);
	}
	
	@Override
	public void save(OrderDetailEntity orderDetail){
		orderDetailDao.save(orderDetail);
	}
	
	@Override
	public void update(OrderDetailEntity orderDetail){
		orderDetailDao.update(orderDetail);
	}
	
	@Override
	public void delete(Long id){
		orderDetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		orderDetailDao.deleteBatch(ids);
	}
	
}
