package com.kirin.modules.storage.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Author: BeauFang
 * @Date: 2018/4/30 14:02
 * @Description:
 **/
public class StorageSearchEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;
    // 原料名称
    private String mtrName;
    // 原料编码
    private String mtrNo;
    //采购单位
    private String purchaseUnit;
    //采购单位转换率
    private BigDecimal purchaseUnitRate;
    // 最小单位
    private String miniUnit;
    // 最小转换率
    private BigDecimal miniRate;
    // 配方单位
    private String formulaUnit;
    // 入库数量
    private BigDecimal inCount;
    // 出库数量
    private BigDecimal outCount;
    // 库存数量
    private BigDecimal storageCount;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getPurchaseUnit() {
        return purchaseUnit;
    }

    public void setPurchaseUnit(String purchaseUnit) {
        this.purchaseUnit = purchaseUnit;
    }

    public BigDecimal getPurchaseUnitRate() {
        return purchaseUnitRate;
    }

    public void setPurchaseUnitRate(BigDecimal purchaseUnitRate) {
        this.purchaseUnitRate = purchaseUnitRate;
    }

    public String getMiniUnit() {
        return miniUnit;
    }

    public void setMiniUnit(String miniUnit) {
        this.miniUnit = miniUnit;
    }

    public BigDecimal getMiniRate() {
        return miniRate;
    }

    public void setMiniRate(BigDecimal miniRate) {
        this.miniRate = miniRate;
    }

    public String getFormulaUnit() {
        return formulaUnit;
    }

    public void setFormulaUnit(String formulaUnit) {
        this.formulaUnit = formulaUnit;
    }

    public BigDecimal getInCount() {
        return inCount;
    }

    public void setInCount(BigDecimal inCount) {
        this.inCount = inCount;
    }

    public BigDecimal getOutCount() {
        return outCount;
    }

    public void setOutCount(BigDecimal outCount) {
        this.outCount = outCount;
    }

    // 库存量= 入库量 - 出库量
    public BigDecimal getStorageCount() {
        if (this.inCount == null) this.inCount = new BigDecimal(0);
        if (this.outCount == null) this.outCount = new BigDecimal(0);
        return this.inCount.subtract(this.outCount);
    }

    public void setStorageCount(BigDecimal storageCount) {
        this.storageCount = storageCount;
    }
}
