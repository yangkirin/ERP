package com.kirin.modules.sales.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 客户采购产品信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
public class CustomerPrdEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//客户ID
	private Long customerId;
	private String customerName;
	//产品ID
	private Long prdId;
	private String prdName;
	//产品编号
	private String prdNo;
	private String prdPy;
	//产品售价
	private BigDecimal prdPrice;
	//标签规格
	private String tagSpec;
	//标签编号
	private String tagNo;
	//标签条码
	private String tagCode;
	//加热时长
	private String tagPower;
	//生产时间
	private String tagProdTime;
	//保质期
	private String tagQgp;
	//储存条件
	private String tagStorage;
	//净含量
	private String tagNetwgt;
	//标签价格
	private BigDecimal tagPrice;
	//地址
	private String tagAddr;
	//产地
	private String tagProdAddr;
	//制造商
	private String tagManufacturer;
	//联系电话
	private String tagLinkphone;
	//配料表
	private String tagBurdenList;
	//许可编号
	private String tagLicenseNo;
	//执行标准
	private String tagSe;
	//状态
	private String status;
	//备注
	private String remark;

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
	 * 设置：客户ID
	 */
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	/**
	 * 获取：客户ID
	 */
	public Long getCustomerId() {
		return customerId;
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
	 * 设置：产品售价
	 */
	public void setPrdPrice(BigDecimal prdPrice) {
		this.prdPrice = prdPrice;
	}
	/**
	 * 获取：产品售价
	 */
	public BigDecimal getPrdPrice() {
		return prdPrice;
	}
	/**
	 * 设置：标签规格
	 */
	public void setTagSpec(String tagSpec) {
		this.tagSpec = tagSpec;
	}
	/**
	 * 获取：标签规格
	 */
	public String getTagSpec() {
		return tagSpec;
	}
	/**
	 * 设置：标签编号
	 */
	public void setTagNo(String tagNo) {
		this.tagNo = tagNo;
	}
	/**
	 * 获取：标签编号
	 */
	public String getTagNo() {
		return tagNo;
	}
	/**
	 * 设置：标签条码
	 */
	public void setTagCode(String tagCode) {
		this.tagCode = tagCode;
	}
	/**
	 * 获取：标签条码
	 */
	public String getTagCode() {
		return tagCode;
	}
	/**
	 * 设置：加热时长
	 */
	public void setTagPower(String tagPower) {
		this.tagPower = tagPower;
	}
	/**
	 * 获取：加热时长
	 */
	public String getTagPower() {
		return tagPower;
	}
	/**
	 * 设置：生产时间
	 */
	public void setTagProdTime(String tagProdTime) {
		this.tagProdTime = tagProdTime;
	}
	/**
	 * 获取：生产时间
	 */
	public String getTagProdTime() {
		return tagProdTime;
	}
	/**
	 * 设置：保质期
	 */
	public void setTagQgp(String tagQgp) {
		this.tagQgp = tagQgp;
	}
	/**
	 * 获取：保质期
	 */
	public String getTagQgp() {
		return tagQgp;
	}
	/**
	 * 设置：储存条件
	 */
	public void setTagStorage(String tagStorage) {
		this.tagStorage = tagStorage;
	}
	/**
	 * 获取：储存条件
	 */
	public String getTagStorage() {
		return tagStorage;
	}
	/**
	 * 设置：净含量
	 */
	public void setTagNetwgt(String tagNetwgt) {
		this.tagNetwgt = tagNetwgt;
	}
	/**
	 * 获取：净含量
	 */
	public String getTagNetwgt() {
		return tagNetwgt;
	}
	/**
	 * 设置：标签价格
	 */
	public void setTagPrice(BigDecimal tagPrice) {
		this.tagPrice = tagPrice;
	}
	/**
	 * 获取：标签价格
	 */
	public BigDecimal getTagPrice() {
		return tagPrice;
	}
	/**
	 * 设置：地址
	 */
	public void setTagAddr(String tagAddr) {
		this.tagAddr = tagAddr;
	}
	/**
	 * 获取：地址
	 */
	public String getTagAddr() {
		return tagAddr;
	}
	/**
	 * 设置：产地
	 */
	public void setTagProdAddr(String tagProdAddr) {
		this.tagProdAddr = tagProdAddr;
	}
	/**
	 * 获取：产地
	 */
	public String getTagProdAddr() {
		return tagProdAddr;
	}
	/**
	 * 设置：制造商
	 */
	public void setTagManufacturer(String tagManufacturer) {
		this.tagManufacturer = tagManufacturer;
	}
	/**
	 * 获取：制造商
	 */
	public String getTagManufacturer() {
		return tagManufacturer;
	}
	/**
	 * 设置：联系电话
	 */
	public void setTagLinkphone(String tagLinkphone) {
		this.tagLinkphone = tagLinkphone;
	}
	/**
	 * 获取：联系电话
	 */
	public String getTagLinkphone() {
		return tagLinkphone;
	}
	/**
	 * 设置：配料表
	 */
	public void setTagBurdenList(String tagBurdenList) {
		this.tagBurdenList = tagBurdenList;
	}
	/**
	 * 获取：配料表
	 */
	public String getTagBurdenList() {
		return tagBurdenList;
	}
	/**
	 * 设置：许可编号
	 */
	public void setTagLicenseNo(String tagLicenseNo) {
		this.tagLicenseNo = tagLicenseNo;
	}
	/**
	 * 获取：许可编号
	 */
	public String getTagLicenseNo() {
		return tagLicenseNo;
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

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public String getTagSe() {
		return tagSe;
	}

	public void setTagSe(String tagSe) {
		this.tagSe = tagSe;
	}

	public String getPrdPy() {
		return prdPy;
	}

	public void setPrdPy(String prdPy) {
		this.prdPy = prdPy;
	}
}
