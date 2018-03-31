package com.kirin.modules.baseData.controller;

import java.lang.reflect.Type;
import java.util.*;

import com.kirin.common.annotation.SysLog;
import com.kirin.modules.baseData.entity.MtrDataEntity;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kirin.modules.baseData.entity.TypeInfoEntity;
import com.kirin.modules.baseData.service.TypeInfoService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;




/**
 * 类型信息表
 * 
 * @author kirin
 * @email yang5830404@163.com
 * @date 2017-10-01 23:29:47
 */
@RestController
@RequestMapping("/baseData/typeinfo")
public class TypeInfoController extends AbstractController {
	@Autowired
	private TypeInfoService typeInfoService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("baseData:typeinfo:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<TypeInfoEntity> typeInfoList = typeInfoService.queryList(query);
		int total = typeInfoService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(typeInfoList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	@RequestMapping("/listAll")
	@RequiresPermissions("baseData:typeinfo:list")
	public List<TypeInfoEntity> listAll(@RequestParam Map<String, Object> params){
		List<TypeInfoEntity> typeInfoList = typeInfoService.queryList(new HashMap<String,Object>());
		return typeInfoList;
	}

	@RequestMapping("/select")
	public R select(@RequestParam("parentId")Long parentId){
		//查询列表数据
//		List<TypeInfoEntity> typeInfoList = typeInfoService.queryParentList();
		List<TypeInfoEntity> typeInfoList = null;
//		if(parentId == null){
//			parentId = 0L;
//		}
		typeInfoList = typeInfoService.queryParentList(parentId);
		//添加顶级菜单
		TypeInfoEntity root = new TypeInfoEntity();
		root.setId(0L);
		root.setTypeName("一级分类");
		root.setParentId(-1L);
		root.setOpen(true);
		typeInfoList.add(root);

		return R.ok().put("typeInfoList", typeInfoList);
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("baseData:typeinfo:info")
	public R info(@PathVariable("id") Long id){
		TypeInfoEntity typeInfo = typeInfoService.queryObject(id);
		
		return R.ok().put("typeInfo", typeInfo);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("baseData:typeinfo:save")
	public R save(@RequestBody TypeInfoEntity typeInfo){
		SysUserEntity sysUserEntity =  getUser();

		typeInfo.setCreateUser(sysUserEntity.getUsername());
		typeInfo.setCreateDate(new Date());
		typeInfoService.save(typeInfo);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("baseData:typeinfo:update")
	public R update(@RequestBody TypeInfoEntity typeInfo){
		SysUserEntity sysUserEntity =  getUser();

		typeInfo.setUpdateUser(sysUserEntity.getUsername());
		typeInfo.setUpdateDate(new Date());
		typeInfoService.update(typeInfo);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
//	@RequestMapping("/delete")
//	@RequiresPermissions("baseData:typeinfo:delete")
//	public R delete(@RequestBody Long[] ids){
//		typeInfoService.deleteBatch(ids);
//
//		return R.ok();
//	}

	@SysLog("删除菜单")
	@RequestMapping("/delete")
	@RequiresPermissions("baseData:typeinfo:delete")
	public R delete(Long typeInfoId){
		System.out.println("--------->typeInfoId="+typeInfoId);
		//判断是否有子菜单或按钮
		List<TypeInfoEntity> typeInfoList = typeInfoService.queryListParentId(typeInfoId);
		if(typeInfoList.size() > 0){
			return R.error("请先删除子分类");
		}

		typeInfoService.delete(typeInfoId);

		return R.ok();
	}

	@RequestMapping("/getTypeInfo2Commbom")
	public R getTypeInfo2Commbom(){
		List<TypeInfoEntity> dictTypeInfoList = typeInfoService.queryListForCommbom();
		List<Map> typeArr = new ArrayList<Map>();
		if(dictTypeInfoList != null && dictTypeInfoList.size() > 0){
			for (TypeInfoEntity typeInfoEntity : dictTypeInfoList) {
				Map<String,String> map = new HashMap<String,String>();
				map.put("text", typeInfoEntity.getTypeName());
				map.put("value", typeInfoEntity.getId().toString());
				typeArr.add(map);
			}
		}
		System.out.println("---------"+typeArr.size());
		return R.ok().put("dataJson", typeArr);
	}

	@RequestMapping("/queryListParentId")
	public R queryListParentId(@RequestParam("parentId")Long parentId,@RequestParam("searchWord")String searchWord){
		List<TypeInfoEntity> typeList = typeInfoService.queryListParentId(parentId);
		List<TypeInfoEntity> typeArr = new ArrayList<TypeInfoEntity>();
		if(typeList != null && typeList.size() > 0){
			for (TypeInfoEntity typeInfoEntity : typeList) {
				if(typeInfoEntity.getTypeName().indexOf(searchWord) >= 0 || typeInfoEntity.getTypePy().indexOf(searchWord.toUpperCase())>=0){
					typeArr.add(typeInfoEntity);
				}
			}
		}
		return R.ok().put("data",typeArr);
	}

	/**
	 * 根据上级分类ID来创建最新编号
	 * @param id
	 * @return
	 */
	@RequestMapping("/createMaxNo/{id}")
	public R createMaxNo(@PathVariable("id")Long id){
		List<TypeInfoEntity> typeList = new ArrayList<TypeInfoEntity>();
		//判断传入ID，为0则为一级分类，否则根据传入参数进行查询此分类下的最大编号
		typeList = typeInfoService.queryListParentId(id);
		String no = "0";

		if(id == 0){//查询一级分类最大编号
			if(typeList == null || typeList.size() == 0){
				no = "A";
			}else{
				char no_char = no.charAt(0);
				for (TypeInfoEntity type : typeList){
					if(type.getTypeCode().charAt(0)>no_char){
						no_char = type.getTypeCode().charAt(0);
					}
				}
				no = String.valueOf((char)(no_char+1));
			}
		}else{
			if(typeList == null || typeList.size() == 0){
				no = "01";
			}else{
				Long no_long = Long.valueOf(no);
				for (TypeInfoEntity type : typeList){
					if(no_long < Long.valueOf(type.getTypeCode())){
						no_long = Long.valueOf(type.getTypeCode());
					}
				}
				no = String.format("%02d",(no_long + 1));
			}
		}
		return R.ok().put("maxNo",no);
	}

	//二级下拉列表树
	@RequestMapping("/getTypeInfoForSelectTree")
	public R getTypeInfoForSelectTree(@RequestParam("parentId")Long parentId){
		List<TypeInfoEntity> typeList = typeInfoService.queryListParentId(parentId);
		List<Map<String,Object>> returnList = new ArrayList<Map<String,Object>>();
		for (TypeInfoEntity typeInfoEntity:typeList) {
			Map<String,Object> map = new HashMap<>();
			map.put("value",typeInfoEntity.getId());
			map.put("text",typeInfoEntity.getTypeName());
			List<TypeInfoEntity> typeChildList = typeInfoService.queryListParentId(typeInfoEntity.getId());
			List<Map<String,Object>> childList = new ArrayList<Map<String,Object>>();
			for (TypeInfoEntity childEntity:typeChildList) {
				Map<String,Object> childMap = new HashMap<>();
				childMap.put("value",childEntity.getId());
				childMap.put("text",childEntity.getTypeName());
				childList.add(childMap);
			}
			map.put("child",childList);
			returnList.add(map);
		}
		return R.ok().put("data",returnList);
	}


	public static void main(String[] params){
		String no = "01";
		Long no_long = Long.valueOf(no);
		System.out.println(no_long);
		System.out.println(String.format("%02d",(no_long + 1)));


		String searchWord = "y";
		String name = "测试字眼";
		String py = "CSZY";
		System.out.println(name.indexOf(searchWord));
		System.out.println(py.indexOf(searchWord.toUpperCase()));
		if(name.indexOf(searchWord) >= 0 || py.indexOf(searchWord.toUpperCase())>=0){
			System.out.println(true);
		}
	}
}
