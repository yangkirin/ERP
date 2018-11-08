package com.kirin.modules.businessPrint.service;

import java.util.List;
import java.util.Map;

public interface NewSearchService {

    /**
     * 根据订单ID以及查询参数，查询半成品集合
     * @param params
     * @param orderIds
     * @return List<Map>
     */
    List<Map> querySemiFinishedPrd(Map<String,Object> params,Long[] orderIds);

    /**
     * 根据订单ID以及查询参数，查询原料集合
     * @param params
     * @param orderIds
     * @return List<Map>
     */
    List<Map> queryMtr(Map<String,Object> params,Long[] orderIds);

}
