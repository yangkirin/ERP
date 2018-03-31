package com.kirin.modules.purchase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.purchase.dao.ContractDao;
import com.kirin.modules.purchase.entity.ContractEntity;
import com.kirin.modules.purchase.service.ContractService;



@Service("contractService")
public class ContractServiceImpl implements ContractService {
	@Autowired
	private ContractDao contractDao;
	
	@Override
	public ContractEntity queryObject(Long id){
		return contractDao.queryObject(id);
	}
	
	@Override
	public List<ContractEntity> queryList(Map<String, Object> map){
		return contractDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return contractDao.queryTotal(map);
	}
	
	@Override
	public void save(ContractEntity contract){
		contractDao.save(contract);
	}
	
	@Override
	public void update(ContractEntity contract){
		contractDao.update(contract);
	}
	
	@Override
	public void delete(Long id){
		contractDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		contractDao.deleteBatch(ids);
	}
	
}
