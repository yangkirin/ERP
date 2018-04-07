package com.kirin.modules.baseData.dao;

import com.kirin.modules.baseData.entity.PrdDataEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 产品基础信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
@Repository
@Mapper
public interface PrdDataDao extends BaseDao<PrdDataEntity> {
	int queryByPrdName(String prdName);
}
