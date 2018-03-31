package com.kirin.modules.storage.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 入库原料批次信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-01-21 15:12:02
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class ImportMtrBatchEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//入库单ID
	private Long importId;
	//入库明细ID
	private Long importDetailId;
	//原料ID
	private Long mtrId;
	private String mtrName;
	private String mtrNo;
	//扩展规格ID，默认为0表示取原料基础数据的规格信息
	private Long extendId;//add
	//采购单位ID
	private Long orderUnitId;
	//采购单位
	private String orderUnitName;
	//采购单位转换率
	private BigDecimal orderUnitRate;
	private BigDecimal orderCount;//add
	private BigDecimal orderPrice;//add
	//入库单位ID
	private Long inUnitId;
	//入库单位
	private String inUnitName;
	//入库单位转换率
	private BigDecimal inUnitRate;
	//入库单价
	private BigDecimal inPrice;
	//入库数量
	private BigDecimal inCount;

	private BigDecimal inUnit1Count;//add
	private BigDecimal wgtUnit1;//add
	private BigDecimal inWgt;//add

	//入库总金额
	private BigDecimal inTotlaPrice;
	//批次号
	private String batchNo;
	//生产日期
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date productionDate;
	//有效日期
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date effectiveDate;
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
	 * 设置：入库单ID
	 */
	public void setImportId(Long importId) {
		this.importId = importId;
	}
	/**
	 * 获取：入库单ID
	 */
	public Long getImportId() {
		return importId;
	}
	/**
	 * 设置：入库明细ID
	 */
	public void setImportDetailId(Long importDetailId) {
		this.importDetailId = importDetailId;
	}
	/**
	 * 获取：入库明细ID
	 */
	public Long getImportDetailId() {
		return importDetailId;
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
	 * 设置：采购单位ID
	 */
	public void setOrderUnitId(Long orderUnitId) {
		this.orderUnitId = orderUnitId;
	}
	/**
	 * 获取：采购单位ID
	 */
	public Long getOrderUnitId() {
		return orderUnitId;
	}
	/**
	 * 设置：采购单位
	 */
	public void setOrderUnitName(String orderUnitName) {
		this.orderUnitName = orderUnitName;
	}
	/**
	 * 获取：采购单位
	 */
	public String getOrderUnitName() {
		return orderUnitName;
	}
	/**
	 * 设置：采购单位转换率
	 */
	public void setOrderUnitRate(BigDecimal orderUnitRate) {
		this.orderUnitRate = orderUnitRate;
	}
	/**
	 * 获取：采购单位转换率
	 */
	public BigDecimal getOrderUnitRate() {
		return orderUnitRate;
	}
	/**
	 * 设置：入库单位ID
	 */
	public void setInUnitId(Long inUnitId) {
		this.inUnitId = inUnitId;
	}
	/**
	 * 获取：入库单位ID
	 */
	public Long getInUnitId() {
		return inUnitId;
	}
	/**
	 * 设置：入库单位
	 */
	public void setInUnitName(String inUnitName) {
		this.inUnitName = inUnitName;
	}
	/**
	 * 获取：入库单位
	 */
	public String getInUnitName() {
		return inUnitName;
	}
	/**
	 * 设置：入库单位转换率
	 */
	public void setInUnitRate(BigDecimal inUnitRate) {
		this.inUnitRate = inUnitRate;
	}
	/**
	 * 获取：入库单位转换率
	 */
	public BigDecimal getInUnitRate() {
		return inUnitRate;
	}
	/**
	 * 设置：入库单价
	 */
	public void setInPrice(BigDecimal inPrice) {
		this.inPrice = inPrice;
	}
	/**
	 * 获取：入库单价
	 */
	public BigDecimal getInPrice() {
		return inPrice;
	}
	/**
	 * 设置：入库数量
	 */
	public void setInCount(BigDecimal inCount) {
		this.inCount = inCount;
	}
	/**
	 * 获取：入库数量
	 */
	public BigDecimal getInCount() {
		return inCount;
	}
	/**
	 * 设置：入库总金额
	 */
	public void setInTotlaPrice(BigDecimal inTotlaPrice) {
		this.inTotlaPrice = inTotlaPrice;
	}
	/**
	 * 获取：入库总金额
	 */
	public BigDecimal getInTotlaPrice() {
		return inTotlaPrice;
	}
	/**
	 * 设置：批次号
	 */
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	/**
	 * 获取：批次号
	 */
	public String getBatchNo() {
		return batchNo;
	}
	/**
	 * 设置：生产日期
	 */
	public void setProductionDate(Date productionDate) {
		this.productionDate = productionDate;
	}
	/**
	 * 获取：生产日期
	 */
	public Date getProductionDate() {
		return productionDate;
	}
	/**
	 * 设置：有效日期
	 */
	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	/**
	 * 获取：有效日期
	 */
	public Date getEffectiveDate() {
		return effectiveDate;
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

	public String getMtrName() {
		return mtrName;
	}

	public void setMtrName(String mtrName) {
		this.mtrName = mtrName;
	}

	public String getMtrNo() {
		return mtrNo;
	}

	public void setMtrNo(String mtrNo) {
		this.mtrNo = mtrNo;
	}

	public Long getExtendId() {
		return extendId;
	}

	public void setExtendId(Long extendId) {
		this.extendId = extendId;
	}

	public BigDecimal getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(BigDecimal orderCount) {
		this.orderCount = orderCount;
	}

	public BigDecimal getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(BigDecimal orderPrice) {
		this.orderPrice = orderPrice;
	}

	public BigDecimal getInUnit1Count() {
		return inUnit1Count;
	}

	public void setInUnit1Count(BigDecimal inUnit1Count) {
		this.inUnit1Count = inUnit1Count;
	}

	public BigDecimal getWgtUnit1() {
		return wgtUnit1;
	}

	public void setWgtUnit1(BigDecimal wgtUnit1) {
		this.wgtUnit1 = wgtUnit1;
	}

	public BigDecimal getInWgt() {
		return inWgt;
	}

	public void setInWgt(BigDecimal inWgt) {
		this.inWgt = inWgt;
	}
}
