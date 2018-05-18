package com.kirin.modules.storage.dao;

import com.kirin.modules.storage.entity.ImportDetailEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 入库单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-28 06:18:42
 */
@Repository
@Mapper
public interface ImportDetailDao extends BaseDao<ImportDetailEntity> {
    void insertImportDetailFromOrderDetail(@Param("orderId")Long orderId);

//    ImportDetailEntity queryObject2(@Param("importId")Long importId,@Param("mtrId")Long mtrId,@Param("inUnit")Long inUnit,@Param("inRate")Long inRate,@Param("mtrId")Long mtrId,@Param("mtrId")Long mtrId);
    ImportDetailEntity queryObject2(ImportDetailEntity importDetailEntity);
}
