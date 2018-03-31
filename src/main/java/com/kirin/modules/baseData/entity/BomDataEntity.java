package com.kirin.modules.baseData.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 配方信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
public class BomDataEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//产品ID
	private Long prdId;
	private String prdName;
	//原料ID
	private Long mtrId;
	private String mtrName;
	//切割形状ID
	private Long mtrCutId;
	private String mtrCutName;
	//原料类别
	private Long mtrTypeId;
	private String mtrTypeName;
	//领料站点
	private Long takeStn;
	private String takeStnName;
	//是否半成品
	private String semiFinished;
	//材料毛重
	private String grossWgt;
	//净重
	private String netWgt;
	//净得率
	private String netRate;
	//熟重
	private String modiWgt;
	//熟得率
	private String modiRate;
	//备注
	private String remark;
	//创建者
	private Long createUser;
	//创建日期
	private Date createDate;
	//状态
	private String status;

	//单价
	private String price;
	//成本=单价*毛重
	private String cost;
	//成本率=成本／单价
	private String costRate;

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
	 * 设置：原料类别
	 */
	public void setMtrTypeId(Long mtrTypeId) {
		this.mtrTypeId = mtrTypeId;
	}
	/**
	 * 获取：原料类别
	 */
	public Long getMtrTypeId() {
		return mtrTypeId;
	}
	/**
	 * 设置：领料站点
	 */
	public void setTakeStn(Long takeStn) {
		this.takeStn = takeStn;
	}
	/**
	 * 获取：领料站点
	 */
	public Long getTakeStn() {
		return takeStn;
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
	/**
	 * 设置：材料毛重
	 */
	public void setGrossWgt(String grossWgt) {
		this.grossWgt = grossWgt;
	}
	/**
	 * 获取：材料毛重
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
	public void setCreateUser(Long createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：创建者
	 */
	public Long getCreateUser() {
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

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public String getMtrName() {
		return mtrName;
	}

	public void setMtrName(String mtrName) {
		this.mtrName = mtrName;
	}

	public String getMtrTypeName() {
		return mtrTypeName;
	}

	public void setMtrTypeName(String mtrTypeName) {
		this.mtrTypeName = mtrTypeName;
	}

	public String getTakeStnName() {
		return takeStnName;
	}

	public void setTakeStnName(String takeStnName) {
		this.takeStnName = takeStnName;
	}

	public String getCostRate() {
		return costRate;
	}

	public void setCostRate(String costRate) {
		this.costRate = costRate;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getMtrCutName() {
		return mtrCutName;
	}

	public void setMtrCutName(String mtrCutName) {
		this.mtrCutName = mtrCutName;
	}
}
