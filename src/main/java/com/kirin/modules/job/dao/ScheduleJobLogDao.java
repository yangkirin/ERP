package com.kirin.modules.job.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kirin.modules.job.entity.ScheduleJobLogEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.springframework.stereotype.Repository;

/**
 * 定时任务日志
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年12月1日 下午10:30:02
 */
@Repository
@Mapper
public interface ScheduleJobLogDao extends BaseDao<ScheduleJobLogEntity> {
	
}
