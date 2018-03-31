package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.BomInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-31 16:31:30
 */
public interface BomInfoService {
	
	BomInfoEntity queryObject(Long id);
	
	List<BomInfoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BomInfoEntity bomInfo);
	
	void update(BomInfoEntity bomInfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	BomInfoEntity queryObjectByPrdId(Long prdId);
}
