package com.kirin.modules.purchase.service;

import com.kirin.modules.purchase.entity.QuotationEntity;

import java.util.List;
import java.util.Map;

/**
 * 供应商原料报价信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
public interface QuotationService {
	
	QuotationEntity queryObject(Long id);
	
	List<QuotationEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(QuotationEntity quotation);
	
	void update(QuotationEntity quotation);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
