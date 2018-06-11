package com.kirin.modules.storage.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 出库记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-12-25 23:45:15
 */
public class OutportDetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//出库单ID
	private String outportId;
	//原料ID
	private Long mtrId;
	//原料编号
	private String mtrNo;
	//原料名称
	private String mtrName;
	//原料类型
	private String mtrTypeName;
	//需求数量
	private BigDecimal orderCount;
	//领料数量
	private BigDecimal outCount;
	//配方原料毛重
	private BigDecimal bomGrossWgt;
	//领料单位
	private String outUnit;
	//出库日期
	private Date outDate;
	//状态
	private String status;
	//操作人
	private String createUser;

	private String batchNo;

	public String getOutportId() {
		return outportId;
	}

	public void setOutportId(String outportId) {
		this.outportId = outportId;
	}

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
	 * 设置：原料编号
	 */
	public void setMtrNo(String mtrNo) {
		this.mtrNo = mtrNo;
	}
	/**
	 * 获取：原料编号
	 */
	public String getMtrNo() {
		return mtrNo;
	}
	/**
	 * 设置：原料名称
	 */
	public void setMtrName(String mtrName) {
		this.mtrName = mtrName;
	}
	/**
	 * 获取：原料名称
	 */
	public String getMtrName() {
		return mtrName;
	}
	/**
	 * 设置：原料类型
	 */
	public void setMtrTypeName(String mtrTypeName) {
		this.mtrTypeName = mtrTypeName;
	}
	/**
	 * 获取：原料类型
	 */
	public String getMtrTypeName() {
		return mtrTypeName;
	}
	/**
	 * 设置：需求数量
	 */
	public void setOrderCount(BigDecimal orderCount) {
		this.orderCount = orderCount;
	}
	/**
	 * 获取：需求数量
	 */
	public BigDecimal getOrderCount() {
		return orderCount;
	}
	/**
	 * 设置：领料数量
	 */
	public void setOutCount(BigDecimal outCount) {
		this.outCount = outCount;
	}
	/**
	 * 获取：领料数量
	 */
	public BigDecimal getOutCount() {
		return outCount;
	}
	/**
	 * 设置：出库日期
	 */
	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}
	/**
	 * 获取：出库日期
	 */
	public Date getOutDate() {
		return outDate;
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
	 * 设置：操作人
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：操作人
	 */
	public String getCreateUser() {
		return createUser;
	}

	public String getOutUnit() {
		return outUnit;
	}

	public void setOutUnit(String outUnit) {
		this.outUnit = outUnit;
	}

	public BigDecimal getBomGrossWgt() {
		return bomGrossWgt;
	}

	public void setBomGrossWgt(BigDecimal bomGrossWgt) {
		this.bomGrossWgt = bomGrossWgt;
	}

	public String getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
}
