package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.MtrCutEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-19 17:35:28
 */
public interface MtrCutService {
	
	MtrCutEntity queryObject(Long id);
	
	List<MtrCutEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(MtrCutEntity mtrCut);
	
	void update(MtrCutEntity mtrCut);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
