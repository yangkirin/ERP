package com.kirin.modules.storage.service;

import com.kirin.modules.storage.entity.ImportMtrBatchEntity;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 入库原料批次信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-01-21 15:12:02
 */
public interface ImportMtrBatchService {
	
	ImportMtrBatchEntity queryObject(Long id);
	
	List<ImportMtrBatchEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ImportMtrBatchEntity importMtrBatch);
	
	void update(ImportMtrBatchEntity importMtrBatch);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	List<ImportMtrBatchEntity> queryByAttr(Long mtrId, String batchNo);


}
