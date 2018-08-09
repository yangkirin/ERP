package com.kirin.modules.common.service.impl;

import com.kirin.common.utils.CommonUtils;
import com.kirin.modules.baseData.dao.TypeInfoDao;
import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.entity.PrdDataEntity;
import com.kirin.modules.baseData.entity.TypeInfoEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.baseData.service.PrdDataService;
import com.kirin.modules.common.controller.CommonUtil;
import com.kirin.modules.common.dao.CommonUtilDao;
import com.kirin.modules.common.service.CommonUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("commonUtilService")
public class CommonUtilServiceImpl implements CommonUtilService{

    @Autowired
    private CommonUtilDao commonUtilDao;
    @Autowired
    private TypeInfoDao typeInfoDao;

    @Override
    public String createNewNo(String tableName,String id, String typeInfoId){





        //1.一层No
        Integer maxId = commonUtilDao.getTableMaxId(tableName,id);
        String idStr = String.format("%05d",maxId);


        TypeInfoEntity typeInfoEntity = typeInfoDao.queryObject(Long.valueOf(typeInfoId));
        idStr = String.format(typeInfoEntity.getTypeCode()+"%s",idStr);

        while (typeInfoEntity.getParentId() != 0){
            typeInfoEntity = typeInfoDao.queryObject(typeInfoEntity.getParentId());
            idStr = String.format(typeInfoEntity.getTypeCode()+"%s",idStr);
        }
        return idStr;
    }


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

    @Override
    public List<Map> inventorySearch(){
        return commonUtilDao.inventorySearch();
    }

    @Override
    public List<Map> batchInventorySearch(Long mtrId){
        return commonUtilDao.batchInventorySearch(mtrId);
    }

    @Override
    public List<Map> outStoreSearch(){
        return commonUtilDao.outStoreSearch();
    }

    @Override
    public List<Map> outStoreDetailSearch(Long outputId){
        return commonUtilDao.outStoreDetailSearch(outputId);
    }

    @Override
    public String compBomCount(Long id,String type){
        if(type != null || type.equals("MTR")){
            return commonUtilDao.compBomMtrCount(id);
        }else{
            return commonUtilDao.compBomPrdCount(id);
        }
    }

    @Override
    public String getTableMaxNo(String returnFiled, String tableName,String likeDateStr){
        return commonUtilDao.getTableMaxNo(returnFiled,tableName,likeDateStr);
    }

    @Override
    public String checkNameRepeat(String searchFiled,String tableName,String checkStr){
        return commonUtilDao.checkNameRepeat(searchFiled,tableName,checkStr);
    }

    @Override
    public List<Map> dataSearchLL(Map<String,Object> params){
        return commonUtilDao.dataSearchLL(params);
    }

    @Override
    public List<Map> getMtrByOrderId(Long[] orderIds){

        return null;
    }

    @Autowired
    BomInfoService bomInfoService;
    @Autowired
    BomDetailService bomDetailService;
    @Autowired
    PrdDataService prdDataService;
    /**
     * 根据产品Id查询
     * @param prdId
     * @return
     */
    @Override
    public List<Map> eachGetPrdMtr(Long prdId,Long orderCount,Map<String,Object> params){
        List<Map> mtrList = new ArrayList<>();
        params.put("prdId",prdId);
        List<Map> dataList = bomDetailService.searchMtrByPrdId(params);
        if(dataList != null && dataList.size() > 0){
            for (Map<String,Object> map:dataList) {
                if(map.get("semiFinished").toString().equals("0")){//原料
                    Map mtrMap = new HashMap();
                    mtrMap.putAll(map);
                    BigDecimal grossWgt = new BigDecimal(map.get("grossWgt") == null ? "0" : map.get("grossWgt").toString());//毛重
                    BigDecimal sumGrossWgt = grossWgt.multiply(new BigDecimal(orderCount)).setScale(2,BigDecimal.ROUND_HALF_UP);
                    BigDecimal wgtUnit = new BigDecimal(map.get("wgtUnit") == null ? "0" : map.get("wgtUnit").toString());//件重
                    BigDecimal numberCase = new BigDecimal("0");//件数
                    if(wgtUnit.compareTo(BigDecimal.ZERO) != 0){
                        numberCase = sumGrossWgt.divide(wgtUnit,2,BigDecimal.ROUND_HALF_UP);//件数
                    }
                    BigDecimal netRate = new BigDecimal(map.get("netRate") == null ? "0" : map.get("netRate").toString());
                    BigDecimal cookedRate = new BigDecimal(map.get("cookedRate") == null ? "0" : map.get("cookedRate").toString());
                    BigDecimal netWgt = new BigDecimal("0");
                    if(netRate.compareTo(BigDecimal.ZERO) != 0){
                        netWgt = sumGrossWgt.multiply(netRate).setScale(2,BigDecimal.ROUND_HALF_UP);
                    }
                    BigDecimal cookedWgt = new BigDecimal("0");
                    if(cookedRate.compareTo(BigDecimal.ZERO) != 0){
                        cookedWgt = sumGrossWgt.multiply(cookedRate).setScale(2,BigDecimal.ROUND_HALF_UP);
                    }
                    mtrMap.put("grossWgt",sumGrossWgt);
                    mtrMap.put("netWgt",netWgt);
                    mtrMap.put("cookedWgt",cookedWgt);

                    mtrMap.put("numberCase",numberCase);
                    mtrList.add(mtrMap);
                }else{//半成品
                    params.put("prdId",prdId);
                    List<Map> subDataList = eachGetPrdMtr(Long.valueOf(map.get("mtrId").toString()),orderCount,params);
                    if(subDataList != null && subDataList.size() > 0){
                        for (Map temp:subDataList) {
                            mtrList.add(temp);
                        }
                    }
                }
            }
        }
        return mtrList;
    }

    /**
     * 重复的原料重量累加，不同规格型号不需要累加
     * @param listData
     * @return
     */
    @Override
    public List<Map> distinctListData(List<Map> listData){
        List<Map> returnList = new ArrayList<>();
        if(listData != null && listData.size() > 0){
            for (Map mapTemp:listData) {
                if(returnList.size()<=0){
                    returnList.add(mapTemp);
                }
                boolean flag = false;
                String id_1 = mapTemp.get("id").toString();
                for (int i=0;i < returnList.size(); i++) {
                    Map temp = returnList.get(i);
                    String id = temp.get("id").toString();
                    String mtrId = temp.get("mtrId").toString();
                    String grossWgt = temp.get("grossWgt").toString();

                    //存在多规格型号的原料
                    if(id_1.equals(id)){
                        flag = true;
                        BigDecimal oldCount = new BigDecimal(temp.get("grossWgt").toString());
                        BigDecimal sumCount = new BigDecimal(grossWgt).add(oldCount).setScale(2,BigDecimal.ROUND_HALF_UP);

                        BigDecimal wgtUnit = new BigDecimal(temp.get("wgtUnit") == null ? "0" : temp.get("wgtUnit").toString());//件重
                        BigDecimal numberCase = new BigDecimal("0");//件数
                        if(wgtUnit.compareTo(BigDecimal.ZERO) != 0){
                            numberCase = sumCount.divide(wgtUnit,2,BigDecimal.ROUND_HALF_UP);//件数
                        }
                        temp.put("numberCase",numberCase);
                        temp.put("grossWgt",sumCount);
                    }else{
//                        returnList.add(mapTemp);
                    }
                }
                if(!flag){
                    returnList.add(mapTemp);
                    flag = false;
                }
            }
        }
        return returnList;
    }

    /**
     * 根据产品Id查询
     * @param prdId
     * @return
     */
    @Override
    public List<Map> eachGetPrd(Long prdId,Long orderCount,Map<String,Object> params){
        List<Map> prdList = new ArrayList<>();
        params.put("prdId",prdId);
        List<Map> dataList = bomDetailService.searchMtrByPrdId(params);
        if(dataList != null && dataList.size() > 0){
            for (Map<String,Object> map:dataList) {
                if(map.get("semiFinished").toString().equals("1")){//半成品
                    Map prdMap = new HashMap();
//                    prdMap.putAll(map);
                    PrdDataEntity prdDataEntity = prdDataService.queryObject(Long.valueOf(map.get("mtrId").toString()));
                    prdMap.put("prdId",prdDataEntity.getId());
                    prdMap.put("orderCount",orderCount);
                    prdMap.put("prdName",prdDataEntity.getPrdName());
                    prdMap.put("prdCode",prdDataEntity.getPrdCode());
                    prdMap.put("prdTypeName",prdDataEntity.getTypeName());
                    prdMap.put("prdStnName",prdDataEntity.getPdcStnName());
                    //毛重
                    BigDecimal grossWgt = new BigDecimal(prdDataEntity.getSumGrossWgt() == null ? "0" : prdDataEntity.getSumGrossWgt().toString());//毛重
                    BigDecimal sumGrossWgt = grossWgt.multiply(new BigDecimal(orderCount)).setScale(2,BigDecimal.ROUND_HALF_UP);
                    //净重
                    BigDecimal netWgt = new BigDecimal(prdDataEntity.getSumNetWgt() == null ? "0" : prdDataEntity.getSumNetWgt().toString());//净重
                    BigDecimal sumNetWgt = netWgt.multiply(new BigDecimal(orderCount)).setScale(2,BigDecimal.ROUND_HALF_UP);
                    //熟重
                    BigDecimal cookedWgt = new BigDecimal(prdDataEntity.getSumCookedWgt() == null ? "0" : prdDataEntity.getSumCookedWgt().toString());//净重
                    BigDecimal sumCookedWgt = cookedWgt.multiply(new BigDecimal(orderCount)).setScale(2,BigDecimal.ROUND_HALF_UP);
                    //速冷重
                    BigDecimal quickCoolWgt = new BigDecimal("0");
                    BigDecimal sumQuickCoolWgt = new BigDecimal("0");
                    if(prdDataEntity.getQuickCooling().equals("1") && prdDataEntity.getQuickCoolingRate() != null){
                        BigDecimal quickCoolRate = new BigDecimal(prdDataEntity.getQuickCoolingRate() == null ? "0" : prdDataEntity.getQuickCoolingRate().toString());
                        quickCoolWgt = netWgt.multiply(quickCoolRate).setScale(2,BigDecimal.ROUND_HALF_UP);
                        sumQuickCoolWgt = quickCoolWgt.multiply(new BigDecimal(orderCount)).setScale(2,BigDecimal.ROUND_HALF_UP);
                    }
                    prdMap.put("sumGrossWgt",sumGrossWgt);
                    prdMap.put("sumNetWgt",sumNetWgt);
                    prdMap.put("sumCookedWgt",sumCookedWgt);
                    prdMap.put("sumQuickCoolWgt",sumQuickCoolWgt);

                    //单锅重
                    BigDecimal potWeight = new BigDecimal("0");
                    //总锅数
                    BigDecimal sumPotCount = new BigDecimal("0");
                    //尾锅重
                    BigDecimal lastPotWeight = new BigDecimal("0");
                    //尾锅数
                    BigDecimal lastPotCount = new BigDecimal("0");

                    if(prdDataEntity.getPotWeight() != null){
                        potWeight = new BigDecimal(prdDataEntity.getPotWeight());
                        sumPotCount = sumNetWgt.divideToIntegralValue(potWeight);
                        lastPotWeight = sumNetWgt.subtract(potWeight.multiply(sumPotCount)).setScale(2,BigDecimal.ROUND_HALF_UP);
                        lastPotCount = (sumNetWgt.divide(potWeight,2,BigDecimal.ROUND_HALF_UP)).subtract(sumPotCount);
                    }
                    prdMap.put("potWeight",potWeight);
                    prdMap.put("sumPotCount",sumGrossWgt);
                    prdMap.put("lastPotWeight",lastPotWeight);
                    prdMap.put("lastPotCount",lastPotCount);

                    prdList.add(prdMap);

                    params.put("prdId",prdId);
                    List<Map> subDataList = eachGetPrdMtr(Long.valueOf(map.get("mtrId").toString()),orderCount,params);
                    if(subDataList != null && subDataList.size() > 0){
                        for (Map temp:subDataList) {
                            if(temp.get("semiFinished").toString().equals("1")){
                                prdList.add(temp);
                            }
                        }
                    }
                }
            }
        }
        return prdList;
    }

    /**
     * 查询产品下所有原料的信息。计算所需原料重量
     * @param prdId
     * @param orderAmount
     * @return List<Map>
     */
    @Override
    public List<Map> getMtrListByPrdId(Long prdId, BigDecimal orderAmount){
        List<Map> mtrList = new ArrayList<>();
        //根据产品ID获取产品配方明细
        BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdId);
        if(bomInfoEntity == null){
            return null;
        }
        Map<String,Object> paramMap = new HashMap<>();
        paramMap.put("bomInfoId",bomInfoEntity.getId());
        List<BomDetailEntity> bomDetailEntityList = bomDetailService.queryList(paramMap);
        if(bomDetailEntityList == null || bomDetailEntityList.size() <= 0){
            return null;
        }
        //循环明细信息，判断原料与半成品
        for (BomDetailEntity bomDetailEntity:bomDetailEntityList) {
            BigDecimal grossWgt = new BigDecimal(bomDetailEntity.getGrossWgt() == null ? "0" : bomDetailEntity.getGrossWgt().toString());
            //半成品则循环进行计算
            if(bomDetailEntity.getSemiFinished().equals("1")){//半成品
                BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(bomDetailEntity.getMtrId());
                BigDecimal detailPrdGrossWgt = new BigDecimal(bomInfo.getSumGrossWgt() == null ? "1" : bomInfo.getSumGrossWgt().toString());
                //计算所需要半成品的份数
                //（【产品配方中半成品所需毛重】*【产品所需数量】）/【半成品配方单份毛重】
                BigDecimal cpoies = (grossWgt.multiply(orderAmount).setScale(4,BigDecimal.ROUND_HALF_UP)).divide(detailPrdGrossWgt,2,BigDecimal.ROUND_HALF_UP);//份数
                List<Map> mapList = getMtrListByPrdId(bomDetailEntity.getMtrId(),cpoies);
                if(mapList != null && mapList.size() > 0){
                    mtrList.addAll(mapList);
                }

            }else{//原料则直接运算后存入集合
                Map<String,Object> map = new HashMap<>();
                map.put("mtrId",bomDetailEntity.getMtrId());
                map.put("mtrName",bomDetailEntity.getMtrIdName());
                map.put("grossWgt",bomDetailEntity.getGrossWgt());
                map.put("netWgt",bomDetailEntity.getNetWgt());
                map.put("modiWgt",bomDetailEntity.getModiWgt());
                map.put("netRate",bomDetailEntity.getNetRate());
                map.put("cost",bomDetailEntity.getCost());
                map.put("costRate",bomDetailEntity.getCostRate());

                BigDecimal orderWgt = grossWgt.multiply(orderAmount).setScale(2,BigDecimal.ROUND_HALF_UP);
                map.put("orderWgt",orderWgt);
                mtrList.add(map);
            }
        }



        return mtrList;
    }


    @Override
    public List<Map> executeSql(String searchSql){
        return commonUtilDao.executeSql(searchSql);
    }


    public static void main(String[] args){
        BigDecimal A = new BigDecimal(100);
        BigDecimal B = new BigDecimal(15);

        System.out.println(A.divideToIntegralValue(B));
    }
}
