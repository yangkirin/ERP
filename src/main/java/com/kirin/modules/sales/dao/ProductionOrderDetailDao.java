package com.kirin.modules.sales.dao;

import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 生产订单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-24 11:52:37
 */
@Repository
@Mapper
public interface ProductionOrderDetailDao extends BaseDao<ProductionOrderDetailEntity> {
	void deleteByOrderId(@Param("orderId")Long orderId);

	List<Map> searchPrd(Map<String,Object> params);
}
