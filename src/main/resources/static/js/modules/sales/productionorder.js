$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        $("#jqGridPRD").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    };

    $("#jqGrid").jqGrid({
        url: baseURL + 'sales/productionorder/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '订单编号', name: 'productionNo', index: 'PRODUCTION_NO', width: 80 },
			{ label: '订单类型ID', name: 'orderTypeId', index: 'ORDER_TYPE_ID', width: 80 ,hidden:true},
			{ label: '类型', name: 'orderTypeName', index: 'ORDER_TYPE_NAME', width: 60 },
			{ label: '客户ID', name: 'customerId', index: 'CUSTOMER_ID', width: 80 ,hidden:true},
			{ label: '客户编号', name: 'customerNo', index: 'CUSTOMER_NO', width: 80 },
            {label: '客户名称', name: 'customerName', index: 'CUSTOMER_NAME', width: 120},
			{ label: '售点ID', name: 'placeId', index: 'PLACE_ID', width: 80,hidden:true },
			{ label: '售点名称', name: 'placeName', index: 'PLACE_NAME', width: 60 },
            { label: '成本', name: 'prdCost', index: 'PRD_COST', width: 80,hidden:true },
            { label: '收入', name: 'prdIncome', index: 'PRD_INCOME', width: 80 ,hidden:true},
            { label: '折后收入', name: 'discountIncome', index: 'DISCOUNT_INCOME', width: 80,hidden:true },
            { label: '产品总数', name: 'prdMount', index: 'PRD_MOUNT', width: 60,hidden:false },
            { label: '成本率', name: 'costRate', index: 'COST_RATE', width: 80,hidden:true },
            { label: '折扣成本比', name: 'discountCostRate', index: 'DISCOUNT_COST_RATE', width: 80,hidden:true },
            {label: '需求日期', name: 'demandDate', index: 'DEMAND_DATE', width: 60},
            { label: '备注', name: 'remakr', index: 'REMAKR', width: 100 },
            {
                label: '预订单', name: 'typeId', index: 'TYPE_ID', width: 40, formatter: function (value) {
                    if (value == 0) {
                        return "否";
                    } else if (value == 1) {
                        return "是";
                    } else {
                        return "null";
                    }
                }
            },
            { label: '状态', name: 'status', index: 'STATUS', width: 40, formatter: function (value, options, row) {
                var msg = "";
                if(value == 0){
                    msg = '<p class="bg-danger">已撤销</p>';
                }else if(value == 1){
                    msg = '<p class="bg-success">待确认</p>';
                }else if(value == 2){
                    msg = '<p class="bg-info">已确认</p>';
                }else if(value == 3){
                    msg = '<p class="bg-warning">已出库</p>';
                }else if(value == 4){
                    msg = '<p class="bg-primary">已完结</p>';
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
                }else if($.trim(value)=="已出库"){
                    return "3";
                }else if($.trim(value)=="已完结"){
                    return "4";
                }
            }
            },
            { label: '操作', name: 'operation', index: 'operation', width: 200,formatter:function(value, options, row){
                var operatorStr = "";

                var editStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"0\")'>修&nbsp;&nbsp;&nbsp;改</button>&nbsp;&nbsp;";
                var confirmStr = "<button type='button' class='btn btn-primary btn-xs' onclick='orderConfirm("+row.id+",\"1\")'>确&nbsp;&nbsp;&nbsp;认</button>&nbsp;&nbsp;";
                var backStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"2\")'>反确认</button>&nbsp;&nbsp;";
                var closeStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"3\")'>完结</button>&nbsp;&nbsp;";
                var printStr = "<button type='button' class='btn btn-info btn-xs' onclick='oper("+row.id+",\"4\")'>打&nbsp;&nbsp;&nbsp;印</button>&nbsp;&nbsp;";
                var cancleStr = "<button type='button' class='btn btn-warning btn-xs' onclick='oper("+row.id+",\"5\")'>撤&nbsp;&nbsp;&nbsp;销</button>&nbsp;&nbsp;";

                var configPrd = "<button type='button' class='btn btn-primary btn-xs' onclick='configPrd("+row.id+")'>产品配置</button>&nbsp;&nbsp;";

                    var copyStr = "<button type='button' class='btn btn-primary btn-xs' onclick='copyOrder(" + row.id + ")'>复制</button>&nbsp;&nbsp;";

                // if(!hasPermission('purchase:orderinfo:update')){
                //     editStr = "";
                // }
                // if(!hasPermission('purchase:orderinfo:delete')){
                //     confirmStr = "";
                // }
                //状态说明：0-撤销，1-待确认，2-已确认，3-已出库，4-已完结
                //撤销的单据无任何操作；
                //待确认表示刚刚新建的单据，可以进行反复的修改以及确认
                //已确认的单据不允许修改，可以被反确认和打印。反确认需要进行逻辑校验
                //已出库表示单据做了领料出库操作，只能被完结掉。不能做其它操作
                //已完结表述单据已正常关闭。可以打印。
                var status = row.status;
                if(status == '0'){
                    operatorStr = "";
                }else if(status == '1'){//待确认
                    operatorStr = configPrd+editStr+confirmStr+cancleStr;
                }else if(status == '2'){//已确认
                    operatorStr = backStr+printStr;
                }else if(status == '3'){//已出库
                    operatorStr = closeStr;
                }else if(status == '4'){//已完结
                    operatorStr = printStr;
                }
                    operatorStr += copyStr;
                return operatorStr;
            }}
        ],
		viewrecords: true,
        height: 'auto',
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
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var url = baseURL + 'sales/productionorderdetail/list?productionOrderId='+row_id;
            createSubGrid(subgrid_id,row_id,url);
        }
    });

    function createSubGrid(subgrid_id,row_id,url){
        var subgrid_table_id, pager_id;
        subgrid_table_id = subgrid_id + "_t";
        pager_id = "p_" + subgrid_table_id;
        // $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
        $("#" + subgrid_id).html("<div style=\"height:100%;width:100%;overflow:auto\"><table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div></div>");
        jQuery("#" + subgrid_table_id).jqGrid({
            url : url,
            datatype : "json",
            colModel : [
                { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
                { label: '生产订单ID', name: 'productionOrderId', index: 'PRODUCTION_ORDER_ID', width: 80 ,hidden:true},
                { label: '生产订单编号', name: 'productionOrderNo', index: 'PRODUCTION_ORDER_NO', width: 80 ,hidden:true},
                { label: '产品ID', name: 'prdId', index: 'PRD_ID', width: 80 ,hidden:true},
                { label: '产品编号', name: 'prdNo', index: 'PRD_NO', width: 80 },
                { label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 80 },
                { label: '产品类型ID', name: 'prdTypeId', index: 'PRD_TYPE_ID', width: 80 ,hidden:true},
                { label: '产品类型名称', name: 'prdTypeName', index: 'PRD_TYPE_NAME', width: 80 },
                { label: '需求数量', name: 'amount', index: 'AMOUNT', width: 80 },
                { label: '定价', name: 'price1', index: 'PRICE1', width: 80 },
                { label: '售价', name: 'price2', index: 'PRICE2', width: 80 },
                { label: '成本', name: 'cost', index: 'COST', width: 80 },
                { label: '预估收入', name: 'revenue', index: 'REVENUE', width: 80 }
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
                //隐藏grid底部滚动条
                $("#" + subgrid_table_id).closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
            }
        })
    };

    $("#jqGridPRD").jqGrid({
        url: baseURL + 'sales/productionorderdetail/list',
        datatype: "json",
        colModel: [
            //dataRow={prdTypeName:prdData.typeName,prdTypeId:prdData.typeId,prdId:prdData.id,prdNo:prdData.prdNo,prdName:prdData.prdName,amount:vm.selectData.amount,PRICE1:0,PRICE2:prdData.referencePrice,COST:prdData.cost,revenue:0};
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '生产订单ID', name: 'productionOrderId', index: 'PRODUCTION_ORDER_ID', width: 80 ,hidden:true},
            { label: '生产订单编号', name: 'productionOrderNo', index: 'PRODUCTION_ORDER_NO', width: 80 ,hidden:true},
            { label: '产品ID', name: 'prdId', index: 'PRD_ID', width: 80 ,hidden:true},
            { label: '产品编号', name: 'prdNo', index: 'PRD_NO', width: 60 },
            { label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 300 },
            { label: '产品类型ID', name: 'prdTypeId', index: 'PRD_TYPE_ID', width: 80 ,hidden:true},
            { label: '产品类型', name: 'prdTypeName', index: 'PRD_TYPE_NAME', width: 80 },
            { label: '需求数量', name: 'amount', index: 'AMOUNT', width: 60 },
            { label: '定价', name: 'price1', index: 'PRICE1', width: 60 },
            { label: '售价', name: 'price2', index: 'PRICE2', width: 60 },
            { label: '成本', name: 'cost', index: 'COST', width: 60 },
            { label: '预估收入', name: 'revenue', index: 'REVENUE', width: 60 },
            { label: '操作', name: 'operation', index: 'operation', width: 200,formatter:function(value, options, row){
                var operatorStr = "";

                var editStr = "<button type='button' class='btn btn-primary btn-xs' onclick='editPrd("+row.id+")'>修&nbsp;&nbsp;&nbsp;改</button>&nbsp;&nbsp;";
                var delStr = "<button type='button' class='btn btn-primary btn-xs' onclick='delPrd("+row.id+")'>删&nbsp;&nbsp;&nbsp;除</button>&nbsp;&nbsp;";

                // if(!hasPermission('purchase:orderinfo:update')){
                //     editStr = "";
                // }

                operatorStr = editStr+delStr;

                return operatorStr;
            }}
        ],
        viewrecords: true,
        // height: 230,
        height: 'auto',
        rowNum: 9999999,
        rowList : [10,30,50],
        rownumbers: true,
        // rownumWidth: 25,
        autowidth:true,
        scroll:true,
        // pager: "#jqGridPagerPRD",
        // toolbar:[true,"top"],
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
            $("#jqGridPRD").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    $("#demandDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        autoclose: true,
        minView: 2,
        todayBtn: true,
        todayHighlight: true,
        weekStart: 1
        // startDate:new Date(currentDate)
    });
    $('#demandDate').datetimepicker().on('hide', function (ev) {
        var value = $("#demandDate").val();
        vm.productionOrder.demandDate = value;
    });


});

/**
 * Grid操作列事件
 * @param rowid 所选择的操作行数据ID
 * @param type 操作类型：0-修改，1-确认，2-反确认，3-完结，4-打印
 */
function oper(rowId,type){
    //根据所选数据的状态来进行业务判断，5种状态说明：0-撤销，1-待确认，2-已确认，3-已出库，4-已完结
    var rowData = $("#jqGrid").jqGrid('getRowData',rowId);
    var status = rowData.status;
    var msg = '所选单据状态不满足此操作，请选择合适的单据！';
    switch(type){
        case '0'://修改订单
            //TODO 修改订单
            vm.productionOrder = rowData;
            vm.update(rowId);
            return;
            break;
        case '1'://确认
            //修改订单状态
            $.ajax({
                type: "POST",
                async: false,
                url: baseURL + "sales/productionorder/updateStatus",
                data: {orderId:rowId,status:'2'},
                success: function (r) {
                    console.log(r);
                    msg = "操作成功！";
                    vm.reload();
                }
            });
            break;
        case '2'://反确认
            //TODO 反确认后台逻辑校验
            var isBack = true;
            if(isBack){
                //修改订单状态
                $.ajax({
                    type: "POST",
                    async: false,
                    url: baseURL + "sales/productionorder/updateStatus",
                    data: {orderId:rowId,status:'1'},
                    success: function (r) {
                        console.log(r);
                        msg = "操作成功！";
                        vm.reload();
                    }
                });
            }else{
                msg = "订单已做领料出库，无法进行反确认！";
            }
            break;
        case '3'://
            //修改订单状态
            $.ajax({
                type: "POST",
                async: false,
                url: baseURL + "sales/productionorder/updateStatus",
                data: {orderId:rowId,status:'4'},
                success: function (r) {
                    console.log(r);
                    msg = "操作成功！";
                    vm.reload();
                }
            });
            break;
        case '4'://完结
            //TODO 打印
            msg = "打印单据";
            break;
        case '5'://撤销
            //修改订单状态
            $.ajax({
                type: "POST",
                async: false,
                url: baseURL + "sales/productionorder/updateStatus",
                data: {orderId:rowId,status:'0'},
                success: function (r) {
                    console.log(r);
                    msg = "操作成功！";
                    vm.reload();
                }
            });
            break;
        default:
            break;
    }
    alert(msg);
}

function configPrd(rowId){

    vm.showList = false;
    vm.showForm = true;
    vm.addOrderForm = false;

    $("#jqGridPRD").jqGrid('setGridParam',{
        postData:{'productionOrderId': rowId},
    }).trigger("reloadGrid");

    vm.getInfo(rowId);
    vm.getSelectDataPrd();
}

function editPrd(detailId){
    vm.editPrd(detailId);
}

function delPrd(detailId){
    vm.deletePrd(detailId);
}

function orderConfirm(rowId){
    vm.saveOrder(rowId);
}

function copyOrder(rowid) {
    // alert("确定复制该订单？", function () {
    //     console.log("复制订单");
    //     vm.copyOrder(rowid);
    // });

    vm.copy(rowid);
}

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
        showForm:false,
        addOrderForm:false,
		title: null,
		productionOrder: {},
        productionOrderDetailEntity: {},
        orderTypeArr:{},
        customerArr:{},
        placeArr:{},
        selectData:{},
		prdGridRowData:[],
        q:{
            productionNo: null,
            orderTypeName: null,
            customer: null,
            placeName: null
        },
        copyBtn: false,
        addOrUpdate: false
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
                data:"billType=3",
                success: function(r){
                    no = r.newBillNo;
                }
            });
            return no;
        },
		add: function(){
            // vm.showList = false;
            // vm.showForm = false;
            // vm.addOrderForm = true;
			vm.productionOrder = {
                productionNo:vm.createNewNo(),
                status: 1,
                typeId: 0
			};

            vm.addOrUpdate = true;
            vm.copyBtn = false;
            vm.title = "新增";
            $("#myModal").modal("show");
            // $('#jqGridPRD').jqGrid("clearGridData");
		},
		update: function (rowId) {
			var id = rowId;
			if(id == null){
				return ;
			}
            // vm.showList = false;
            // vm.showForm = false;
            // vm.addOrderForm = true;
            // vm.productionOrder = {};
            vm.getInfo(id);
            vm.addOrUpdate = true;
            vm.copyBtn = false;
            vm.title = "修改";
            $("#myModal").modal("show");
		},
        saveOrUpdate: function (event) {
            var url = vm.productionOrder.id == null ? "sales/productionorder/save" : "sales/productionorder/update";
            $.ajax({
                type: "POST",
                url: baseURL + url,
                contentType: "application/json",
                data: JSON.stringify(vm.productionOrder),
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            vm.productionOrder = {};
                            vm.reload();
                        });
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        copy: function (rowId) {
            var oldOrder = $("#jqGrid").jqGrid('getRowData', rowId);
            vm.productionOrder = {
                orderTypeId: oldOrder.orderTypeId,
                customerId: oldOrder.customerId,
                placeId: oldOrder.placeId,
                productionNo: vm.createNewNo(),
                status: 1,
                oldId: rowId,
                typeId: 0
            };
            vm.title = '复制';
            vm.addOrUpdate = false;
            vm.copyBtn = true;
            $("#myModal").modal("show");
        },
        copyOrder: function () {
            var url = "sales/productionorder/copyOrder";
            // var data = {
            //     productionNo: vm.createNewNo(),
            //     oldId: rowid,
            // };
            $.ajax({
                type: "POST",
                url: baseURL + url,
                contentType: "application/json",
                data: JSON.stringify(vm.productionOrder),
                success: function (r) {
                    if (r.code === 0) {
                        alert('新订单的编号是' + r.productionNo, function (index) {
                            vm.productionOrder = {};
                            vm.reload();
                        });
                    } else {
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
				    url: baseURL + "sales/productionorder/delete",
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
			$.get(baseURL + "sales/productionorder/info/"+id, function(r){
                vm.productionOrder = r.productionOrder;

                // console.log(r.productionOrder);
                // console.log(vm.productionOrder);
            });
		},
		reload: function (event) {
			vm.showList = true;
			vm.showForm = false;
            vm.addOrderForm = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
        addPrd:function(){
            vm.showPrdForm('新增');
		},
        editPrd:function(detailId){
            var rowData = $("#jqGridPRD").jqGrid("getRowData",detailId);
            vm.productionOrderDetailEntity = rowData;
            vm.showPrdForm('修改');
		},
		deletePrd:function(detailId){
            confirm('确定要删除选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: baseURL + "sales/productionorderdetail/deleteById",
                    data: {id:detailId},
                    success: function(r){
                        if(r.code == 0){
                            alert('操作成功', function(index){
                                $("#jqGridPRD").jqGrid('setGridParam',{
                                    postData:{'productionOrderId': vm.productionOrder.id},
                                }).trigger("reloadGrid");
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            });
		},
        saveOrder:function(rowId){
            confirm("确定保存后无法进行修改，是否继续？",function(){
                $.ajax({
                    type: "POST",
                    async: false,
                    url: baseURL + "sales/productionorder/updateStatus",
                    data: {orderId:rowId,status:'2'},
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
            });
        },
        savePrd:function(){
			console.log(vm.productionOrder);
            //1.保存订单信息
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');//单据Id
			var orderUrl = baseURL + "sales/productionorder/save";
			var orderParam = JSON.stringify(vm.productionOrder);
			var flag = 0;
			if(id){//修改
                orderUrl = baseURL + "sales/productionorder/update";
			}else{//新增
                orderUrl = baseURL + "sales/productionorder/save";
			}
            $.ajax({
                type: "POST",
                async:false,
                url: orderUrl,
                contentType: "application/json",
                data: orderParam,
                success: function(r){
                    if(r.code === 0){
                        vm.productionorder = r.data;
                        console.log(vm.productionorder);
                        flag = 1;
                    }else{
                        console.log(r.msg);
                    }
                }
            });
			var detailUrl = baseURL + "sales/productionorderdetail/save";
			//2.保存订单明细信息
			if(!id && flag==1){
                for (var i = 0; i < vm.prdGridRowData.length; i++) {
					vm.productionOrderDetailEntity = {
                        productionOrderId:vm.productionorder.id,
                        productionOrderNo:vm.productionorder.productionOrderNo,
                        prdId:vm.prdGridRowData[i].prdId,
                        prdNo:vm.prdGridRowData[i].prdNo,
                        prdName:vm.prdGridRowData[i].prdName,
                        prdTypeId:vm.prdGridRowData[i].prdTypeId,
                        prdTypeName:vm.prdGridRowData[i].prdTypeName,
                        amount:vm.prdGridRowData[i].amount,
                        price1:vm.prdGridRowData[i].price1,
                        price2:vm.prdGridRowData[i].price2,//售价=客户报价
                        cost:vm.prdGridRowData[i].cost,
                        revenue:vm.prdGridRowData[i].revenue
					};
                    $.ajax({
                        type: "POST",
                        async:false,
                        url: detailUrl,
                        contentType: "application/json",
                        data: JSON.stringify(vm.productionOrderDetailEntity),
                        success: function(r){
                            if(r.code === 0){
                                flag = 2;
                            }else{
                                console.log(r.msg);
                            }
                        }
                    });
                }
			}
			if((id && flag === 1) || (!id && flag===2)){
                alert('操作成功！');
                vm.prdGridRowData = [];
                vm.selectData={};
                vm.productionOrderDetailEntity={};
                vm.reload();
                vm.showForm=false;
                vm.showList=true;
			}
		},
        confirm:function(rowId,type){
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');//计划单Id
            var rowData = $("#jqGrid").jqGrid("getRowData",id);//计划单信息
            if(!id){
                alert('请选择要确认的订单！');
            }
            var status;
            if(type == 'ok'){
                status = "2";
            }else if(type == 'back'){
                status = "1";
            }
            $.ajax({
                type: "POST",
                async: false,
                url: baseURL + "sales/productionorder/updateStatus",
                data: {orderId:id,status:status},
                success: function (r) {
                    console.log(r);
                }
            });
		},
		showPrdForm:function(title){
            //判断是否是客户端&服务端操作---如存在计划Id则为服务端操作，否则为客户端操作。
            var id = vm.productionOrder.id;
            var rowData = vm.productionOrder;
			var operType;

			if(title == '新增'){
                url = "sales/productionorderdetail/save";
                vm.productionOrderDetailEntity.productionOrderId = id;
                vm.productionOrderDetailEntity.productionOrderNo = vm.productionOrder.productionNo;
            }else if(title == '修改'){//修改
                //根据detailId查询信息进行修改
                url = "sales/productionorderdetail/update";
            }

            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: title+"产品",
                area: ['350px', '400px'],
                shadeClose: false,
                content: jQuery("#addLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {

                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        url: baseURL + url,
                        async:false,
                        data: JSON.stringify(vm.productionOrderDetailEntity),
                        success: function (r) {
                            if(r.code === 0){
                                alert('操作成功');
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                    $("#jqGridPRD").jqGrid('setGridParam',{
                        postData:{'productionOrderId': id},
                    }).trigger("reloadGrid");

                    layer.close(num);
                    vm.productionOrderDetailEntity = {};
                },
                btn2:function(event){
                    layer.close(num);
                    vm.productionOrderDetailEntity = {};
                }
            });
		},
        selectVal:function(type){
            // var i=0;
            // var typeInfo;
            // var customerNo;
            // var customerName;
            // var placeInfo;
            if (type == 'orderTypeId' && vm.productionOrder.orderTypeId != null) {
                // i=1;
                $.get(baseURL + "baseData/typeinfo/info/"+vm.productionOrder.orderTypeId, function(r){
                    console.log(r);
                    vm.productionOrder.orderTypeName = r.typeInfo.typeName;
				});
            } else if (type == 'customerId' && vm.productionOrder.customerId != null) {
                // i=2;
                $.get(baseURL + "sales/customerinfo/info/"+vm.productionOrder.customerId, function(r){
                    console.log(r);
                    vm.productionOrder.customerNo = r.customerInfo.customerNo;
                    vm.productionOrder.customerName = r.customerInfo.customerName;
                });
            } else if (type == 'placeId' && vm.productionOrder.placeId != null) {
                // i=3;
                $.get(baseURL + "baseData/typeinfo/info/"+vm.productionOrder.placeId, function(r){
                    console.log(r);
                    vm.productionOrder.placeName = r.typeInfo.typeName;
                });
            }
            // if(i == 3){
            //     vm.productionOrder.orderTypeName = typeInfo;
            //     vm.productionOrder.customerNo = customerNo;
            //     vm.productionOrder.customerName = customerName;
            //     vm.productionOrder.placeName = placeInfo;
            //
            //     $('#addPrd_btn').attr("disabled",false);
            //     $('#editPrd_btn').attr("disabled",false);
            //     $('#delPrd_btn').attr("disabled",false);
            //     $('#savePrd_btn').attr("disabled",false);
            // }
		},
        initCsutomerInfoArr:function(){
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_customer_info",search:"STATUS='1'",returnField:"ID as value,CUSTOMER_NAME as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
		initTypeInfoArr:function(parentId){
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_type_info",search:"PARENT_ID="+parentId,returnField:"ID as value,TYPE_NAME as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
        getSelectDataPrd:function(){
            $('#prd').typeahead({
                source: function (query, process) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "sales/customerprd/list?&limit=100&page=1&searchWord="+query+"&customerId="+vm.productionOrder.customerId,
                        success: function (r) {
                            var resultList = r.page.list.map(function (item) {
                                var aItem  = {id: item.prdId,py: item.prdPy, name: item.prdName};
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
                    vm.productionOrderDetailEntity.prdId=item.id;
                    vm.productionOrderDetailEntity.prdName=item.name;
                    return item.name;
                },
                afterSelect:function(obj){
                    // vm.productionOrder.customerId
                    $.ajax({
                        type: "POST",
                        url: baseURL + "sales/customerprd/getCustomerPrdById",
                        async:false,
                        data: {customerId:vm.productionOrder.customerId,prdId:vm.productionOrderDetailEntity.prdId},
                        success: function (r) {
                            vm.productionOrderDetailEntity.price1 = r.data.price1;
                            vm.productionOrderDetailEntity.price2 = r.data.price2;
                            vm.productionOrderDetailEntity.cost = r.data.cost;

                            vm.productionOrderDetailEntity.prdNo = r.data.prdNo;
                            vm.productionOrderDetailEntity.prdTypeId = r.data.prdTypeId;
                            vm.productionOrderDetailEntity.prdTypeName = r.data.prdTypeName;
                            $('#selectPrice1').val(r.data.price1);
                            $('#selectPrice2').val(r.data.price2);
                        }
                    });
                }
            });
        },
		getGridMaxId:function(gridObj){
			var ids = $(gridObj).jqGrid('getDataIDs');
			var j=0;
			for(var i=0;i<ids.length;i++){
				if(ids[i]>j){
					j=ids[i];
				}
			}
			return j;
		},
        getFieldData:function(){
            var query = $('#customer').val();
            $.ajax({
                type:"POST",
                url: baseURL + "common/commonUtil/getTableData",
                data:"tableName=TB_PRODUCTION_ORDER&fieldName=CUSTOMER_NO:CUSTOMER_NAME&searchWord="+query,
                success: function(r){
                    var resultList = r.data.map(function (item) {
                        var aItem = {no: item.CUSTOMER_NO, name: item.CUSTOMER_NAME};
                        return JSON.stringify(aItem);
                    });
                    dataSource = resultList;
                    $('#customer').typeahead({
                        source: dataSource,
                        highlighter: function (obj) {
                            var item = JSON.parse(obj);
                            var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
                            var str = item.name + "(" + item.no + ")";
                            return str.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                                return '<strong>' + match + '</strong>'
                            });
                        },
                        updater: function (obj) {
                            var item = JSON.parse(obj);
                            vm.q.customer = item.name;
                            return item.name;
                        }
                    });
                }
            });
        },
        search:function(){
            console.log(vm.orderInfo);
            var postData = {
                productionNo: vm.q.productionNo,
                orderTypeName: vm.q.orderTypeName==0?null:vm.q.orderTypeName,
                customer: vm.q.customer,
                placeName: vm.q.placeName==0?null:vm.q.placeName,
            };
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData:postData,
                page:page
            }).trigger("reloadGrid");
            // vm.reload();
        },
        checkFormAttr:function(){
            var flag = true;
            var msg = "";
            if(vm.productionOrder.orderTypeId == undefined || vm.productionOrder.orderTypeId == ''){
                msg = '请选择订单类型！';
                flag = false;
                alert(msg);
                return flag;
            }
            if(vm.productionOrder.customerId == undefined || vm.productionOrder.customerId == ''){
                msg = '请选择客户！';
                flag = false;
                alert(msg);
                return flag;
            }
            return flag;
        },
	}
});
vm.orderTypeArr = vm.initTypeInfoArr(40);
vm.placeArr = vm.initTypeInfoArr(82);
vm.customerArr = vm.initCsutomerInfoArr();
var dataSource = ["a","b","1","测试","dd","10a","a测","yi","yidaiyilu","shuohua","1touzhu"];
vm.getFieldData();

