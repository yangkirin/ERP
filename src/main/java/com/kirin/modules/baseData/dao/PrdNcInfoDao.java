package com.kirin.modules.baseData.dao;

import com.kirin.modules.baseData.entity.PrdNcInfoEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 产品营养成分信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
@Repository
@Mapper
public interface PrdNcInfoDao extends BaseDao<PrdNcInfoEntity> {
    PrdNcInfoEntity queryObjectForPrdId(@Param("value")Long prdId);
}
