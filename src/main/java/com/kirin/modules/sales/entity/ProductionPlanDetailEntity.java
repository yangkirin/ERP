package com.kirin.modules.sales.entity;

import com.kirin.modules.baseData.entity.PrdDataEntity;

import java.io.Serializable;
import java.util.Date;


/**
 * 生产计划明细
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
public class ProductionPlanDetailEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//计划ID
	private Long planId;
	//产品ID
	private Long prdId;
	//产品成本
	private String prdCost;
	//数量
	private String amount;
	//定价
	private String price1;
	//售价
	private String price2;
	//预估收入=（数量*定价）
	private String income;

	private PrdDataEntity prdDataEntity;

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
	 * 设置：计划ID
	 */
	public void setPlanId(Long planId) {
		this.planId = planId;
	}
	/**
	 * 获取：计划ID
	 */
	public Long getPlanId() {
		return planId;
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
	 * 设置：产品成本
	 */
	public void setPrdCost(String prdCost) {
		this.prdCost = prdCost;
	}
	/**
	 * 获取：产品成本
	 */
	public String getPrdCost() {
		return prdCost;
	}
	/**
	 * 设置：数量
	 */
	public void setAmount(String amount) {
		this.amount = amount;
	}
	/**
	 * 获取：数量
	 */
	public String getAmount() {
		return amount;
	}
	/**
	 * 设置：定价
	 */
	public void setPrice1(String price1) {
		this.price1 = price1;
	}
	/**
	 * 获取：定价
	 */
	public String getPrice1() {
		return price1;
	}
	/**
	 * 设置：售价
	 */
	public void setPrice2(String price2) {
		this.price2 = price2;
	}
	/**
	 * 获取：售价
	 */
	public String getPrice2() {
		return price2;
	}
	/**
	 * 设置：预估收入=（数量*定价）
	 */
	public void setIncome(String income) {
		this.income = income;
	}
	/**
	 * 获取：预估收入=（数量*定价）
	 */
	public String getIncome() {
		return income;
	}

	public PrdDataEntity getPrdDataEntity() {
		return prdDataEntity;
	}

	public void setPrdDataEntity(PrdDataEntity prdDataEntity) {
		this.prdDataEntity = prdDataEntity;
	}
}
