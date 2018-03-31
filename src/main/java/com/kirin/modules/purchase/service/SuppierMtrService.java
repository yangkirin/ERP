package com.kirin.modules.purchase.service;

import com.kirin.modules.purchase.entity.SuppierMtrEntity;

import java.util.List;
import java.util.Map;

/**
 * 供应商供应产品信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
public interface SuppierMtrService {
	
	SuppierMtrEntity queryObject(Long id);
	
	List<SuppierMtrEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(SuppierMtrEntity suppierMtr);
	
	void update(SuppierMtrEntity suppierMtr);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	List<SuppierMtrEntity> querySupplierByMtrId(Long mtrId,Long supplierId);

	List<SuppierMtrEntity> queryByIdAndPy(Long mtrId,Long supplierId,String searchWord);
}
