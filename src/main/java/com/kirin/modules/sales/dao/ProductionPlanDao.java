package com.kirin.modules.sales.dao;

import com.kirin.modules.sales.entity.ProductionPlanEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 生产计划
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
@Repository
@Mapper
public interface ProductionPlanDao extends BaseDao<ProductionPlanEntity> {

    Long saveId(ProductionPlanEntity productionPlanEntity);
}
