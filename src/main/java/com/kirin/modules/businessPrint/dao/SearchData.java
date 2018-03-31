package com.kirin.modules.businessPrint.dao;

import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface SearchData extends BaseDao<Object> {

    public List<Map> chpkSearch(@Param("orderIds")Long[] orderIds,@Param("prdIds")Long[] prdIds,@Param("wareHouseId")Long wareHouseId);

    public List<Map> queryListLL(Map<String, Object> map);

    public int queryTotalLL(Map<String, Object> map);

    public List<ProductionOrderDetailEntity> queryOrderPrd(Map<String, Object> map);

//    public List<Map> getCommbox(@Param("tableName") String tableName, @Param("returnField") String[] returnField, @Param("searchArr") String[] searchArr);
//
//    public int getTableMaxId(@Param("tableName") String tableName, @Param("id") String id);
//
//    public List<String> getFieldData(@Param("tableName") String tableName, @Param("returnField") String returnField, @Param("searchFeild") String[] fieldName, @Param("searchWord") String searchWord);
//
//    public List<Map> getTableData(@Param("tableName") String tableName, @Param("searchWord") String searchWord, @Param("searchFeild") String[] fieldName);
//
//    public String getTableNewNo(@Param("tableName") String tableName, @Param("noField") String noField);
//
//    List<Map> getDataToCommbox(@Param("tableName") String tableName, @Param("search") String search, @Param("returnField") String returnField);
}
