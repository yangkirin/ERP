package com.kirin.modules.purchase.dao;

import com.kirin.modules.purchase.entity.ProcurementDetailEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 采购计划明细
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
@Mapper
public interface ProcurementDetailDao extends BaseDao<ProcurementDetailEntity> {
	List<ProcurementDetailEntity> queryListByProcurementId(@Param("procurementId") Long procurementId);
}
