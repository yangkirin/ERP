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
	//出库单号
	private String outportNo;
	//生产订单ID
	private Long orderId;
	//客户ID
	private Long customerId;
	//客户名称
	private String customerName;
	//客户编号
	private String customerNo;
	//产品ID
	private Long prdId;
	//产品编号
	private String prdNo;
	//产品类型
	private String prdTypeName;
	//产品名称
	private String prdName;
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
	 * 设置：出库单号
	 */
	public void setOutportNo(String outportNo) {
		this.outportNo = outportNo;
	}
	/**
	 * 获取：出库单号
	 */
	public String getOutportNo() {
		return outportNo;
	}
	/**
	 * 设置：生产订单ID
	 */
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	/**
	 * 获取：生产订单ID
	 */
	public Long getOrderId() {
		return orderId;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
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
	 * 设置：产品编号
	 */
	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}
	/**
	 * 获取：产品编号
	 */
	public String getPrdNo() {
		return prdNo;
	}
	/**
	 * 设置：产品类型
	 */
	public void setPrdTypeName(String prdTypeName) {
		this.prdTypeName = prdTypeName;
	}
	/**
	 * 获取：产品类型
	 */
	public String getPrdTypeName() {
		return prdTypeName;
	}
	/**
	 * 设置：产品名称
	 */
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	/**
	 * 获取：产品名称
	 */
	public String getPrdName() {
		return prdName;
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
