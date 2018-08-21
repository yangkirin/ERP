package com.kirin.modules.sales.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 生产订单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-24 11:52:37
 */
public class ProductionOrderEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//生产订单编号
	private String productionNo;
	//计划单ID
	private Long planId;
	//计划单编号
	private String planNo;
	//订单类型ID
	private Long orderTypeId;
	//订单类型名称
	private String orderTypeName;
	//客户ID
	private Long customerId;
	//客户编号
	private String customerNo;
	//客户名称
	private String customerName;
	//售点ID
	private Long placeId;
	//售点名称
	private String placeName;
	//备注
	private String remakr;
	//是否是预订单,1-预订单，0-实际订单
	private Long typeId;
	//需求日期
	private String demandDate;
	//状态
	private String status;
	//创建者
	private String createUser;
	//创建日期
	private Date createDate;

	//成本
	private BigDecimal prdCost;
	//收入
	private BigDecimal prdIncome;
	//折后收入
	private BigDecimal discountIncome;
	//产品总数
	private String prdMount;
	//成本率
	private BigDecimal costRate;
	//折扣成本比
	private BigDecimal discountCostRate;
	//
	private Date updateDate;
	//
	private String updateUser;

	private Long outportId;

	private String outportStatus;

	private String outportNo;

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
	 * 设置：生产订单编号
	 */
	public void setProductionNo(String productionNo) {
		this.productionNo = productionNo;
	}
	/**
	 * 获取：生产订单编号
	 */
	public String getProductionNo() {
		return productionNo;
	}
	/**
	 * 设置：计划单ID
	 */
	public void setPlanId(Long planId) {
		this.planId = planId;
	}
	/**
	 * 获取：计划单ID
	 */
	public Long getPlanId() {
		return planId;
	}
	/**
	 * 设置：计划单编号
	 */
	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}
	/**
	 * 获取：计划单编号
	 */
	public String getPlanNo() {
		return planNo;
	}
	/**
	 * 设置：订单类型ID
	 */
	public void setOrderTypeId(Long orderTypeId) {
		this.orderTypeId = orderTypeId;
	}
	/**
	 * 获取：订单类型ID
	 */
	public Long getOrderTypeId() {
		return orderTypeId;
	}
	/**
	 * 设置：订单类型名称
	 */
	public void setOrderTypeName(String orderTypeName) {
		this.orderTypeName = orderTypeName;
	}
	/**
	 * 获取：订单类型名称
	 */
	public String getOrderTypeName() {
		return orderTypeName;
	}
	/**
	 * 设置：客户ID
	 */
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	/**
	 * 获取：客户ID
	 */
	public Long getCustomerId() {
		return customerId;
	}
	/**
	 * 设置：客户编号
	 */
	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
	}
	/**
	 * 获取：客户编号
	 */
	public String getCustomerNo() {
		return customerNo;
	}
	/**
	 * 设置：客户名称
	 */
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	/**
	 * 获取：客户名称
	 */
	public String getCustomerName() {
		return customerName;
	}
	/**
	 * 设置：售点ID
	 */
	public void setPlaceId(Long placeId) {
		this.placeId = placeId;
	}
	/**
	 * 获取：售点ID
	 */
	public Long getPlaceId() {
		return placeId;
	}
	/**
	 * 设置：售点名称
	 */
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	/**
	 * 获取：售点名称
	 */
	public String getPlaceName() {
		return placeName;
	}
	/**
	 * 设置：备注
	 */
	public void setRemakr(String remakr) {
		this.remakr = remakr;
	}
	/**
	 * 获取：备注
	 */
	public String getRemakr() {
		return remakr;
	}

	/**
	 * 设置：typeId
	 */
	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	/**
	 * 获取：typeId
	 */
	public Long getTypeId() {
		return typeId;
	}

	public String getDemandDate() {
		return demandDate;
	}

	public void setDemandDate(String demandDate) {
		this.demandDate = demandDate;
	}

	/**
	 * 设置：状态
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * 设置：创建者
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：创建者
	 */
	public String getCreateUser() {
		return createUser;
	}
	/**
	 * 设置：创建日期
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * 获取：创建日期
	 */
	public Date getCreateDate() {
		return createDate;
	}

	public BigDecimal getPrdCost() {
		return prdCost;
	}

	public void setPrdCost(BigDecimal prdCost) {
		this.prdCost = prdCost;
	}

	public BigDecimal getPrdIncome() {
		return prdIncome;
	}

	public void setPrdIncome(BigDecimal prdIncome) {
		this.prdIncome = prdIncome;
	}

	public BigDecimal getDiscountIncome() {
		return discountIncome;
	}

	public void setDiscountIncome(BigDecimal discountIncome) {
		this.discountIncome = discountIncome;
	}

	public String getPrdMount() {
		return prdMount;
	}

	public void setPrdMount(String prdMount) {
		this.prdMount = prdMount;
	}

	public BigDecimal getCostRate() {
		return costRate;
	}

	public void setCostRate(BigDecimal costRate) {
		this.costRate = costRate;
	}

	public BigDecimal getDiscountCostRate() {
		return discountCostRate;
	}

	public void setDiscountCostRate(BigDecimal discountCostRate) {
		this.discountCostRate = discountCostRate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Long getOutportId() {
		return outportId;
	}

	public void setOutportId(Long outportId) {
		this.outportId = outportId;
	}

	public String getOutportStatus() {
		return outportStatus;
	}

	public void setOutportStatus(String outportStatus) {
		this.outportStatus = outportStatus;
	}

	public String getOutportNo() {
		return outportNo;
	}

	public void setOutportNo(String outportNo) {
		this.outportNo = outportNo;
	}
}
