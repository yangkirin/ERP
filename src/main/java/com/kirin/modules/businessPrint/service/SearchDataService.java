package com.kirin.modules.businessPrint.service;

import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;

import java.util.List;
import java.util.Map;

public interface SearchDataService {

    List<Map> chpkSearch(Long[] orderIds,Long[] prdIds, Long wareHouseId);
//
//    String getCommbox(String tableName, String[] returnField, String[] searchArr);
//
//    Integer getTableMaxId(String tableName, String id);
//
//    List<String> getFieldData(String tableName, String returnField, String[] fieldName, String searchWord);
//
    List<Map> queryListLL(Map<String, Object> map);

    int queryTotalLL(Map<String, Object> map);

    List<ProductionOrderDetailEntity> queryOrderPrd(Map<String, Object> map);
//
//    String getTableNewNo(String tableName, String noField);
//
//    List<Map> getDataToCommbox(String tableName, String search, String returnField);
}
