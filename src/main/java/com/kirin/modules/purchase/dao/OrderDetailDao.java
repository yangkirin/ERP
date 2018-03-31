package com.kirin.modules.purchase.dao;

import com.kirin.modules.purchase.entity.OrderDetailEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
@Mapper
public interface OrderDetailDao extends BaseDao<OrderDetailEntity> {
	
}
