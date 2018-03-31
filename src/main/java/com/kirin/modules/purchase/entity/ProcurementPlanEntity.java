package com.kirin.modules.purchase.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 采购计划表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
public class ProcurementPlanEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//采购计划编号
	private String procurementNo;
	//期望到货日期
	private Date expectDate;
	//制单日期
	private Date createDate;
	//制单人
	private String createUser;
	//发送日期
	private Date sendDate;
	//确认人
	private String confirmUser;
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
	 * 设置：采购计划编号
	 */
	public void setProcurementNo(String procurementNo) {
		this.procurementNo = procurementNo;
	}
	/**
	 * 获取：采购计划编号
	 */
	public String getProcurementNo() {
		return procurementNo;
	}
	/**
	 * 设置：期望到货日期
	 */
	public void setExpectDate(Date expectDate) {
		this.expectDate = expectDate;
	}
	/**
	 * 获取：期望到货日期
	 */
	public Date getExpectDate() {
		return expectDate;
	}
	/**
	 * 设置：制单日期
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * 获取：制单日期
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * 设置：制单人
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：制单人
	 */
	public String getCreateUser() {
		return createUser;
	}
	/**
	 * 设置：发送日期
	 */
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	/**
	 * 获取：发送日期
	 */
	public Date getSendDate() {
		return sendDate;
	}
	/**
	 * 设置：确认人
	 */
	public void setConfirmUser(String confirmUser) {
		this.confirmUser = confirmUser;
	}
	/**
	 * 获取：确认人
	 */
	public String getConfirmUser() {
		return confirmUser;
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
}
