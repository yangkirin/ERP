package com.kirin.modules.purchase.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 供应商原料报价信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
public class QuotationEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//报价日期
	private Date quotationDate;
	//供应商ID
	private Long suppierId;
	//原料ID
	private Long mtrId;
	//本次报价
	private BigDecimal currentPrice;
	//上次报价
	private BigDecimal lastPrice;
	//操作员
	private String operationUser;

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
	 * 设置：报价日期
	 */
	public void setQuotationDate(Date quotationDate) {
		this.quotationDate = quotationDate;
	}
	/**
	 * 获取：报价日期
	 */
	public Date getQuotationDate() {
		return quotationDate;
	}
	/**
	 * 设置：供应商ID
	 */
	public void setSuppierId(Long suppierId) {
		this.suppierId = suppierId;
	}
	/**
	 * 获取：供应商ID
	 */
	public Long getSuppierId() {
		return suppierId;
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
	 * 设置：本次报价
	 */
	public void setCurrentPrice(BigDecimal currentPrice) {
		this.currentPrice = currentPrice;
	}
	/**
	 * 获取：本次报价
	 */
	public BigDecimal getCurrentPrice() {
		return currentPrice;
	}
	/**
	 * 设置：上次报价
	 */
	public void setLastPrice(BigDecimal lastPrice) {
		this.lastPrice = lastPrice;
	}
	/**
	 * 获取：上次报价
	 */
	public BigDecimal getLastPrice() {
		return lastPrice;
	}
	/**
	 * 设置：操作员
	 */
	public void setOperationUser(String operationUser) {
		this.operationUser = operationUser;
	}
	/**
	 * 获取：操作员
	 */
	public String getOperationUser() {
		return operationUser;
	}
}
