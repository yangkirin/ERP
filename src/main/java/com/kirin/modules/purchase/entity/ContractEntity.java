package com.kirin.modules.purchase.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 合同信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-12 12:16:47
 */
public class ContractEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//机构ID
	private Long orgId;
	//合同编号
	private String contractNo;
	//合同名称
	private String contractName;
	//合同类型
	private String contractType;
	//甲方
	private String partyA;
	//乙方
	private String partyB;
	//签订日期
	private Date signingDate;
	//到期日
	private Date dueDate;
	//文件地址
	private String fileUrl;
	//状态
	private String status;
	//创建人
	private String createUser;
	//创建日期
	private Date createDate;

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
	 * 设置：机构ID
	 */
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	/**
	 * 获取：机构ID
	 */
	public Long getOrgId() {
		return orgId;
	}
	/**
	 * 设置：合同编号
	 */
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	/**
	 * 获取：合同编号
	 */
	public String getContractNo() {
		return contractNo;
	}
	/**
	 * 设置：合同名称
	 */
	public void setContractName(String contractName) {
		this.contractName = contractName;
	}
	/**
	 * 获取：合同名称
	 */
	public String getContractName() {
		return contractName;
	}
	/**
	 * 设置：合同类型
	 */
	public void setContractType(String contractType) {
		this.contractType = contractType;
	}
	/**
	 * 获取：合同类型
	 */
	public String getContractType() {
		return contractType;
	}
	/**
	 * 设置：甲方
	 */
	public void setPartyA(String partyA) {
		this.partyA = partyA;
	}
	/**
	 * 获取：甲方
	 */
	public String getPartyA() {
		return partyA;
	}
	/**
	 * 设置：乙方
	 */
	public void setPartyB(String partyB) {
		this.partyB = partyB;
	}
	/**
	 * 获取：乙方
	 */
	public String getPartyB() {
		return partyB;
	}
	/**
	 * 设置：签订日期
	 */
	public void setSigningDate(Date signingDate) {
		this.signingDate = signingDate;
	}
	/**
	 * 获取：签订日期
	 */
	public Date getSigningDate() {
		return signingDate;
	}
	/**
	 * 设置：到期日
	 */
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	/**
	 * 获取：到期日
	 */
	public Date getDueDate() {
		return dueDate;
	}
	/**
	 * 设置：文件地址
	 */
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	/**
	 * 获取：文件地址
	 */
	public String getFileUrl() {
		return fileUrl;
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
}
