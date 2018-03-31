package com.kirin.modules.purchase.service;

import com.kirin.modules.purchase.entity.ProcurementDetailEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 采购计划明细
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
public interface ProcurementDetailService {
	
	ProcurementDetailEntity queryObject(Long id);
	
	List<ProcurementDetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ProcurementDetailEntity procurementDetail);
	
	void update(ProcurementDetailEntity procurementDetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	List<ProcurementDetailEntity> queryListByProcurementId(Long procurementId);
}
