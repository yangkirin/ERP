package com.kirin;

import com.kirin.common.utils.CommonUtils;
import com.kirin.modules.common.service.CommonUtilService;
import okhttp3.internal.Internal;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;
import java.util.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CommonUtilServiceTest {
    @Autowired
    CommonUtilService commonUtilService;

    @Test
    public void checkSearch(){
        Map<String,Object> params = new HashMap<>();
        List<Map> listData = commonUtilService.eachGetPrdMtr(2062L,100L,params);
        System.out.println(listData.size());
        for (Map map :listData) {
            for(Object key : map.keySet()){
                System.out.print(key.toString()+"-----"+map.get(key));
            }
            System.out.println();
        }
    }

    @Test
    public void eachGetPrd(){
        Map<String,Object> params = new HashMap<>();
        List<Map> listData = commonUtilService.eachGetPrd(2062L,100L,params);
        System.out.println(listData.size());
        for (Map map :listData) {
            for(Object key : map.keySet()){
                System.out.print(key.toString()+"-----"+map.get(key));
            }
            System.out.println();
        }
    }

    @Test
    public void getMtrListByPrdId(){
        List<Map> mtrList = commonUtilService.getMtrListByPrdId(110L,new BigDecimal("1"));

        System.out.println(mtrList.size());
        for (Map map :mtrList) {
            for(Object key : map.keySet()){
                System.out.print(key.toString()+"-----"+map.get(key));
            }
            System.out.println();
        }

        //计算重复项，重复原料进行重量累加
        //1.取出重复对象集合，循环累加
        List<Map> returnList = new ArrayList<>();

        Object[] objectArr = new CommonUtils().findRepeat(mtrList,"mtrId");
        if(objectArr != null && objectArr.length > 0) {//存在重复项
            List<Map> mapListTemp = new CommonUtils().clearRepeat(mtrList, "mtrId");

            for (int i = 0; i < objectArr.length; i++) {
                Map mapObj = new HashMap();
                BigDecimal count = new BigDecimal("0");
                for (Map mapTemp : mtrList) {
                    if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
                        count = count.add(new BigDecimal(mapTemp.get("orderWgt").toString()));
                    }
                }
                for (Map mapTemp : mapListTemp) {
                    if (mapTemp.get("mtrId").toString().equals(objectArr[i].toString())) {
                        mapTemp.put("orderWgt", count);
                    }
                }
            }
            returnList.addAll(mapListTemp);
        }else{
            returnList.addAll(mtrList);
        }




        System.out.println("-----------------去掉重复------------------------");

        System.out.println(returnList.size());
        for (Map map :returnList) {
            for(Object key : map.keySet()){
                System.out.print(key.toString()+"-----"+map.get(key));
            }
            System.out.println();
        }
    }

    @Test
    public void executeSql(){
        String sql = "SELECT oi.ORDER_NO,im.IMPORT_NO,oi.SUPPLIER_ID,(select s.suppier_name from tb_supplier_info s where s.id=oi.SUPPLIER_ID) as SUPPLIER_NAME,DATE_FORMAT(im.IMPORT_DATE,'%Y-%m-%d') as IMPORT_DATE FROM tb_order_info oi LEFT JOIN tb_import im ON oi.ID = im.ORDER_ID where oi.`STATUS`='3'";

        List<Map> mapList = commonUtilService.executeSql(sql);

        System.out.println(mapList.size());
        for (Map map :mapList) {
            for(Object key : map.keySet()){
                System.out.print(key.toString()+"-----"+map.get(key));
            }
            System.out.println();
        }
    }
}
