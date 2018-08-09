package com.kirin.modules.storage.service;

import com.kirin.modules.storage.entity.OutportDetailEntity;

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
public interface OutportDetailService {
	
	OutportDetailEntity queryObject(Long id);
	
	List<OutportDetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(OutportDetailEntity outportDetail);
	
	void update(OutportDetailEntity outportDetail);
	
	void delete(Long id);

	void deleteByInfoId(Long infoId);

	void deleteBatch(Long[] ids);

	List<Map> queryMtrByPrdId(Long prdId,Long takeStnId,Long wareHouseId);

	List<OutportDetailEntity> queryListByMtrId(Long mtrId);

	/**
	 * 根据订单Id计算此订单下该原料已出库数量
	 * @param mtrId
	 * @param orderId
	 * @return
	 */
	BigDecimal getOutboundCount(Long mtrId, Long orderId);

	List<OutportDetailEntity> queryDetailListByOrderId(Long orderId,Long mtrId);

	List<Map> getOutportDetailList(Long orderId,Long mtrId,Long outportId);
}
