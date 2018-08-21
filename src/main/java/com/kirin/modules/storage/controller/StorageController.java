package com.kirin.modules.storage.controller;

import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.common.utils.CommonUtils;
import com.kirin.modules.storage.entity.ImportEntity;
import com.kirin.modules.storage.service.ImportService;
import com.kirin.modules.storage.service.OutportDetailService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 入库主记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-28 06:18:42
 */
@RestController
@RequestMapping("/storage/search")
public class StorageController extends AbstractController {
	@Autowired
	private ImportService importService;

	@Autowired
	private OutportDetailService outportDetailService;

	@Autowired
	private CommonUtilService commonUtilService;
	
	/**
	 * 库存查询列表
	 */
	@RequestMapping("/inventorySearch")
//	@RequiresPermissions("storage:import:list")
	public R list(@RequestParam Map<String, Object> params){
		List<Map> listMap = commonUtilService.inventorySearch(null);
		Map<String,Object> returnMap = new HashMap<>();
        Query query = new Query(params);
		PageUtils pageUtil = new PageUtils(listMap, listMap == null ? 0:listMap.size(), query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 库存批次查询
	 * @param params
	 * @return
	 */
	@RequestMapping("/batchInventorySearch")
	public R batchInventorySearch(@RequestParam("mtrId")Long mtrId,@RequestParam Map<String, Object> params){
		List<Map> listMap = commonUtilService.batchInventorySearch(mtrId);
		Map<String,Object> returnMap = new HashMap<>();
		Query query = new Query(params);
		PageUtils pageUtil = new PageUtils(listMap, listMap == null ? 0:listMap.size(), query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 出存查询列表
	 */
	@RequestMapping("/outStoreSearch")
//	@RequiresPermissions("storage:import:list")
	public R outStoreSearch(@RequestParam Map<String, Object> params){
		List<Map> listMap = commonUtilService.outStoreSearch();
		Query query = new Query(params);
		PageUtils pageUtil = new PageUtils(listMap, listMap == null ? 0:listMap.size(), query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 出库明细查询
	 * @param params
	 * @return
	 */
	@RequestMapping("/outStoreDetailSearch")
	public R outStoreDetailSearch(@RequestParam("outputId")Long outputId,@RequestParam Map<String, Object> params){
		List<Map> listMap = commonUtilService.outStoreDetailSearch(outputId);
		Map<String,Object> returnMap = new HashMap<>();
		Query query = new Query(params);
		PageUtils pageUtil = new PageUtils(listMap, listMap == null ? 0:listMap.size(), query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	public R info(@PathVariable("id") Long id){
		ImportEntity importInfo = importService.queryObject(id);
		
		return R.ok().put("import", importInfo);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	public R save(@RequestBody ImportEntity importInfo){
		SysUserEntity sysUserEntity =  getUser();

		importInfo.setCreateUser(sysUserEntity.getUsername());
		importInfo.setImportDate(new Date());

		importService.save(importInfo);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	public R update(@RequestBody ImportEntity importInfo){
		importService.update(importInfo);
		
		return R.ok();
	}

	@RequestMapping("/updateInfo")
	public R update(@RequestParam("id")Long id,@RequestParam("status")String status){
		ImportEntity importEntity = importService.queryObject(id);

		Long no = 0L;
		String currentNo = commonUtilService.getTableNewNo("TB_IMPORT","IMPORT_NO");
		if(currentNo == null || currentNo.equals("")){
			//yyyyMMdd+0000
//			no = Long.valueOf(currentNo.substring(8));
			no = no+1;
			String newNo = new CommonUtils().createNoByDate(no);
			importEntity.setImportNo(newNo);
		}

		importEntity.setImportDate(new Date());

		importEntity.setStatus(status);
		SysUserEntity sysUserEntity =  getUser();
		importEntity.setCreateUser(sysUserEntity.getUsername());
		importService.update(importEntity);

		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("storage:import:delete")
	public R delete(@RequestBody Long[] ids){
		importService.deleteBatch(ids);
		
		return R.ok();
	}

	/**
	 * 盘点查询
	 * @param params
	 * @return
	 */
	@RequestMapping(value="/pdSearch")
	public R pdSearch(@RequestParam Map<String, Object> params){


		return R.ok();
	}
}
