package com.kirin.modules.oss.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kirin.modules.oss.entity.SysOssEntity;
import com.kirin.modules.sys.dao.BaseDao;

/**
 * 文件上传
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-03-25 12:13:26
 */
@Mapper
public interface SysOssDao extends BaseDao<SysOssEntity> {
	
}
