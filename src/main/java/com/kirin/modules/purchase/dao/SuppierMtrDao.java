package com.kirin.modules.purchase.dao;

import com.kirin.modules.purchase.entity.SuppierMtrEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 供应商供应产品信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
@Repository
@Mapper
public interface SuppierMtrDao extends BaseDao<SuppierMtrEntity> {
    List<SuppierMtrEntity> querySupplierByMtrId(@Param("mtrId") Long mtrId,@Param("supplierId")Long supplierId);

    List<SuppierMtrEntity> queryByIdAndPy(@Param("mtrId") Long mtrId,@Param("supplierId")Long supplierId,@Param("searchWord")String searchWord);

}
