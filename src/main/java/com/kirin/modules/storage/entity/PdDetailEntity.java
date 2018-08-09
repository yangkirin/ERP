package com.kirin.modules.storage.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;


/**
 * 盘点单明细表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2018-06-09 18:02:45
 */
public class PdDetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//
	private Long pdInfoId;
	//物料ID
	private Long mtrId;
	//物料编号
	private String mtrCode;

	private String mtrName;

	private String miniUnitName;

	private String typeName;
	//上期结余数量
	private BigDecimal lastCount;
	//上期结余金额
	private BigDecimal lastAmt;
	//本期盘点数量
	private BigDecimal currentCount;
	//本期盘点金额
	private BigDecimal currentAmt;
	//本期入库数量
	private BigDecimal currentIn;
	//本期出库数量
	private BigDecimal currentOut;
	//实际盘点数量
	private BigDecimal realCount;
	//实际盘点金额
	private BigDecimal realAmtlossCount;
	//盘盈数量
	private BigDecimal profttCount;
	//盘亏数量
	private BigDecimal lossCount;

	private BigDecimal price;

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
	 * 设置：
	 */
	public void setPdInfoId(Long pdInfoId) {
		this.pdInfoId = pdInfoId;
	}
	/**
	 * 获取：
	 */
	public Long getPdInfoId() {
		return pdInfoId;
	}
	/**
	 * 设置：物料ID
	 */
	public void setMtrId(Long mtrId) {
		this.mtrId = mtrId;
	}
	/**
	 * 获取：物料ID
	 */
	public Long getMtrId() {
		return mtrId;
	}
	/**
	 * 设置：物料编号
	 */
	public void setMtrCode(String mtrCode) {
		this.mtrCode = mtrCode;
	}
	/**
	 * 获取：物料编号
	 */
	public String getMtrCode() {
		return mtrCode;
	}
	/**
	 * 设置：上期结余数量
	 */
	public void setLastCount(BigDecimal lastCount) {
		this.lastCount = lastCount;
	}
	/**
	 * 获取：上期结余数量
	 */
	public BigDecimal getLastCount() {
		return lastCount;
	}
	/**
	 * 设置：上期结余金额
	 */
	public void setLastAmt(BigDecimal lastAmt) {
		this.lastAmt = lastAmt;
	}
	/**
	 * 获取：上期结余金额
	 */
	public BigDecimal getLastAmt() {
		return lastAmt;
	}
	/**
	 * 设置：本期盘点数量
	 */
	public void setCurrentCount(BigDecimal currentCount) {
		this.currentCount = currentCount;
	}
	/**
	 * 获取：本期盘点数量
	 */
	public BigDecimal getCurrentCount() {
		return currentCount;
	}
	/**
	 * 设置：本期盘点金额
	 */
	public void setCurrentAmt(BigDecimal currentAmt) {
		this.currentAmt = currentAmt;
	}
	/**
	 * 获取：本期盘点金额
	 */
	public BigDecimal getCurrentAmt() {
		return currentAmt;
	}
	/**
	 * 设置：本期入库数量
	 */
	public void setCurrentIn(BigDecimal currentIn) {
		this.currentIn = currentIn;
	}
	/**
	 * 获取：本期入库数量
	 */
	public BigDecimal getCurrentIn() {
		return currentIn;
	}
	/**
	 * 设置：本期出库数量
	 */
	public void setCurrentOut(BigDecimal currentOut) {
		this.currentOut = currentOut;
	}
	/**
	 * 获取：本期出库数量
	 */
	public BigDecimal getCurrentOut() {
		return currentOut;
	}
	/**
	 * 设置：实际盘点数量
	 */
	public void setRealCount(BigDecimal realCount) {
		this.realCount = realCount;
	}
	/**
	 * 获取：实际盘点数量
	 */
	public BigDecimal getRealCount() {
		return realCount;
	}
	/**
	 * 设置：实际盘点金额
	 */
	public void setRealAmtlossCount(BigDecimal realAmtlossCount) {
		this.realAmtlossCount = realAmtlossCount;
	}
	/**
	 * 获取：实际盘点金额
	 */
	public BigDecimal getRealAmtlossCount() {
		return realAmtlossCount;
	}
	/**
	 * 设置：盘盈数量
	 */
	public void setProfttCount(BigDecimal profttCount) {
		this.profttCount = profttCount;
	}
	/**
	 * 获取：盘盈数量
	 */
	public BigDecimal getProfttCount() {
		return profttCount;
	}
	/**
	 * 设置：盘亏数量
	 */
	public void setLossCount(BigDecimal lossCount) {
		this.lossCount = lossCount;
	}
	/**
	 * 获取：盘亏数量
	 */
	public BigDecimal getLossCount() {
		return lossCount;
	}

	public String getMtrName() {
		return mtrName;
	}

	public void setMtrName(String mtrName) {
		this.mtrName = mtrName;
	}

	public String getMiniUnitName() {
		return miniUnitName;
	}

	public void setMiniUnitName(String miniUnitName) {
		this.miniUnitName = miniUnitName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}
}
