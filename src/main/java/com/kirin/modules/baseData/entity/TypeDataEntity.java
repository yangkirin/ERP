package com.kirin.modules.baseData.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 类型数据信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-01 23:29:47
 */
public class TypeDataEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//类型数据编码
	private String dataCode;
	//类型数据名称
	private String dataName;
	//所属分类
	private Long typeId;
	//拼音码
	private String dataPy;
	//状态
	private Integer status;

	private TypeInfoEntity typeInfo;

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
	 * 设置：类型数据编码
	 */
	public void setDataCode(String dataCode) {
		this.dataCode = dataCode;
	}
	/**
	 * 获取：类型数据编码
	 */
	public String getDataCode() {
		return dataCode;
	}
	/**
	 * 设置：类型数据名称
	 */
	public void setDataName(String dataName) {
		this.dataName = dataName;
	}
	/**
	 * 获取：类型数据名称
	 */
	public String getDataName() {
		return dataName;
	}
	/**
	 * 设置：所属分类
	 */
	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}
	/**
	 * 获取：所属分类
	 */
	public Long getTypeId() {
		return typeId;
	}
	/**
	 * 设置：拼音码
	 */
	public void setDataPy(String dataPy) {
		this.dataPy = dataPy;
	}
	/**
	 * 获取：拼音码
	 */
	public String getDataPy() {
		return dataPy;
	}
	/**
	 * 设置：状态
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public Integer getStatus() {
		return status;
	}

	public TypeInfoEntity getTypeInfo() {
		return typeInfo;
	}

	public void setTypeInfo(TypeInfoEntity typeInfo) {
		this.typeInfo = typeInfo;
	}
}
