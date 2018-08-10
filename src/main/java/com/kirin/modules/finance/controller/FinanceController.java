package com.kirin.modules.finance.controller;

import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;
import com.kirin.modules.finance.service.FinanceService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/finance/search")
public class FinanceController {

    @Autowired
    private FinanceService financeService;

    //Payable--应付
    /**
     * 列表
     */
    @RequestMapping("/payableSumInfo")
    @RequiresPermissions("finance:search:payableSumInfo")
    public R payableSumInfo(@RequestParam Map<String, Object> params){
        Long supplierId = (params.get("supplierId") == null || params.get("supplierId").toString().equals("0")) ? null : Long.valueOf(params.get("supplierId").toString());
        params.put("supplierId",supplierId);

        //查询列表数据
        List<Map> pdDetailList = financeService.payableSumInfo(params);
        int total = pdDetailList != null ? pdDetailList.size() : 0;

        PageUtils pageUtil = new PageUtils(pdDetailList, total, 999999999, 1);

        return R.ok().put("page", pageUtil);
    }

    @RequestMapping("/payableSumDetail")
    @RequiresPermissions("finance:search:payableSumDetail")
    public R payableSumDetail(@RequestParam Map<String, Object> params){
        Long supplierId = (params.get("supplierId") == null || params.get("supplierId").toString().equals("0")) ? null : Long.valueOf(params.get("supplierId").toString());
        params.put("supplierId",supplierId);

        //查询列表数据
        List<Map> resultList = financeService.payableSumDetail(params);
        int total = resultList != null ? resultList.size() : 0;

        PageUtils pageUtil = new PageUtils(resultList, total, 999999999, 1);

        return R.ok().put("page", pageUtil);
    }

    //receivable --应收
    @RequestMapping("/receivableSumInfo")
    @RequiresPermissions("finance:search:receivableSumInfo")
    public R receivableSumInfo(@RequestParam Map<String, Object> params){

        Long customerId = (params.get("customerId") == null || params.get("customerId").toString().equals("0")) ? null : Long.valueOf(params.get("customerId").toString());
        params.put("customerId",customerId);

        //查询列表数据
        List<Map> resultList = financeService.receivableSumInfo(params);
        int total = resultList != null ? resultList.size() : 0;

        PageUtils pageUtil = new PageUtils(resultList, total, 999999999, 1);

        return R.ok().put("page", pageUtil);
    }


    //receivable --应收明细
    @RequestMapping("/receivableSumDetail")
    @RequiresPermissions("finance:search:receivableSumDetail")
    public R receivableSumDetail(@RequestParam Map<String, Object> params){
        Long customerId = (params.get("customerId") == null || params.get("customerId").toString().equals("0")) ? null : Long.valueOf(params.get("customerId").toString());
        params.put("customerId",customerId);

        //查询列表数据
        List<Map> resultList = financeService.receivableSumDetail(params);
        int total = resultList != null ? resultList.size() : 0;

        PageUtils pageUtil = new PageUtils(resultList, total, 999999999, 1);

        return R.ok().put("page", pageUtil);
    }

    //成本总表
    @RequestMapping("/costreportInfo")
    @RequiresPermissions("finance:search:costreportInfo")
    public R costreportInfo(@RequestParam Map<String, Object> params){

        Long customerId = (params.get("customerId") == null || params.get("customerId").toString().equals("0")) ? null : Long.valueOf(params.get("customerId").toString());
        params.put("customerId",customerId);

        //查询列表数据
        List<Map> resultList = financeService.costreportInfo(params);
        int total = resultList != null ? resultList.size() : 0;

        PageUtils pageUtil = new PageUtils(resultList, total, 999999999, 1);

        return R.ok().put("page", pageUtil);
    }

    //成本总表
    @RequestMapping("/costreportDetail")
    @RequiresPermissions("finance:search:costreportDetail")
    public R costreportDetail(@RequestParam Map<String, Object> params){

        Long customerId = (params.get("customerId") == null || params.get("customerId").toString().equals("0")) ? null : Long.valueOf(params.get("customerId").toString());
        params.put("customerId",customerId);

        //查询列表数据
        List<Map> resultList = financeService.costreportDetail(params);
        int total = resultList != null ? resultList.size() : 0;

        PageUtils pageUtil = new PageUtils(resultList, total, 999999999, 1);

        return R.ok().put("page", pageUtil);
    }

    //成本总表
    @RequestMapping("/costreportHead")
    @RequiresPermissions("finance:search:costreportHead")
    public R costreportHead(@RequestParam Map<String, Object> params){

        Long customerId = (params.get("customerId") == null || params.get("customerId").toString().equals("0")) ? null : Long.valueOf(params.get("customerId").toString());
        params.put("customerId",customerId);

        //查询列表数据
        List<Map> resultList = financeService.costreportHead(params);

        //增加低值易耗类{"PRICEMONEY":3752.2,"PRD_TYPE_NAME":"寿司类","AMOUNT":630.0,"SUMCOST":1189.9,"PERCENT":"31.71%"}
        Map map = new HashMap();
        map.put("PRD_TYPE_NAME","低值易耗");
        map.put("PRICEMONEY","营收");
        map.put("AMOUNT","数量");
        map.put("SUMCOST","成本");
        map.put("PERCENT","成本率");

        resultList.add(map);

        int total = resultList != null ? resultList.size() : 0;

        PageUtils pageUtil = new PageUtils(resultList, total, 999999999, 1);

        return R.ok().put("dataList", resultList);
    }

}
