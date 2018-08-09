package com.kirin.modules.businessPrint.controller;

import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.HorizontalAlignment;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.property.UnitValue;
import com.kirin.common.print.PdfUtil;
import com.kirin.common.utils.*;
import com.kirin.modules.baseData.entity.BomDetailEntity;
import com.kirin.modules.baseData.entity.BomInfoEntity;
import com.kirin.modules.baseData.entity.TypeInfoEntity;
import com.kirin.modules.baseData.service.BomDetailService;
import com.kirin.modules.baseData.service.BomInfoService;
import com.kirin.modules.baseData.service.TypeInfoService;
import com.kirin.modules.businessPrint.service.SearchDataService;
import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sales.service.ProductionOrderDetailService;
import com.kirin.modules.sales.service.ProductionOrderService;
import com.kirin.modules.storage.controller.OutportDetailController;
import com.kirin.modules.storage.entity.OutportDetailEntity;
import com.kirin.modules.storage.service.OutportDetailService;
import com.kirin.modules.sys.controller.AbstractController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.*;

@RestController
@RequestMapping("/businessPrint/dataSearch")
public class DataSearchController extends AbstractController {

    @Autowired
    SearchDataService searchDataService;
    @Autowired
    ProductionOrderDetailService productionOrderDetailService;
    @Autowired
    TypeInfoService typeInfoService;
    @Autowired
    ProductionOrderService productionOrderService;

    @RequestMapping(value="/DataSearchLL")
    public R DataSearchLL(@RequestParam Map<String, Object> params){
        //查询列表数据
        Query query = new Query(params);

        Long takeStn = params.get("takeStn") == null ? null : Long.valueOf(params.get("takeStn").toString());
        Long warehouse = params.get("warehouse") == null ? null :Long.valueOf(params.get("warehouse").toString());

        List<Map> returnList = new ArrayList<>();

        if(params.get("createDate") != null){
            returnList = searchDataLL(params);
        }

        int total = returnList.size();

        PageUtils pageUtil = new PageUtils(returnList, total, 9999, 1);

        return R.ok().put("page", pageUtil);
    }

    public List<Map> searchDataLL(Map<String, Object> params){
        Query query = new Query(params);
        Long takeStn = params.get("takeStn") == null ? null : Long.valueOf(params.get("takeStn").toString());
        Long warehouse = params.get("warehouse") == null ? null :Long.valueOf(params.get("warehouse").toString());
        List<Map> returnList = new ArrayList<>();
        List<ProductionOrderDetailEntity> productionOrderDetailEntityList = searchDataService.queryOrderPrd(query);
        if(productionOrderDetailEntityList != null && productionOrderDetailEntityList.size() > 0){
            List<Map> mtrList = new ArrayList<>();
            for (ProductionOrderDetailEntity productionOrderDetailEntity:productionOrderDetailEntityList) {
                List<Map> mapListTemp = findAllMtrByPrd2(productionOrderDetailEntity.getPrdId(),takeStn,warehouse,new BigDecimal(productionOrderDetailEntity.getAmount()));//单各产品所需要的原料重量
                mtrList.addAll(mapListTemp);
//                //完善客户信息和产品信息与计算数量
//                for (Map mapTemp:mapList) {
//
//                    BigDecimal mtrGrossWgt = new BigDecimal(mapTemp.get("mtrGrossWgt") == null ? "0" : mapTemp.get("mtrGrossWgt").toString());
//                    BigDecimal orderAmount = new BigDecimal(productionOrderDetailEntity.getAmount() == null ? "0" : productionOrderDetailEntity.getAmount().toString());
//
//                    BigDecimal mtrAmount = mtrGrossWgt.multiply(orderAmount).setScale(2,BigDecimal.ROUND_HALF_UP);
//                    mtrAmount = mtrAmount.divide(new BigDecimal(1000)).setScale(2,BigDecimal.ROUND_HALF_UP);
//                    mapTemp.put("orderCount",mtrAmount);
//                }
            }

            //所有产品原料集合去重
            if(mtrList !=null && mtrList.size() > 0){
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
            }

//            for (Map mapTemp:mapList) {
//                if(returnList.size()<=0){
//                    returnList.add(mapTemp);
//                }
//                for (int i=0;i < returnList.size(); i++) {
//                    Map temp = returnList.get(i);
//                    if(mapTemp.get("mtrId").toString().equals(temp.get("mtrId").toString())){
//                        BigDecimal newCount = new BigDecimal(temp.get("orderCount").toString());
//                        BigDecimal oldCount = new BigDecimal(temp.get("orderCount").toString());
//                        BigDecimal sumCount = newCount.add(oldCount).setScale(2,BigDecimal.ROUND_HALF_UP);
//                        temp.put("orderCount",sumCount);
//                    }else{
//                        returnList.add(mapTemp);
//                    }
//                }
//            }
        }
        return returnList;
    }


    @Autowired
    BomDetailService bomDetailService;
    @Autowired
    BomInfoService bomInfoService;
    @Autowired
    OutportDetailService outportDetailService;

    //根据所选订单查询产品配方所需原料信息
    public List<Map> findAllMtrByPrd(Long prdId,Long takeStnId,Long warehouseId){
        BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdId);
        if(bomInfoEntity == null){
            return null;
        }
        Map<String,Object> map = new HashMap<>();
        map.put("bomInfoId",bomInfoEntity.getId());
        List<BomDetailEntity> bomDetailEntityList = bomDetailService.queryList(map);
        if(bomDetailEntityList == null || bomDetailEntityList.size() <= 0){
            return null;
        }

        List<Map> mapList = outportDetailService.queryMtrByPrdId(prdId,takeStnId,warehouseId);

        for (BomDetailEntity bomDetailEntity:bomDetailEntityList) {
            if(bomDetailEntity.getSemiFinished().equals("1")){//半成品
                List<Map> subMapList = findAllMtrByPrd(bomDetailEntity.getMtrId(),takeStnId,warehouseId);
                mapList.addAll(subMapList);
            }
        }

        return mapList;
    }

    public List<Map> findAllMtrByPrd2(Long prdId,Long takeStnId,Long warehouseId,BigDecimal orderAmount){
        List<Map> mtrList = new ArrayList<>();
        BomInfoEntity bomInfoEntity = bomInfoService.queryObjectByPrdId(prdId);
        if(bomInfoEntity == null){
            return null;
        }

        List<Map> detailMapList = outportDetailService.queryMtrByPrdId(prdId,takeStnId,warehouseId);

        if(detailMapList != null && detailMapList.size() > 0){
            for (Map map : detailMapList) {
                BigDecimal grossWgt = new BigDecimal(map.get("mtrGrossWgt") == null ? "0" : map.get("mtrGrossWgt").toString());
                //半成品则循环进行计算
                if(map.get("semiFinished").equals("1")){//半成品
                    BomInfoEntity bomInfo = bomInfoService.queryObjectByPrdId(Long.valueOf(map.get("mtrId").toString()));
                    BigDecimal detailPrdGrossWgt = new BigDecimal(bomInfo.getSumGrossWgt() == null ? "1" : bomInfo.getSumGrossWgt().toString());
                    //计算所需要半成品的份数
                    //（【产品配方中半成品所需毛重】*【产品所需数量】）/【半成品配方单份毛重】
                    BigDecimal cpoies = (grossWgt.multiply(orderAmount).setScale(4,BigDecimal.ROUND_HALF_UP)).divide(detailPrdGrossWgt,2,BigDecimal.ROUND_HALF_UP);//份数
                    List<Map> mapList = findAllMtrByPrd2(Long.valueOf(map.get("mtrId").toString()),takeStnId,warehouseId,cpoies);
                    if(mapList != null && mapList.size() > 0){
                        mtrList.addAll(mapList);
                    }

                }else{//原料则直接运算后存入集合
                    BigDecimal orderWgt = grossWgt.multiply(orderAmount).setScale(2,BigDecimal.ROUND_HALF_UP);
                    map.put("orderWgt",orderWgt);
                    mtrList.add(map);
                }
            }
        }
        //重复的原料进行累加，形成唯一结果集
        List<Map> returnList = new ArrayList<>();
        if(mtrList !=null && mtrList.size() > 0){
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
        }
        return returnList;
    }

}

