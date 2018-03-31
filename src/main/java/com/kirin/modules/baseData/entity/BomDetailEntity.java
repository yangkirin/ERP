package com.kirin.modules.baseData.entity;

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
public class BomDetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//配方ID
	private Long bomId;
	private Long typeId;
	private String typeIdName;
	//原料ID
	private Long mtrId;
	private String mtrIdName;
	private String mtrCode;
	private Long takeStnId;
	private String takeStnIdName;
	//切割形状ID
	private Long mtrCutId;
	private String mtrCutIdName;
	//毛重
	private String grossWgt;
	//净重
	private String netWgt;
	//净得率
	private String netRate;
	//熟重
	private String modiWgt;
	//熟得率
	private String modiRate;
	//是否半成品
	private String semiFinished;

	//单价
	private BigDecimal price;
	//成本
	private BigDecimal cost;
	//成本率
	private BigDecimal costRate;

	//创建者
	private String createUser;
	//创建日期
	private Date createDate;
	private String updateUser;
	private Date updateDate;

	private Long mtrExtendId;
	private String mtrExtendDesc;

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
	 * 设置：配方ID
	 */
	public void setBomId(Long bomId) {
		this.bomId = bomId;
	}
	/**
	 * 获取：配方ID
	 */
	public Long getBomId() {
		return bomId;
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
	 * 设置：切割形状ID
	 */
	public void setMtrCutId(Long mtrCutId) {
		this.mtrCutId = mtrCutId;
	}
	/**
	 * 获取：切割形状ID
	 */
	public Long getMtrCutId() {
		return mtrCutId;
	}
	/**
	 * 设置：毛重
	 */
	public void setGrossWgt(String grossWgt) {
		this.grossWgt = grossWgt;
	}
	/**
	 * 获取：毛重
	 */
	public String getGrossWgt() {
		return grossWgt;
	}
	/**
	 * 设置：净重
	 */
	public void setNetWgt(String netWgt) {
		this.netWgt = netWgt;
	}
	/**
	 * 获取：净重
	 */
	public String getNetWgt() {
		return netWgt;
	}
	/**
	 * 设置：净得率
	 */
	public void setNetRate(String netRate) {
		this.netRate = netRate;
	}
	/**
	 * 获取：净得率
	 */
	public String getNetRate() {
		return netRate;
	}
	/**
	 * 设置：熟重
	 */
	public void setModiWgt(String modiWgt) {
		this.modiWgt = modiWgt;
	}
	/**
	 * 获取：熟重
	 */
	public String getModiWgt() {
		return modiWgt;
	}
	/**
	 * 设置：熟得率
	 */
	public void setModiRate(String modiRate) {
		this.modiRate = modiRate;
	}
	/**
	 * 获取：熟得率
	 */
	public String getModiRate() {
		return modiRate;
	}
	/**
	 * 设置：是否半成品
	 */
	public void setSemiFinished(String semiFinished) {
		this.semiFinished = semiFinished;
	}
	/**
	 * 获取：是否半成品
	 */
	public String getSemiFinished() {
		return semiFinished;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getTypeIdName() {
		return typeIdName;
	}

	public void setTypeIdName(String typeIdName) {
		this.typeIdName = typeIdName;
	}

	public String getMtrIdName() {
		return mtrIdName;
	}

	public void setMtrIdName(String mtrIdName) {
		this.mtrIdName = mtrIdName;
	}

	public String getMtrCutIdName() {
		return mtrCutIdName;
	}

	public void setMtrCutIdName(String mtrCutIdName) {
		this.mtrCutIdName = mtrCutIdName;
	}

	public String getMtrCode() {
		return mtrCode;
	}

	public void setMtrCode(String mtrCode) {
		this.mtrCode = mtrCode;
	}

	public String getTakeStnIdName() {
		return takeStnIdName;
	}

	public void setTakeStnIdName(String takeStnIdName) {
		this.takeStnIdName = takeStnIdName;
	}

	public Long getTakeStnId() {
		return takeStnId;
	}

	public void setTakeStnId(Long takeStnId) {
		this.takeStnId = takeStnId;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	public BigDecimal getCostRate() {
		return costRate;
	}

	public void setCostRate(BigDecimal costRate) {
		this.costRate = costRate;
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
