package com.kirin.modules.common.controller;

import com.kirin.common.utils.*;
import com.kirin.modules.baseData.entity.TypeInfoEntity;
import com.kirin.modules.baseData.service.TypeInfoService;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.common.utils.CommonUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/common/commonUtil")
public class CommonUtil {

    @Autowired
    private CommonUtilService commonUtilService;

    @Autowired
    private TypeInfoService typeInfoService;

    @RequestMapping("/word2pinying/{word}")
    public R pinyingCode(@PathVariable("word") String word){
        String code = PinyinUtil.getPinYinHeadUperChar(word);
        return R.ok().put("pinying", code);
    }

    @RequestMapping("/getCommbox")
    public R getCommbox(@RequestParam("tableName") String tableName,@RequestParam("returnField") String returnField,@RequestParam("searchCond") String searchId){
        String[] fieldNameArr = returnField.split(":");
        String[] searchArr = searchId.split(":");

        commonUtilService.getCommbox(tableName,fieldNameArr,searchArr);

        return R.ok().put("dataJson","111");
    }


    @RequestMapping("/getTableMaxId")
    public R getTableMaxId(@RequestParam("tableName") String tableName,@RequestParam("id") String id){
        Integer maxId = commonUtilService.getTableMaxId(tableName,id);
        String idStr = String.format("%05d",maxId);
        return R.ok().put("maxNo",idStr);
    }


    @RequestMapping("/createNewNo")
    public R createNewNo(@RequestParam("tableName") String tableName,@RequestParam("id") String id,@RequestParam("typeInfoId") String typeInfoId){
        //1.一层No
        Integer maxId = commonUtilService.getTableMaxId(tableName,id);
        String idStr = String.format("%05d",maxId);


        TypeInfoEntity typeInfoEntity = typeInfoService.queryObject(Long.valueOf(typeInfoId));
        idStr = String.format(typeInfoEntity.getTypeCode()+"%s",idStr);

        while (typeInfoEntity.getParentId() != 0){
            typeInfoEntity = typeInfoService.queryObject(typeInfoEntity.getParentId());
            idStr = String.format(typeInfoEntity.getTypeCode()+"%s",idStr);
        }
        return R.ok().put("newNo",idStr);
    }

    @RequestMapping("/getFieldData")
    public R getFieldData(@RequestParam("tableName")String tableName,@RequestParam("returnField")String returnField,@RequestParam("fieldName")String fieldName,@RequestParam("searchWord")String searchWord){
        String[] fieldNameArr = fieldName.split(":");
        List<String> data_arr = commonUtilService.getFieldData(tableName,returnField,fieldNameArr,searchWord);
        return R.ok().put("data",data_arr);
    }

    @RequestMapping("/getTableData")
    public R getTableData(@RequestParam("tableName")String tableName,@RequestParam("searchWord")String searchWord,@RequestParam("fieldName")String fieldName){
        String[] fieldNameArr = fieldName.split(":");
        List<Map> data_arr = commonUtilService.getTableData(tableName,searchWord,fieldNameArr);
        return R.ok().put("data",data_arr);
    }

    @RequestMapping("/getTableNewNo")
    public R getTableNewNo(@RequestParam("tableName")String tableName,@RequestParam("noField")String noField,@RequestParam(value="length",required = false)Long length){
        String newNo = "";
        Long no = 0L;
        String currentNo = commonUtilService.getTableNewNo(tableName,noField);
        if(length != null && length > 0){
            if(currentNo != null && !currentNo.equals("")){
                no = Long.valueOf(currentNo);
                no = Long.valueOf(currentNo);
                no = no+1;
                newNo = String.format("%0"+length+"d",no);
            }else{
                newNo = String.format("%0"+length+"d",1);
            }
        }else{
            if(currentNo == null || currentNo.equals("")){
                currentNo = "000";
            }
            int len = currentNo.length();
            if(currentNo != null && !currentNo.equals("")){
                if(currentNo.length() >= 8){
                    //yyyyMMdd+0000
                    no = Long.valueOf(currentNo.substring(8));
                    newNo = new CommonUtils().createNoByDate(no+1);
                }else{
                    no = Long.valueOf(currentNo);
                    no = no+1;
                    newNo = String.format("%0"+len+"d",no);
                }
            }
        }
        return R.ok().put("newNo",newNo);
    }

    public String createDateNewNo(String tableName,String noField){

        return "";
    }


    public String getTableNewNoStr(String tableName,String noField){
        Long no = 0L;
        String currentNo = commonUtilService.getTableNewNo(tableName,noField);
        if(currentNo != null && !currentNo.equals("")){
            //yyyyMMdd+0000
            no = Long.valueOf(currentNo.substring(8));
        }
        no = no+1;
        return new CommonUtils().createNoByDate(no);
    }

    @RequestMapping("/getDataToCommbox")
    public R getDataToCommbox(@RequestParam("tableName")String tableaName,@RequestParam("search")String search,@RequestParam("returnField")String returnField){
        List<Map> map = commonUtilService.getDataToCommbox(tableaName,search,returnField);

        Map<String,String> map_empty = new HashMap<>();
        map_empty.put("value","0");
        map_empty.put("text","空");

        map.add(map_empty);
        return R.ok().put("data",map);
    }

    @RequestMapping("/compBomCount")
    public R compBomCount(@RequestParam("id") Long id,@RequestParam("type") String type){
        String count = commonUtilService.compBomCount(id,type);
        if(count == null || count.equals("")){
            count = "0";
        }
        return R.ok().put("count",count);
    }

    /**
     * 根据条件查询是否存在结果，可用于针对表某一字段的值做唯一性校验
     * @param searchFiled
     * @param tableName
     * @param checkStr
     * @return
     */
    public R checkNameRepeat(@RequestParam("searchFiled")String searchFiled,@RequestParam("tableName")String tableName,@RequestParam("checkStr")String checkStr){
        if(StringUtils.isEmpty(searchFiled) || StringUtils.isEmpty(tableName) || StringUtils.isEmpty(checkStr)){
            return R.error("参数错误！请联系管理员...");
        }
        String count = commonUtilService.checkNameRepeat(searchFiled,tableName,checkStr);
        return R.ok().put("count",count);
    }


    /**
     * 创建新的单据号
     * @param billType:单据类型（0-采购单，1-采购入库单，2-领料出库单，3-客户订单，4-盘点单）
     * @return
     */
    @RequestMapping("/createBillNo")
    public R createBillNo(@RequestParam("billType") String billType){
//        StringBuffer newBillNo = new StringBuffer("");
        if(billType == null || billType.equals("")){
            return R.error("单据类型未知，无法生成单据号！请联系管理员...");
        }
//        String currentMaxNo = getTableMaxBillNo(billType);
//        String newNo = "0000";
//        String currentDateStr = DateUtils.format(new Date(),"yyyyMMdd");
//        if(currentMaxNo != null && !currentMaxNo.equals("")){
//            Long maxNo = Long.valueOf(currentMaxNo.substring(10));
//            Long seq = Long.valueOf(maxNo)+1;
//            newNo = String.format("%04d",seq);
//        }
//
//        String billCode = "";
//        //根据单据类型来获取对应单据的最新单据号，生成新的单据号
//        //单据号生成规则：单据简称+8位YYYYMMDD+4位顺序号
//        switch(billType){
//            case "0":
//                billCode = "CG";
//                break;
//            case "1":
//                billCode = "RK";
//                break;
//            case "2":
//                billCode = "CK";
//                break;
//            case "3":
//                billCode = "XS";
//                break;
//            case "4":
//                billCode = "PD";
//                break;
//            default:
//                break;
//        }
//        newBillNo.append(billCode);
//        newBillNo.append(currentDateStr);
//        newBillNo.append(newNo.toString());
        String newBillNo = commonUtilService.createBillNo(billType);
        return R.ok().put("newBillNo",newBillNo);
    }


//    /**
//     *
//     * @param billType:单据类型（0-采购单，1-采购入库单，2-领料出库单，3-客户订单，4-盘点单）
//     * @return
//     */
//    public String getTableMaxBillNo(String billType){
//        String likeDateStr = DateUtils.format(new Date(),"yyyyMMdd");
//        String returnFiled = "";
//        String tableName = "";
//        switch(billType){
//            case "0":
//                returnFiled = "ORDER_NO";
//                tableName = "tb_order_info";
//                break;
//            case "1":
//                returnFiled = "IMPORT_NO";
//                tableName = "tb_import";
//                break;
//            case "2":
//                returnFiled = "OUTPORRT_NO";
//                tableName = "tb_outport_info";
//                break;
//            case "3":
//                returnFiled = "PRODUCTION_NO";
//                tableName = "tb_production_order";
//                break;
//            case "4":
//                returnFiled = "STOCKTAKING_NO";
//                tableName = "tb_stocktaking";
//                break;
//            default:
//                    break;
//        }
//        String currentMaxNo = commonUtilService.getTableMaxNo(returnFiled,tableName,likeDateStr);
//        return currentMaxNo;
//
//    }

    public static void main(String[] args){
//        R s = new CommonUtil().createBillNo("0");
//        System.out.println(s.get("newBillNo"));
    }
}
