package com.kirin.modules.storage.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 出库记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-12-25 23:45:15
 */
public class OutportInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//出库单号
	private String outporrtNo;
	//生产订单ID
	private Long orderId;
	//客户ID
	private Long customerId;
	//客户名称
	private String customerName;
	//客户编号
	private String customerNo;
	//产品ID
	private Long prdId;
	private Long placeId;
	//订单类型
	private Long orderTypeId;
	//订单类型名称
	private String orderTypeName;
	//需求日期
	private String demandDate;
	//出库日期
	private String outportDate;
	//状态
	private String status;
	private String remark;
	//操作人
	private String createUser;

	private Date createDate;

	private String updateUser;

	private Date updateDate;

	private String placeName;

	private String productionNo;

	public String getOutportDate() {
		return outportDate;
	}

	public void setOutportDate(String outportDate) {
		this.outportDate = outportDate;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getProductionNo() {
		return productionNo;
	}

	public void setProductionNo(String productionNo) {
		this.productionNo = productionNo;
	}

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
	 * 设置：出库单号
	 */
	public void setOutporrtNo(String outporrtNo) {
		this.outporrtNo = outporrtNo;
	}
	/**
	 * 获取：出库单号
	 */
	public String getOutporrtNo() {
		return outporrtNo;
	}
	/**
	 * 设置：生产订单ID
	 */
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	/**
	 * 获取：生产订单ID
	 */
	public Long getOrderId() {
		return orderId;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
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
	 * 设置：需求日期
	 */
	public void setDemandDate(String demandDate) {
		this.demandDate = demandDate;
	}

	/**
	 * 获取需求日期
	 */
	public String getDemandDate() {
		return demandDate;
	}

	/**
	 * 设置：出库日期
	 */
	public void setOutDate(String outportDate) {
		this.outportDate = outportDate;
	}
	/**
	 * 获取：出库日期
	 */
	public String getOutDate() {
		return outportDate;
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
	 * 设置：操作人
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：操作人
	 */
	public String getCreateUser() {
		return createUser;
	}

	public Long getOrderTypeId() {
		return orderTypeId;
	}

	public void setOrderTypeId(Long orderTypeId) {
		this.orderTypeId = orderTypeId;
	}

	public String getOrderTypeName() {
		return orderTypeName;
	}

	public void setOrderTypeName(String orderTypeName) {
		this.orderTypeName = orderTypeName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Long getPlaceId() {
		return placeId;
	}

	public void setPlaceId(Long placeId) {
		this.placeId = placeId;
	}
}
