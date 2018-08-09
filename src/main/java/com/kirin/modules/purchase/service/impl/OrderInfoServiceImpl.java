package com.kirin.modules.purchase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.purchase.dao.OrderInfoDao;
import com.kirin.modules.purchase.entity.OrderInfoEntity;
import com.kirin.modules.purchase.service.OrderInfoService;



@Service("orderInfoService")
public class OrderInfoServiceImpl implements OrderInfoService {
	@Autowired
	private OrderInfoDao orderInfoDao;
	
	@Override
	public OrderInfoEntity queryObject(Long id){
		return orderInfoDao.queryObject(id);
	}
	
	@Override
	public List<OrderInfoEntity> queryList(Map<String, Object> map){
		return orderInfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return orderInfoDao.queryTotal(map);
	}
	
	@Override
	public void save(OrderInfoEntity orderInfo){
		orderInfoDao.save(orderInfo);
	}

	@Override
	public Long saveId(OrderInfoEntity orderInfo){
		return orderInfoDao.saveId(orderInfo);
	}

	@Override
	public void update(OrderInfoEntity orderInfo){
		orderInfoDao.update(orderInfo);
	}
	
	@Override
	public void delete(Long id){
		orderInfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		orderInfoDao.deleteBatch(ids);
	}

	@Override
	public List<OrderInfoEntity> searchList(Map<String,Object> params){
		return orderInfoDao.searchList(params);
	}
}
