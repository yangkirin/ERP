package com.kirin.modules.sales.dao;

import com.kirin.modules.sales.entity.CustomerPrdEntity;
import com.kirin.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 客户采购产品信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
@Mapper
@Repository
public interface CustomerPrdDao extends BaseDao<CustomerPrdEntity> {

    int batchInsert(List<CustomerPrdEntity> customerPrdEntityList);

    CustomerPrdEntity queryObjectMap(Map<String,Object> params);
}
