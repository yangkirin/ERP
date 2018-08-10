package com.kirin.modules.storage.service;

import com.kirin.modules.storage.entity.OutportDetailEntity;
import com.kirin.modules.storage.entity.OutportInfoEntity;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * 出库记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-12-25 23:45:15
 */
public interface OutportInfoService {

	OutportInfoEntity queryObject(Long id);

	List<OutportInfoEntity> queryList(Map<String, Object> map);

	int queryTotal(Map<String, Object> map);

	void save(OutportInfoEntity outportInfoEntity);

	void update(OutportInfoEntity outportInfoEntity);

	void delete(Long id);

	void deleteBatch(Long[] ids);

	OutportInfoEntity queryObjectByOrderId(Long orderId);
}
