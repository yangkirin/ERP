$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sales/productionorder/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '订单编号', name: 'productionNo', index: 'PRODUCTION_NO', width: 80 },
			{ label: '订单类型ID', name: 'orderTypeId', index: 'ORDER_TYPE_ID', width: 80 ,hidden:true},
			{ label: '订单类型名称', name: 'orderTypeName', index: 'ORDER_TYPE_NAME', width: 80 }, 			
			{ label: '客户ID', name: 'customerId', index: 'CUSTOMER_ID', width: 80 ,hidden:true},
			{ label: '客户编号', name: 'customerNo', index: 'CUSTOMER_NO', width: 80 }, 			
			{ label: '客户名称', name: 'customerName', index: 'CUSTOMER_NAME', width: 80 }, 			
			{ label: '售点ID', name: 'placeId', index: 'PLACE_ID', width: 80,hidden:true },
			{ label: '售点名称', name: 'placeName', index: 'PLACE_NAME', width: 80 },
            { label: '成本', name: 'prdCost', index: 'PRD_COST', width: 80 },
            { label: '收入', name: 'prdIncome', index: 'PRD_INCOME', width: 80 },
            { label: '折后收入', name: 'discountIncome', index: 'DISCOUNT_INCOME', width: 80 },
            { label: '产品总数', name: 'prdMount', index: 'PRD_MOUNT', width: 80 },
            { label: '成本率', name: 'costRate', index: 'COST_RATE', width: 80 },
            { label: '折扣成本比', name: 'discountCostRate', index: 'DISCOUNT_COST_RATE', width: 80 },
            { label: '备注', name: 'remakr', index: 'REMAKR', width: 80 },
            { label: '状态', name: 'status', index: 'STATUS', width: 80, formatter: function (value, options, row) {
					var msg = "";
					if (value == 0) {
						msg = '<span class="label label-danger">已禁用</span>';
					} else if (value == 1) {
						msg = '<span class="label label-info">待确认</span>';
					} else if (value == 2) {
						msg = '<span class="label label-primary">已确认</span>';
					}
					return msg;
				}
            }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
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
            var url = baseURL + 'sales/productionorderdetail/list?productionOrderId='+row_id;
            createSubGrid(subgrid_id,row_id,url);
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
            { label: '产品编号', name: 'prdNo', index: 'PRD_NO', width: 150 },
            { label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 300 },
            { label: '产品类型ID', name: 'prdTypeId', index: 'PRD_TYPE_ID', width: 80 ,hidden:true},
            { label: '产品类型', name: 'prdTypeName', index: 'PRD_TYPE_NAME', width: 120 },
            { label: '需求数量', name: 'amount', index: 'AMOUNT', width: 80 },
            { label: '定价', name: 'price1', index: 'PRICE1', width: 80 },
            { label: '售价', name: 'price2', index: 'PRICE2', width: 80 },
            { label: '成本', name: 'cost', index: 'COST', width: 80 },
            { label: '预估收入', name: 'revenue', index: 'REVENUE', width: 80 }
        ],
        viewrecords: true,
        height: 230,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        // rownumWidth: 25,
        autowidth:true,
        pager: "#jqGridPagerPRD",
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

});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
        showForm:false,
		title: null,
		productionOrder: {},
        productionOrderDetailEntity: {},
        orderTypeArr:{},
        customerArr:{},
        placeArr:{},
        selectData:{},
		prdGridRowData:[]
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.showForm = true;
			vm.title = "新增";
			vm.productionOrder = {
                productionNo:vm.createNewNo(),
                status:1
			};
			$('#confirm_ok').hide();
			$('#confirm_back').hide();

            // $('#addPrd_btn').attr("disabled",true);
            // $('#editPrd_btn').attr("disabled",true);
            // $('#delPrd_btn').attr("disabled",true);
            // $('#savePrd_btn').attr("disabled",true);

            $('#jqGridPRD').jqGrid("clearGridData");
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
			vm.showForm = true;
            vm.title = "修改";
            
            vm.getInfo(id);
            $("#jqGridPRD").jqGrid('setGridParam',{
                postData:{'productionOrderId': id},
            }).trigger("reloadGrid");
		},
		saveOrUpdate: function (event) {
			var url = vm.productionOrder.id == null ? "sales/productionorder/save" : "sales/productionorder/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.productionOrder),
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
            });
		},
		reload: function (event) {
			vm.showList = true;
			vm.showForm = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
        createNewNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/getTableNewNo",
                data:"tableName=tb_production_order&noField=PRODUCTION_NO&length=4",
                success: function(r){
                    no = r.newNo;
                }
            });
            return no;
        },
        addPrd:function(){
            // console.log(vm.productionOrder.orderTypeId);
            // console.log(vm.productionOrder.customerId);
            if(vm.checkFormAttr()){
                vm.showPrdForm('新增');
            }
		},
        editPrd:function(){
            var prdRowId = $("#jqGridPRD").jqGrid('getGridParam','selrow');
            if(prdRowId){
                var rowData = $("#jqGridPRD").jqGrid("getRowData",prdRowId);
                vm.selectData = rowData;
                vm.showPrdForm('修改');
            }else{
                alert('请选择要修改的产品！');
            }
            // $('#addPrd_btn').attr("disabled",true);
            // $('#editPrd_btn').attr("disabled",true);
            // $('#delPrd_btn').attr("disabled",true);
            // $('#savePrd_btn').attr("disabled",true);
		},
		deletePrd:function(){
            var prdRowId = $("#jqGridPRD").jqGrid('getGridParam','selrow');
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');//计划单Id
            if(prdRowId){
            	if(id){//服务端删除
                    confirm('确定要删除选中的记录？', function(){
                        $.ajax({
                            type: "POST",
                            url: baseURL + "sales/productionorderdetail/deleteById",
                            data: {id:prdRowId},
                            success: function(r){
                                if(r.code == 0){
                                    alert('操作成功', function(index){
                                        $("#jqGridPRD").jqGrid('setGridParam',{
                                            postData:{'productionOrderId': id},
                                        }).trigger("reloadGrid");
                                    });
                                }else{
                                    alert(r.msg);
                                }
                            }
                        });
                    });
				}else{//客户端删除
                    var count = vm.getGridMaxId($('#jqGridPRD'));
                    var rowData = $("#jqGridPRD").jqGrid("getRowData",prdRowId);
                    var tempData = [];
                    for (var i = 0; i < vm.prdGridRowData.length; i++) {
                        if (vm.prdGridRowData[i].prdId != rowData.prdId) {
                            // vm.prdGridRowData.remove(vm.prdGridRowData[i]);
                            tempData.push(vm.prdGridRowData[i]);
                        }
                    }
                    vm.prdGridRowData = tempData;
                    $('#jqGridPRD').jqGrid("clearGridData");
                    $('#jqGridPRD').jqGrid("addRowData", count + 1, tempData, "first");
				}
			}else{
            	alert('请选择要删除的产品！');
            	return;
			}
		},
        savePrd:function(){
			console.log(vm.productionOrder);
            //1.保存订单信息
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');//计划单Id
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
        confirm:function(type){
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
            // console.log(vm.productionOrder);
		},
		showPrdForm:function(title){
            vm.getSelectDataPrd();
            //判断是否是客户端&服务端操作---如存在计划Id则为服务端操作，否则为客户端操作。
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');//计划单Id
            var rowData = $("#jqGrid").jqGrid("getRowData",id);//计划单信息
			var operType;
			if(id){//服务端
                operType = 'Server';
                //判断是否进行明细修改
                var prdRowId = $("#jqGridPRD").jqGrid('getGridParam','selrow');
                if(prdRowId){//修改Detail
                    url = "sales/productionorderdetail/update";
                    $.get(baseURL + "sales/productionplandetail/info/"+prdRowId, function(r){
                        vm.productionOrderDetailEntity = r.productionOrderDetail;
                    });
                }else{//新增Detail

                    url = "sales/productionorderdetail/save";
                }
			}else{//客户端
                operType = 'Client';
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
                    if(operType == 'Server'){
                        var revenue = Number(Number(vm.selectData.amount) * Number(vm.selectData.price2)).toFixed(2);
                        $.ajax({
                            type: "POST",
                            async: false,
                            url: baseURL + "baseData/prddata/info/" + vm.selectData.prdId,
                            success: function (r) {
                                var prdData = r.prdData;
                                vm.productionOrderDetailEntity = {
                                    productionOrderId:id,
                                    prdTypeName: prdData.typeName,
                                    prdTypeId: prdData.typeId,
                                    prdId: prdData.id,
                                    prdNo: prdData.prdCode,
                                    prdName: prdData.prdName,
                                    amount: vm.selectData.amount,
                                    price1: vm.selectData.price1,
                                    price2: vm.selectData.price2,
                                    cost: prdData.cost,
                                    revenue: revenue
                                };
                            }
                        });

                        // vm.productionOrderDetailEntity.productionOrderId=id;
                        // vm.productionOrderDetailEntity.prdId=vm.selectData.prdId;
                        // vm.productionOrderDetailEntity.prdName=vm.selectData.prdName;
                        // vm.productionOrderDetailEntity.prdNo=vm.selectData.prdNo;
                        // vm.productionOrderDetailEntity.prdTypeId=vm.selectData.prdTypeId;
                        // vm.productionOrderDetailEntity.prdTypeName=vm.selectData.prdTypeName;
                        // vm.productionOrderDetailEntity.amount = vm.selectData.amount;
                        // vm.productionOrderDetailEntity.price1 = vm.selectData.price1;
                        // vm.productionOrderDetailEntity.price2 = vm.selectData.price2;

                        //判断是否存在相同产品
                        var isExtis = false;
                        var allDetail = $("#jqGridPRD").jqGrid("getRowData");
                        var allDetail2 = getGridAllData('jqGridPRD');
                        for (var i = 0; i < allDetail.length; i++) {
                            if (allDetail2[i].prdId == vm.productionOrderDetailEntity.prdId) {
                                isExtis = true;
                                break;
							}
                        }
						if(isExtis){
							alert('存在相同产品，请做修改！');
							return;
						}else{
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
						}
                    }else if(operType == 'Client'){
                        if(title == '新增'){
                            var count = vm.getGridMaxId($('#jqGridPRD'));
                            var rowId = $('#jqGridPRD').jqGrid("getGridParam", "selrow");
                            //判断列表当中是否存在当前所选原料，如存在，则提示是否累加数量，如不存在，则进入下一流程
                            var isExtis = false;
                            for (var i = 0; i < vm.prdGridRowData.length; i++) {
                                if (vm.prdGridRowData[i].prdId == vm.selectData.prdId) {
                                    vm.prdGridRowData[i].amount = Number(Number(vm.prdGridRowData[i].amount) + Number(vm.selectData.amount)).toFixed(2);
                                    vm.prdGridRowData[i].revenue = Number(Number(vm.prdGridRowData[i].amount) * Number(vm.selectData.price2)).toFixed(2);
                                    isExtis = true;
                                    break;
                                }
                            }
                            if (!isExtis) {
                                var dataRow = {};
                                var prdData;
                                var revenue = Number(Number(vm.selectData.amount) * Number(vm.selectData.price2)).toFixed(2);
                                $.ajax({
                                    type: "POST",
                                    async: false,
                                    url: baseURL + "baseData/prddata/info/" + vm.selectData.prdId,
                                    success: function (r) {
                                        prdData = r.prdData;
                                        // dataRow={prdTypeName:prdData.typeName,prdName:prdData.prdName,amount:vm.selectData.amount,PRICE1:0,PRICE2:prdData.referencePrice,COST:prdData.cost,revenue:0};
                                        dataRow = {
                                            prdTypeName: prdData.typeName,
                                            prdTypeId: prdData.typeId,
                                            prdId: prdData.id,
                                            prdNo: prdData.prdCode,
                                            prdName: prdData.prdName,
                                            amount: vm.selectData.amount,
                                            price1: vm.selectData.price1,
                                            price2: vm.selectData.price2,
                                            cost: prdData.cost,
                                            revenue: revenue
                                        };
                                    }
                                });
                                vm.prdGridRowData.push(dataRow);
                                $("#jqGridPRD").jqGrid("addRowData", Number(count) + 1, dataRow, "first");
                            } else {
                                $('#jqGridPRD').jqGrid("clearGridData");
                                $('#jqGridPRD').jqGrid("addRowData", count + 1, vm.prdGridRowData, "first");
                            }
                        }else if(title == '修改'){
                            for(var i=0;i<vm.prdGridRowData.length;i++){
                                if(vm.prdGridRowData[i].prdId == vm.selectData.prdId){
                                    vm.prdGridRowData[i].amount = vm.selectData.amount;
                                    vm.prdGridRowData[i].revenue = Number(Number(vm.selectData.amount)*Number(vm.selectData.price2)).toFixed(2);
                                }
                            }
                            $('#jqGridPRD').jqGrid("clearGridData");
                            var count = $("#jqGridPRD").jqGrid("getGridParam", "records");
                            $('#jqGridPRD').jqGrid("addRowData",count+1,vm.prdGridRowData,"first");
                        }
                    }
                    layer.close(num);
                    vm.selectData = {};
                },
                btn2:function(event){
                    layer.close(num);
                    vm.selectData = {};
                }
            });
		},
        selectVal:function(type){
            var i=0;
            var typeInfo;
            var customerNo;
            var customerName;
            var placeInfo;
            if(type == 'orderTypeId'){
                i=1;
                $.get(baseURL + "baseData/typeinfo/info/"+vm.productionOrder.orderTypeId, function(r){
                    typeInfo = r.typeInfo;
				});
            }else if(type == 'customerId'){
                i=2;
                $.get(baseURL + "sales/customerinfo/info/"+vm.productionOrder.customerId, function(r){
                    customerNo = r.customerInfo;
                    customerName = r.customerName;
                });
            }else if(type == 'placeId'){
                i=3;
                $.get(baseURL + "baseData/typeinfo/info/"+vm.productionOrder.placeId, function(r){
                    placeInfo = r.typeInfo;
                });
            }
            if(i == 3){
                vm.productionOrder.orderTypeName = typeInfo;
                vm.productionOrder.customerNo = customerNo;
                vm.productionOrder.customerName = customerName;
                vm.productionOrder.placeName = placeInfo;

                $('#addPrd_btn').attr("disabled",false);
                $('#editPrd_btn').attr("disabled",false);
                $('#delPrd_btn').attr("disabled",false);
                $('#savePrd_btn').attr("disabled",false);
            }
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
                    vm.selectData.prdId=item.id;
                    vm.selectData.prdName=item.name;
                    return item.name;
                },
                afterSelect:function(obj){
                    // vm.productionOrder.customerId
                    $.ajax({
                        type: "POST",
                        url: baseURL + "sales/customerprd/getCustomerPrdById",
                        async:false,
                        data: {customerId:vm.productionOrder.customerId,prdId:vm.selectData.prdId},
                        success: function (r) {
                            vm.selectData.price1 = r.data.price1;
                            vm.selectData.price2 = r.data.price2;
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
        search:function(){
            console.log(vm.orderInfo);
            var postData = {
                productionNo: $('#search').val(),
                orderTypeName: $('#search').val(),
                customerNo: $('#search').val(),
                customerName: $('#search').val(),
                placeName: $('#search').val()
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
        }
	}
});
vm.orderTypeArr = vm.initTypeInfoArr(40);
vm.placeArr = vm.initTypeInfoArr(82);
vm.customerArr = vm.initCsutomerInfoArr();