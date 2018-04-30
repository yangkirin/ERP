package com.kirin.modules.storage.service.impl;

import com.kirin.modules.storage.dao.StorageSearchDao;
import com.kirin.modules.storage.entity.StorageSearchEntity;
import com.kirin.modules.storage.service.StorageSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author: BeauFang
 * @Date: 2018/4/30 14:31
 * @Description:
 **/
@Service
public class StorageSearchServiceImpl implements StorageSearchService {

    @Autowired
    private StorageSearchDao storageSearchDao;

    @Override
    public List<StorageSearchEntity> queryList(Map<String, Object> map) {
        return storageSearchDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return storageSearchDao.queryTotal(map);
    }
}
