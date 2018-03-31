package com.kirin.modules.purchase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.purchase.dao.SupplierInfoDao;
import com.kirin.modules.purchase.entity.SupplierInfoEntity;
import com.kirin.modules.purchase.service.SupplierInfoService;



@Service("supplierInfoService")
public class SupplierInfoServiceImpl implements SupplierInfoService {
	@Autowired
	private SupplierInfoDao supplierInfoDao;
	
	@Override
	public SupplierInfoEntity queryObject(Long id){
		return supplierInfoDao.queryObject(id);
	}
	
	@Override
	public List<SupplierInfoEntity> queryList(Map<String, Object> map){
		return supplierInfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return supplierInfoDao.queryTotal(map);
	}
	
	@Override
	public void save(SupplierInfoEntity supplierInfo){
		supplierInfoDao.save(supplierInfo);
	}
	
	@Override
	public void update(SupplierInfoEntity supplierInfo){
		supplierInfoDao.update(supplierInfo);
	}
	
	@Override
	public void delete(Long id){
		supplierInfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		supplierInfoDao.deleteBatch(ids);
	}
	
}
