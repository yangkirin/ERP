package com.kirin.modules.baseData.dao;

import com.kirin.modules.baseData.entity.MtrExtendEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 原料扩展信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-12-08 21:30:27
 */
@Repository
@Mapper
public interface MtrExtendDao extends BaseDao<MtrExtendEntity> {
    List<Map> createCommbox(@Param("mtrId")Long mtrId);
}
