package com.kirin.modules.finance.service;

import java.util.List;
import java.util.Map;

public interface FinanceService {
    List<Map> receivableSumInfo(Map<String,Object> param);
    List<Map> payableSumInfo(Map<String,Object> param);

    List<Map> receivableSumDetail(Map<String,Object> param);
    List<Map> payableSumDetail(Map<String,Object> param);

    List<Map> costreportInfo(Map<String,Object> param);
    List<Map> costreportDetail(Map<String,Object> param);

    List<Map> costreportHead(Map<String,Object> param);
}
