package com.kirin.modules.purchase.service;

import com.kirin.modules.purchase.entity.ContractEntity;

import java.util.List;
import java.util.Map;

/**
 * 合同信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
public interface ContractService {
	
	ContractEntity queryObject(Long id);
	
	List<ContractEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ContractEntity contract);
	
	void update(ContractEntity contract);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
