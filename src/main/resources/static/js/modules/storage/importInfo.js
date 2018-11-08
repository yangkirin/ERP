$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    };

    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/import/listOrder',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
            { label: '订单编号', name: 'orderNo', index: 'ORDER_NO', width: 80 },
            { label: '供应商ID', name: 'supplierId', index: 'SUPPLIER_ID', width: 80 ,hidden:true},
            { label: '供应商', name: 'supplierName', index: 'SUPPLIER_NAME', width: 120 },
            { label: '订购总额', name: 'orderSumPrice', index: 'ORDER_SUM_PRICE', width: 60 ,formatter : "number",align:"right"},
            { label: '入库总额', name: 'inSumPrice', index: 'IN_SUM_PRICE', width: 60 ,formatter : "number",align:"right"},
            { label: '期望到货日期', name: 'exceptionDate', index: 'EXCEPTION_DATE', width: 60 ,align:"right"},
            { label: '状态', name: 'status', index: 'STATUS', width: 40 ,align:"center",formatter: function(value, options, row){
                var msg = "";
                if(value == 0){
                    msg = '<p class="bg-danger">已撤销</p>';
                }else if(value == 1){
                    msg = '<p class="bg-success">待确认</p>';
                }else if(value == 2){
                    msg = '<p class="bg-info">待入库</p>';
                }else if(value == 3){
                    msg = '<p class="bg-warning">已入库</p>';
                }else if(value == 4){
                    msg = '<p class="bg-primary">已结转</p>';
                }else{
                    msg = '<p class="bg-danger">未知</p>';
                }
                return msg;
            },unformat:function(value, options, row){
                if($.trim(value)=="已撤销"){
                    return "0";
                }else if($.trim(value)=="待确认"){
                    return "1";
                }else if($.trim(value)=="待入库"){
                    return "2";
                }else if($.trim(value)=="已入库"){
                    return "3";
                }else if($.trim(value)=="已结转"){
                    return "4";
                }
            }},
            { label: '操作', name: 'operation', index: 'operation', width: 150,formatter:function(value, options, row){
                var operatorStr = "";
                
                var editStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"0\")'>修&nbsp;&nbsp;&nbsp;改</button>&nbsp;&nbsp;";
                var importStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"1\")'>入&nbsp;&nbsp;&nbsp;库</button>&nbsp;&nbsp;";
                var backStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"2\")'>反确认</button>&nbsp;&nbsp;";
                var printStr = "<button type='button' class='btn btn-info btn-xs' onclick='oper("+row.id+",\"3\")'>打&nbsp;&nbsp;&nbsp;印</button>&nbsp;&nbsp;";

                if(!hasPermission('purchase:orderinfo:update')){
                    editStr = "";
                }
                if(!hasPermission('purchase:orderinfo:delete')){
                    confirmStr = "";
                }

                var status = row.status;
                if(status == '0'){
                    operatorStr = "";
                }else if(status == '2'){//待入库
                    operatorStr = importStr;
                }else if(status == '3'){//已入库
                    operatorStr = editStr+backStr+printStr;
                }else if(status == '4'){
                    operatorStr = printStr;
                }
                
                return operatorStr;
            }}
        ],
		viewrecords: true,
        // height: 385,
        height: 'auto',
        rowNum: 20,
		rowList : [20,50,100],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        // scroll:true,
        pager: "#jqGridPager",
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
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var rowData = $("#jqGrid").jqGrid("getRowData",row_id);
            var url = baseURL + 'storage/importdetail/orderDetailList?orderId='+row_id;
            createSubGrid(subgrid_id,row_id,url);
        },
        onSelectRow:function(id){
            var ids = $('#jqGrid').getGridParam("selarrrow");

            if(ids != null && ids.length > 1){
                $('#confirm_storg').attr("disabled", true);
                $('#printImport').attr("disabled", false);
                for(var i=0;i<ids;i++){
                    var rowData = $("#jqGrid").jqGrid("getRowData", ids[i]);
                    if(rowData.status == '1'){
                        $('#printImport').attr("disabled", true);
                        break;
                    }
                }
            }else{
                var id = $('#jqGrid').jqGrid("getGridParam","selrow");
                var rowData = $("#jqGrid").jqGrid("getRowData", id);
                if(rowData.status == '1'){
                    $('#confirm_storg').attr("disabled", false);
                    $('#printImport').attr("disabled", true);
                }else{
                    $('#confirm_storg').attr("disabled", true);
                    $('#printImport').attr("disabled", false);
                }
            }
        }
    });

    function createSubGrid(subgrid_id,row_id,url){
        var subgrid_table_id, pager_id;
        subgrid_table_id = subgrid_id + "_t";
        pager_id = "p_" + subgrid_table_id;
        $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
        jQuery("#" + subgrid_table_id).jqGrid({
            url : url,
            datatype : "json",
            colModel : [
                {label: 'id', name: 'id', index: 'ID', width: 50, key: true,hidden:true},
                {label: '订单ID', name: 'orderId', index: 'ORDER_ID', width: 80,hidden:true},
                {label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80,hidden:true},
                {label: '原料编码', name: 'mtrCode', index: 'MTR_CODE', width: 100},
                {label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 180},
                {label: '单位', name: 'mtrUnit', index: 'MTR_UNIT', width: 40},
                {label: '转换率', name: 'mtrRate', index: 'MTR_RATE', width: 60,formatter : "number",align:"right"},
                {label: '采购数量', name: 'amount', index: 'AMOUNT', width: 80,editable:true,formatter : "number",align:"right"},
                {label: '单价', name: 'price', index: 'PRICE', width: 50,editable:false,formatter : "number",align:"right"},
                {label: '采购金额', name: 'sumPrice', index: 'SUM_PRICE', width: 60,editable:false,align:"right",formatter:function(value, options, row){
                    return Number(Number(row.amount)*Number(row.price)).toFixed(2);
                }},
                {label: '入库数量', name: 'inCount', index: 'IN_COUNT', width: 60,editable:true,formatter : "number",align:"right"},
                {label: '入库重量', name: 'inWgt', index: 'IN_WGT', width: 60,formatter : "number",align:"right"},
                {label: '入库金额', name: 'inPrice', index: 'IN_PRICE', width: 60,formatter : "number",align:"right"},
                {label: '实际入库日期', name: 'inDate', index: 'IN_DATE', width: 100}
            ],
            rowNum : 99999,
            height : '100%',
            rowList : [10,30,50],
            rownumbers: true,
            rownumWidth: 25,
            autowidth:true,
            multiselect: false,
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
                $("#" + subgrid_table_id).closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
            }
        })
    };

    $("#jqGridMtr").jqGrid({
        url: baseURL + 'storage/importdetail/list',
        editurl : baseURL+"storage/importdetail/editDetail",
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '入库单ID', name: 'importId', index: 'IMPORT_ID', width: 80,hidden:true },
            { label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80,hidden:true },
            { label: '原料名称', name: 'mtrName', index: 'mtrName', width: 140},
            { label: '原料编号', name: 'mtrNo', index: 'MTR_NO', width: 80 },
            { label: '入库单位', name: 'inUnit', index: 'IN_UNIT', width: 60 },
            { label: '入库转换率', name: 'inRate', index: 'IN_RATE', width: 70 },
            { label: '采购数量', name: 'orderCount', index: 'ORDER_COUNT', width: 60 },
            { label: '采购单价', name: 'orderPrice', index: 'ORDER_PRICE', width: 60 },
            { label: '采购金额', name: 'orderSumPrice', index: 'ORDER_SUM_PRICE', width: 60, align:"right",formatter:function(value, options, row){
                return Number(Number(row.orderCount)*Number(row.orderPrice)).toFixed(2);
            }},
            { label: '入库数量', name: 'inCount', index: 'IN_COUNT', width: 60 },
            { label: '入库单价', name: 'inPrice', index: 'IN_PRICE', width: 60 },
            { label: '入库金额', name: 'inSumPrice', index: 'IN_SUM_PRICE', width: 60 , align:"right",formatter:function(value, options, row) {
                return Number(Number(row.inCount) * Number(row.inPrice)).toFixed(2);
            }},
            { label: '入库重量', name: 'inWgt', index: 'IN_WGT', width: 60 },
            { label: '入库日期', name: 'inDate', index: 'IN_DATE', width: 120 }
        ],
        viewrecords: true,
        height: 'auto',
        rowNum: 99999999,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: false,
        // scroll:true,
        ondblClickRow:function(id){
            var orderId = $('#jqGrid').jqGrid("getGridParam","selrow");
            var rowData = $("#jqGridMtr").jqGrid("getRowData",id);

            if (lastSelection != null && lastSelection != "" && lastSelection.length > 0) {
                $("#jqGridMtr").jqGrid('saveRow', lastSelection);//保存上一行
            }

            //当前选中行
            lastSelection = id;//临时存储当前选中行
            //$("#fieldGrid").jqGrid('editRow', id);
            $("#jqGridMtr").jqGrid('editRow', id, { keys: true, focusField: 1 });

            if (id && id !== lastSelection) {
                var grid = $("#jqGridMtr");
                grid.jqGrid('restoreRow',lastSelection);
                grid.jqGrid('editRow',id, {
                    keys:true,
                    // focusField: 1,
                    mtype: "POST",
                    contentType: "application/json",
                    extraparam:{detailId:id,amount:rowData.amount,price:rowData.price,inCount:rowData.inCount},
                    oneditfunct:function(rowid){
                        var data = $("#jqGridMtr").jqGrid("getRowData",rowid);
                        $("#jqGridMtr").jqGrid('setGridParam',{
                            postData:{'importId': orderId},
                        }).trigger("reloadGrid");
                    }
                });
                lastSelection = id;
            }

        },
        // pager: "#jqGridPagerMtr",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        onSelectRow:function(id){
            // vm.orderDetail.id = id;
        },
        gridComplete: function () {
            $('#jqGridMtr_orderCount').css('text-align','right');
            $('#jqGridMtr_orderPrice').css('text-align','right');
            $('#jqGridMtr_orderSumPrice').css('text-align','right');
            $('#jqGridMtr_orderMtrWgt').css('text-align','right');
            $('#jqGridMtr_inWgt').css('text-align','right');

            //隐藏grid底部滚动条
            $("#jqGridMtr").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});

        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var rowData = $("#jqGrid").jqGrid("getRowData",row_id);
            var url = baseURL + 'storage/importmtrbatch/list?importDetailId='+row_id;
            createSubBatchGrid(subgrid_id,row_id,url);
        }
    });

    function createSubBatchGrid(subgrid_id,row_id,url){
        var subgrid_table_id, pager_id;
        subgrid_table_id = subgrid_id + "_t";
        pager_id = "p_" + subgrid_table_id;
        $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
        jQuery("#" + subgrid_table_id).jqGrid({
            url : url,
            datatype : "json",
            colModel : [
                { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},

                {
                    label: '修改', name: '', index: 'operateEdit', width: 50, align: 'center',
                    formatter: function (cellvalue, options, row) {
                        return "<button type='button' class='btn btn-primary btn-xs' onclick='editMtr("+row.id+")'>修改</button>"
                    },
                },
                {
                    label: '删除', name: '', index: 'operateEdit', width: 50, align: 'center',
                    formatter: function (cellvalue, options, row) {
                        return "<button type='button' class='btn btn-primary btn-xs' onclick='deleteMtr("+row.id+")'>删除</button>"
                    },
                },
                { label: '入库单ID', name: 'importId', index: 'IMPORT_ID', width: 80 ,hidden:true},
                { label: '入库明细ID', name: 'importDetailId', index: 'IMPORT_DETAIL_ID', width: 80 ,hidden:true},
                { label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80 ,hidden:true},
                { label: '采购单位ID', name: 'orderUnitId', index: 'ORDER_UNIT_ID', width: 80 ,hidden:true},
                { label: '入库单位ID', name: 'inUnitId', index: 'IN_UNIT_ID', width: 80 ,hidden:true},

                { label: '批次号', name: 'batchNo', index: 'BATCH_NO', width: 100 },
                { label: '生产日期', name: 'productionDate', index: 'PRODUCTION_DATE', width: 80 },
                { label: '有效日期', name: 'effectiveDate', index: 'EFFECTIVE_DATE', width: 80 },
                { label: '入库数量', name: 'inCount', index: 'IN_COUNT', width: 70 },

                { label: '采购数量', name: 'orderCount', index: 'ORDER_COUNT', width: 70 },
                { label: '采购单价', name: 'orderPrice', index: 'ORDER_PRICE', width: 70 ,hidden:true},
                { label: '采购单位', name: 'orderUnitName', index: 'ORDER_UNIT_NAME', width: 80 ,hidden:true},
                { label: '采购转换率', name: 'orderUnitRate', index: 'ORDER_UNIT_RATE', width: 80 ,hidden:true},

                { label: '入库单位', name: 'inUnitName', index: 'IN_UNIT_NAME', width: 80 },
                { label: '入库转换率', name: 'inUnitRate', index: 'IN_UNIT_RATE', width: 80 },
                { label: '入库单价', name: 'inPrice', index: 'IN_PRICE', width: 70 },
                { label: '入库总金额', name: 'inTotlaPrice', index: 'IN_TOTLA_PRICE', width: 70 ,formatter : "number"},
                { label: '状态', name: 'status', index: 'STATUS', width: 80 ,hidden:true}
            ],
            rowNum : 20,
            height : '100%',
            rowList : [10,30,50],
            rownumbers: true,
            rownumWidth: 25,
            autowidth:true,
            multiselect: false,
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
                $('#'+subgrid_table_id+'_operateEdit').css('text-align','center');
                $('#'+subgrid_table_id+'_operateDel').css('text-align','center');

                //隐藏grid底部滚动条
                $("#" + subgrid_table_id).closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
            }
        })
    };

    var newDate = new Date();
    var currentDate = newDate.toJSON();

    $("#exceptionDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1,
        endDate:new Date(currentDate)
    });

    $('#exceptionDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.orderInfo.exceptionDate = newDate;
    });

    //多规格下拉事件
    // $("#mtrSelectExtend").on("change",function(){
    //     var data = $(this).val();
    //     var text = $(this).find("option:selected").text();
    //
    //     vm.createBacthNo(vm.importMtrBatch.supplierId,vm.importMtrBatch.mtrId,data);//根据所选规格来生成批次号;
    //     vm.searchMtrInfo();
    //     console.log(vm.importMtrBatch);
    //
    // });

    $("#exportStartDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1,
        endDate:new Date(currentDate)
    });

    $('#exportStartDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.exportStartDate = newDate;
    });

    $("#exportEndDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1,
        endDate:new Date(currentDate)
    });

    $('#exportEndDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.exportEndDate = newDate;
    });

});

function editMtr(batchId){
    $.get(baseURL + "storage/importmtrbatch/info/"+batchId, function(r){
        console.log(r.importMtrBatch);
        vm.importMtrBatch = r.importMtrBatch;
    });

    var importId = $("#jqGrid").jqGrid('getGridParam','selrow');

    var num = layer.open({
        type: 1,
        skin: 'layui-layer-molv',
        title: "新增原料",
        area: ['750px', '350px'],
        shadeClose: false,
        content: jQuery("#detailLayer"),
        btn: ['提交','取消'],
        success:function(layero,index){
            var newDate = new Date();
            var currentDate = newDate.toJSON();
            $('#productionDate').datetimepicker({
                format: 'yyyy-mm-dd',
                language:'zh-CN',
                autoclose:true,
                minView:2,
                todayBtn:true,
                todayHighlight:true,
                weekStart:1,
                endDate:new Date(currentDate)
            });

            $('#productionDate').datetimepicker().on('changeDate', function(ev){
                var newDate = dateFtt('yyyy-MM-dd',ev.date);
                vm.importMtrBatch.productionDate = newDate;
            });

            $('#effectiveDate').datetimepicker({
                format: 'yyyy-mm-dd',
                language:'zh-CN',
                autoclose:true,
                minView:2,
                todayBtn:true,
                todayHighlight:true,
                weekStart:1,
                startDate:new Date(currentDate)
            });

            $('#effectiveDate').datetimepicker().on('changeDate', function(ev){
                var newDate = dateFtt('yyyy-MM-dd',ev.date);
                vm.importMtrBatch.effectiveDate = newDate;
            });

        },
        btn1: function (event) {
            vm.importMtrBatch.inTotlaPrice = Number(Number(vm.importMtrBatch.inCount)*Number(vm.importMtrBatch.orderPrice)).toFixed(2);

            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "storage/importmtrbatch/update",
                contentType: "application/json",
                data: JSON.stringify(vm.importMtrBatch),
                success: function(r){
                    if(r.code == 0){
                        alert('操作成功', function(index){
                            vm.importMtrBatch={};
                            $("#jqGridMtr").jqGrid('setGridParam',{
                                postData:{'importId': importId},
                            }).trigger("reloadGrid");

                            layer.close(num);
                        });
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        btn2:function(event){
            vm.importMtrBatch={};
        }
    });
};


function deleteMtr(batchId){
    var ids = [];
    ids.push(batchId);
    var importId = $("#jqGrid").jqGrid('getGridParam','selrow');
    confirm('确定要删除选中的记录？', function(){
        $.ajax({
            type: "POST",
            url: baseURL + "storage/importmtrbatch/delete",
            contentType: "application/json",
            data: JSON.stringify(ids),
            success: function(r){
                if(r.code == 0){
                    alert('操作成功', function(index){
                        $("#jqGridMtr").jqGrid('setGridParam',{
                            postData:{'importId': importId},
                        }).trigger("reloadGrid");
                        ids.splice(0,ids.length);//清空数组
                    });
                }else{
                    alert(r.msg);
                }
            }
        });
    });
};

/**
 * Grid操作列事件
 * @param rowid 所选择的操作行数据ID
 * @param type 操作类型：0-修改，1-入库，2-反确认，3-打印
 */
function oper(rowId,type){
    //根据所选数据的状态来进行业务判断，5种状态：0.已撤销 1.待确认 2.已确认 3.已入库 4.已结转
    var rowData = $("#jqGrid").jqGrid('getRowData',rowId);
    var status = rowData.status;
    vm.importInfo = vm.getInfo(rowId);
    var msg = '所选单据状态不满足此操作，请选择合适的单据！';
    switch(type){
        case '0':
            if(status == '3'){
                if(vm.importInfo.status == '3'){
                    alert('已确认入库，无法继续编辑！');
                }else{
                    vm.confirm(rowId,'edit');
                }
                return;
            }
            break;
        case '1':
            if(status == '2' ){//入库
                vm.confirm(rowId,'storg');
                return;
            }
            break;
        case '2'://反确认
            if(status == '3'){//反确认：已确认和已入库的可以被反确认，已入库时需要判断是否存在出库，存在出库也不允许进行反确认
                vm.confirm(rowId,'back');
                return;
            }
            break;
        case '3'://打印：已确认和已入库的订单可以进行打印
            if(status == '2' || status == '3'){
                // vm.print(rowId);
                vm.print(rowId,'import');
                return;
            }
            break;
        default:
            break;
    }
    alert(msg);
}

// function modalCommit(){
//     console.log(vm.exportType+'----'+vm.exportStartDate+'----'+vm.exportEndDate);
// }

var lastSelection;

var vm = new Vue({
	el:'#rrapp',
	data:{
        showList: true,
        showDetail: false,
		title: null,
		importInfo: {},
        importDetail: {},
        orderInfo:{},
        importMtrBatch:{},
        mtrExtendArr:{},
        exportType:null,
        exportStartDate:null,
        exportEndDate:null
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			// vm.showList = false;
			// vm.showForm = true;
			// vm.title = "新增";
			// vm.import = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = "storage/import/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.importInfo),
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
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "storage/import/delete",
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
		getInfo: function(orderId){
		    var importData;
            $.ajax({
                type: "GET",
                async:false,
                url: baseURL + "storage/import/info/"+orderId,
                success: function (r) {
                    if(r.code == 0){
                        importData = r.import;
                        vm.importInfo = importData;
                    }else{
                        console.log(r.msg);
                    }
                }
            });
            return importData;
            // $.get(baseURL + "storage/import/info/"+id, function(r){
            //     vm.importInfo = r.importInfo;
            // });
		},
        getOrderInfo: function(id){
            var orderData;
            $.ajax({
                type: "GET",
                async:false,
                url: baseURL + "purchase/orderinfo/info/"+id,
                success: function (r) {

                    if(r.code == 0){
                        orderData = r.orderInfo;
                    }else{
                        console.log(r.msg);
                    }
                }
            });
            return orderData;

            // $.get(baseURL + "purchase/orderinfo/info/"+id, function(r){
            //     vm.orderInfo = r.orderInfo;
            // });
        },
		reload: function (event) {
			vm.showList = true;
			vm.showDetail = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                // postData:vm.orderInfo,
                page:page
            }).trigger("reloadGrid");
		},
        save:function(){

		    confirm("确定保存后无法进行修改，是否继续？",function(){
		        vm.importInfo.status = '3';
                vm.saveOrUpdate();
            });

            // var importId = $("#jqGrid").jqGrid('getGridParam','selrow');
		},
        addImportInfo:function(){
            $.ajax({
                type: "POST",
                url: baseURL + "storage/import/add",
                data: JSON.stringify(vm.import),
                success: function (r) {
                    if(r.code == 0){
                        alert('操作成功', function(index){
                            vm.reload();
                        });
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        confirm:function(rowId,type){//入库与反确认
            var url = "";
            var dataParam = "";
            if(type == 'edit') {//
                $("#jqGridMtr").jqGrid('setGridParam',{
                    postData:{'orderId': rowId}
                }).trigger("reloadGrid");

                vm.showDetail = true;
                vm.showList = false;
                vm.importInfo = vm.getInfo(rowId);
            }else if(type == 'storg'){//入库
                vm.importInfo = {};
                //创建出库单，确定后创建入库明细
                vm.orderInfo = vm.getOrderInfo(rowId);
                var billNo = vm.createNewNo();
                vm.importInfo.importNo = billNo;
                vm.importInfo.orderId = rowId;
                vm.importInfo.orderNo = vm.orderInfo.orderNo;
                vm.importInfo.supplierId = vm.orderInfo.supplierId;
                vm.importInfo.supplierName = vm.orderInfo.supplierName;
                vm.importInfo.exceptionDate = vm.orderInfo.exceptionDate+" 00:00:00";

                url = "storage/import/add";
                dataParam = JSON.stringify(vm.importInfo);

                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    async:false,
                    contentType: "application/json",
                    data: JSON.stringify(vm.importInfo),
                    success: function(r){
                        vm.importInfo = r.import;
                        // if(r.code === 0){
                        //     alert('操作成功', function(index){
                        //         vm.reload();
                        //     });
                        // }else{
                        //     alert(r.msg);
                        // }
                        $("#jqGridMtr").jqGrid('setGridParam',{
                            postData:{'orderId': rowId},
                        }).trigger("reloadGrid");

                        vm.showDetail = true;
                        vm.showList = false;
                    }
                });
            }else if(type == 'back'){
                //订单反确认：修改入库单状态为待确认状态，删除已入库的明细记录
                var rowData = $('#jqGrid').jqGrid("getRowData",rowId);
                var flag = false;
                if(rowData.status == '3'){
                    confirm('此单已入库，是否继续进行反确认操作？',function(){
                        url = "storage/import/updateInfo";
                        $.ajax({
                            type: "POST",
                            url: baseURL + url,
                            data: {orderId: rowId, status: '1',type:'back'},
                            success: function (r) {
                                // console.log(r.data);
                                // vm.reload();
                                if (r.code == 0) {
                                    alert('操作成功', function (index) {
                                        vm.reload();
                                    });
                                } else {
                                    alert(r.msg);
                                }
                            }
                        });
                    });
                }

                // if(flag) {
                //
                // }
            }
            // $.ajax({
            //     type: "POST",
            //     url: baseURL + url,
            //     data: dataParam,
            //     success: function (r) {
            //         // console.log(r.data);
            //         // vm.reload();
            //         if(r.code == 0){
            //             alert('操作成功', function(index){
            //                 vm.reload();
            //             });
            //         }else{
            //             alert(r.msg);
            //         }
            //     }
            // });
        },
        search:function(){
            console.log(vm.orderInfo);
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData:vm.orderInfo,
                page:page
            }).trigger("reloadGrid");
            // vm.reload();
        },
        clean:function(){
            vm.orderInfo={
                supplierId:0,
                orderNo:null,
                exceptionDate:null
            };
            vm.getFieldData();
        },
        print:function(rowId,typeName){
            // var rowId = $('#jqGrid').jqGrid("getGridParam","selrow");
            if(!rowId){
                alert('请先选择要打印的订单！');
                return;
            }
            if(typeName == 'order'){
                window.open(baseURL + "purchase/orderinfo/printPdf?token="+token+"&orderId="+rowId);
            }else if(typeName == 'import'){
                window.open(baseURL + "purchase/orderinfo/inputPrint?token="+token+"&orderId="+rowId);
            }
        },
        getFieldData:function(){
            $('#search_supplier').typeahead({
                source: function (query, process) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "common/commonUtil/getTableData",
                        data: "tableName=tb_supplier_info&fieldName=suppier_name:suppier_py&searchWord=" + query,
                        success: function (r) {
                            var resultList = r.data.map(function (item) {
                                var aItem = {id: item.id, py: item.suppier_py, name: item.suppier_name};
                                return JSON.stringify(aItem);
                            });
                            process(resultList);
                        }
                    });
                },
                highlighter: function (obj) {
                    var item = JSON.parse(obj);
                    var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
                    return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                        return '<strong>' + match + '</strong>'
                    });
                },
                updater: function (obj) {
                    var item = JSON.parse(obj);
                    vm.orderInfo.supplierId = item.id;
                    return item.name;
                }
            })
        },
        initMtrName:function(supplierId){
            $('#mtrName').typeahead({
                source: function (query, process) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "purchase/orderinfo/queryByIdAndPy/",
                        data: "supplierId="+supplierId+"&searchWord=" + query,
                        success: function (r) {

                            var resultList = r.data.map(function (item) {
                                var aItem = {id: item.id, py: item.mtrPy, name: item.mtrIdName};
                                return JSON.stringify(aItem);
                            });
                            process(resultList);
                        }
                    });
                },
                highlighter: function (obj) {
                    var item = JSON.parse(obj);
                    var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
                    return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                        return '<strong>' + match + '</strong>'
                    });
                },
                updater: function (obj) {
                    var item = JSON.parse(obj);
                    vm.importDetail.mtrId=item.id;
                    return item.name;
                },
                afterSelect:function(obj){
                    $.ajax({
                        type: "POST",
                        url: baseURL + "purchase/orderdetail/getSupplierMtrById",
                        data: "supplierId="+supplierId+"&supplierMtrId=" + vm.importDetail.mtrId+"&mtrId=",
                        success: function (r) {
                            console.log(r.data);
                            // vm.orderDetail = r.data;
                        }
                    });
                }
            });
        },
        addMtr:function(){
            //供应商信息
            console.log(vm.orderInfo);
            // var id = $('#jqGrid').getGridParam("selrow");
            var rowData = vm.orderInfo;
            //原料信息
            var detailId = $('#jqGridMtr').getGridParam("selrow");
            if(!detailId){
                alert('请选择要入库的原料！');
                return;
            }
            var rowDetailData = $('#jqGridMtr').jqGrid("getRowData",detailId);
            console.log(rowDetailData);
            // vm.mtrExtendArr = vm.initMtrExtendArr(rowData.supplierId,rowDetailData.mtrId);

            // vm.importMtrBatch.importId = id;
            // vm.importMtrBatch.importDetailId = detailId;
            // vm.importMtrBatch.supplierId = rowData.supplierId;
            // vm.importMtrBatch.mtrId = rowDetailData.mtrId;
            // vm.importMtrBatch.mtrName = rowDetailData.mtrName;
            // vm.importMtrBatch.mtrNo = rowDetailData.mtrNo;
            // vm.importMtrBatch.orderCount = rowDetailData.orderCount;
            //
            // vm.importMtrBatch.inCount = '';//输入;
            // vm.importMtrBatch.productionDate = '';//输入;
            // vm.importMtrBatch.effectiveDate = '';//输入;


            // vm.importMtrBatch.orderUnitId = r.mtrData.purchaseUnit;//unitName
            // vm.importMtrBatch.orderUnitName = r.mtrData.purchaseUnitName;//unitName
            // vm.importMtrBatch.orderUnitRate = r.mtrData.purchaseRate;//unitRate
            // vm.importMtrBatch.orderPrice = r.mtrData.price;
            // vm.importMtrBatch.inPrice = r.mtrData.price;//price
            // vm.importMtrBatch.inUnitId = r.mtrData.miniUnit;
            // vm.importMtrBatch.inUnitName = r.mtrData.miniUnitName;
            // vm.importMtrBatch.inUnitRate = r.mtrData.miniRate;
            // vm.importMtrBatch.inUnit1Count = 0;//件数==入库数
            // vm.importMtrBatch.wgtUnit1 = r.mtrData.wgtUnit1;
            vm.createBacthNo(rowDetailData.mtrId,detailId);
            vm.searchMtrInfo();

            // vm.initMtrName(rowData.supplierId);
            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "新增原料",
                area: ['750px', '350px'],
                shadeClose: false,
                content: jQuery("#detailLayer"),
                btn: ['提交','取消'],
                success:function(layero,index){
                    var newDate = new Date();
                    var currentDate = newDate.toJSON();
                    $('#productionDate').datetimepicker({
                        format: 'yyyy-mm-dd',
                        language:'zh-CN',
                        autoclose:true,
                        minView:2,
                        todayBtn:true,
                        todayHighlight:true,
                        weekStart:1,
                        endDate:new Date(currentDate)
                    });

                    $('#productionDate').datetimepicker().on('changeDate', function(ev){
                        var newDate = dateFtt('yyyy-MM-dd',ev.date);
                        vm.importMtrBatch.productionDate = newDate;
                    });

                    $('#effectiveDate').datetimepicker({
                        format: 'yyyy-mm-dd',
                        language:'zh-CN',
                        autoclose:true,
                        minView:2,
                        todayBtn:true,
                        todayHighlight:true,
                        weekStart:1,
                        startDate:new Date(currentDate)
                    });

                    $('#effectiveDate').datetimepicker().on('changeDate', function(ev){
                        var newDate = dateFtt('yyyy-MM-dd',ev.date);
                        vm.importMtrBatch.effectiveDate = newDate;
                    });

                },
                btn1: function (event) {
                    vm.importMtrBatch.inTotlaPrice = Number(Number(vm.importMtrBatch.inCount)*Number(vm.importMtrBatch.orderPrice)).toFixed(2);
                    $.ajax({
                        type: "POST",
                        async:false,
                        url: baseURL + "storage/importmtrbatch/save",
                        contentType: "application/json",
                        data: JSON.stringify(vm.importMtrBatch),
                        success: function(r){
                            if(r.code == 0){
                                alert('操作成功', function(index){
                                    vm.importMtrBatch={};
                                    $("#jqGridMtr").jqGrid('setGridParam',{
                                        postData:{'orderId': rowData.id},
                                    }).trigger("reloadGrid");

                                    layer.close(num);
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                },
                btn2:function(event){
                    vm.importMtrBatch={};
                }
            });
        },
        initMtrExtendArr:function(supId,mtrIdVal){
            // getDataToCommbox
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "purchase/suppiermtr/queryExtendMtrComb",
                data: {supplierId:supId,mtrId:mtrIdVal},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
        createBacthNo:function(mtrId,detailId){
            var batchNo = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "storage/importmtrbatch/createBatchNo",
                data: {mtrId:mtrId,detailId:detailId},
                success: function(r){
                    batchNo =  r.no;
                    vm.importMtrBatch.batchNo = batchNo;
                    $('#batchNo').val(batchNo);
                }
            });
            return batchNo;
        },
        searchMtrInfo:function(){
            // var id = $('#jqGrid').getGridParam("selrow");
            var rowData = vm.orderInfo;
            //原料信息
            var detailId = $('#jqGridMtr').getGridParam("selrow");
            var rowDetailData = $('#jqGridMtr').jqGrid("getRowData",detailId);

            vm.importMtrBatch.importId = vm.importInfo.id;
            vm.importMtrBatch.importDetailId = detailId;
            vm.importMtrBatch.supplierId = rowData.supplierId;
            vm.importMtrBatch.mtrId = rowDetailData.mtrId;
            vm.importMtrBatch.mtrName = rowDetailData.mtrName;
            vm.importMtrBatch.mtrNo = rowDetailData.mtrNo;
            vm.importMtrBatch.orderCount = rowDetailData.orderCount;

            vm.importMtrBatch.inCount = '';//输入;
            vm.importMtrBatch.productionDate = '';//输入;
            vm.importMtrBatch.effectiveDate = '';//输入;


            // vm.importMtrBatch.orderUnitId = r.mtrData.purchaseUnit;//unitName
            // vm.importMtrBatch.orderUnitName = r.mtrData.purchaseUnitName;//unitName
            // vm.importMtrBatch.orderUnitRate = r.mtrData.purchaseRate;//unitRate
            vm.importMtrBatch.orderPrice = rowDetailData.orderPrice;
            vm.importMtrBatch.inPrice = rowDetailData.price;//price
            // vm.importMtrBatch.inUnitId = rowDetailData.mtrData.miniUnit;
            vm.importMtrBatch.inUnitName = rowDetailData.inUnit;
            vm.importMtrBatch.inUnitRate = rowDetailData.inRate;
            vm.importMtrBatch.inUnit1Count = 0;//件数==入库数
            vm.importMtrBatch.wgtUnit1 = rowDetailData.inWgt;



            // var extendId = vm.importMtrBatch.extendId;
            //
            // $.ajax({
            //     type: "POST",
            //     async:false,
            //     url: baseURL + "storage/importdetail/info/"+vm.importMtrBatch.importDetailId,
            //     success: function(r){
            //         console.log(r.importDetail);
            //         // vm.importMtrBatch.orderUnitId = r.mtrData.purchaseUnit;//unitName
            //         // vm.importMtrBatch.orderUnitName = r.mtrData.purchaseUnitName;//unitName
            //         // vm.importMtrBatch.orderUnitRate = r.mtrData.purchaseRate;//unitRate
            //         // vm.importMtrBatch.orderPrice = r.mtrData.price;
            //         // vm.importMtrBatch.inPrice = r.mtrData.price;//price
            //         // vm.importMtrBatch.inUnitId = r.mtrData.miniUnit;
            //         // vm.importMtrBatch.inUnitName = r.mtrData.miniUnitName;
            //         // vm.importMtrBatch.inUnitRate = r.mtrData.miniRate;
            //         // vm.importMtrBatch.inUnit1Count = 0;//件数==入库数
            //         // vm.importMtrBatch.wgtUnit1 = r.mtrData.wgtUnit1;
            //         vm.importMtrBatch.inWgt = 0;
            //     }
            // });
            // if( extendId != 0){
            //     $.ajax({
            //         type: "POST",
            //         async:false,
            //         url: baseURL + "baseData/mtrextend/info/"+extendId,
            //         success: function(r){
            //             vm.importMtrBatch.orderUnitId = r.mtrExtend.unitId;//unitName
            //             vm.importMtrBatch.orderUnitName = r.mtrExtend.unitName;
            //             vm.importMtrBatch.orderUnitRate = r.mtrExtend.unitRate;
            //             vm.importMtrBatch.inPrice = r.mtrExtend.price;//price
            //             vm.importMtrBatch.orderPrice = r.mtrExtend.price;
            //         }
            //     });
            // }
            $('#mtrName').val(vm.importMtrBatch.mtrName);
            $('#orderCount').val(vm.importMtrBatch.orderCount);
            $('#mtrNo').val(vm.importMtrBatch.mtrNo);
            $('#orderUnitName').val(vm.importMtrBatch.orderUnitName);
            $('#orderUnitRate').val(vm.importMtrBatch.orderUnitRate);
            $('#orderPrice').val(vm.importMtrBatch.orderPrice);
            $('#inPrice').val(vm.importMtrBatch.inPrice);
            $('#inUnitName').val(vm.importMtrBatch.inUnitName);
            $('#inUnitRate').val(vm.importMtrBatch.inUnitRate);
            $('#inUnit1Count').val(vm.importMtrBatch.inUnit1Count);
            $('#wgtUnit1').val(vm.importMtrBatch.wgtUnit1);
            $('#inWgt').val(vm.importMtrBatch.inWgt);

        },
        createNewNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/createBillNo",
                data:"billType=1",//0-采购单，1-采购入库单，2-领料出库单，3-客户订单，4-盘点单
                success: function(r){
                    no = r.newBillNo;
                }
            });
            return no;
        },

        down:function(type){
            var paramType;
            if(type == 'cw'){//财务导出
                paramType='CW';
            }else{//普通导出
                paramType='PT';
            }
            vm.exportType = paramType;
            $("#myModal").modal("show");
        },
        modalCommit:function(){
            console.log(vm.exportType+'----'+vm.exportStartDate+'----'+vm.exportEndDate);

            window.open(baseURL + "storage/import/export?token="+token+"&type="+vm.exportType+"&startDate="+vm.exportStartDate+"&endDate="+vm.exportEndDate);
        }

	}
});

vm.getFieldData();