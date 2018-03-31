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
import com.kirin.common.utils.DateUtils;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;
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
            List<Map> mapList = new ArrayList<>();
            for (ProductionOrderDetailEntity productionOrderDetailEntity:productionOrderDetailEntityList) {
                List<Map> mapListTemp = findAllMtrByPrd(productionOrderDetailEntity.getPrdId(),takeStn,warehouse);
                mapList.addAll(mapListTemp);
                //完善客户信息和产品信息与计算数量
                for (Map mapTemp:mapList) {

                    BigDecimal mtrGrossWgt = new BigDecimal(mapTemp.get("mtrGrossWgt") == null ? "0" : mapTemp.get("mtrGrossWgt").toString());
                    BigDecimal orderAmount = new BigDecimal(productionOrderDetailEntity.getAmount() == null ? "0" : productionOrderDetailEntity.getAmount().toString());

                    BigDecimal mtrAmount = mtrGrossWgt.multiply(orderAmount).setScale(2,BigDecimal.ROUND_HALF_UP);
                    mtrAmount = mtrAmount.divide(new BigDecimal(1000)).setScale(2,BigDecimal.ROUND_HALF_UP);
                    mapTemp.put("orderCount",mtrAmount);
                }
            }

            for (Map mapTemp:mapList) {
                if(returnList.size()<=0){
                    returnList.add(mapTemp);
                }
                for (int i=0;i < returnList.size(); i++) {
                    Map temp = returnList.get(i);
                    if(mapTemp.get("mtrId").toString().equals(temp.get("mtrId").toString())){
                        BigDecimal newCount = new BigDecimal(temp.get("orderCount").toString());
                        BigDecimal oldCount = new BigDecimal(temp.get("orderCount").toString());
                        BigDecimal sumCount = newCount.add(oldCount).setScale(2,BigDecimal.ROUND_HALF_UP);
                        temp.put("orderCount",sumCount);
                    }else{
                        returnList.add(mapTemp);
                    }
                }
            }
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

}

