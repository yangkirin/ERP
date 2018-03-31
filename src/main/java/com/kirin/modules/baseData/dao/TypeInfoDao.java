package com.kirin.modules.baseData.dao;

import com.kirin.modules.baseData.entity.TypeInfoEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 类型信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-01 23:29:47
 */
@Repository
@Mapper
public interface TypeInfoDao extends BaseDao<TypeInfoEntity> {

    List<TypeInfoEntity> queryListForCommbom();

    TypeInfoEntity getTypeInfo(@Param("typeId") Integer typeId);

    List<TypeInfoEntity> queryListParentId(@Param("parentId")Long parentId);

    List<TypeInfoEntity> queryParentList(@Param("parentId")Long parentId);

    TypeInfoEntity getParentById(@Param("typeInfoId")Long typeInfoId);
}
