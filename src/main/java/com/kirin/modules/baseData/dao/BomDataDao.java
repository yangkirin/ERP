package com.kirin.modules.baseData.dao;

import com.kirin.modules.baseData.entity.BomDataEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

/**
 * 配方信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
@Mapper
public interface BomDataDao extends BaseDao<BomDataEntity> {
	
}
