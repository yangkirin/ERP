package com.kirin.modules.sales.dao;

import com.kirin.modules.sales.entity.CustomerInfoEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 客户信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
@Mapper
public interface CustomerInfoDao extends BaseDao<CustomerInfoEntity> {
	
}
