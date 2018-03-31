package com.kirin.modules.storage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.kirin.modules.storage.dao.ImportMtrBatchDao;
import com.kirin.modules.storage.entity.ImportMtrBatchEntity;
import com.kirin.modules.storage.service.ImportMtrBatchService;



@Service("importMtrBatchService")
public class ImportMtrBatchServiceImpl implements ImportMtrBatchService {
	@Autowired
	private ImportMtrBatchDao importMtrBatchDao;
	
	@Override
	public ImportMtrBatchEntity queryObject(Long id){
		return importMtrBatchDao.queryObject(id);
	}
	
	@Override
	public List<ImportMtrBatchEntity> queryList(Map<String, Object> map){
		return importMtrBatchDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return importMtrBatchDao.queryTotal(map);
	}
	
	@Override
	public void save(ImportMtrBatchEntity importMtrBatch){
		importMtrBatchDao.save(importMtrBatch);
	}
	
	@Override
	public void update(ImportMtrBatchEntity importMtrBatch){
		importMtrBatchDao.update(importMtrBatch);
	}
	
	@Override
	public void delete(Long id){
		importMtrBatchDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		importMtrBatchDao.deleteBatch(ids);
	}

	@Override
	public List<ImportMtrBatchEntity> queryByAttr(Long mtrId,String batchNo){
		return importMtrBatchDao.queryByAttr(mtrId,batchNo);
	}
}
