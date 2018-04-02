package com.kirin.modules.storage.service.impl;

import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.baseData.service.MtrDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.kirin.modules.storage.dao.OutportDetailDao;
import com.kirin.modules.storage.entity.OutportDetailEntity;
import com.kirin.modules.storage.service.OutportDetailService;



@Service("outportDetailService")
public class OutportDetailServiceImpl implements OutportDetailService {
	@Autowired
	private OutportDetailDao outportDetailDao;
	
	@Override
	public OutportDetailEntity queryObject(Long id){
		return outportDetailDao.queryObject(id);
	}
	
	@Override
	public List<OutportDetailEntity> queryList(Map<String, Object> map){
		return outportDetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return outportDetailDao.queryTotal(map);
	}
	
	@Override
	public void save(OutportDetailEntity outportDetail){
		outportDetailDao.save(outportDetail);
	}
	
	@Override
	public void update(OutportDetailEntity outportDetail){
		outportDetailDao.update(outportDetail);
	}
	
	@Override
	public void delete(Long id){
		outportDetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		outportDetailDao.deleteBatch(ids);
	}

	@Override
	public List<Map> queryMtrByPrdId(Long prdId,Long takeStnId,Long wareHouseId){
		return outportDetailDao.queryMtrByPrdId(prdId,takeStnId,wareHouseId);
	}

	@Override
	public List<OutportDetailEntity> queryListByMtrId(Long mtrId){
		return outportDetailDao.queryListByMtrId(mtrId);
	}

	@Autowired
	MtrDataService mtrDataService;

	@Override
	public BigDecimal getOutboundCount(Long mtrId, Long orderId){
		BigDecimal haveOutboundCount = new BigDecimal(0);
		MtrDataEntity mtrDataEntity = mtrDataService.queryObject(mtrId);

		List<OutportDetailEntity> outportDetailEntityList = outportDetailDao.getOutportDetail(mtrId,orderId);
		if(outportDetailEntityList != null && outportDetailEntityList.size() > 0){
			for (OutportDetailEntity object:outportDetailEntityList) {
				BigDecimal outCount = object.getOutCount() != null ? object.getOutCount() : new BigDecimal(0);
				haveOutboundCount = haveOutboundCount.add(outCount);
			}
		}
		return haveOutboundCount;
	}
}
