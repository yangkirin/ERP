package com.kirin.modules.storage.controller;

import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;
import com.kirin.modules.storage.entity.StorageSearchEntity;
import com.kirin.modules.storage.service.StorageSearchService;
import com.kirin.modules.sys.controller.AbstractController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @Author: BeauFang
 * @Date: 2018/4/30 13:53
 * @Description:
 **/
@RestController
@RequestMapping("storage/search/")
public class StorageSearchController extends AbstractController {

    @Autowired
    private StorageSearchService storageSearchService;

    @RequestMapping("inventorySearch")
    public R list(@RequestParam Map<String, Object> params) {
        Query query = new Query(params);
        List<StorageSearchEntity> storageSearchEntities = storageSearchService.queryList(query);
        int total = storageSearchService.queryTotal(query);

        PageUtils pageUtils = new PageUtils(storageSearchEntities, total, query.getLimit(), query.getPage());
        return R.ok().put("page", pageUtils);
    }

}
