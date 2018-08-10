package com.kirin.modules.finance.dao;

import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface FinanceDao extends BaseDao<Object> {

    List<Map> receivableSumInfo(Map param);
    List<Map> payableSumInfo(Map param);

    List<Map> receivableSumDetail(Map param);
    List<Map> payableSumDetail(Map param);

    List<Map> costreportInfo(Map param);
    List<Map> costreportDetail(Map param);

    List<Map> costreportHead(Map param);

}
