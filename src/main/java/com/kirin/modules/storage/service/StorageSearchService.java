package com.kirin.modules.storage.service;

import com.kirin.modules.storage.entity.StorageSearchEntity;

import java.util.List;
import java.util.Map;

/**
 * @Author: BeauFang
 * @Date: 2018/4/30 14:30
 * @Description:
 **/
public interface StorageSearchService {
    List<StorageSearchEntity> queryList(Map<String, Object> map);

    int queryTotal(Map<String, Object> map);
}
