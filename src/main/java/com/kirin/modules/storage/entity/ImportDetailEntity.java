package com.kirin.modules.storage.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 入库单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-28 06:18:42
 */
public class ImportDetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//入库单ID
	private Long importId;
	//原料ID
	private Long mtrId;
	//原料编号
	private String mtrNo;
	private String mtrName;
	private String taxRate;

	//入库单位
	private String inUnit;
	//入库转换率
	private String inRate;
	//采购数量
	private String orderCount;
	//采购单价
	private BigDecimal orderPrice;
	//采购金额
	private BigDecimal orderSumPrice;
	//入库数量
	private String inCount;
	//入库单价
	private BigDecimal inPrice;
	//入库金额
	private BigDecimal inSumPrice;
	private BigDecimal orderMtrWgt;
	//入库重量
	private String inWgt;
	//入库日期
	private String inDate;
	//状态
	private String status;

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
	 * 设置：入库单ID
	 */
	public void setImportId(Long importId) {
		this.importId = importId;
	}
	/**
	 * 获取：入库单ID
	 */
	public Long getImportId() {
		return importId;
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
	 * 设置：原料编号
	 */
	public void setMtrNo(String mtrNo) {
		this.mtrNo = mtrNo;
	}
	/**
	 * 获取：原料编号
	 */
	public String getMtrNo() {
		return mtrNo;
	}
	/**
	 * 设置：入库单位
	 */
	public void setInUnit(String inUnit) {
		this.inUnit = inUnit;
	}
	/**
	 * 获取：入库单位
	 */
	public String getInUnit() {
		return inUnit;
	}
	/**
	 * 设置：入库转换率
	 */
	public void setInRate(String inRate) {
		this.inRate = inRate;
	}
	/**
	 * 获取：入库转换率
	 */
	public String getInRate() {
		return inRate;
	}
	/**
	 * 设置：采购数量
	 */
	public void setOrderCount(String orderCount) {
		this.orderCount = orderCount;
	}
	/**
	 * 获取：采购数量
	 */
	public String getOrderCount() {
		return orderCount;
	}
	/**
	 * 设置：采购单价
	 */
	public void setOrderPrice(BigDecimal orderPrice) {
		this.orderPrice = orderPrice;
	}
	/**
	 * 获取：采购单价
	 */
	public BigDecimal getOrderPrice() {
		return orderPrice;
	}
	/**
	 * 设置：采购金额
	 */
	public void setOrderSumPrice(BigDecimal orderSumPrice) {
		this.orderSumPrice = orderSumPrice;
	}
	/**
	 * 获取：采购金额
	 */
	public BigDecimal getOrderSumPrice() {
		return orderSumPrice;
	}
	/**
	 * 设置：入库数量
	 */
	public void setInCount(String inCount) {
		this.inCount = inCount;
	}
	/**
	 * 获取：入库数量
	 */
	public String getInCount() {
		return inCount;
	}
	/**
	 * 设置：入库单价
	 */
	public void setInPrice(BigDecimal inPrice) {
		this.inPrice = inPrice;
	}
	/**
	 * 获取：入库单价
	 */
	public BigDecimal getInPrice() {
		return inPrice;
	}
	/**
	 * 设置：入库金额
	 */
	public void setInSumPrice(BigDecimal inSumPrice) {
		this.inSumPrice = inSumPrice;
	}
	/**
	 * 获取：入库金额
	 */
	public BigDecimal getInSumPrice() {
		return inSumPrice;
	}
	/**
	 * 设置：入库重量
	 */
	public void setInWgt(String inWgt) {
		this.inWgt = inWgt;
	}
	/**
	 * 获取：入库重量
	 */
	public String getInWgt() {
		return inWgt;
	}
	/**
	 * 设置：入库日期
	 */
	public void setInDate(String inDate) {
		this.inDate = inDate;
	}
	/**
	 * 获取：入库日期
	 */
	public String getInDate() {
		return inDate;
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

	public String getMtrName() {
		return mtrName;
	}

	public void setMtrName(String mtrName) {
		this.mtrName = mtrName;
	}

	public String getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}

	public BigDecimal getOrderMtrWgt() {
		return orderMtrWgt;
	}

	public void setOrderMtrWgt(BigDecimal orderMtrWgt) {
		this.orderMtrWgt = orderMtrWgt;
	}
}
