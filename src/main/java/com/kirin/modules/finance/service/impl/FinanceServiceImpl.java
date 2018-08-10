package com.kirin.modules.finance.service.impl;

import com.kirin.modules.finance.dao.FinanceDao;
import com.kirin.modules.finance.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("financeService")
public class FinanceServiceImpl implements FinanceService{

    @Autowired
    private FinanceDao financeDao;

    @Override
    public List<Map> receivableSumInfo(Map<String,Object> param) {
        return financeDao.receivableSumInfo(param);
    }

    @Override
    public List<Map> payableSumInfo(Map<String,Object> param) {
        return financeDao.payableSumInfo(param);
    }

    @Override
    public List<Map> receivableSumDetail(Map<String,Object> param) {
        return financeDao.receivableSumDetail(param);
    }

    @Override
    public List<Map> payableSumDetail(Map<String,Object> param) {
        return financeDao.payableSumDetail(param);
    }

    @Override
    public List<Map> costreportInfo(Map<String,Object> param) {
        return financeDao.costreportInfo(param);
    }

    @Override
    public List<Map> costreportDetail(Map<String,Object> param) {
        return financeDao.costreportDetail(param);
    }

    @Override
    public List<Map> costreportHead(Map<String,Object> param) {
        return financeDao.costreportHead(param);
    }


}
