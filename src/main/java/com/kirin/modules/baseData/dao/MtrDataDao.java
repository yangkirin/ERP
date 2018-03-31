package com.kirin.modules.baseData.dao;

import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 原料基础数据表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-15 00:43:36
 */
@Mapper
public interface MtrDataDao extends BaseDao<MtrDataEntity> {
	
}
