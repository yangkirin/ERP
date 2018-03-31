package com.kirin.modules.purchase.dao;

import com.kirin.modules.purchase.entity.ProcurementPlanEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 采购计划表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
@Mapper
public interface ProcurementPlanDao extends BaseDao<ProcurementPlanEntity> {
	
}
