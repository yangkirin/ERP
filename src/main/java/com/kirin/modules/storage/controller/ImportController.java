package com.kirin.modules.storage.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.common.utils.CommonUtils;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.storage.entity.ImportEntity;
import com.kirin.modules.storage.service.ImportService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 入库主记录信息
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-11-28 06:18:42
 */
@RestController
@RequestMapping("/storage/import")
public class ImportController extends AbstractController {
	@Autowired
	private ImportService importService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("storage:import:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ImportEntity> importList = importService.queryList(query);
		int total = importService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(importList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("storage:import:info")
	public R info(@PathVariable("id") Long id){
		ImportEntity importInfo = importService.queryObject(id);
		
		return R.ok().put("import", importInfo);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("storage:import:save")
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
	@RequiresPermissions("storage:import:update")
	public R update(@RequestBody ImportEntity importInfo){
		importService.update(importInfo);
		
		return R.ok();
	}

	@Autowired
	CommonUtilService commonUtilService;

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
	
}
