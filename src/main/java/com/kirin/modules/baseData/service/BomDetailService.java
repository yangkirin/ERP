package com.kirin.modules.baseData.service;

import com.kirin.modules.baseData.entity.BomDetailEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-31 16:31:30
 */
public interface BomDetailService {
	
	BomDetailEntity queryObject(Long id);
	
	List<BomDetailEntity> queryList(Map<String, Object> map);

	List<BomDetailEntity> queryListByPrdId(Map<String, Object> map);

	int queryTotal(Map<String, Object> map);
	
	void save(BomDetailEntity bomDetail);
	
	void update(BomDetailEntity bomDetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	BomDetailEntity queryDetailObject(Long id);


}
