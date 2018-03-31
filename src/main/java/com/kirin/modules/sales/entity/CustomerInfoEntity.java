package com.kirin.modules.sales.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 客户信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
public class CustomerInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//客户名称
	private String customerName;
	//客户代码
	private String customerCode;
	//拼音码
	private String customerPy;
	//简称
	private String customerShortName;
	//联系人
	private String linkman;
	//联系电话
	private String linkphone;
	//地址
	private String address;
	//状态
	private String status;
	//备注
	private String remark;

	//创建者
	private String createUser;
	//创建日期
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
	 * 设置：客户代码
	 */
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	/**
	 * 获取：客户代码
	 */
	public String getCustomerCode() {
		return customerCode;
	}
	/**
	 * 设置：拼音码
	 */
	public void setCustomerPy(String customerPy) {
		this.customerPy = customerPy;
	}
	/**
	 * 获取：拼音码
	 */
	public String getCustomerPy() {
		return customerPy;
	}
	/**
	 * 设置：简称
	 */
	public void setCustomerShortName(String customerShortName) {
		this.customerShortName = customerShortName;
	}
	/**
	 * 获取：简称
	 */
	public String getCustomerShortName() {
		return customerShortName;
	}
	/**
	 * 设置：联系人
	 */
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	/**
	 * 获取：联系人
	 */
	public String getLinkman() {
		return linkman;
	}
	/**
	 * 设置：联系电话
	 */
	public void setLinkphone(String linkphone) {
		this.linkphone = linkphone;
	}
	/**
	 * 获取：联系电话
	 */
	public String getLinkphone() {
		return linkphone;
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
