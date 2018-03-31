package com.kirin.modules.purchase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.purchase.dao.QuotationDao;
import com.kirin.modules.purchase.entity.QuotationEntity;
import com.kirin.modules.purchase.service.QuotationService;



@Service("quotationService")
public class QuotationServiceImpl implements QuotationService {
	@Autowired
	private QuotationDao quotationDao;
	
	@Override
	public QuotationEntity queryObject(Long id){
		return quotationDao.queryObject(id);
	}
	
	@Override
	public List<QuotationEntity> queryList(Map<String, Object> map){
		return quotationDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return quotationDao.queryTotal(map);
	}
	
	@Override
	public void save(QuotationEntity quotation){
		quotationDao.save(quotation);
	}
	
	@Override
	public void update(QuotationEntity quotation){
		quotationDao.update(quotation);
	}
	
	@Override
	public void delete(Long id){
		quotationDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		quotationDao.deleteBatch(ids);
	}
	
}
