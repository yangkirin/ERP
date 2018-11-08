$(function () {

    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    };

    mygrid = $("#jqGrid").jqGrid({
        url: baseURL + 'purchase/orderinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true, search:false},
			{ label: '订单编号', name: 'orderNo', index: 'orderNo', width: 80 },
			{ label: '供应商ID', name: 'supplierId', index: 'SUPPLIER_ID', width: 80 ,hidden:true, search:false},
			{ label: '供应商', name: 'supplierName', index: 'supplierName', width: 120 },
            { label: '订购总额', name: 'orderSumPrice', index: 'ORDER_SUM_PRICE', width: 60 , search:false,formatter : "number",align:"right"},
            { label: '入库总额', name: 'inSumPrice', index: 'IN_SUM_PRICE', width: 60 , search:false,formatter : "number",align:"right"},
			{ label: '期望到货日期', name: 'exceptionDate', index: 'exceptionDate', width: 60 ,align:"right"},
			{ label: '状态', name: 'status', index: 'STATUS', width: 40 , search:false,align:"center",formatter: function(value, options, row){
			    var msg = "";
			    if(value == 0){
                    msg = '<p class="bg-danger">已撤销</p>';
                }else if(value == 1){
                    msg = '<p class="bg-success">待确认</p>';
                }else if(value == 2){
                    msg = '<p class="bg-info">已确认</p>';
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
                }else if($.trim(value)=="已确认"){
                    return "2";
                }else if($.trim(value)=="已入库"){
                    return "3";
                }else if($.trim(value)=="已结转"){
                    return "4";
                }
            }},
            { label: '操作', name: 'operation', index: 'operation', width: 150, search:false,formatter:function(value, options, row){
                // var detailStr = "<button type='button' class='btn btn-primary btn-xs' onclick='opearionEvent("+row.id+",\'0\')'>详&nbsp;&nbsp;情</button>&nbsp;&nbsp;"+
                var operatorStr = "";

                var editStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"1\")'>修&nbsp;&nbsp;&nbsp;改</button>&nbsp;&nbsp;";
                var confirmStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"2\")'>确&nbsp;&nbsp;&nbsp;认</button>&nbsp;&nbsp;";
                var backStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"3\")'>反确认</button>&nbsp;&nbsp;";
                var printStr = "<button type='button' class='btn btn-info btn-xs' onclick='oper("+row.id+",\"4\")'>打&nbsp;&nbsp;&nbsp;印</button>&nbsp;&nbsp;";
                var deleteStr = "<button type='button' class='btn btn-warning btn-xs' onclick='oper("+row.id+",\"5\")'>撤&nbsp;&nbsp;&nbsp;销</button>&nbsp;&nbsp;";

                if(!hasPermission('purchase:orderinfo:update')){
                    editStr = "";
                }
                if(!hasPermission('purchase:orderinfo:delete')){
                    confirmStr = "";
                }

                var status = row.status;
                if(status == '0'){
                    operatorStr = ""
                }else if(status == '1'){
                    operatorStr = editStr+confirmStr+deleteStr;
                }else if(status == '2'){
                    operatorStr = backStr+printStr;
                }else if(status == '3'){
                    operatorStr = backStr+printStr;
                }else if(status == '4'){
                    operatorStr = "";
                }
                return operatorStr;
            }}
        ],
		viewrecords: true,
        // height: 385,
        height: 'auto',
        rowNum: 20,
		rowList : [20,50,80],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: false,
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
        onSelectRow:function(id){
            // var ids = $('#jqGrid').getGridParam("selarrrow");
            // if(ids != null && ids.length > 1){
                // $('#print_order_btn').attr("disabled",true);
                // var showBtn = "";
                // for(var i = 0;i<ids.length;i++){
                //     var rowDataTemp = $('#jqGrid').jqGrid("getRowData",ids[i]);
                //     if(rowDataTemp.status<3){
                //         $('#printImport').attr("disabled",true);
                //         return;
                //     }else{
                //         $('#printImport').attr("disabled",false);
                //     }
                // }
                // $('#printImport').attr("disabled",true);
                // return;
            // }else{
            //
            //     $('#print_order_btn').attr("disabled",false);
            // }
            // var rowData = $('#jqGrid').jqGrid("getRowData",id);
            // if(rowData.status < 2){
            //     $('#printImport').attr("disabled",true);
            // }else{
            //     $('#printImport').attr("disabled",false);
            // }
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var rowData = $("#jqGrid").jqGrid('getRowData',row_id);
            var url = baseURL + 'purchase/orderdetail/list?orderId='+row_id;
            createSubGrid(subgrid_id,row_id,url);
        }
    });

    $("#jqGrid").jqGrid('navGrid','#jqGrid_toppager', {edit:false,add:false,del:false,search:false,refresh:true});
    $("#jqGrid").jqGrid('navButtonAdd',"#jqGrid_toppager", {
        caption: "隐藏",
        title: "隐藏搜索工具栏",
        buttonicon:"ui-icon-search",
        onClickButton:function(){
            mygrid[0].toggleToolbar()
        }
    });
    $("#jqGrid").jqGrid('navButtonAdd',"#jqGrid_toppager",{
        caption:"清空",
        title:"清空搜索栏",
        buttonicon :'ui-icon-refresh',
        onClickButton:function(){
            mygrid[0].clearToolbar()
        }
    });
    $("#jqGrid").jqGrid('filterToolbar');


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
                    {label: '单位', name: 'mtrUnit', index: 'MTR_UNIT', width: 50},
                    {label: '转换率', name: 'mtrRate', index: 'MTR_RATE', width: 80,formatter : "number"},
                    {label: '采购数量', name: 'amount', index: 'AMOUNT', width: 80,editable:true,formatter : "number"},
                    {label: '单价', name: 'price', index: 'PRICE', width: 50,editable:false,formatter : "number"},
                    {label: '采购金额', name: 'sumPrice', index: 'SUM_PRICE', width: 80,editable:false,formatter:function(value, options, row){
                        return Number(Number(row.amount)*Number(row.price)).toFixed(2);
                    }},
                    {label: '入库数量', name: 'inCount', index: 'IN_COUNT', width: 80,editable:true,formatter : "number"},
                    {label: '入库重量', name: 'inWgt', index: 'IN_WGT', width: 80,formatter : "number"},
                    {label: '入库金额', name: 'inPrice', index: 'IN_PRICE', width: 80,formatter : "number"},
                    {label: '实际入库日期', name: 'inDate', index: 'IN_DATE', width: 80},
                    {label: '对外编码', name: 'extendCode', index: 'extendCode', width: 80}
                ],
            rowNum : 20,
            // pager : pager_id,
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
                // $("#" + subgrid_table_id).closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
            }
        });
    }

    $("#jqGridMtr").jqGrid({
        url: baseURL + 'purchase/orderdetail/list',
        editurl : baseURL+"purchase/orderdetail/editDetail",
        datatype: "json",
        colModel: [
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
        viewrecords: true,
        height: 'auto',
        rowNum: 99999999,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        // scroll:true,
        // multiselect: true,
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
                        // console.log(data);
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
            vm.orderDetail.id = id;
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGridMtr").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});

            // vm.gridData = $('#jqGrid').jqGrid("getRowData");
            // console.log(vm.gridData);
        }
    });

    $('#jqGridMtr').navGrid('#jqGridPagerMtr',
        { edit: false, add: false, del: false, search: false, refresh: false, view: false, position: "left", cloneToTop: false });


    var newDate = new Date();
    var currentDate = newDate.toJSON();

    $(".form_datetime").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1
        // startDate:new Date(currentDate)
    });

    $('.form_datetime').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.orderInfo.exceptionDate = newDate;
            // if (ev.date.valueOf() < date-start-display.valueOf()){
            //
            // }
        });

    $("#exceptionDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1,
        // endDate:new Date(currentDate)
    });

    $('#exceptionDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.orderInfo.exceptionDate = newDate;
    });

});

/**
 * Grid操作列事件
 * @param rowid 所选择的操作行数据ID
 * @param type 操作类型：0-详情，1-修改，2-确认，3-反确认，4-打印，5-撤销
 */
function oper(rowId,type){
    //根据所选数据的状态来进行业务判断，5种状态：0.已撤销 1.待确认 2.已确认 3.已入库 4.已结转
    var rowData = $("#jqGrid").jqGrid('getRowData',rowId);
    var status = rowData.status;
    var msg = '所选单据状态不满足此操作，请选择合适的单据！';
    switch(type){
        case '0':
            msg = '查看详情！';
            break;
        case '1':
            if(status == '1'){
                vm.update(rowId);
                return;
            }
            break;
        case '2'://确认
            if(status == '1'){
                vm.confirm(rowId,'ok');
                return;
            }
            break;
        case '3'://反确认：已确认喝已入库的可以被反确认，已入库时需要判断是否存在出库，存在出库也不允许进行反确认
            if(status == '2' || status == '3'){
                vm.confirm(rowId,'back');
                return;
            }
            break;
        case '4'://打印：已确认喝已入库的订单可以进行打印
            if(status == '2' || status == '3'){
                vm.print(rowId);
                return;
            }
            break;
        case '5'://撤销：待确认
            if(status == '1'){
                vm.del(rowId);
                return;
            }
            break;
        default:
            break;
    }
    alert(msg);
}

var lastSelection;

function showDetail(id){

    vm.showList = false;
    vm.showForm = true;
    vm.getInfo(id);
    $("#jqGridMtr").jqGrid('setGridParam',{
        postData:{'orderId': id},
    }).trigger("reloadGrid");
}

function editStatus(id,status){
    vm.orderInfo.status=status;
    vm.orderInfo.id=id;
    vm.saveOrUpdate();
    vm.reload();
}

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		showForm:false,
		showListMtr:false,
        isEdit:false,
        isAdd:false,
		title: null,
		orderInfo: {},
        orderDetail:{},
        importInfo:{},
        importDetail:{},
        gridData:[],
        addRow:[]
	},
	methods: {
		query: function () {
			vm.reload();
		},
        createNewNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/createBillNo",
                data:"billType=0",
                success: function(r){
                    no = r.newBillNo;
                }
            });
            return no;
        },
        getFieldData:function(){
            $('#add_supplier').typeahead({
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

                    vm.orderInfo.supplierName=item.name;
                    vm.orderInfo.supplierId=item.id;

                    $('#addMtr_btn').attr("disabled",false);
                    $('#editMtr_btn').attr("disabled",false);
                    $('#delMtr_btn').attr("disabled",false);
                    $('#saveMtr_btn').attr("disabled",false);

                    return item.name;
                }
            })
        },
		add: function(){
			vm.showList = false;
			vm.showForm = true;
			vm.isEdit = false;
			vm.isAdd = true;
			vm.title = "新增";
            vm.orderInfo = {
                status:"1",
                orderNo:vm.createNewNo()
            };
            $('#jqGridMtr').jqGrid("clearGridData");

            vm.getFieldData();
		},
		update: function (rowId) {
			var rowData = $('#jqGrid').jqGrid("getRowData",rowId);

            $("#jqGrid").jqGrid('setSelection',rowId);

			vm.showList = false;
			vm.showForm = true;
			vm.isEdit = true;
            vm.isAdd = false;
            vm.title = "修改";

            vm.getInfo(rowId);
            vm.reloadMtr(rowId);
		},
		saveOrUpdate: function (event) {

			var url = vm.orderInfo.id == null ? "purchase/orderinfo/save" : "purchase/orderinfo/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.orderInfo),
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
		del: function (rowId) {
            var ids = new Array();
            ids.push(rowId);
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "purchase/orderinfo/delete",
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
			$.get(baseURL + "purchase/orderinfo/info/"+id, function(r){
                vm.orderInfo = r.orderInfo;
            });
		},
		reload: function (event) {
			vm.showList = true;
			vm.showForm = false;
			vm.showListMtr = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
		addMtr:function(){
		    //判断是否存在OrderInfo_Id
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            var rowData = $("#jqGrid").jqGrid("getRowData",id);

            $("#jqGridMtr").jqGrid("resetSelection");

            vm.initMtrName(vm.orderInfo.supplierId);
            if(id){//编辑Info--Detail新增与修改均走Server
                vm.showDetail('server');
            }else{//新增Info---Detail新增与修改均走Client
                // vm.initMtrName(vm.orderInfo.supplierId);
                vm.showDetail('client');
            }
		},
		editMtr:function(){
            var detailId = $("#jqGridMtr").jqGrid('getGridParam','selrow');
            if(!detailId){
                alert('请选择要编辑的原料！');
                return;
            }
            var detailRowData = $("#jqGridMtr").jqGrid("getRowData",detailId);

            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id){//编辑Info--Detail新增与修改均走Server
                // var rowData = $("#jqGrid").jqGrid("getRowData",id);
                // $.get(baseURL + "purchase/orderdetail/info/"+detailId, function(r){
                //     vm.orderDetail = r.orderDetail;
                // });
                // vm.getInfo();
                vm.showDetail('server');

            }else{//新增Info---Detail新增与修改均走Client
                // var detailId = $("#jqGridMtr").jqGrid('getGridParam','selrow');
                // var detailRowData = $("#jqGridMtr").jqGrid("getRowData",detailId);

                // console.log(detailRowData);

                $.ajax({
                    type: "POST",
                    async:false,
                    url: baseURL + "purchase/orderdetail/getSupplierMtrById",
                    data: "supplierId="+vm.orderInfo.supplierId+"&mtrId=" + detailRowData.mtrId+"&supplierMtrId=",
                    success: function (r) {
                        vm.orderDetail = r.data;

                        vm.orderDetail.mtrUnit = detailRowData.mtrUnit;
                        vm.orderDetail.mtrRate = detailRowData.mtrRate;
                        vm.orderDetail.amount = detailRowData.amount;
                        $('#amount').val(detailRowData.amount);
                        vm.orderDetail.price = detailRowData.price;
                    }
                });
                vm.showDetail('client');
            }
		},
        deleteMtr:function(){
            var id = $("#jqGridMtr").jqGrid('getGridParam','selrow');
            if(!id){
                alert("请选择要删除的数据！");
                return ;
            }

            var orderId = $("#jqGrid").jqGrid('getGridParam','selrow');
            var ids = [];
            if(orderId){//服务端删除
                ids.push(id);
                $.ajax({
                    type: "POST",
                    async:false,
                    url: baseURL + "purchase/orderdetail/delete",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function(r){
                        if(r.code === 0){
                            alert('操作成功', function(index){
                                var page = $("#jqGridMtr").jqGrid('getGridParam','page');
                                $("#jqGridMtr").jqGrid('setGridParam',{
                                    postData:{'orderId': orderId},
                                }).trigger("reloadGrid");
                            });

                        }else{
                            alert(r.msg);
                        }
                    }
                });
            }


            var removeData = $("#jqGridMtr").jqGrid("getRowData",id);

            var gridData = $('#jqGridMtr').jqGrid("getRowData");
            var gridIdsData = $('#jqGridMtr').jqGrid("getDataIDs");
            gridData.push($("#jqGridMtr").jqGrid("getRowData",gridIdsData[gridIdsData.length-1]));

            var delIndex;
            if(gridData){
                for(var i=0;i<gridData.length;i++){
                    if(removeData.mtrId == gridData[i].mtrId && removeData.mtrUnit == gridData[i].mtrUnit && removeData.mtrRate == gridData[i].mtrRate){
                        delIndex = i;
                        break;
                    }
                }
            }
            gridData.remove(gridData[delIndex]);

            $('#jqGridMtr').jqGrid("clearGridData");
            $('#jqGridMtr').jqGrid("addRowData",gridData.length+1,gridData,"first");
            vm.addRow = gridData;
		},
        save:function(){
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id){
                //获取表格数据进行保存
                $.ajax({
                    type: "POST",
                    async:false,
                    url: baseURL + "purchase/orderinfo/update",
                    contentType: "application/json",
                    data: JSON.stringify(vm.orderInfo),
                    success: function(r){
                        if(r.code === 0){
                            // alert('操作成功', function(index){
                                vm.orderInfo = r.orderInfo;
                            // });
                            alert("请选择要删除的数据！");
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            }else{
                //获取表格数据进行保存
                $.ajax({
                    type: "POST",
                    async:false,
                    url: baseURL + "purchase/orderinfo/save",
                    contentType: "application/json",
                    data: JSON.stringify(vm.orderInfo),
                    success: function(r){
                        if(r.code === 0){
                            vm.orderInfo = r.orderInfo;
                            console.log('订单保存成功！');
                        }else{
                            console.log(r.msg);
                        }
                    }
                });
                //先保存订单主信息，返回订单ID
                //再保存订单明细信息
                for(var i in vm.addRow){
                    if(vm.addRow[i].mtrId){
                        $.ajax({
                            type: "POST",
                            // async:false,
                            url: baseURL + "purchase/orderdetail/addDetail",
                            // contentType: "application/json",
                            data: {suppilerId:vm.orderInfo.supplierId,orderId:vm.orderInfo.id,mtrId:vm.addRow[i].mtrId,amount:vm.addRow[i].amount,price:vm.addRow[i].price},
                            success: function(r){
                                if(r.code === 0){
                                    console.log('订单明细保存成功！');
                                }else{
                                    console.log(r.msg);
                                }
                            }
                        });
                    }
                }
            }

            vm.addRow=[];
            vm.orderInfo={};
            vm.orderDetail={};
            vm.reload();

        },
        reloadMtr:function(rowId){
            // var rowId = $('#jqGrid').jqGrid("getGridParam","selrow");
            // if(!rowId){
            //     return;
            // }
            vm.showList = false;
            vm.showForm = true;
            var page = $("#jqGridMtr").jqGrid('getGridParam','page');
            $("#jqGridMtr").jqGrid('setGridParam',{
                postData:{'orderId': rowId},
            }).trigger("reloadGrid");
        },
        showDetail:function(type){
            var title = '';
            var url = '';
            var rowId;
            var detailData;

            if(type == 'server'){//编辑Info--Detail需要与Server端数据交互
                var id = $("#jqGrid").jqGrid('getGridParam','selrow');
                var rowData = $("#jqGrid").jqGrid("getRowData",id);

                rowId = $('#jqGridMtr').jqGrid("getGridParam","selrow");
                detailData = $("#jqGridMtr").jqGrid("getRowData",rowId);
                if(rowId){//修改Detail
                    title = '编辑信息';
                    url = "purchase/orderdetail/update";
                    $.get(baseURL + "purchase/orderdetail/info/"+rowId, function(r){
                        vm.orderDetail = r.orderDetail;
                    });
                }else{//新增Detail
                    title = '新增信息';
                    url = "purchase/orderdetail/save";
                    vm.initMtrName(rowData.supplierId);
                    console.log(id);
                    console.log(rowData);
                }
            }else{//新增Info---Detail新增与修改均走Client

            }
            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "新增原料",
                area: ['700px', '380px'],
                shadeClose: false,
                content: jQuery("#detailLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {
                    rowId = $('#jqGridMtr').jqGrid("getGridParam","selrow");
                    if(type == 'server'){
                        if(rowId){
                            url = "purchase/orderdetail/update";
                        }else{
                            //判断是否有重复原料（ID，单位，转换率）,如存在重复则进行更新，否则走save
                            //获取当前Grid所有数据
                            var gridData = $('#jqGridMtr').jqGrid("getRowData");
                            var gridIdsData = $('#jqGridMtr').jqGrid("getDataIDs");
                            gridData.push($("#jqGridMtr").jqGrid("getRowData",gridIdsData[gridIdsData.length-1]));

                            var newAmonut = vm.orderDetail.amount;
                            var oldAmonut = 0;
                            if(gridData){
                                for(var i=0;i<gridData.length;i++){
                                    if(vm.orderDetail.mtrId == gridData[i].mtrId && vm.orderDetail.mtrUnit == gridData[i].mtrUnit && Number(vm.orderDetail.mtrRate).toFixed(2) == Number(gridData[i].mtrRate).toFixed(2)){
                                        vm.orderDetail = gridData[i];
                                        url = "purchase/orderdetail/update";
                                        // vm.orderDetail.amount = Number(Number(gridData[i].amount)+Number(vm.orderDetail.amount)).toFixed(2).toString();
                                        oldAmonut = gridData[i].amount;
                                        break;
                                    }
                                }
                            }
                            vm.orderDetail.amount = Number(Number(newAmonut)+Number(oldAmonut)).toFixed(2).toString();
                        }

                        vm.orderDetail.orderId=id;
                        $.ajax({
                            type: "POST",
                            contentType: "application/json",
                            url: baseURL + url,
                            data: JSON.stringify(vm.orderDetail),
                            success: function (r) {
                                if(r.code === 0){
                                    alert('操作成功', function(index){
                                        vm.reloadMtr();
                                    });
                                }else{
                                    alert(r.msg);
                                }
                            }
                        });
                    }else{
                        var count = $("#jqGridMtr").jqGrid("getGridParam", "records");
                        var rowId = $('#jqGridMtr').jqGrid("getGridParam","selrow");

                        if(rowId){//存在订单信息--针对订单明细的修改，均走Server端
                            for(var i=0;i<vm.addRow.length;i++){
                                if(vm.addRow[i].mtrId == vm.orderDetail.mtrId){
                                    vm.addRow[i].id = rowId;
                                    vm.addRow[i].amount = vm.orderDetail.amount;
                                }else if(vm.addRow[i].id == rowId){
                                    vm.addRow.remove(vm.addRow[i]);
                                }
                            }
                            $('#jqGridMtr').jqGrid("clearGridData");
                            $('#jqGridMtr').jqGrid("addRowData",count+1,vm.addRow,"first");
                        }else{//不存在订单信息--针对订单明细的新增，均走Client端
                            // var count = $("#jqGridMtr").jqGrid("getGridParam", "records");
                            //判断列表当中是否存在当前所选原料，如存在，则提示是否累加数量，如不存在，则进入下一流程
                            var isExtis = false;
                            for(var i=0;i<vm.addRow.length;i++){
                                if(vm.addRow[i].mtrId == vm.orderDetail.mtrId && vm.addRow[i].mtrUnit == vm.orderDetail.mtrUnit && vm.addRow[i].mtrRate == vm.orderDetail.mtrRate){
                                    vm.addRow[i].amount = Number(Number(vm.addRow[i].amount)+Number(vm.orderDetail.amount)).toFixed(2);
                                    isExtis = true;
                                    break;
                                }
                            }
                            if(!isExtis){
                                var dataRow = {
                                    mtrId:vm.orderDetail.mtrId,
                                    mtrCode:vm.orderDetail.mtrCode,
                                    mtrName:vm.orderDetail.mtrName,
                                    mtrUnit:vm.orderDetail.mtrUnit,
                                    mtrRate:vm.orderDetail.mtrRate,
                                    amount:vm.orderDetail.amount,
                                    price:vm.orderDetail.price,
                                    sumPrice:Number(vm.orderDetail.price)*Number(vm.orderDetail.amount)
                                };
                                vm.addRow.push(dataRow);
                                $('#jqGridMtr').jqGrid("addRowData",count+1,dataRow,"first");
                            }else{
                                // count = $("#jqGridMtr").jqGrid("getGridParam", "records");
                                $('#jqGridMtr').jqGrid("clearGridData");
                                $('#jqGridMtr').jqGrid("addRowData",count+1,vm.addRow,"first");
                            }
                        }
                    }
                    layer.close(num);
                    vm.orderDetail={};
                },
                btn2:function(event){
                    vm.orderDetail = {};
                }
            });
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
                    vm.orderDetail.id=item.id;
                    return item.name;
                },
                afterSelect:function(obj){
                    // $.get(baseURL + "purchase/suppiermtr/info/"+vm.orderDetail.id, function(r){
                    //     vm.orderDetail = r.data;
                    // });

                    $.ajax({
                        type: "POST",
                        url: baseURL + "purchase/orderdetail/getSupplierMtrById",
                        data: "supplierId="+supplierId+"&supplierMtrId=" + vm.orderDetail.id+"&mtrId=",
                        success: function (r) {
                            vm.orderDetail = r.data;
                        }
                    });
                }
            });
        },
        initMtrDetail:function(supplierId,mtrId,detailId){
            console.log("supplierId="+supplierId+"|mtrId="+mtrId);
            var url = "";
            var dataParam = "";
            $.get(baseURL + "purchase/orderdetail/info/"+detailId, function(r){
                vm.orderDetail = r.orderDetail;
            });

            if(vm.orderDetail){//修改

            }else{//新增
                var id = $("#jqGrid").jqGrid('getGridParam','selrow');
                url = "purchase/orderdetail/getSupplierMtrById";
                dataParam = "supplierId="+supplierId+"&mtrId=" + mtrId;
                $.ajax({
                    type: "POST",
                    // url: baseURL + "purchase/orderdetail/getSupplierMtrById",
                    url: baseURL + url,
                    // data: "supplierId="+supplierId+"&mtrId=" + mtrId,
                    data: dataParam,
                    success: function (r) {
                        vm.orderDetail = r.data;
                        vm.orderDetail.orderId = id;
                    }
                });
            }
        },
        print:function(rowId){
            if(!rowId){
                alert('请先选择要打印的订单！');
                return;
            }
            window.open(baseURL + "purchase/orderinfo/printPdf?token="+token+"&orderId="+rowId);
        },
        confirm:function(rowId,type){//各级确认与反确认操作
            //type :ok,back
            var url;
            var dataParam = '';
            if(type == 'back'){
                url = "purchase/orderdetail/backConfirm";
                dataParam = "orderId="+rowId;
            }else if(type == 'ok'){
                url = "purchase/orderdetail/orderConfirm";
                dataParam = "orderId="+rowId;
            }
            if(url){
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    data: dataParam,
                    success: function (r) {
                        // console.log(r.data);
                        // vm.reload();
                        if(r.code == 0){
                            alert('操作成功', function(index){
                                vm.reload();
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            }
        },
        search:function(){
            var postData = {
                exceptionDate: $('#exceptionDate').val(),
                orderNo: $('#search').val(),
                supplierName: $('#search').val()
            };
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData:postData,
                page:page
            }).trigger("reloadGrid");
            // vm.reload();
        }
	}
});