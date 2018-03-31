package com.kirin.modules.baseData.entity;

import sun.nio.cs.ext.Big5;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-31 16:31:30
 */
public class BomInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//配方名称
	private String bomName;
	//拼音码
	private String bomPy;
	//产品ID
	private Long prdId;
	//产品名称
	private String prdIdName;
	//状态
	private String status;

	private BigDecimal cost;
	//备注
	private String remark;
	//创建者
	private String createUser;
	//创建日期
	private Date createDate;

	private String semiFinished;
	private String updateUser;
	private Date updateDate;
	/**
	 * 设置：
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：配方名称
	 */
	public void setBomName(String bomName) {
		this.bomName = bomName;
	}
	/**
	 * 获取：配方名称
	 */
	public String getBomName() {
		return bomName;
	}
	/**
	 * 设置：拼音码
	 */
	public void setBomPy(String bomPy) {
		this.bomPy = bomPy;
	}
	/**
	 * 获取：拼音码
	 */
	public String getBomPy() {
		return bomPy;
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

	public String getPrdIdName() {
		return prdIdName;
	}

	public void setPrdIdName(String prdIdName) {
		this.prdIdName = prdIdName;
	}

	public String getSemiFinished() {
		return semiFinished;
	}

	public void setSemiFinished(String semiFinished) {
		this.semiFinished = semiFinished;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
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
