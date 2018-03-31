package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.MtrExtendEntity;

import java.util.List;
import java.util.Map;

/**
 * 原料扩展信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-12-08 21:30:27
 */
public interface MtrExtendService {
	
	MtrExtendEntity queryObject(Long id);
	
	List<MtrExtendEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(MtrExtendEntity mtrExtend);
	
	void update(MtrExtendEntity mtrExtend);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	List<Map> createCommbox(Long mtrId);
}
