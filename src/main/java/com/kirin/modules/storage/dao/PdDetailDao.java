package com.kirin.modules.storage.dao;

import com.kirin.modules.storage.entity.PdDetailEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 盘点单明细表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-06-09 18:02:45
 */
@Repository
@Mapper
public interface PdDetailDao extends BaseDao<PdDetailEntity> {
	List<Map> createPdMtrDetail(Map<String,Object> map);
}
