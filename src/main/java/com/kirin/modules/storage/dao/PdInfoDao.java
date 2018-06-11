package com.kirin.modules.storage.dao;

import com.kirin.modules.storage.entity.PdInfoEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 盘点单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-06-09 18:02:45
 */
@Repository
@Mapper
public interface PdInfoDao extends BaseDao<PdInfoEntity> {
	
}
