package com.kirin.modules.sales.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 生产计划
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-20 22:52:14
 */
public class ProductionPlanEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//计划编号
	private String planNo;
	//序号
	private Integer planSortNo;
	//完成率
	private String planCompletionRate;
	//创建日期
	private Date createDate;
	//创建人
	private String createUser;
	//状态
	private String status;
	//备注
	private String remark;
	//成本
	private String prdCost;
	//收入
	private String prdIncome;
	//折后收入
	private String discountIncome;
	//折扣成本比
	private String discountCostRate;
	//产品总数
	private String prdMount;
	//成本率
	private String costRate;

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
	 * 设置：计划编号
	 */
	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}
	/**
	 * 获取：计划编号
	 */
	public String getPlanNo() {
		return planNo;
	}
	/**
	 * 设置：序号
	 */
	public void setPlanSortNo(Integer planSortNo) {
		this.planSortNo = planSortNo;
	}
	/**
	 * 获取：序号
	 */
	public Integer getPlanSortNo() {
		return planSortNo;
	}
	/**
	 * 设置：完成率
	 */
	public void setPlanCompletionRate(String planCompletionRate) {
		this.planCompletionRate = planCompletionRate;
	}
	/**
	 * 获取：完成率
	 */
	public String getPlanCompletionRate() {
		return planCompletionRate;
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
	 * 设置：创建人
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	/**
	 * 获取：创建人
	 */
	public String getCreateUser() {
		return createUser;
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
	/**
	 * 设置：成本
	 */
	public void setPrdCost(String prdCost) {
		this.prdCost = prdCost;
	}
	/**
	 * 获取：成本
	 */
	public String getPrdCost() {
		return prdCost;
	}
	/**
	 * 设置：收入
	 */
	public void setPrdIncome(String prdIncome) {
		this.prdIncome = prdIncome;
	}
	/**
	 * 获取：收入
	 */
	public String getPrdIncome() {
		return prdIncome;
	}
	/**
	 * 设置：折后收入
	 */
	public void setDiscountIncome(String discountIncome) {
		this.discountIncome = discountIncome;
	}
	/**
	 * 获取：折后收入
	 */
	public String getDiscountIncome() {
		return discountIncome;
	}
	/**
	 * 设置：折扣成本比
	 */
	public void setDiscountCostRate(String discountCostRate) {
		this.discountCostRate = discountCostRate;
	}
	/**
	 * 获取：折扣成本比
	 */
	public String getDiscountCostRate() {
		return discountCostRate;
	}
	/**
	 * 设置：产品总数
	 */
	public void setPrdMount(String prdMount) {
		this.prdMount = prdMount;
	}
	/**
	 * 获取：产品总数
	 */
	public String getPrdMount() {
		return prdMount;
	}
	/**
	 * 设置：成本率
	 */
	public void setCostRate(String costRate) {
		this.costRate = costRate;
	}
	/**
	 * 获取：成本率
	 */
	public String getCostRate() {
		return costRate;
	}
}
