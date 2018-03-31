package com.kirin.modules.sales.dao;

import com.kirin.modules.sales.entity.ProductionPlanDetailEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 生产计划明细
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
@Mapper
public interface ProductionPlanDetailDao extends BaseDao<ProductionPlanDetailEntity> {
	
}
