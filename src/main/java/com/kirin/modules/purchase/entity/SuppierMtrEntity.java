package com.kirin.modules.purchase.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 供应商供应产品信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
public class SuppierMtrEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//供应商ID
	private Long suppierId;
	private String suppierIdName;
	private String suppierCode;
	//原料ID
	private Long mtrId;
	private String mtrIdName;

	private Long mtrExtendId;
	private String mtrExtendDesc;
	//采购编码
	private String purchaseNo;
	//采购价
	private BigDecimal price;
	//状态
	private String status;
	//上次编辑人
	private String lastEditUser;
	//上次编辑状态
	private Date lastEditDate;

	private String mtrPy;

	private Date createDate;
	private String createUser;
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
	 * 设置：采购编码
	 */
	public void setPurchaseNo(String purchaseNo) {
		this.purchaseNo = purchaseNo;
	}
	/**
	 * 获取：采购编码
	 */
	public String getPurchaseNo() {
		return purchaseNo;
	}
	/**
	 * 设置：采购价
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * 获取：采购价
	 */
	public BigDecimal getPrice() {
		return price;
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
	 * 设置：上次编辑人
	 */
	public void setLastEditUser(String lastEditUser) {
		this.lastEditUser = lastEditUser;
	}
	/**
	 * 获取：上次编辑人
	 */
	public String getLastEditUser() {
		return lastEditUser;
	}
	/**
	 * 设置：上次编辑状态
	 */
	public void setLastEditDate(Date lastEditDate) {
		this.lastEditDate = lastEditDate;
	}
	/**
	 * 获取：上次编辑状态
	 */
	public Date getLastEditDate() {
		return lastEditDate;
	}

	public String getSuppierIdName() {
		return suppierIdName;
	}

	public void setSuppierIdName(String suppierIdName) {
		this.suppierIdName = suppierIdName;
	}

	public String getMtrIdName() {
		return mtrIdName;
	}

	public void setMtrIdName(String mtrIdName) {
		this.mtrIdName = mtrIdName;
	}

	public String getSuppierCode() {
		return suppierCode;
	}

	public void setSuppierCode(String suppierCode) {
		this.suppierCode = suppierCode;
	}

	public String getMtrPy() {
		return mtrPy;
	}

	public void setMtrPy(String mtrPy) {
		this.mtrPy = mtrPy;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Long getMtrExtendId() {
		return mtrExtendId;
	}

	public void setMtrExtendId(Long mtrExtendId) {
		this.mtrExtendId = mtrExtendId;
	}

	public String getMtrExtendDesc() {
		return mtrExtendDesc;
	}

	public void setMtrExtendDesc(String mtrExtendDesc) {
		this.mtrExtendDesc = mtrExtendDesc;
	}
}
