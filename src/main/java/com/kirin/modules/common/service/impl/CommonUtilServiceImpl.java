package com.kirin.modules.common.service.impl;

import com.kirin.modules.common.dao.CommonUtilDao;
import com.kirin.modules.common.service.CommonUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("commonUtilService")
public class CommonUtilServiceImpl implements CommonUtilService{

    @Autowired
    private CommonUtilDao commonUtilDao;

    @Override
    public String getCommbox(String tableName, String[] returnField, String[] searchArr) {
        List<Map> list = commonUtilDao.getCommbox(tableName,returnField,searchArr);
        System.out.println("---------->getCommboxData Size="+list.size());
        for (int i=0;i<list.size();i++){
            Map map = list.get(i);
            System.out.println("---------->getCommboxData map Size="+map.size());
            System.out.println("---------->getCommboxData map 1="+map.get("id"));
        }
        
        return null;
    }

    @Override
    public Integer getTableMaxId(String tableName,String id){
        Integer maxId = commonUtilDao.getTableMaxId(tableName,id);
        return maxId+1;
    }

    @Override
    public List<String> getFieldData(String tableName, String returnField,String[] fieldName,String searchWord) {
        return commonUtilDao.getFieldData(tableName,returnField,fieldName,searchWord);
    }

    @Override
    public List<Map> getTableData(String tableName, String searchWord,String[] fieldName){
        return commonUtilDao.getTableData(tableName,searchWord,fieldName);
    }

    @Override
    public String getTableNewNo(String tableName,String noField){
        return commonUtilDao.getTableNewNo(tableName,noField);
    }

    @Override
    public List<Map> getDataToCommbox(String tableName,String search,String returnField){
        return commonUtilDao.getDataToCommbox(tableName,search,returnField);
    }
}
