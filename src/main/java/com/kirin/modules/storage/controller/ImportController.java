package com.kirin.modules.storage.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

import com.kirin.common.fileUtils.ExcelDataEntity;
import com.kirin.common.fileUtils.ExcelUtils;
import com.kirin.modules.common.service.CommonUtilService;
import com.kirin.modules.common.utils.CommonUtils;
import com.kirin.modules.purchase.entity.OrderInfoEntity;
import com.kirin.modules.purchase.service.OrderDetailService;
import com.kirin.modules.purchase.service.OrderInfoService;
import com.kirin.modules.storage.entity.ImportDetailEntity;
import com.kirin.modules.storage.service.ImportDetailService;
import com.kirin.modules.sys.controller.AbstractController;
import com.kirin.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.kirin.modules.storage.entity.ImportEntity;
import com.kirin.modules.storage.service.ImportService;
import com.kirin.common.utils.PageUtils;
import com.kirin.common.utils.Query;
import com.kirin.common.utils.R;

import javax.servlet.http.HttpServletResponse;


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

	@Autowired
	ImportDetailService importDetailService;

	@Autowired
	private OrderInfoService orderInfoService;

	@Autowired
	private OrderDetailService orderDetailService;

	/**
	 * 列表
	 */
	@RequestMapping("/listOrder")
	@RequiresPermissions("storage:import:listOrder")
	public R listOrder(@RequestParam Map<String, Object> params){
		//查询列表数据
		String[] statusArr = new String[]{"2","3"};
		params.put("status",statusArr);
		Query query = new Query(params);
		List<OrderInfoEntity> orderList = orderInfoService.queryList(query);
		int total = orderInfoService.queryTotal(query);
		PageUtils pageUtil = new PageUtils(orderList, total, query.getLimit(), query.getPage());
		return R.ok().put("page", pageUtil);
	}

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
		ImportEntity importInfo = importService.queryObjectByOrderId(id);
		
		return R.ok().put("import", importInfo);
	}

	/**
	 * 保存
	 */
	@RequestMapping("/add")
	@RequiresPermissions("storage:import:add")
	public R add(@RequestBody ImportEntity importInfo){
		SysUserEntity sysUserEntity =  getUser();
		importInfo.setCreateUser(sysUserEntity.getUsername());
		importInfo.setImportDate(new Date());

		if(importInfo.getImportNo() == null || importInfo.getImportNo().equals("")){
			return R.ok();
		}

		//写入入库记录
		importInfo.setStatus("2");
		importService.save(importInfo);
		//写入入库明细记录
		importDetailService.insertImportDetailFromOrderDetail(importInfo.getOrderId());

		//更新订单状态为已入库；防止重复入库
		OrderInfoEntity orderInfoEntity = orderInfoService.queryObject(importInfo.getOrderId());
		orderInfoEntity.setStatus("3");
		orderInfoService.update(orderInfoEntity);




		return R.ok().put("import",importInfo);
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

		if(importInfo.getImportNo() == null || importInfo.getImportNo().equals("")){
			return R.ok();
		}

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
//	public R update(@RequestParam("id")Long id,@RequestParam("status")String status){
	public R updateInfo(@RequestParam Map<String, Object> params){
		Long id = Long.valueOf(params.get("orderId").toString());//orderId
		String status = params.get("status").toString();
		String type = params.get("type") == null ? "0" : params.get("type").toString();

		//采购入库的各种操作都根据采购单ID来进行操作
		//1.采购单的各种状态转换
		//2.采购单反确认：修改采购单状态，并删除采购单下的所有入库记录
		if(type.equals("back")){
			OrderInfoEntity orderInfoEntity = orderInfoService.queryObject(id);
			orderInfoEntity.setStatus("1");
			orderInfoService.update(orderInfoEntity);

			//删除入库明细及入库单
			ImportEntity importEntity = importService.queryObjectByOrderId(id);
			if(importEntity != null){
				importService.delete(importEntity.getId());

				Map<String,Object> param = new HashMap<>();
				param.put("importId",importEntity.getId());
				List<ImportDetailEntity> importDetailEntityList = importDetailService.queryList(param);
				if(importDetailEntityList != null && importDetailEntityList.size() > 0){
					Long[] detailIds = new Long[importDetailEntityList.size()];
					int i=0;
					for (ImportDetailEntity importDetailEntity:importDetailEntityList) {
						detailIds[i] = importDetailEntity.getId();
						i++;
					}
					importDetailService.deleteBatch(detailIds);
				}
			}
		}else{
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
		}
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

	@RequestMapping("/export")
	public void exportExcel(HttpServletResponse response,@RequestParam("type") String type,@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate) throws Exception {

		ExcelDataEntity data = new ExcelDataEntity();
		List<String> titles = new ArrayList();
		if(type.equals("CW")){//财务导出
			data.setSheetName("凭证");
			titles.add("公司");//SX02
			titles.add("记账日期");//入库日期
			titles.add("业务日期");//入库日期
			titles.add("会计期间");//月份
			titles.add("凭证类型");//记
			titles.add("凭证号");//1
			titles.add("分录号");//序号
			titles.add("摘要");//订单号-仓库入库单
			titles.add("科目");//1403.02.01代表食材科目代码(原料) 1403.02.03代表包材科目代码(包材) 1403.01代表备抵户科目代码(税额) 2202.01.01.01代表应付账款科目代码(总额)

			titles.add("币种");//BB01
			titles.add("汇率");//1
			titles.add("方向");//2202.01.01.01时为0.其它为1
			titles.add("原币金额");
			titles.add("数量");
			titles.add("单价");
			titles.add("借方金额");
			titles.add("贷方金额");
			titles.add("制单人");
			titles.add("过账人");
			titles.add("审核人");
			titles.add("附件数量");
			titles.add("过账标记");
			titles.add("机制凭证模板");
			titles.add("删除标记");
			titles.add("凭证序号");
			titles.add("单位");
			titles.add("参考信息");
			titles.add("是否有现金流量");
			titles.add("现金流量标记");
			titles.add("业务编号");
			titles.add("结算方式");
			titles.add("结算号");
			titles.add("辅助账摘要");
			for (int i=1;i<=8;i++){
				titles.add("核算项目"+i);
				titles.add("编码"+i);
				titles.add("名称"+i);
			}
			titles.add("换票证号");
			titles.add("发票号");
			titles.add("客户");
			titles.add("费用类别");
			titles.add("收款人");
			titles.add("物料");
			titles.add("财务组织");
			titles.add("供应商");
			titles.add("辅助账业务日期");
			titles.add("到期日");
		}else{//普通导出
			data.setSheetName("入库明细");
			titles.add("原料类别");
			titles.add("编码");
			titles.add("名称");
			titles.add("单位");
			titles.add("总数量");
			titles.add("总金额");
			titles.add("平均单价");
		}
		data.setTitles(titles);


		String sql = "select (select t.TYPE_NAME from tb_type_info t where t.id=m.TYPE_ID) as TYPE_NAME,m.MTR_CODE,m.MTR_NAME,(select t.TYPE_NAME from tb_type_info t where t.id=m.PURCHASE_UNIT) as ORDER_UNIT,sum(imd.IN_COUNT) as SUM_IN_COUNT,CAST(((imd.IN_COUNT)*m.PRICE) as DECIMAL(10,2)) as SUM_IN_MONEY,m.PRICE from tb_import im,tb_import_detail imd,mtr_data m where im.id=imd.IMPORT_ID and imd.MTR_ID=m.id and im.`STATUS`='3' ";
		String sqlCW = "SELECT oi.ORDER_NO,im.IMPORT_NO,oi.SUPPLIER_ID,(select s.suppier_code from tb_supplier_info s where s.id=oi.SUPPLIER_ID) as SUPPLIER_NO,(select s.suppier_name from tb_supplier_info s where s.id=oi.SUPPLIER_ID) as SUPPLIER_NAME,DATE_FORMAT(im.IMPORT_DATE,'%Y-%m-%d') as IMPORT_DATE FROM tb_order_info oi LEFT JOIN tb_import im ON oi.ID = im.ORDER_ID where oi.`STATUS`='3'";
		String sqlCWDetail = "SELECT oi.ORDER_NO,im.IMPORT_NO,oi.SUPPLIER_ID,DATE_FORMAT(im.IMPORT_DATE,'%Y-%m-%d') as IMPORT_DATE,m.MTR_NAME,m.MTR_CODE,sm.price,imd.IN_COUNT,m.TAX_RATE,m.TYPE_ID,cast((sm.price*imd.IN_COUNT) as DECIMAL(10,2)) as SUM_PRICE,cast((sm.price*imd.IN_COUNT)/m.TAX_RATE as DECIMAL(10,2)) as TAX_PRICE FROM tb_order_info oi LEFT JOIN tb_import im ON oi.ID = im.ORDER_ID LEFT JOIN tb_import_detail imd on im.ID=imd.IMPORT_ID LEFT join mtr_data m on imd.MTR_ID=m.id LEFT JOIN tb_suppier_mtr sm on oi.SUPPLIER_ID=sm.suppier_id and imd.MTR_ID=sm.mtr_id and m.id=sm.mtr_id where oi.`STATUS`='3'";

		if(startDate != null && !startDate.equals("")){
			sql += "and im.IMPORT_DATE >= '"+startDate+"'";
			sqlCW += "and im.IMPORT_DATE >= '"+startDate+"'";
			sqlCWDetail += "and im.IMPORT_DATE >= '"+startDate+"'";
		}
		if(endDate != null && !endDate.equals("")){
			sql += "and im.IMPORT_DATE <= '"+endDate+"'";
			sqlCW += "and im.IMPORT_DATE <= '"+endDate+"'";
			sqlCWDetail += "and im.IMPORT_DATE <= '"+endDate+"'";
		}

		List<List<Object>> rows = new ArrayList();
		if(type.equals("CW")){
			List<Map> info = commonUtilService.executeSql(sqlCW);
			List<Map> detail = commonUtilService.executeSql(sqlCWDetail);

			if((info != null && info.size() > 0) && (detail != null && detail.size() > 0)){
				int index = 1;
				for (Map mapInfo :info) {
					String supplierId = mapInfo.get("SUPPLIER_ID").toString();
					String importNo = mapInfo.get("IMPORT_NO").toString();
					String orderNo = mapInfo.get("ORDER_NO").toString();

					BigDecimal taxSumPrice = new BigDecimal("0");
					BigDecimal sumPrice = new BigDecimal("0");

					for (Map mapDetail :detail) {//1403.02.01原料  1403.02.03包材
						if(supplierId.equals(mapDetail.get("SUPPLIER_ID").toString())&&importNo.equals(mapDetail.get("IMPORT_NO").toString())&&orderNo.equals(mapDetail.get("ORDER_NO").toString())){

							BigDecimal taxPrice = new BigDecimal(mapDetail.get("TAX_PRICE").toString());
							BigDecimal price = new BigDecimal(mapDetail.get("SUM_PRICE").toString());

							taxSumPrice = taxSumPrice.add(taxPrice);
							sumPrice = sumPrice.add(price);

							List<Object> row = new ArrayList();
							row.add("SX02");//SX02
							row.add(mapInfo.get("IMPORT_DATE").toString());//入库日期
							row.add(mapInfo.get("IMPORT_DATE").toString());//入库日期
							row.add(mapInfo.get("IMPORT_DATE").toString().substring(5,7));//月份
							row.add("记");//记
							row.add("1");//1
							row.add(index);//序号
							row.add(orderNo+"_"+importNo);//订单号-仓库入库单
							if(mapDetail.get("TYPE_ID").toString().equals("389")){//包材
								row.add("1403.02.03");//1403.02.01代表食材科目代码(原料) 1403.02.03代表包材科目代码(包材) 1403.01代表备抵户科目代码(税额) 2202.01.01.01代表应付账款科目代码(总额)
							}else{
								row.add("1403.02.01");//1403.02.01代表食材科目代码(原料) 1403.02.03代表包材科目代码(包材) 1403.01代表备抵户科目代码(税额) 2202.01.01.01代表应付账款科目代码(总额)
							}
							row.add("BB01");//BB01
							row.add("1");//1
							row.add("1");//2202.01.01.01时为0.其它为1
							row.add(mapDetail.get("SUM_PRICE").toString());
							row.add("");
							row.add("");
							row.add(mapDetail.get("SUM_PRICE").toString());
							row.add("0");
							row.add("胡艳芳");
							row.add("");
							row.add("");
							row.add("0");
							row.add("FALSE");
							row.add("");
							row.add("FALSE");
							row.add("1515891353015--0");
							row.add("");
							row.add("");
							row.add("");
							row.add("0");
							row.add("");
							row.add("");
							row.add("");
							row.add(orderNo+"_"+importNo);
							row.add("品种名称");
							row.add("SX02"+"-"+mapDetail.get("MTR_CODE").toString());
							row.add(mapDetail.get("MTR_NAME").toString());
							for (int i=2;i<=8;i++){
								row.add("");
								row.add("");
								row.add("");
							}
							row.add("");
							row.add("");
							row.add("");
							row.add("");
							row.add("");
							row.add("");
							row.add("");
							row.add("");
							row.add(mapInfo.get("IMPORT_DATE").toString());
							row.add("");

							index++;

							rows.add(row);
						}
					}
					//1403.01 税额
					//2202.01.01.01总额
					for(int i=0;i<2;i++){
						List<Object> row = new ArrayList();
						row.add("SX02");//SX02
						row.add(mapInfo.get("IMPORT_DATE").toString());//入库日期
						row.add(mapInfo.get("IMPORT_DATE").toString());//入库日期
						row.add(mapInfo.get("IMPORT_DATE").toString().substring(5,7));//月份
						row.add("记");//记
						row.add("1");//1
						row.add(index);//序号
						row.add(orderNo+"_"+importNo);//订单号-仓库入库单
						if(i==0){
							row.add("1403.01");//1403.02.01代表食材科目代码(原料) 1403.02.03代表包材科目代码(包材) 1403.01代表备抵户科目代码(税额) 2202.01.01.01代表应付账款科目代码(总额)
						}else{
							row.add("2202.01.01.01");//1403.02.01代表食材科目代码(原料) 1403.02.03代表包材科目代码(包材) 1403.01代表备抵户科目代码(税额) 2202.01.01.01代表应付账款科目代码(总额)
						}

						row.add("BB01");//BB01
						row.add("1");//1
						if(i == 0){//2202.01.01.01时为0.其它为1
							row.add("1");//1
							row.add(taxSumPrice);
						}else{
							row.add("0");//1
							row.add(taxSumPrice.add(sumPrice));
						}

						row.add("");
						row.add("");
						if(i == 0){
							row.add(taxSumPrice);
							row.add("0");
						}else{
							row.add("0");
							row.add(taxSumPrice.add(sumPrice));
						}
						row.add("胡艳芳");
						row.add("");
						row.add("");
						row.add("0");
						row.add("FALSE");
						row.add("");
						row.add("FALSE");
						row.add("1515891353015--0");
						row.add("");
						row.add("");
						row.add("");
						row.add("0");
						row.add("");
						row.add("");
						row.add("");
						row.add(orderNo+"_"+importNo);
						row.add("供应商");
						row.add("SX02"+"-02.01.02-"+mapInfo.get("SUPPLIER_NO").toString());
						row.add(mapInfo.get("SUPPLIER_NAME").toString());
						for (int j=2;j<=8;j++){
							row.add("");
							row.add("");
							row.add("");
						}
						row.add("");
						row.add("");
						row.add("");
						row.add("");
						row.add("");
						row.add("");
						row.add("");
						row.add("");
						row.add(mapInfo.get("IMPORT_DATE").toString());
						row.add("");

						index++;

						rows.add(row);
					}
				}
			}
		}else{
			sql += " GROUP BY imd.MTR_ID";
			List<Map> info = commonUtilService.executeSql(sql);
			if(info != null && info.size() > 0){
				for (Map mapInfo :info) {
					List<Object> row = new ArrayList();
					row.add(mapInfo.get("TYPE_NAME").toString());//TYPE_NAME
					row.add(mapInfo.get("MTR_CODE").toString());//MTR_CODE
					row.add(mapInfo.get("MTR_NAME").toString());//ORDER_UNIT
					row.add(mapInfo.get("ORDER_UNIT").toString());//ORDER_UNIT
					row.add(mapInfo.get("SUM_IN_COUNT").toString());//SUM_IN_COUNT
					row.add(mapInfo.get("SUM_IN_MONEY").toString());//SUM_IN_MONEY
					row.add(mapInfo.get("PRICE").toString());//PRICE

					rows.add(row);
				}
			}
		}

		data.setRows(rows);
		//生成本地
		/*File f = new File("c:/test.xlsx");
		FileOutputStream out = new FileOutputStream(f);
		ExportExcelUtils.exportExcel(data, out);
		out.close();*/
		SimpleDateFormat fdate=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String fileName=fdate.format(new Date())+".xlsx";
		ExcelUtils.exportExcel(response,fileName,data);
	}

}
