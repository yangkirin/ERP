package com.kirin.modules.purchase.dao;

import com.kirin.modules.purchase.entity.OrderInfoEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 订单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
@Repository
@Mapper
public interface OrderInfoDao extends BaseDao<OrderInfoEntity> {
//	Long saveId(OrderInfoEntity orderInfoEntity);

}
