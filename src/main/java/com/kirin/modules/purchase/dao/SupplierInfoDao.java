package com.kirin.modules.purchase.dao;

import com.kirin.modules.purchase.entity.SupplierInfoEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 供应商信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
@Repository
@Mapper
public interface SupplierInfoDao extends BaseDao<SupplierInfoEntity> {
	
}
