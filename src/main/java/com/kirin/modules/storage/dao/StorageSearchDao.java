package com.kirin.modules.storage.dao;

import com.kirin.modules.storage.entity.StorageSearchEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @Author: BeauFang
 * @Date: 2018/4/30 14:20
 * @Description:
 **/
@Repository
@Mapper
public interface StorageSearchDao extends BaseDao<StorageSearchEntity> {
}
