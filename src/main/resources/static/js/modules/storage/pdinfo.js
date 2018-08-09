$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        $("#jqDetailGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    };

    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/pdinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', key: true ,hidden:true},
			{ label: '盘点单号', name: 'pdNo', index: 'PD_NO', width: 80 }, 			
			{ label: '盘点类型', name: 'pdType', index: 'PD_TYPE', width: 80 ,formatter:function(value, options, row){//0-原料盘点，1-半成品盘点
                var msg = "";
                if(value == 0){
                    msg = '原料盘点';
                }else if(value == 1){
                    msg = '半成品盘点';
                }
                return msg;
            },unformat:function(value, options, row){
                if($.trim(value)=="原料盘点"){
                    return "0";
                }else if($.trim(value)=="半成品盘点"){
                    return "1";
                }
            }},
			{ label: '开始日期', name: 'pdStartDate', index: 'PD_START_DATE', width: 80 }, 			
			{ label: '截止日期', name: 'pdEndDate', index: 'PD_END_DATE', width: 80 }, 			
			{ label: '盘点机构ID(仓库、站点）', name: 'pdOrgId', index: 'PD_ORG_ID',hidden:true},
			{ label: '机构名称', name: 'pdOrgName', index: 'PD_ORG_NAME', width: 80 },
			{ label: '创建日期', name: 'createDate', index: 'CREATE_DATE', width: 80 },
			{ label: '创建人', name: 'createUser', index: 'CREATE_USER', width: 80 },
            { label: '状态', name: 'pdStatus', index: 'PD_STATUS', width: 80 ,formatter:function(value, options, row){//0-已删除，1-待确认，2-已确认，3-已结转
                var msg = "";
                if(value == 0){
                    msg = '<p class="bg-danger">已删除</p>';
                }else if(value == 1){
                    msg = '<p class="bg-success">待确认</p>';
                }else if(value == 2){
                    msg = '<p class="bg-info">已确认</p>';
                }else if(value == 3){
                    msg = '<p class="bg-warning">已结转</p>';
                }
                return msg;
            },unformat:function(value, options, row){
                if($.trim(value)=="已删除"){
                    return "0";
                }else if($.trim(value)=="待确认"){
                    return "1";
                }else if($.trim(value)=="已确认"){
                    return "2";
                }else if($.trim(value)=="已结转"){
                    return "3";
                }
            }},
            { label: '操作', name: 'operation', index: 'operation', width: 150,formatter:function(value, options, row){
                var operatorStr = "";

                var detailStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"0\")'>详&nbsp;&nbsp;&nbsp;情</button>&nbsp;&nbsp;";
                var okStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"1\")'>确&nbsp;&nbsp;&nbsp;认</button>&nbsp;&nbsp;";
                var backStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"2\")'>反确认</button>&nbsp;&nbsp;";
                var overStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"3\")'>结&nbsp;&nbsp;&nbsp;转</button>&nbsp;&nbsp;";
                var printStr = "<button type='button' class='btn btn-info btn-xs' onclick='oper("+row.id+",\"4\")'>打&nbsp;&nbsp;&nbsp;印</button>&nbsp;&nbsp;";

                var status = row.pdStatus;
                if(status == '0'){
                    operatorStr = detailStr;
                }else if(status == '1'){//待确认
                    operatorStr = detailStr+okStr;
                }else if(status == '2'){//已确认
                    operatorStr = detailStr+backStr+overStr+printStr;
                }else if(status == '3'){//已结转
                    operatorStr = detailStr+printStr;
                }else if(status == '4'){
                    operatorStr = detailStr+printStr;
                }

                return operatorStr;
            }}
        ],
		viewrecords: true,
        height: "auto",
        rowNum: 9999999,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: false,
        // scroll:true,
        // pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });

    $("#jqDetailGrid").jqGrid({
        url: baseURL + 'storage/pddetail/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'id', index: 'ID', width: 50, key: true,hidden:true},
            { label: 'pdInfoId', name: 'pdInfoId', index: 'PD_INFO_ID',hidden:true},
            { label: '物料ID', name: 'mtrId', index: 'MTR_ID',hidden:true },
            { label: '物料编号', name: 'mtrCode', index: 'MTR_CODE', width: 120 },
            { label: '物料名称', name: 'mtrName', index: 'mtrName', width: 150 },
            { label: '物料类型', name: 'typeName', index: 'typeName', width: 80 },
            { label: '单位', name: 'miniUnitName', index: 'miniUnitName', width: 80 },
            { label: '上期结余数量', name: 'lastCount', index: 'LAST_COUNT', width: 80 },
            { label: '上期结余金额', name: 'lastAmt', index: 'LAST_AMT', width: 80 },
            { label: '本期盘点数量', name: 'currentCount', index: 'CURRENT_COUNT', width: 80 },
            { label: '本期盘点金额', name: 'currentAmt', index: 'CURRENT_AMT', width: 80 },
            { label: '本期入库数量', name: 'currentIn', index: 'CURRENT_IN', width: 80 },
            { label: '本期出库数量', name: 'currentOut', index: 'CURRENT_OUT', width: 80 },
            { label: '实际盘点数量', name: 'realCount', index: 'REAL_COUNT', width: 80,editable: true,edittype: "number" },
            { label: '实际盘点金额', name: 'realAmtlossCount', index: 'REAL_AMTLOSS_COUNT', width: 80 },
            { label: '盘盈数量', name: 'profttCount', index: 'PROFTT_COUNT', width: 80 },
            { label: '盘亏数量', name: 'lossCount', index: 'LOSS_COUNT', width: 80 },
            { label: '操作', name: 'operation', index: 'operation', width: 150,formatter:function(value, options, row){

                var updateId = row.id+'_btnUpdate';
                var saveId = row.id+'_btnSave';
                var cancelId = row.id+'_btnCancel';

                var editBtn = "<div class='btnBox'> "
                    + "<button type='button' id="+updateId+" class='btn btn-primary btn-xs'  onclick='editParam("
                    + row.id
                    + ")'>编辑</button>&nbsp;&nbsp;"
                    + "<button type='button' id="+saveId+" class='btn btn-primary btn-xs' onclick='saveParam("
                    + row.id
                    + ")'>保存</button>&nbsp;&nbsp;";
                    // + "<button type='button' id="+cancelId+" class='btn btn-primary btn-xs' onclick='cancelParam("
                    // + row.id + ")'>取消</button> </div>";

                var rowData = $("#jqGrid").jqGrid('getRowData',row.pdInfoId);
                var status = rowData.pdStatus;
                //4种状态：0-已删除，1-待确认，2-已确认，3-已结转
                if(status == '0' || status == '2' || status == '3'){
                    editBtn = "<div class='btnBox'> "
                        + "<button type='button' disabled='disabled' id="+updateId+" class='btn btn-primary btn-xs'  onclick='editParam("
                        + row.id
                        + ")'>编辑</button>&nbsp;&nbsp;"
                        + "<button type='button' disabled='disabled' id="+saveId+" class='btn btn-primary btn-xs' onclick='saveParam("
                        + row.id
                        + ")'>保存</button>&nbsp;&nbsp;";
                }
                return editBtn;
            }}
        ],
        viewrecords: true,
        height: "auto",
        rowNum: 200,
        rowList : [200,400,600],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: false,
        pager: "#jqDetailGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page",
            rows:"limit",
            order: "order"
        },
        gridComplete:function(){
            //隐藏grid底部滚动条
            $("#jqDetailGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });


    var newDate = new Date();
    var currentDate = newDate.toJSON();

    $("#pdStartDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        // initialDate:'2018-05-27',
        weekStart:1,
        endDate:new Date(currentDate)
    });
    $('#pdStartDate').datetimepicker().on('hide', function (ev) {
        var value = $("#pdStartDate").val();
        vm.pdInfo.pdStartDate = value;
    });

    $("#pdEndDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        // initialDate:'2018-05-27',
        weekStart:1,
        endDate:new Date(currentDate)
    });
    $('#pdEndDate').datetimepicker().on('hide', function (ev) {
        var value = $("#pdEndDate").val();
        vm.pdInfo.pdEndDate = value;
    });
});

/**
 * Grid操作列事件
 * @param rowid 所选择的操作行数据ID
 * @param type 操作类型：0-详情，1-确认，2-反确认，3-结转，4-打印
 */
function oper(rowId,type){
    //根据所选数据的状态来进行业务判断，4种状态：0-已删除，1-待确认，2-已确认，3-已结转
    var rowData = $("#jqGrid").jqGrid('getRowData',rowId);
    var status = rowData.pdStatus;
    if(type == '0'){
        vm.showMain = false;
        vm.showInfo = false;
        vm.showDetail = true;

        var page = $("#jqDetailGrid").jqGrid('getGridParam','page');
        $("#jqDetailGrid").jqGrid('setGridParam',{
            postData:{'pdInfoId': rowId,'sidx':'CURRENT_COUNT','order':'DESC'},
            page:page
        }).trigger("reloadGrid");


        // var allData = getGridAllData('jqDetailGrid');
        // if(allData != null && allData.length > 0){
        //     for(var i=0;i<allData.length;i++){
        //         var rowData = allData[i];
        //         $('#'+rowData.id+'_btnUpdate').attr("disabled",true);//编辑按钮变为不可用
        //         $('#'+rowData.id+'_btnSave').attr("disabled",true);
        //         // $('#'+rowData.id+'_tnCancel').attr("disabled",false);
        //     }
        // }

        // $("#jqDetailGrid").setColProp('realCount',{editable:{value:"True:False"}});//设置editable属性由true改为false
        // $("#jqDetailGrid").setColProp('operation',{formatter:function () {
        //     return "";
        // }});//设置editable属性由true改为false


    }else if(type == '1'){//确认操作，显示详情并提供详情的修改，在详情里面保存时修改Info状态；
        // vm.updateStatus(rowId,"2");

        vm.showMain = false;
        vm.showInfo = false;
        vm.showDetail = true;

        var page = $("#jqDetailGrid").jqGrid('getGridParam','page');
        $("#jqDetailGrid").jqGrid('setGridParam',{
            postData:{'pdInfoId': rowId,'sidx':'CURRENT_COUNT','order':'DESC'},
            page:page
        }).trigger("reloadGrid");

        // $("#jqDetailGrid").setColProp('realCount',{editable:{value:"False:True"}});//设置editable属性由true改为false

    }else if(type == '2'){
        vm.updateStatus(rowId,"1");
    }else if(type == '3'){
        vm.updateStatus(rowId,"3");
    }else if(type == '4'){
        alert('打印');
    }
}

//选中行启用行编辑
function editParam(id) {
    //调用此方法，使当前行变为可编辑
    $("#jqDetailGrid").jqGrid('editRow', id);

    $('#'+id+'_btnUpdate').attr("disabled",true);//编辑按钮变为不可用
    //保存和取消按钮变为可用
    $('#'+id+'_btnSave').attr("disabled",false);
    $('#'+id+'_tnCancel').attr("disabled",false);
}
//选中行启用行编辑
function saveParam(id) {
    var rowData = $("#jqDetailGrid").jqGrid('getRowData',id);
    var realCount = $('#'+id+'_realCount').val();
    $.ajax({
        type: "POST",
        async:false,
        url: baseURL + "storage/pdinfo/updateDetailCount",
        // contentType: "application/json",
        data: {detailId:id,realCount:realCount},
        success: function(r){
            if(r.code === 0){
                alert('操作成功', function(index){
                    var page = $("#jqDetailGrid").jqGrid('getGridParam','page');
                    $("#jqDetailGrid").jqGrid('setGridParam',{
                        postData:{'pdInfoId': rowData.pdInfoId,'sidx':'CURRENT_COUNT','order':'DESC'},
                        page:page
                    }).trigger("reloadGrid");
                });
            }else{
                alert(r.msg);
            }
        }
    });
    //调用此方法，使当前行变为可编辑
    // $("#jqDetailGrid").saveRow(id,parameter);

    $('#'+id+'_btnUpdate').attr("disabled",false);//编辑按钮变为可用
    //保存和取消按钮变为不可用
    $('#'+id+'_btnSave').attr("disabled",true);
    $('#'+id+'_btnCancel').attr("disabled",true);


}


var vm = new Vue({
	el:'#rrapp',
	data:{
        showMain: true,
        showInfo: false,
        showDetail: false,
		title: null,
        orgArr:null,
		pdInfo: {},
        pdDetail: {}
	},
	methods: {
        createNewNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/createBillNo",
                data:"billType=4",//0-采购单，1-采购入库单，2-领料出库单，3-客户订单，4-盘点单
                success: function(r){
                    no = r.newBillNo;
                }
            });
            return no;
        },
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showMain = false;
			vm.showInfo = true;
			vm.showDetail = false;
			vm.title = "新增";
			vm.pdInfo = {};
			var newNo = vm.createNewNo();
			vm.pdInfo.pdNo = newNo;
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
            vm.showMain = false;
            vm.showInfo = true;
            vm.showDetail = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
        updateStatus: function (pdInfoId,status) {
            $.ajax({
                type: "POST",
                url: baseURL + "storage/pdinfo/updateStatus",
                // contentType: "application/json",
                data: {pdInfoId:pdInfoId,status:status},
                success: function(r){
                    if(r.code === 0){
                        alert('操作成功', function(index){
                            vm.reload();
                        });
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
		saveOrUpdate: function (event) {
			var url = vm.pdInfo.id == null ? "storage/pdinfo/save" : "storage/pdinfo/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.pdInfo),
                beforeSend:function(XMLHttpRequest){
                    showLoading();
                },
			    success: function(r){
			    	if(r.code === 0){
                        hideLoading();
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "storage/pdinfo/delete",
                    contentType: "application/json",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get(baseURL + "storage/pdinfo/info/"+id, function(r){
                vm.pdInfo = r.pdInfo;
            });
		},
        getDetailInfo: function(id){
            $.get(baseURL + "storage/pddetail/info/"+id, function(r){
                vm.pdDetail = r.pdDetail;
            });
        },
		reload: function (event) {
            vm.showMain = true;
            vm.showInfo = false;
            vm.showDetail = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
        initTypeInfoArr:function(parentId){
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_type_info",search:"PARENT_ID in("+parentId+")",returnField:"ID as value,TYPE_NAME as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        }

	}
});
vm.orgArr = vm.initTypeInfoArr('23,48');

initLoading();