package com.kirin.modules.sales.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kirin.modules.baseData.entity.PrdDataEntity;
import com.kirin.modules.baseData.service.PrdDataService;
import com.kirin.modules.sales.entity.ProductionOrderEntity;
import com.kirin.modules.sales.service.ProductionOrderService;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.sales.entity.ProductionOrderDetailEntity;
import com.kirin.modules.sales.service.ProductionOrderDetailService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 生产订单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-24 11:52:37
 */
@RestController
@RequestMapping("/sales/productionorderdetail")
public class ProductionOrderDetailController {
	@Autowired
	private ProductionOrderDetailService productionOrderDetailService;

    @Autowired
    private PrdDataService prdDataService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
//	@RequiresPermissions("sales:productionorderdetail:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ProductionOrderDetailEntity> productionOrderDetailList = productionOrderDetailService.queryList(query);
		int total = productionOrderDetailService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(productionOrderDetailList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
//	@RequiresPermissions("sales:productionorderdetail:info")
	public R info(@PathVariable("id") Long id){
		ProductionOrderDetailEntity productionOrderDetail = productionOrderDetailService.queryObject(id);
		
		return R.ok().put("productionOrderDetail", productionOrderDetail);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
//	@RequiresPermissions("sales:productionorderdetail:save")
	public R save(@RequestBody ProductionOrderDetailEntity productionOrderDetail){
        //判断产品状态
        PrdDataEntity prdDataEntity = prdDataService.queryObject(productionOrderDetail.getPrdId());
        String status = prdDataEntity.getStatus();
//		System.out.println("?"+status+"?");
        if (status.equals("1")) {    //启用
            //判断是否重复
            Map<String, Object> params = new HashMap<>();
            params.put("productionOrderId", productionOrderDetail.getProductionOrderId());
            List<ProductionOrderDetailEntity> productionOrderDetailList = productionOrderDetailService.queryList(params);
            if (productionOrderDetailList != null && productionOrderDetailList.size() > 0) {
                for (ProductionOrderDetailEntity productionOrderDetailEntity : productionOrderDetailList) {
                    if (productionOrderDetail.getPrdId().equals(productionOrderDetailEntity.getPrdId())) {
                        return R.error("产品已存在列表，请直接进行编辑！");
                    }
                }
            }
            //计算预估收入=(数量*售价）-（数量*定价）
            BigDecimal revenue = new BigDecimal(0);
            revenue = new BigDecimal(productionOrderDetail.getAmount()).multiply(new BigDecimal(productionOrderDetail.getPrice2())).subtract(new BigDecimal(productionOrderDetail.getAmount()).multiply(productionOrderDetail.getCost())).setScale(2, BigDecimal.ROUND_HALF_DOWN);

            productionOrderDetail.setRevenue(revenue.toString());

            productionOrderDetailService.save(productionOrderDetail);

            updateOrderPrdCount(productionOrderDetail.getProductionOrderId());
            return R.ok();
        } else if (status.equals("0")) {    //禁用
            return R.error("产品已被禁用！");
        } else if (status.equals("2")) {    //编辑
            return R.error("产品正在编辑！");
        } else {
            return R.error("产品状态未知！");
        }

	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
//	@RequiresPermissions("sales:productionorderdetail:update")
	public R update(@RequestBody ProductionOrderDetailEntity productionOrderDetail){

		//计算预估收入=(数量*售价）-（数量*定价）
		BigDecimal revenue = new BigDecimal(0);
		revenue = new BigDecimal(productionOrderDetail.getAmount()).multiply(new BigDecimal(productionOrderDetail.getPrice2())).subtract(new BigDecimal(productionOrderDetail.getAmount()).multiply(productionOrderDetail.getCost())).setScale(2,BigDecimal.ROUND_HALF_DOWN);

		productionOrderDetail.setRevenue(revenue.toString());

		productionOrderDetailService.update(productionOrderDetail);

		updateOrderPrdCount(productionOrderDetail.getProductionOrderId());

		return R.ok();
	}

	@Autowired
	private ProductionOrderService productionOrderService;


	/**
	 * 更新订单产品总数
	 * @param orderId
	 */
	public void updateOrderPrdCount(Long orderId){
		BigDecimal sumCount = new BigDecimal(0);
		Map<String,Object> params = new HashMap<>();
		params.put("productionOrderId",orderId);
		List<ProductionOrderDetailEntity> productionOrderDetailList = productionOrderDetailService.queryList(params);
		if(productionOrderDetailList != null && productionOrderDetailList.size() > 0){
			for (ProductionOrderDetailEntity productionOrderDetailEntity : productionOrderDetailList) {
				sumCount = sumCount.add(new BigDecimal(productionOrderDetailEntity.getAmount()));
			}
		}
		ProductionOrderEntity productionOrder = productionOrderService.queryObject(orderId);
		productionOrder.setPrdMount(sumCount.toString());
		productionOrderService.update(productionOrder);
	}

	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sales:productionorderdetail:delete")
	public R delete(@RequestBody Long[] ids){
		productionOrderDetailService.deleteBatch(ids);
		
		return R.ok();
	}

	@RequestMapping("/deleteById")
	public R delete(@RequestParam("id")Long id){
		Long[] ids = new Long[]{id};
		productionOrderDetailService.deleteBatch(ids);

		return R.ok();
	}

	@RequestMapping("/deleteByOrderId")
	public R deleteByOrderId(@RequestParam("orderId")Long orderId){
		productionOrderDetailService.deleteByOrderId(orderId);
		return R.ok();
	}
}
