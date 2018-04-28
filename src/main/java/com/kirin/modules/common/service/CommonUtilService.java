package com.kirin.modules.common.service;

import java.util.List;
import java.util.Map;

public interface CommonUtilService {

    String getCommbox(String tableName,String[] returnField,String[] searchArr);

    Integer getTableMaxId(String tableName,String id);

    List<String> getFieldData(String tableName, String returnField,String[] fieldName,String searchWord);

    List<Map> getTableData(String tableName, String searchWord,String[] fieldName);

    String getTableNewNo(String tableName,String noField);

    List<Map> getDataToCommbox(String tableName,String search,String returnField);

    List<Map> inventorySearch();

    List<Map> batchInventorySearch(Long mtrId);

    List<Map> outStoreSearch();

    List<Map> outStoreDetailSearch(Long outputId);
}
