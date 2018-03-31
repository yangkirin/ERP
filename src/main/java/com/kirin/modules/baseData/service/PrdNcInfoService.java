package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.PrdNcInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 产品营养成分信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
public interface PrdNcInfoService {
	
	PrdNcInfoEntity queryObject(Long id);

	PrdNcInfoEntity queryObjectForPrdId(Long prdId);

	List<PrdNcInfoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PrdNcInfoEntity prdNcInfo);
	
	void update(PrdNcInfoEntity prdNcInfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);


}
