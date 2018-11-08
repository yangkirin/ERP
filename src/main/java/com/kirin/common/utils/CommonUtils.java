package com.kirin.common.utils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.storage.service.OutportDetailService;
import com.kirin.modules.storage.service.OutportInfoService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.swing.text.html.HTMLDocument;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

public class CommonUtils {

    /**
     * 计算集合当中是否存在重复项
     */
    public Object[] findRepeat(List<Map> baseList,String attrName){
        if(baseList == null && baseList.size() <= 0){
            return null;
        }
        Set objectValue = new HashSet();
        for (int i=0;i<baseList.size();i++) {
            Map map = baseList.get(i);
            Object attrValue = map.get(attrName);
            for(int j=i+1;j<baseList.size();j++){
                Map temp = baseList.get(j);
                Object tempValue = temp.get(attrName);
                if(attrValue.equals(tempValue)){
                    objectValue.add(attrValue);
                }
            }
//            for (Map temp:baseList) {
//                Object tempValue = temp.get(attrName);
//                if(attrValue.equals(tempValue)){
//                    objectValue.add(attrValue);
//                }
//            }
        }
        return objectValue.toArray();
    }

    /**
     *
     * @param baseList
     * @param attrName
     * @return 返回去重后的集合
     */
    public List<Map> clearRepeat(List<Map> baseList,String attrName){
        List<Map> newList = new ArrayList<Map>();
        List<String> attrValue = new ArrayList<String>();
        boolean contain;
        for(int i = 0;i < baseList.size();i++){
            //假设取出一条数据后，后面有一样的id，num就+1，如果没有就把自己加在新的list中
            int num = 0;
            contain = attrValue.contains(baseList.get(i).get(attrName).toString());
            attrValue.add(baseList.get(i).get(attrName).toString());
            //在下一次循环的时候不考虑之前出现过得id
            if(contain == false){
                for(int j = i+1; j <= baseList.size() - 1;j++){
                    String  attrVal = baseList.get(i).get(attrName).toString();
                    if(attrVal.equals(baseList.get(j).get(attrName).toString())){
                        num ++;
                        newList.add(baseList.get(i));
                        break;
                    }
                }
                if(num == 0){
                    newList.add(baseList.get(i));
                }
            }
        }
        return newList;
    }

    /**
     * 获取重复对象集合
     * @param baseList
     * @param attrName
     * @param attrVal
     * @return 返回重复的对象集合
     */
    public List<Map> getRepeat(List<Map> baseList,String attrName,String attrVal){
        List<Map> newList = new ArrayList<Map>();
        for(int i = 0;i < baseList.size();i++){
            if(attrVal.equals(baseList.get(i).get(attrName).toString())){
                newList.add(baseList.get(i));
            }
        }
        return newList;
    }

    public static String createBillNo(String startCode){
        String billNo = DateUtils.format(new Date(),"yyyyMMddHHmmss");
        if(StringUtils.isNotBlank(startCode)){
            billNo = startCode+billNo;
        }
        return billNo;
    }


    /**
     * 利用JDK1.8的Comparator进行排序
     * @param listMap
     * @param groupKeyName
     * @return
     */
    public static List<Map<String, String>> storeListMap(List<Map> listMap,String groupKeyName){
        List<Map<String, String>> sourceList = coventMapToStringMap(listMap);
        List<Map<String, String>> result = sourceList.stream().sorted(Comparator.comparingLong(map -> Long.parseLong(map.get(groupKeyName).toString()))).collect(Collectors.toList());

        return result;
    }



    /**
     * 将Map集合转换成Map<String,String>对象集合
     * @param sourceList
     * @return
     */
    public static List<Map<String, String>> coventMapToStringMap(List<Map> sourceList){
        List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
        if(sourceList == null && sourceList.size() <= 0){
            return null;
        }else{
            for (Map<String,Object> map : sourceList) {
                Map<String,String> newMap = new HashMap<String, String>();
                Iterator<Map.Entry<String,Object>> iterator = map.entrySet().iterator();
                while(iterator.hasNext()){
                    Map.Entry<String,Object> entry=iterator.next();
                    newMap.put(entry.getKey(),entry.getValue() == null ? "" : entry.getValue().toString());
                }
                resultList.add(newMap);
            }
        }
        return resultList;
    }


    public static void main(String args[]){
        BigDecimal a = new BigDecimal("100");
        BigDecimal b = new BigDecimal("4589.32");

        System.out.println(b.divide(a,0,BigDecimal.ROUND_DOWN));
        System.out.println(b.subtract(b.divide(a,0,BigDecimal.ROUND_DOWN).multiply(a)));

    }


    public static void main2(String args[]){
        List<Map> list = new ArrayList<>();
        for(int i=1;i<=10;i++){
            Map map = new HashMap();
            if(i%2 == 0){
                map.put("id",2);
                map.put("name",2);
            }else{
                map.put("id",i);
                map.put("name",i);
            }
            list.add(map);
        }

        for (Map<String, Object> map :list) {
            System.out.println(map.get("id")+"-----"+map.get("name"));
        }
        System.out.println("-----------");

        List<Map<String, String>> result = storeListMap(list,"id");
        for (Map<String, String> map :result) {
            System.out.println(map.get("id")+"-----"+map.get("name"));
        }
        System.out.println("-----------分组");
//        Map<Integer, List<Apple>> groupBy = appleList.stream().collect(Collectors.groupingBy(Apple::getId));
//        sourceList.stream().sorted(Comparator.comparingLong(map -> Long.parseLong(map.get(groupKeyName).toString()))).collect(Collectors.toList());

        Map<Integer,List<Map>> groupBy = list.stream().collect(Collectors.groupingBy(map -> Integer.parseInt(map.get("id").toString())));
        System.out.println(groupBy);

//        Object[] objArr0 = new CommonUtils().findRepeat(list,"id");
//        for (Object obj:objArr0) {
//            System.out.println(obj.toString());
//        }
//
//        System.out.println("-----------");
//
//        List<Map> objArr = new CommonUtils().clearRepeat(list,"id");
//        for (Map map:objArr) {
//            System.out.println(map.get("id").toString());
//        }
//
//        System.out.println("-----------");
//        List<Map> objArr2 = new CommonUtils().getRepeat(list,"id","2");
//        for (Map map:objArr2) {
//            System.out.println(map.get("id").toString());
//        }
//        for (Object object:objArr) {
//            System.out.println(object.toString());
//        }
    }

    public static void main1(String args[]) throws IOException {
        String json = "[{\"id\":\"\",\"mtrId\":\"728\",\"mtrCode\":\"A0600042\",\"mtrName\":\"原味肉碎\",\"mtrTypeName\":\"肉禽类\",\"takeStnName\":\"肉类班\",\"bomWgt\":\"1928.3202\",\"formulaUnit\":\"g\",\"purchaseWgt\":\"0.1928\",\"purchaseUnit\":\"箱\",\"purchaseRate\":\"10\",\"TAKE_STN_ID\":\"377\",\"WAREHOUSE_ID\":\"373\",\"outUnit\":\"kg\",\"miniRate\":\"1000\",\"orderWgt\":\"1.9283\",\"storeCount\":\"0.0\",\"wgtUnit\":\"\",\"numberCase\":\"\",\"wareHouseName\":\"冷冻库\"},{\"id\":\"\",\"mtrId\":\"540\",\"mtrCode\":\"A0600018\",\"mtrName\":\"去骨鸡上腿排\",\"mtrTypeName\":\"肉禽类\",\"takeStnName\":\"肉类班\",\"bomWgt\":\"6611.1045\",\"formulaUnit\":\"g\",\"purchaseWgt\":\"6.6111\",\"purchaseUnit\":\"kg\",\"purchaseRate\":\"1\",\"TAKE_STN_ID\":\"377\",\"WAREHOUSE_ID\":\"373\",\"outUnit\":\"kg\",\"miniRate\":\"1000\",\"orderWgt\":\"6.6111\",\"storeCount\":\"0.0\",\"wgtUnit\":\"\",\"numberCase\":\"\",\"wareHouseName\":\"冷冻库\"},{\"id\":\"\",\"mtrId\":\"566\",\"mtrCode\":\"A0600023\",\"mtrName\":\"鸡胸肉\",\"mtrTypeName\":\"肉禽类\",\"takeStnName\":\"肉类班\",\"bomWgt\":\"2455.5531\",\"formulaUnit\":\"g\",\"purchaseWgt\":\"2.4556\",\"purchaseUnit\":\"kg\",\"purchaseRate\":\"1\",\"TAKE_STN_ID\":\"377\",\"WAREHOUSE_ID\":\"373\",\"outUnit\":\"kg\",\"miniRate\":\"1000\",\"orderWgt\":\"2.4556\",\"storeCount\":\"2600.0\",\"wgtUnit\":\"\",\"numberCase\":\"\",\"wareHouseName\":\"冷冻库\"},{\"id\":\"\",\"mtrId\":\"607\",\"mtrCode\":\"A0600027\",\"mtrName\":\"牛霖\",\"mtrTypeName\":\"肉禽类\",\"takeStnName\":\"肉类班\",\"bomWgt\":\"766.6659\",\"formulaUnit\":\"g\",\"purchaseWgt\":\"0.7667\",\"purchaseUnit\":\"kg\",\"purchaseRate\":\"1\",\"TAKE_STN_ID\":\"377\",\"WAREHOUSE_ID\":\"373\",\"outUnit\":\"kg\",\"miniRate\":\"1000\",\"orderWgt\":\"0.7667\",\"storeCount\":\"0.0\",\"wgtUnit\":\"\",\"numberCase\":\"\",\"wareHouseName\":\"冷冻库\"}]";

        ObjectMapper mapper = new ObjectMapper();
        JsonNode jsonNode = mapper.readTree(json);
        if(jsonNode.isArray()){
            List<Map> mapList = mapper.convertValue(jsonNode,List.class);
            System.out.println(mapList.size());
        }


    }
}
