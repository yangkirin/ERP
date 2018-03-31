package com.kirin.modules.baseData.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 类型信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-01 23:29:47
 */
public class TypeInfoEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//ID
	private Long id;
	//类型编码
	private String typeCode;
	//类型名称
	private String typeName;
	//上级ID
	private Long parentId;
	//上级名称
	private String parentName;
	//拼音码
	private String typePy;
	//状态
	private Integer status;

	private String createUser;
	private Date createDate;
	private String updateUser;
	private Date updateDate;

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	/**
	 * ztree属性
	 */
	private Boolean open;

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
	 * 设置：类型编码
	 */
	public void setTypeCode(String typeCode) {
		this.typeCode = typeCode;
	}
	/**
	 * 获取：类型编码
	 */
	public String getTypeCode() {
		return typeCode;
	}
	/**
	 * 设置：类型名称
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	/**
	 * 获取：类型名称
	 */
	public String getTypeName() {
		return typeName;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	/**
	 * 设置：拼音码
	 */
	public void setTypePy(String typePy) {
		this.typePy = typePy;
	}
	/**
	 * 获取：拼音码
	 */
	public String getTypePy() {
		return typePy;
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

	public Boolean getOpen() {
		return open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}
}
