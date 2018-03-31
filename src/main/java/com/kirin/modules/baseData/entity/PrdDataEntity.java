package com.kirin.modules.baseData.entity;

import com.kirin.modules.baseData.service.BomDetailService;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 产品基础信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-27 00:16:18
 */
public class PrdDataEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//
	private Long id;
	//产品编号
	private String prdCode;
	//产品名称
	private String prdName;
	//拼音码
	private String prdPy;
	//产品类别
	private Integer typeId;
	private String typeName;
	//锅重
	private String potWeight;
	//盒重
	private String boxWeight;
	//参考售价
	private String referencePrice;
	//生产工艺
	private String process;
	//是否半成品
	private String semiFinished;
	//生产站点
	private Integer pdcStn;
	private String pdcStnName;
	//订单类别
	private Integer orderType;
	private String orderTypeName;
	//成本
    private String cost;
	//额外成本
	private Integer extraCost;
	//烹调方式
	private Integer cookType;
	private String cookTypeName;
	//单锅生产时间
	private String productionTime;
	//是否速冷
	private String quickCooling;
	//速冷率
	private String quickCoolingRate;
	//是否取整
	private String rounding;
	//取整重
	private String roundWeight;
	//备注
	private String remark;
	//创建者
	private String createUser;
	//创建日期
	private Date createDate;
	//状态
	private String status;

	//总毛重
	private String sumGrossWgt;
	//总净重
	private String sumNetWgt;
	//总熟重
	private String sumCookedWgt;

	//成本率
	private String costRate;

	//成本占比
	private String costRatio;
	//报表序
	private Integer reportNo;

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
	 * 设置：产品编号
	 */
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}
	/**
	 * 获取：产品编号
	 */
	public String getPrdCode() {
		return prdCode;
	}
	/**
	 * 设置：产品名称
	 */
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	/**
	 * 获取：产品名称
	 */
	public String getPrdName() {
		return prdName;
	}
	/**
	 * 设置：拼音码
	 */
	public void setPrdPy(String prdPy) {
		this.prdPy = prdPy;
	}
	/**
	 * 获取：拼音码
	 */
	public String getPrdPy() {
		return prdPy;
	}
	/**
	 * 设置：产品类别
	 */
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	/**
	 * 获取：产品类别
	 */
	public Integer getTypeId() {
		return typeId;
	}
	/**
	 * 设置：锅重
	 */
	public void setPotWeight(String potWeight) {
		this.potWeight = potWeight;
	}
	/**
	 * 获取：锅重
	 */
	public String getPotWeight() {
		return potWeight;
	}
	/**
	 * 设置：盒重
	 */
	public void setBoxWeight(String boxWeight) {
		this.boxWeight = boxWeight;
	}
	/**
	 * 获取：盒重
	 */
	public String getBoxWeight() {
		return boxWeight;
	}
	/**
	 * 设置：参考售价
	 */
	public void setReferencePrice(String referencePrice) {
		this.referencePrice = referencePrice;
	}
	/**
	 * 获取：参考售价
	 */
	public String getReferencePrice() {
		return referencePrice;
	}
	/**
	 * 设置：生产工艺
	 */
	public void setProcess(String process) {
		this.process = process;
	}
	/**
	 * 获取：生产工艺
	 */
	public String getProcess() {
		return process;
	}
	/**
	 * 设置：是否半成品
	 */
	public void setSemiFinished(String semiFinished) {
		this.semiFinished = semiFinished;
	}
	/**
	 * 获取：是否半成品
	 */
	public String getSemiFinished() {
		return semiFinished;
	}
	/**
	 * 设置：生产站点
	 */
	public void setPdcStn(Integer pdcStn) {
		this.pdcStn = pdcStn;
	}
	/**
	 * 获取：生产站点
	 */
	public Integer getPdcStn() {
		return pdcStn;
	}
	/**
	 * 设置：订单类别
	 */
	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}
	/**
	 * 获取：订单类别
	 */
	public Integer getOrderType() {
		return orderType;
	}
	/**
	 * 设置：额外成本
	 */
	public void setExtraCost(Integer extraCost) {
		this.extraCost = extraCost;
	}
	/**
	 * 获取：额外成本
	 */
	public Integer getExtraCost() {
		return extraCost;
	}
	/**
	 * 设置：烹调方式
	 */
	public void setCookType(Integer cookType) {
		this.cookType = cookType;
	}
	/**
	 * 获取：烹调方式
	 */
	public Integer getCookType() {
		return cookType;
	}
	/**
	 * 设置：单锅生产时间
	 */
	public void setProductionTime(String productionTime) {
		this.productionTime = productionTime;
	}
	/**
	 * 获取：单锅生产时间
	 */
	public String getProductionTime() {
		return productionTime;
	}
	/**
	 * 设置：是否速冷
	 */
	public void setQuickCooling(String quickCooling) {
		this.quickCooling = quickCooling;
	}
	/**
	 * 获取：是否速冷
	 */
	public String getQuickCooling() {
		return quickCooling;
	}
	/**
	 * 设置：速冷率
	 */
	public void setQuickCoolingRate(String quickCoolingRate) {
		this.quickCoolingRate = quickCoolingRate;
	}
	/**
	 * 获取：速冷率
	 */
	public String getQuickCoolingRate() {
		return quickCoolingRate;
	}
	/**
	 * 设置：是否取整
	 */
	public void setRounding(String rounding) {
		this.rounding = rounding;
	}
	/**
	 * 获取：是否取整
	 */
	public String getRounding() {
		return rounding;
	}
	/**
	 * 设置：取整重
	 */
	public void setRoundWeight(String roundWeight) {
		this.roundWeight = roundWeight;
	}
	/**
	 * 获取：取整重
	 */
	public String getRoundWeight() {
		return roundWeight;
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

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getPdcStnName() {
		return pdcStnName;
	}

	public void setPdcStnName(String pdcStnName) {
		this.pdcStnName = pdcStnName;
	}

	public String getOrderTypeName() {
		return orderTypeName;
	}

	public void setOrderTypeName(String orderTypeName) {
		this.orderTypeName = orderTypeName;
	}

	public String getCookTypeName() {
		return cookTypeName;
	}

	public void setCookTypeName(String cookTypeName) {
		this.cookTypeName = cookTypeName;
	}

	public String getSumGrossWgt() {
		return sumGrossWgt;
	}

	public void setSumGrossWgt(String sumGrossWgt) {
		this.sumGrossWgt = sumGrossWgt;
	}

	public String getSumNetWgt() {
		return sumNetWgt;
	}

	public void setSumNetWgt(String sumNetWgt) {
		this.sumNetWgt = sumNetWgt;
	}

	public String getSumCookedWgt() {
		return sumCookedWgt;
	}

	public void setSumCookedWgt(String sumCookedWgt) {
		this.sumCookedWgt = sumCookedWgt;
	}

    public String getCostRate() {
        return costRate;
    }

    public void setCostRate(String costRate) {
        this.costRate = costRate;
    }

    public String getCost() {
		return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

	public String getCostRatio() {
		return costRatio;
	}

	public void setCostRatio(String costRatio) {
		this.costRatio = costRatio;
	}

	public Integer getReportNo() {
		return reportNo;
	}

	public void setReportNo(Integer reportNo) {
		this.reportNo = reportNo;
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
