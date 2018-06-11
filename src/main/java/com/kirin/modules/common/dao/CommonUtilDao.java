package com.kirin.modules.common.dao;

import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface CommonUtilDao extends BaseDao<Object> {
    public List<Map> getCommbox(@Param("tableName") String tableName,@Param("returnField")String[] returnField, @Param("searchArr")String[] searchArr);

    public int getTableMaxId(@Param("tableName")String tableName,@Param("id")String id);

    public List<String> getFieldData(@Param("tableName") String tableName,@Param("returnField") String returnField,@Param("searchFeild") String[] fieldName,@Param("searchWord")String searchWord);

    public List<Map> getTableData(@Param("tableName")String tableName,@Param("searchWord")String searchWord,@Param("searchFeild") String[] fieldName);

    public String getTableNewNo(@Param("tableName")String tableName,@Param("noField")String noField);

    List<Map> getDataToCommbox(@Param("tableName")String tableName,@Param("search")String search,@Param("returnField")String returnField);

    List<Map> inventorySearch();

    List<Map> batchInventorySearch(@Param("mtrId")Long mtrId);

    List<Map> outStoreSearch();

    List<Map> outStoreDetailSearch(@Param("outputId")Long outputId);

    String compBomMtrCount(@Param("mtrId") Long mtrId);

    String compBomPrdCount(@Param("prdId") Long prdId);

    String getTableMaxNo(@Param("returnFiled") String returnFiled,@Param("tableName") String tableName,@Param("likeDateStr") String likeDateStr);

    String checkNameRepeat(@Param("searchFiled") String searchFiled,@Param("tableName") String tableName,@Param("checkStr")String  checkStr);

    List<Map> dataSearchLL(Map<String,Object> params);
}
