package com.kirin.modules.baseData.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-19 17:35:28
 */
public class MtrCutEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//原料ID
	private Long mtrId;
	//加工形状
	private String cut;
	//工时
	private String workHours;
	//净得率
	private String netRate;
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
	 * 设置：加工形状
	 */
	public void setCut(String cut) {
		this.cut = cut;
	}
	/**
	 * 获取：加工形状
	 */
	public String getCut() {
		return cut;
	}
	/**
	 * 设置：工时
	 */
	public void setWorkHours(String workHours) {
		this.workHours = workHours;
	}
	/**
	 * 获取：工时
	 */
	public String getWorkHours() {
		return workHours;
	}
	/**
	 * 设置：净得率
	 */
	public void setNetRate(String netRate) {
		this.netRate = netRate;
	}
	/**
	 * 获取：净得率
	 */
	public String getNetRate() {
		return netRate;
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
