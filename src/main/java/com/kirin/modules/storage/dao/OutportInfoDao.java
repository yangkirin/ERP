package com.kirin.modules.storage.dao;

import com.kirin.modules.storage.entity.OutportInfoEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


/**
 * 出库记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-12-25 23:45:15
 */
@Repository
@Mapper
public interface OutportInfoDao extends BaseDao<OutportInfoEntity> {
    OutportInfoEntity queryObjectByOrderId(@Param("orderId")Long orderId);


}
