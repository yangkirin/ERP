package com.kirin.modules.api.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kirin.modules.api.entity.UserEntity;
import com.kirin.modules.sys.dao.BaseDao;

/**
 * 用户
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-23 15:22:06
 */
@Mapper
public interface UserDao extends BaseDao<UserEntity> {

    UserEntity queryByMobile(String mobile);
}
