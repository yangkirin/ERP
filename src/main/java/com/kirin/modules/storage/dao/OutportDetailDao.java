package com.kirin.modules.storage.dao;

import com.kirin.modules.storage.entity.OutportDetailEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 出库记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-12-25 23:45:15
 */
@Repository
@Mapper
public interface OutportDetailDao extends BaseDao<OutportDetailEntity> {
	public List<Map> queryMtrByPrdId(@Param("prdId")Long prdId,@Param("takeStnId")Long takeStnId,@Param("wareHouseId")Long wareHouseId);

	public List<OutportDetailEntity> queryListByMtrId(@Param("mtrId")Long mtrId);

	/**
	 * 根据订单Id计算此订单下该原料已出库数量
	 * @param mtrId
	 * @param orderId
	 * @return
	 */
	public List<OutportDetailEntity> getOutportDetail(@Param("mtrId") Long mtrId,@Param("orderId")Long orderId);
}
