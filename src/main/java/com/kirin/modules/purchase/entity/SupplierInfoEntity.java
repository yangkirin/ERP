package com.kirin.modules.purchase.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 供应商信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
public class SupplierInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//供应商名称
	private String suppierName;
	//供应商代码
	private String suppierCode;
	//供应商简称
	private String suppierShortName;
	//供应商类型
	private String suppierType;
	//拼音码
	private String suppierPy;
	//联系人
	private String linkMan;
	//联系电话
	private String linkPhone;
	//固定电话
	private String linkTell;
	//地址
	private String address;
	//税率
	private String taxRate;
	//账期
	private String paymentDays;
	//状态
	private String status;
	//创建人
	private String createUser;
	//备注
	private String remark;

	private String typeName;

	private Date createDate;
	private Date updateDate;
	private String updateUser;

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
	 * 设置：供应商名称
	 */
	public void setSuppierName(String suppierName) {
		this.suppierName = suppierName;
	}
	/**
	 * 获取：供应商名称
	 */
	public String getSuppierName() {
		return suppierName;
	}
	/**
	 * 设置：供应商代码
	 */
	public void setSuppierCode(String suppierCode) {
		this.suppierCode = suppierCode;
	}
	/**
	 * 获取：供应商代码
	 */
	public String getSuppierCode() {
		return suppierCode;
	}
	/**
	 * 设置：供应商简称
	 */
	public void setSuppierShortName(String suppierShortName) {
		this.suppierShortName = suppierShortName;
	}
	/**
	 * 获取：供应商简称
	 */
	public String getSuppierShortName() {
		return suppierShortName;
	}

	public String getSuppierType() {
		return suppierType;
	}

	public void setSuppierType(String suppierType) {
		this.suppierType = suppierType;
	}

	/**
	 * 设置：拼音码
	 */
	public void setSuppierPy(String suppierPy) {
		this.suppierPy = suppierPy;
	}
	/**
	 * 获取：拼音码
	 */
	public String getSuppierPy() {
		return suppierPy;
	}
	/**
	 * 设置：联系人
	 */
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}
	/**
	 * 获取：联系人
	 */
	public String getLinkMan() {
		return linkMan;
	}
	/**
	 * 设置：联系电话
	 */
	public void setLinkPhone(String linkPhone) {
		this.linkPhone = linkPhone;
	}
	/**
	 * 获取：联系电话
	 */
	public String getLinkPhone() {
		return linkPhone;
	}
	/**
	 * 设置：固定电话
	 */
	public void setLinkTell(String linkTell) {
		this.linkTell = linkTell;
	}
	/**
	 * 获取：固定电话
	 */
	public String getLinkTell() {
		return linkTell;
	}
	/**
	 * 设置：地址
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 获取：地址
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置：税率
	 */
	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}
	/**
	 * 获取：税率
	 */
	public String getTaxRate() {
		return taxRate;
	}
	/**
	 * 设置：账期
	 */
	public void setPaymentDays(String paymentDays) {
		this.paymentDays = paymentDays;
	}
	/**
	 * 获取：账期
	 */
	public String getPaymentDays() {
		return paymentDays;
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
	 * 设置：创建人
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：创建人
	 */
	public String getCreateUser() {
		return createUser;
	}
	/**
	 * 设置：备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：备注
	 */
	public String getRemark() {
		return remark;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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
}
