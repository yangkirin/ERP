package com.kirin.common.utils;

import java.util.*;

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

    public static void main(String args[]){
        List<Map> list = new ArrayList<>();
        for(int i=1;i<=10;i++){
            Map map = new HashMap();
            if(i%2 == 0){
                map.put("id",2);
            }else{
                map.put("id",i);
            }
            list.add(map);
        }

        for (Map map :list) {
            System.out.println(map.get("id"));
        }
        System.out.println("-----------");

        Object[] objArr0 = new CommonUtils().findRepeat(list,"id");
        for (Object obj:objArr0) {
            System.out.println(obj.toString());
        }

        System.out.println("-----------");

        List<Map> objArr = new CommonUtils().clearRepeat(list,"id");
        for (Map map:objArr) {
            System.out.println(map.get("id").toString());
        }

        System.out.println("-----------");
        List<Map> objArr2 = new CommonUtils().getRepeat(list,"id","2");
        for (Map map:objArr2) {
            System.out.println(map.get("id").toString());
        }
//        for (Object object:objArr) {
//            System.out.println(object.toString());
//        }
    }
}
