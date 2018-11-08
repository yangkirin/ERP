package com.kirin.modules.purchase.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.purchase.dao.SuppierMtrDao;
import com.kirin.modules.purchase.entity.SuppierMtrEntity;
import com.kirin.modules.purchase.service.SuppierMtrService;



@Service("suppierMtrService")
public class SuppierMtrServiceImpl implements SuppierMtrService {
	@Autowired
	private SuppierMtrDao suppierMtrDao;
	
	@Override
	public SuppierMtrEntity queryObject(Long id){
		return suppierMtrDao.queryObject(id);
	}
	
	@Override
	public List<SuppierMtrEntity> queryList(Map<String, Object> map){
		return suppierMtrDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return suppierMtrDao.queryTotal(map);
	}
	
	@Override
	public void save(SuppierMtrEntity suppierMtr){
		suppierMtrDao.save(suppierMtr);
	}
	
	@Override
	public void update(SuppierMtrEntity suppierMtr){
		suppierMtrDao.update(suppierMtr);
	}
	
	@Override
	public void delete(Long id){
		suppierMtrDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		suppierMtrDao.deleteBatch(ids);
	}

	@Override
	public List<SuppierMtrEntity> querySupplierByMtrId(Long mtrId,Long supplierId){
		return suppierMtrDao.querySupplierByMtrId(mtrId,supplierId);
	}

	@Override
	public List<SuppierMtrEntity> queryByIdAndPy(Long mtrId,Long supplierId,String searchWord){
		return suppierMtrDao.queryByIdAndPy(mtrId,supplierId,searchWord);
	}

	@Override
	public int batchInsert(List<SuppierMtrEntity> suppierMtrEntityList){return suppierMtrDao.batchInsert(suppierMtrEntityList);}
}
