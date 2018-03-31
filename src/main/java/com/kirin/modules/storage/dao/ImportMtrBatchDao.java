package com.kirin.modules.storage.dao;

import com.kirin.modules.storage.entity.ImportMtrBatchEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 入库原料批次信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-01-21 15:12:02
 */
@Mapper
public interface ImportMtrBatchDao extends BaseDao<ImportMtrBatchEntity> {

    List<ImportMtrBatchEntity> queryByAttr(@Param("mtrId") Long mtrId, @Param("batchNo")String batchNo);

}
