package com.kirin.modules.storage.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;


/**
 * 盘点单信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-06-09 18:02:45
 */
public class PdInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//盘点单号
	private String pdNo;
	//盘点单类型：0-原料盘点，1-半成品盘点
	private String pdType;
	//开始日期
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	private Date pdStartDate;
	//截止日期
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	private Date pdEndDate;
	//状态,0-已删除，1-初始，2-已确认，3-已结转
	private String pdStatus;
	//盘点机构ID(仓库、站点）
	private Long pdOrgId;
	//机构名称
	private String pdOrgName;
	//
	private Date createDate;
	//
	private String createUser;

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
	 * 设置：盘点单号
	 */
	public void setPdNo(String pdNo) {
		this.pdNo = pdNo;
	}
	/**
	 * 获取：盘点单号
	 */
	public String getPdNo() {
		return pdNo;
	}
	/**
	 * 设置：盘点单类型：0-原料盘点，1-半成品盘点
	 */
	public void setPdType(String pdType) {
		this.pdType = pdType;
	}
	/**
	 * 获取：盘点单类型：0-原料盘点，1-半成品盘点
	 */
	public String getPdType() {
		return pdType;
	}
	/**
	 * 设置：开始日期
	 */
	public void setPdStartDate(Date pdStartDate) {
		this.pdStartDate = pdStartDate;
	}
	/**
	 * 获取：开始日期
	 */
	public Date getPdStartDate() {
		return pdStartDate;
	}
	/**
	 * 设置：截止日期
	 */
	public void setPdEndDate(Date pdEndDate) {
		this.pdEndDate = pdEndDate;
	}
	/**
	 * 获取：截止日期
	 */
	public Date getPdEndDate() {
		return pdEndDate;
	}
	/**
	 * 设置：状态,0-已删除，1-初始，2-已确认，3-已结转
	 */
	public void setPdStatus(String pdStatus) {
		this.pdStatus = pdStatus;
	}
	/**
	 * 获取：状态,0-已删除，1-初始，2-已确认，3-已结转
	 */
	public String getPdStatus() {
		return pdStatus;
	}
	/**
	 * 设置：盘点机构ID(仓库、站点）
	 */
	public void setPdOrgId(Long pdOrgId) {
		this.pdOrgId = pdOrgId;
	}
	/**
	 * 获取：盘点机构ID(仓库、站点）
	 */
	public Long getPdOrgId() {
		return pdOrgId;
	}
	/**
	 * 设置：机构名称
	 */
	public void setPdOrgName(String pdOrgName) {
		this.pdOrgName = pdOrgName;
	}
	/**
	 * 获取：机构名称
	 */
	public String getPdOrgName() {
		return pdOrgName;
	}
	/**
	 * 设置：
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * 获取：
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * 设置：
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：
	 */
	public String getCreateUser() {
		return createUser;
	}
}
