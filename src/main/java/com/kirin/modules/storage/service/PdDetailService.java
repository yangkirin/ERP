package com.kirin.modules.storage.service;


import com.kirin.modules.storage.entity.PdDetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 盘点单明细表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-06-09 18:02:45
 */
public interface PdDetailService {
	
	PdDetailEntity queryObject(Long id);
	
	List<PdDetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PdDetailEntity pdDetail);
	
	void update(PdDetailEntity pdDetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	public List<Map> createPdMtrDetail(Map<String,Object> map);
}
