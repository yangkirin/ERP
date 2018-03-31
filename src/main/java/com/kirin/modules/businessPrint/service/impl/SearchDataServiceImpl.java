package com.kirin.modules.businessPrint.service.impl;

import com.kirin.modules.businessPrint.dao.SearchData;
import com.kirin.modules.businessPrint.service.SearchDataService;
import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("searchDataService")
public class SearchDataServiceImpl implements SearchDataService {

    @Autowired
    SearchData searchData;

    public List<Map> chpkSearch(Long[] orderIds,Long[] prdIds, Long wareHouseId){
        return searchData.chpkSearch(orderIds,prdIds,wareHouseId);
    }

    @Override
    public List<Map> queryListLL(Map<String, Object> map){
        return searchData.queryListLL(map);
    }

    @Override
    public int queryTotalLL(Map<String, Object> map){
        return searchData.queryTotalLL(map);
    }

    @Override
    public List<ProductionOrderDetailEntity> queryOrderPrd(Map<String, Object> map) {
        return searchData.queryOrderPrd(map);
    }
}
