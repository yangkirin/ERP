package com.kirin.modules.baseData.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 原料基础数据表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-15 00:43:36
 */
public class MtrDataEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//IDMtrDataService.java
	private Long id;
	//原料编号
	private String mtrCode;
	//原料名称
	private String mtrName;
	//拼音码
	private String mtrPy;
	//类别
	private Integer typeId;
	//类别名称
	private String typeName;
	//采购单位
	private String purchaseUnit;
	//切割形状ID
	private Long cutId;
	//切割形状名称
	private String cutName;

	private String purchaseUnitName;
	//采购单位转换率
	private String purchaseRate;
	//最小单位
	private String miniUnit;

	private String miniUnitName;
	//最小单位转换率
	private String miniRate;
	//配方单位
	private String formulaUnit;

	private String formulaUnitName;
	//净菜得率
	private String modiRate1;
	//熟菜得率
	private String modiRate2;
	//所属仓库
	private Integer warehouseId;

	private String warehouseName;
	//领料站点
	private Integer takeStnId;

	private String takeStnName;
	//单件重量
	private String wgtUnit1;
	//单筐重量
	private String wgtUnit2;
	//采购单价
	private String price;
	//固定采购
	private String fixup;
	//采购周期
	private String purcycle;
	//成本分类
	private String costType;

	private String costTypeName;
	//税率
	private String taxRate;
	//备注
	private String remark;
	//创建者
	private String createUser;
	//创建日期
	private Date createDate;
	//状态
	private String status;

	//扩展ID
	private Long extendId;
	//规格
	private String spec;
	//品牌
	private String brand;

	private String updateUser;
	private Date updateDate;

	private String extendCode;

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
	 * 设置：原料编号
	 */
	public void setMtrCode(String mtrCode) {
		this.mtrCode = mtrCode;
	}
	/**
	 * 获取：原料编号
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
	 * 设置：拼音码
	 */
	public void setMtrPy(String mtrPy) {
		this.mtrPy = mtrPy;
	}
	/**
	 * 获取：拼音码
	 */
	public String getMtrPy() {
		return mtrPy;
	}
	/**
	 * 设置：类别
	 */
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	/**
	 * 获取：类别
	 */
	public Integer getTypeId() {
		return typeId;
	}
	/**
	 * 设置：采购单位
	 */
	public void setPurchaseUnit(String purchaseUnit) {
		this.purchaseUnit = purchaseUnit;
	}
	/**
	 * 获取：采购单位
	 */
	public String getPurchaseUnit() {
		return purchaseUnit;
	}
	/**
	 * 设置：采购单位转换率
	 */
	public void setPurchaseRate(String purchaseRate) {
		this.purchaseRate = purchaseRate;
	}
	/**
	 * 获取：采购单位转换率
	 */
	public String getPurchaseRate() {
		return purchaseRate;
	}
	/**
	 * 设置：最小单位
	 */
	public void setMiniUnit(String miniUnit) {
		this.miniUnit = miniUnit;
	}
	/**
	 * 获取：最小单位
	 */
	public String getMiniUnit() {
		return miniUnit;
	}
	/**
	 * 设置：最小单位转换率
	 */
	public void setMiniRate(String miniRate) {
		this.miniRate = miniRate;
	}
	/**
	 * 获取：最小单位转换率
	 */
	public String getMiniRate() {
		return miniRate;
	}
	/**
	 * 设置：配方单位
	 */
	public void setFormulaUnit(String formulaUnit) {
		this.formulaUnit = formulaUnit;
	}
	/**
	 * 获取：配方单位
	 */
	public String getFormulaUnit() {
		return formulaUnit;
	}
	/**
	 * 设置：净菜得率
	 */
	public void setModiRate1(String modiRate1) {
		this.modiRate1 = modiRate1;
	}
	/**
	 * 获取：净菜得率
	 */
	public String getModiRate1() {
		return modiRate1;
	}
	/**
	 * 设置：熟菜得率
	 */
	public void setModiRate2(String modiRate2) {
		this.modiRate2 = modiRate2;
	}
	/**
	 * 获取：熟菜得率
	 */
	public String getModiRate2() {
		return modiRate2;
	}
	/**
	 * 设置：所属仓库
	 */
	public void setWarehouseId(Integer warehouseId) {
		this.warehouseId = warehouseId;
	}
	/**
	 * 获取：所属仓库
	 */
	public Integer getWarehouseId() {
		return warehouseId;
	}
	/**
	 * 设置：领料站点
	 */
	public void setTakeStnId(Integer takeStnId) {
		this.takeStnId = takeStnId;
	}
	/**
	 * 获取：领料站点
	 */
	public Integer getTakeStnId() {
		return takeStnId;
	}
	/**
	 * 设置：单件重量
	 */
	public void setWgtUnit1(String wgtUnit1) {
		this.wgtUnit1 = wgtUnit1;
	}
	/**
	 * 获取：单件重量
	 */
	public String getWgtUnit1() {
		return wgtUnit1;
	}
	/**
	 * 设置：单筐重量
	 */
	public void setWgtUnit2(String wgtUnit2) {
		this.wgtUnit2 = wgtUnit2;
	}
	/**
	 * 获取：单筐重量
	 */
	public String getWgtUnit2() {
		return wgtUnit2;
	}
	/**
	 * 设置：采购单价
	 */
	public void setPrice(String price) {
		this.price = price;
	}
	/**
	 * 获取：采购单价
	 */
	public String getPrice() {
		return price;
	}
	/**
	 * 设置：固定采购
	 */
	public void setFixup(String fixup) {
		this.fixup = fixup;
	}
	/**
	 * 获取：固定采购
	 */
	public String getFixup() {
		return fixup;
	}
	/**
	 * 设置：采购周期
	 */
	public void setPurcycle(String purcycle) {
		this.purcycle = purcycle;
	}
	/**
	 * 获取：采购周期
	 */
	public String getPurcycle() {
		return purcycle;
	}
	/**
	 * 设置：成本分类
	 */
	public void setCostType(String costType) {
		this.costType = costType;
	}
	/**
	 * 获取：成本分类
	 */
	public String getCostType() {
		return costType;
	}
	/**
	 * 设置：税率
	 */
	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}
	/**
	 * 获取：税率
	 */
	public String getTaxRate() {
		return taxRate;
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
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：创建者
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getPurchaseUnitName() {
		return purchaseUnitName;
	}

	public void setPurchaseUnitName(String purchaseUnitName) {
		this.purchaseUnitName = purchaseUnitName;
	}

	public String getMiniUnitName() {
		return miniUnitName;
	}

	public void setMiniUnitName(String miniUnitName) {
		this.miniUnitName = miniUnitName;
	}

	public String getFormulaUnitName() {
		return formulaUnitName;
	}

	public void setFormulaUnitName(String formulaUnitName) {
		this.formulaUnitName = formulaUnitName;
	}

	public String getWarehouseName() {
		return warehouseName;
	}

	public void setWarehouseName(String warehouseName) {
		this.warehouseName = warehouseName;
	}

	public String getTakeStnName() {
		return takeStnName;
	}

	public void setTakeStnName(String takeStnName) {
		this.takeStnName = takeStnName;
	}

	public String getCostTypeName() {
		return costTypeName;
	}

	public void setCostTypeName(String costTypeName) {
		this.costTypeName = costTypeName;
	}

	public Long getCutId() {
		return cutId;
	}

	public void setCutId(Long cutId) {
		this.cutId = cutId;
	}

	public String getCutName() {
		return cutName;
	}

	public void setCutName(String cutName) {
		this.cutName = cutName;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Long getExtendId() {
		return extendId;
	}

	public void setExtendId(Long extendId) {
		this.extendId = extendId;
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
