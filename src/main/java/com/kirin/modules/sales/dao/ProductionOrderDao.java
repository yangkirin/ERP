package com.kirin.modules.sales.dao;

import com.kirin.modules.sales.entity.ProductionOrderEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 生产订单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-24 11:52:37
 */
@Mapper
public interface ProductionOrderDao extends BaseDao<ProductionOrderEntity> {
	
}
