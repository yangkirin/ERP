package com.kirin.modules.sales.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 生产订单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-24 11:52:37
 */
public class ProductionOrderDetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//生产订单ID
	private Long productionOrderId;
	//生产订单编号
	private String productionOrderNo;
	//产品ID
	private Long prdId;
	//产品编号
	private String prdNo;
	//产品名称
	private String prdName;
	//产品类型ID
	private Long prdTypeId;
	//产品类型名称
	private String prdTypeName;
	//需求数量
	private String amount;
	//定价
	private String price1;
	//售价
	private String price2;
	//成本
	private BigDecimal cost;
	//预估收入
	private String revenue;

	/**
	 * 设置：ID
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：ID
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：生产订单ID
	 */
	public void setProductionOrderId(Long productionOrderId) {
		this.productionOrderId = productionOrderId;
	}
	/**
	 * 获取：生产订单ID
	 */
	public Long getProductionOrderId() {
		return productionOrderId;
	}
	/**
	 * 设置：生产订单编号
	 */
	public void setProductionOrderNo(String productionOrderNo) {
		this.productionOrderNo = productionOrderNo;
	}
	/**
	 * 获取：生产订单编号
	 */
	public String getProductionOrderNo() {
		return productionOrderNo;
	}
	/**
	 * 设置：产品ID
	 */
	public void setPrdId(Long prdId) {
		this.prdId = prdId;
	}
	/**
	 * 获取：产品ID
	 */
	public Long getPrdId() {
		return prdId;
	}
	/**
	 * 设置：产品编号
	 */
	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}
	/**
	 * 获取：产品编号
	 */
	public String getPrdNo() {
		return prdNo;
	}
	/**
	 * 设置：产品名称
	 */
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	/**
	 * 获取：产品名称
	 */
	public String getPrdName() {
		return prdName;
	}
	/**
	 * 设置：产品类型ID
	 */
	public void setPrdTypeId(Long prdTypeId) {
		this.prdTypeId = prdTypeId;
	}
	/**
	 * 获取：产品类型ID
	 */
	public Long getPrdTypeId() {
		return prdTypeId;
	}
	/**
	 * 设置：产品类型名称
	 */
	public void setPrdTypeName(String prdTypeName) {
		this.prdTypeName = prdTypeName;
	}
	/**
	 * 获取：产品类型名称
	 */
	public String getPrdTypeName() {
		return prdTypeName;
	}
	/**
	 * 设置：需求数量
	 */
	public void setAmount(String amount) {
		this.amount = amount;
	}
	/**
	 * 获取：需求数量
	 */
	public String getAmount() {
		return amount;
	}
	/**
	 * 设置：定价
	 */
	public void setPrice1(String price1) {
		this.price1 = price1;
	}
	/**
	 * 获取：定价
	 */
	public String getPrice1() {
		return price1;
	}
	/**
	 * 设置：售价
	 */
	public void setPrice2(String price2) {
		this.price2 = price2;
	}
	/**
	 * 获取：售价
	 */
	public String getPrice2() {
		return price2;
	}
	/**
	 * 设置：成本
	 */
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	/**
	 * 获取：成本
	 */
	public BigDecimal getCost() {
		return cost;
	}
	/**
	 * 设置：预估收入
	 */
	public void setRevenue(String revenue) {
		this.revenue = revenue;
	}
	/**
	 * 获取：预估收入
	 */
	public String getRevenue() {
		return revenue;
	}
}
