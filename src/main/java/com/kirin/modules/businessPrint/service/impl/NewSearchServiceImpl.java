package com.kirin.modules.businessPrint.service.impl;

import com.kirin.modules.businessPrint.service.NewSearchService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("newSearchService")
public class NewSearchServiceImpl implements NewSearchService {




    @Override
    public List<Map> querySemiFinishedPrd(Map<String, Object> params, Long[] orderIds) {
        return null;
    }

    @Override
    public List<Map> queryMtr(Map<String, Object> params, Long[] orderIds) {
        return null;
    }
}
