package com.kirin.modules.purchase.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 订单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
public class OrderInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//订单编号
	private String orderNo;
	//供应商ID
	private Long supplierId;
	private String supplierName;
	//计划ID
	private Long procurementId;
	private String procurementNo;
	//期望到货日期
	private String exceptionDate;
	//状态
	private String status;

	private BigDecimal orderSumPrice;

	private BigDecimal inSumPrice;

	private String createUser;
	private Date createDate;
	private String updateUser;
	private Date updateDate;

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
	 * 设置：订单编号
	 */
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	/**
	 * 获取：订单编号
	 */
	public String getOrderNo() {
		return orderNo;
	}
	/**
	 * 设置：供应商ID
	 */
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	/**
	 * 获取：供应商ID
	 */
	public Long getSupplierId() {
		return supplierId;
	}
	/**
	 * 设置：计划ID
	 */
	public void setProcurementId(Long procurementId) {
		this.procurementId = procurementId;
	}
	/**
	 * 获取：计划ID
	 */
	public Long getProcurementId() {
		return procurementId;
	}
	/**
	 * 设置：期望到货日期
	 */
	public void setExceptionDate(String exceptionDate) {
		this.exceptionDate = exceptionDate;
	}
	/**
	 * 获取：期望到货日期
	 */
	public String getExceptionDate() {
		return exceptionDate;
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

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getProcurementNo() {
		return procurementNo;
	}

	public void setProcurementNo(String procurementNo) {
		this.procurementNo = procurementNo;
	}

	public BigDecimal getOrderSumPrice() {
		return orderSumPrice;
	}

	public void setOrderSumPrice(BigDecimal orderSumPrice) {
		this.orderSumPrice = orderSumPrice;
	}

	public BigDecimal getInSumPrice() {
		return inSumPrice;
	}

	public void setInSumPrice(BigDecimal inSumPrice) {
		this.inSumPrice = inSumPrice;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
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
}
