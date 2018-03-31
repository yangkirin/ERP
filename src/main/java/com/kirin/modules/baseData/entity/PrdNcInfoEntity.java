package com.kirin.modules.baseData.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 产品营养成分信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
public class PrdNcInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//产品ID
	private Long prdId;
	//能量／千焦
	private String energy;
	//能量／NRV%
	private String energyNrv;
	//蛋白质／克
	private String protein;
	//蛋白质／NRV%
	private String proteinNrv;
	//脂肪／克
	private String fat;
	//脂肪／NRV%
	private String fatNrv;
	//碳水化合物／克
	private String carbohydrate;
	//碳水化合物／NRV%
	private String carbohydrateNrv;
	//钠／毫克
	private String sodium;
	//钠／NRV%
	private String sodiumNrv;
	//备注
	private String remark;
	//创建者
	private Long createUser;
	//创建日期
	private Date createDate;
	//状态
	private String status;

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
	 * 设置：能量／千焦
	 */
	public void setEnergy(String energy) {
		this.energy = energy;
	}
	/**
	 * 获取：能量／千焦
	 */
	public String getEnergy() {
		return energy;
	}
	/**
	 * 设置：能量／NRV%
	 */
	public void setEnergyNrv(String energyNrv) {
		this.energyNrv = energyNrv;
	}
	/**
	 * 获取：能量／NRV%
	 */
	public String getEnergyNrv() {
		return energyNrv;
	}
	/**
	 * 设置：蛋白质／克
	 */
	public void setProtein(String protein) {
		this.protein = protein;
	}
	/**
	 * 获取：蛋白质／克
	 */
	public String getProtein() {
		return protein;
	}
	/**
	 * 设置：蛋白质／NRV%
	 */
	public void setProteinNrv(String proteinNrv) {
		this.proteinNrv = proteinNrv;
	}
	/**
	 * 获取：蛋白质／NRV%
	 */
	public String getProteinNrv() {
		return proteinNrv;
	}
	/**
	 * 设置：脂肪／克
	 */
	public void setFat(String fat) {
		this.fat = fat;
	}
	/**
	 * 获取：脂肪／克
	 */
	public String getFat() {
		return fat;
	}
	/**
	 * 设置：脂肪／NRV%
	 */
	public void setFatNrv(String fatNrv) {
		this.fatNrv = fatNrv;
	}
	/**
	 * 获取：脂肪／NRV%
	 */
	public String getFatNrv() {
		return fatNrv;
	}
	/**
	 * 设置：碳水化合物／克
	 */
	public void setCarbohydrate(String carbohydrate) {
		this.carbohydrate = carbohydrate;
	}
	/**
	 * 获取：碳水化合物／克
	 */
	public String getCarbohydrate() {
		return carbohydrate;
	}
	/**
	 * 设置：碳水化合物／NRV%
	 */
	public void setCarbohydrateNrv(String carbohydrateNrv) {
		this.carbohydrateNrv = carbohydrateNrv;
	}
	/**
	 * 获取：碳水化合物／NRV%
	 */
	public String getCarbohydrateNrv() {
		return carbohydrateNrv;
	}
	/**
	 * 设置：钠／毫克
	 */
	public void setSodium(String sodium) {
		this.sodium = sodium;
	}
	/**
	 * 获取：钠／毫克
	 */
	public String getSodium() {
		return sodium;
	}
	/**
	 * 设置：钠／NRV%
	 */
	public void setSodiumNrv(String sodiumNrv) {
		this.sodiumNrv = sodiumNrv;
	}
	/**
	 * 获取：钠／NRV%
	 */
	public String getSodiumNrv() {
		return sodiumNrv;
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
}
