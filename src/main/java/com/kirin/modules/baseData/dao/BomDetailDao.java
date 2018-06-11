package com.kirin.modules.baseData.dao;

import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-31 16:31:30
 */
@Repository
@Mapper
public interface BomDetailDao extends BaseDao<BomDetailEntity> {
    BomDetailEntity queryDetailObject(@Param("id") Long id);

    List<BomDetailEntity> queryListByPrdId(Map<String, Object> map);

    List<Map> searchMtrByPrdId(Map<String,Object> params);
}
