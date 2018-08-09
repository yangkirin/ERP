package com.kirin.modules.baseData.dao;

import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-31 16:31:30
 */
@Repository
@Mapper
public interface BomInfoDao extends BaseDao<BomInfoEntity> {
	BomInfoEntity queryObjectByPrdId(@Param("prdId") Long prdId);
	List<BomInfoEntity> queryObjectByMtrId(@Param("mtrId") Long mtrId);
}
