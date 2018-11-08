package com.kirin.modules.purchase.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 订单明细信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-14 18:24:16
 */
public class OrderDetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//订单ID
	private Long orderId;
	//原料ID
	private Long mtrId;
	//原料编码
	private String mtrCode;
	//原料名称
	private String mtrName;
	//类型ID
	private Long mtrTypeId;
	//类型名称
	private String mtrTypeName;
	//单位
	private String mtrUnit;
	//转换率
	private String mtrRate;
	//仓库ID
	private Long warehoseId;
	//仓库名称
	private String warehoseName;
	//件重
	private String wgtUnit1;
	//盒重
	private String wgtUnit2;
	//价格
	private BigDecimal price;
	//成分分类ID
	private Long costTypeId;
	//成本分类名称
	private String costTypeName;
	//采购编码
	private String purchaseNo;
	//采购数量
	private Double amount;

	private String inCount;

	private String inWgt;

	private BigDecimal inPrice;

	private String createUser;
	private Date createDate;
	private String updateUser;
	private Date updateDate;

	private String extendCode;

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
	 * 设置：订单ID
	 */
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	/**
	 * 获取：订单ID
	 */
	public Long getOrderId() {
		return orderId;
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
	 * 设置：原料编码
	 */
	public void setMtrCode(String mtrCode) {
		this.mtrCode = mtrCode;
	}
	/**
	 * 获取：原料编码
	 */
	public String getMtrCode() {
		return mtrCode;
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
	 * 设置：类型ID
	 */
	public void setMtrTypeId(Long mtrTypeId) {
		this.mtrTypeId = mtrTypeId;
	}
	/**
	 * 获取：类型ID
	 */
	public Long getMtrTypeId() {
		return mtrTypeId;
	}
	/**
	 * 设置：类型名称
	 */
	public void setMtrTypeName(String mtrTypeName) {
		this.mtrTypeName = mtrTypeName;
	}
	/**
	 * 获取：类型名称
	 */
	public String getMtrTypeName() {
		return mtrTypeName;
	}
	/**
	 * 设置：单位
	 */
	public void setMtrUnit(String mtrUnit) {
		this.mtrUnit = mtrUnit;
	}
	/**
	 * 获取：单位
	 */
	public String getMtrUnit() {
		return mtrUnit;
	}
	/**
	 * 设置：转换率
	 */
	public void setMtrRate(String mtrRate) {
		this.mtrRate = mtrRate;
	}
	/**
	 * 获取：转换率
	 */
	public String getMtrRate() {
		return mtrRate;
	}
	/**
	 * 设置：仓库ID
	 */
	public void setWarehoseId(Long warehoseId) {
		this.warehoseId = warehoseId;
	}
	/**
	 * 获取：仓库ID
	 */
	public Long getWarehoseId() {
		return warehoseId;
	}
	/**
	 * 设置：仓库名称
	 */
	public void setWarehoseName(String warehoseName) {
		this.warehoseName = warehoseName;
	}
	/**
	 * 获取：仓库名称
	 */
	public String getWarehoseName() {
		return warehoseName;
	}
	/**
	 * 设置：件重
	 */
	public void setWgtUnit1(String wgtUnit1) {
		this.wgtUnit1 = wgtUnit1;
	}
	/**
	 * 获取：件重
	 */
	public String getWgtUnit1() {
		return wgtUnit1;
	}
	/**
	 * 设置：盒重
	 */
	public void setWgtUnit2(String wgtUnit2) {
		this.wgtUnit2 = wgtUnit2;
	}
	/**
	 * 获取：盒重
	 */
	public String getWgtUnit2() {
		return wgtUnit2;
	}
	/**
	 * 设置：价格
	 */
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	/**
	 * 获取：价格
	 */
	public BigDecimal getPrice() {
		return price;
	}
	/**
	 * 设置：成分分类ID
	 */
	public void setCostTypeId(Long costTypeId) {
		this.costTypeId = costTypeId;
	}
	/**
	 * 获取：成分分类ID
	 */
	public Long getCostTypeId() {
		return costTypeId;
	}
	/**
	 * 设置：成本分类名称
	 */
	public void setCostTypeName(String costTypeName) {
		this.costTypeName = costTypeName;
	}
	/**
	 * 获取：成本分类名称
	 */
	public String getCostTypeName() {
		return costTypeName;
	}

	public String getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(String purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getInCount() {
		return inCount;
	}

	public void setInCount(String inCount) {
		this.inCount = inCount;
	}

	public String getInWgt() {
		return inWgt;
	}

	public void setInWgt(String inWgt) {
		this.inWgt = inWgt;
	}

	public BigDecimal getInPrice() {
		return inPrice;
	}

	public void setInPrice(BigDecimal inPrice) {
		this.inPrice = inPrice;
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

	public String getExtendCode() {
		return extendCode;
	}

	public void setExtendCode(String extendCode) {
		this.extendCode = extendCode;
	}
}
