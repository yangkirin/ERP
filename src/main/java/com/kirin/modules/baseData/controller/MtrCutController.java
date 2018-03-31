package com.kirin.modules.baseData.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.baseData.entity.MtrCutEntity;
import com.kirin.modules.baseData.service.MtrCutService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;


/**
 * 
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-19 17:35:28
 */
@RestController
@RequestMapping("/baseData/mtrcut")
public class MtrCutController {
	@Autowired
	private MtrCutService mtrCutService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
//	@RequiresPermissions("baseData:mtrcut:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<MtrCutEntity> mtrCutList = mtrCutService.queryList(query);
		int total = mtrCutService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(mtrCutList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
//	@RequiresPermissions("baseData:mtrcut:info")
	public R info(@PathVariable("id") Long id){
		MtrCutEntity mtrCut = mtrCutService.queryObject(id);
		
		return R.ok().put("mtrCut", mtrCut);
	}

	@RequestMapping("/saveOrupdate")
	public R saveOrupdate(@RequestParam Map<String, Object> params){
		String oper = params.get("oper").toString();

		Long mtrId = Long.valueOf(params.get("mtrId").toString());
		String cut = params.get("cut").toString();
		String workHours = params.get("workHours").toString();
		String netRate = params.get("netRate").toString();

		MtrCutEntity mtrCut = new MtrCutEntity();
		mtrCut.setCut(cut);
		mtrCut.setMtrId(mtrId);
		mtrCut.setWorkHours(workHours);
		mtrCut.setNetRate(netRate);

		if("edit".equalsIgnoreCase(oper)){
			Long id = Long.valueOf(params.get("id").toString());
			String status = params.get("status").toString();
			mtrCut.setStatus(status);
			mtrCut.setId(id);
			update(mtrCut);
		}else{
			mtrCut.setStatus("1");
			save(mtrCut);
		}
		return R.ok();
	}

	/**
	 * 保存
	 */
	@RequestMapping("/save")
//	@RequiresPermissions("baseData:mtrcut:save")
	public R save(@RequestBody MtrCutEntity mtrCut){
		mtrCut.setStatus("1");
		mtrCutService.save(mtrCut);
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
//	@RequiresPermissions("baseData:mtrcut:update")
	public R update(@RequestBody MtrCutEntity mtrCut){
		mtrCutService.update(mtrCut);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete/{id}")
//	@RequiresPermissions("baseData:mtrcut:delete")
	public R delete(@PathVariable("id") Long id){
		mtrCutService.delete(id);
		
		return R.ok();
	}

	@RequestMapping("/getCommboxByMtrId/{id}")
	public R getCommboxByMtrId(@PathVariable("id") Long id){
		List<MtrCutEntity> mtrCutList = mtrCutService.queryList(null);
		List<Map> returnList = new ArrayList<Map>();
		if(mtrCutList != null && mtrCutList.size() > 0){
			for (MtrCutEntity mtrCut:mtrCutList){
				if(mtrCut.getMtrId() == id){
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("value",mtrCut.getId());
					map.put("text",mtrCut.getCut());
					returnList.add(map);
				}
			}
		}

		return R.ok().put("data",returnList);
	}

	@RequestMapping("/getCommbox")
	public R getCommbox(){
		List<MtrCutEntity> mtrCutList = mtrCutService.queryList(null);
		List<Map> returnList = new ArrayList<Map>();
		if(mtrCutList != null && mtrCutList.size() > 0){
			for (MtrCutEntity mtrCut:mtrCutList){
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("value",mtrCut.getId());
				map.put("text",mtrCut.getCut());
				returnList.add(map);
			}
		}

		return R.ok().put("data",returnList);
	}
}
