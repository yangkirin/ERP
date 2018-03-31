package com.kirin.modules.storage.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 入库主记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-28 06:18:42
 */
public class ImportEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//入库单号
	private String importNo;
	//订单ID
	private Long orderId;
	//订单编号
	private String orderNo;
	//供应商ID
	private Long supplierId;
	//供应商名称
	private String supplierName;
	//供应商编号
	private String supplierNo;
	//入库日期
	private Date importDate;
	//状态
	private String status;
	//入库人
	private String createUser;

	private Date exceptionDate;

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
	 * 设置：入库单号
	 */
	public void setImportNo(String importNo) {
		this.importNo = importNo;
	}
	/**
	 * 获取：入库单号
	 */
	public String getImportNo() {
		return importNo;
	}
	/**
	 * 设置：订单ID
	 */
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	/**
	 * 获取：订单ID
	 */
	public Long getOrderId() {
		return orderId;
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
	 * 设置：供应商名称
	 */
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	/**
	 * 获取：供应商名称
	 */
	public String getSupplierName() {
		return supplierName;
	}
	/**
	 * 设置：供应商编号
	 */
	public void setSupplierNo(String supplierNo) {
		this.supplierNo = supplierNo;
	}
	/**
	 * 获取：供应商编号
	 */
	public String getSupplierNo() {
		return supplierNo;
	}
	/**
	 * 设置：入库日期
	 */
	public void setImportDate(Date importDate) {
		this.importDate = importDate;
	}
	/**
	 * 获取：入库日期
	 */
	public Date getImportDate() {
		return importDate;
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
	 * 设置：入库人
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：入库人
	 */
	public String getCreateUser() {
		return createUser;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Date getExceptionDate() {
		return exceptionDate;
	}

	public void setExceptionDate(Date exceptionDate) {
		this.exceptionDate = exceptionDate;
	}
}
