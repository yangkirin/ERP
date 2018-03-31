package com.kirin.modules.purchase.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 采购计划明细
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
public class ProcurementDetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//计划ID
	private Long procurementId;
	//原料ID
	private Long mtrId;
	private String mtrName;
	private String mtrCode;
	private String purchaseNo;
	//供应商
	private Long supplierId;
	private String supplierName;
	private String supplierCode;
	//采购单位
	private String unit;
	//转换率
	private String rate;
	//采购数量
	private BigDecimal count;
	//规格
	private String spec;

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
	 * 设置：原料ID
	 */
	public void setMtrId(Long mtrId) {
		this.mtrId = mtrId;
	}
	/**
	 * 获取：原料ID
	 */
	public Long getMtrId() {
		return mtrId;
	}
	/**
	 * 设置：采购单位
	 */
	public void setUnit(String unit) {
		this.unit = unit;
	}
	/**
	 * 获取：采购单位
	 */
	public String getUnit() {
		return unit;
	}
	/**
	 * 设置：转换率
	 */
	public void setRate(String rate) {
		this.rate = rate;
	}
	/**
	 * 获取：转换率
	 */
	public String getRate() {
		return rate;
	}
	/**
	 * 设置：采购数量
	 */
	public void setCount(BigDecimal count) {
		this.count = count;
	}
	/**
	 * 获取：采购数量
	 */
	public BigDecimal getCount() {
		return count;
	}
	/**
	 * 设置：规格
	 */
	public void setSpec(String spec) {
		this.spec = spec;
	}
	/**
	 * 获取：规格
	 */
	public String getSpec() {
		return spec;
	}

	public String getMtrName() {
		return mtrName;
	}

	public void setMtrName(String mtrName) {
		this.mtrName = mtrName;
	}

	public Long getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getMtrCode() {
		return mtrCode;
	}

	public void setMtrCode(String mtrCode) {
		this.mtrCode = mtrCode;
	}

	public String getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(String purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public String getSupplierCode() {
		return supplierCode;
	}

	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
}
