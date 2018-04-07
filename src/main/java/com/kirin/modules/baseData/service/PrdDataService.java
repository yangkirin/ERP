package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.PrdDataEntity;

import java.util.List;
import java.util.Map;

/**
 * 产品基础信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
public interface PrdDataService {
	
	PrdDataEntity queryObject(Long id);
	
	List<PrdDataEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PrdDataEntity prdData);
	
	void update(PrdDataEntity prdData);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

    int queryByPrdName(String prdName);
}
