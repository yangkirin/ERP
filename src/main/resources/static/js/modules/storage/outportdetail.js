$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sales/productionorder/list',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '订单编号', name: 'productionNo', index: 'PRODUCTION_NO', width: 80 },
            { label: '计划单编号', name: 'planNo', index: 'PLAN_NO', width: 80 ,hidden:true},
            { label: '订单类型名称', name: 'orderTypeName', index: 'ORDER_TYPE_NAME', width: 80 },
            { label: '客户编号', name: 'customerNo', index: 'CUSTOMER_NO', width: 80 },
            { label: '客户名称', name: 'customerName', index: 'CUSTOMER_NAME', width: 80 },
            { label: '售点名称', name: 'placeName', index: 'PLACE_NAME', width: 80 },
            { label: '备注', name: 'remakr', index: 'REMAKR', width: 80 },
            { label: '状态', name: 'status', index: 'STATUS', width: 80 ,formatter: function(value, options, row){
                return value === '1' ?
                    '<span class="label label-danger">未确认</span>' :
                    '<span class="label label-success">已确认</span>';
            },unformat:function(value, options, row){
                if(value == '未确认'){
                    return 1;
                }else if(value == '已确认'){
                    return 2;
                }
            }
            },
            { label: '创建者', name: 'createUser', index: 'CREATE_USER', width: 80 },
            { label: '创建日期', name: 'createDate', index: 'CREATE_DATE', width: 80 }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
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
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
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
                { label: '定价', name: 'price1', index: 'PRICE1', width: 80 ,hidden:true},
                { label: '售价', name: 'price2', index: 'PRICE2', width: 80 ,hidden:true},
                { label: '成本', name: 'cost', index: 'COST', width: 80 ,hidden:true},
                { label: '预估收入', name: 'revenue', index: 'REVENUE', width: 80 ,hidden:true}
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

    $("#jqGridMtr").jqGrid({
        url: baseURL + 'storage/outportdetail/findOutMtrByOrderId',
        datatype: "local",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            // { label: '出库单号', name: 'outportNo', index: 'OUTPORT_NO', width: 80 },
            // { label: '生产订单ID', name: 'orderId', index: 'ORDER_ID', width: 80 ,hidden:true},
            // { label: '客户ID', name: 'customerId', index: 'CUSOTOMER_ID', width: 80 ,hidden:true},
            // { label: '客户名称', name: 'customerName', index: 'USOTOMER_NAME', width: 80 },
            // { label: '客户编号', name: 'customerNo', index: 'CUSOTOMER_NO', width: 80 },
            { label: '产品ID', name: 'prdId', index: 'PRD_ID', width: 80,hidden:true },
            { label: '产品编号', name: 'prdCode', index: 'PRD_CODE', width: 80 ,hidden:true },
            { label: '产品类型', name: 'prdTypeName', index: 'PRD_TYPE_NAME', width: 80 ,hidden:true },
            { label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 80 ,hidden:true },
            { label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80 ,hidden:true},
            { label: '原料编号', name: 'mtrCode', index: 'MTR_CODE', width: 80 },
            { label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 80 },
            { label: '原料类型', name: 'mtrTypeName', index: 'MTR_TYPE_NAME', width: 80 },
            { label: '需求数量', name: 'orderCount', index: 'ORDER_COUNT', width: 80 },
            { label: '已领数量', name: 'outCount', index: 'OUT_COUNT', width: 80 },
            { label: '出库日期', name: 'outDate', index: 'OUT_DATE', width: 80 ,hidden:true },
            { label: '状态', name: 'status', index: 'STATUS', width: 80,hidden:true },
            { label: '操作人', name: 'createUser', index: 'CREATE_USER', width: 80 ,hidden:true}
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPagerMtr",
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
            // $("#jqGridMtr").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });


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
    $('.form_datetime').datetimepicker().on('hide', function (ev) {
        var value = $(".form_datetime").val();
        vm.productionOrder.createDate = value;
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
        showDetail: false,
		title: null,
        productionOrder:{},
		outportDetail: {},
        selectData:{},
        customerArr:{},
        batchArr:{},
        mtrdata:{},
        detail:{},
        mtrInfo:{}
	},
	methods: {
		search: function () {
			vm.reload();
		},
        addMtr: function(){
            var rowId = $('#jqGridMtr').jqGrid("getGridParam", "selrow");
            if(rowId == null){
                alert('请选择原料！');
                return ;
            }
            var rowData = $('#jqGridMtr').jqGrid("getRowData",rowId);
            // if(rowData.outCount == rowData.orderCount){
            //     alert('需求量已满足，是否继续领用！');
            // }

            //所选原料信息
            $.get(baseURL + "baseData/mtrdata/info/"+rowData.mtrId, function(r){
                vm.mtrInfo = r.mtrData;
            });
            vm.selectData.orderCount = rowData.orderCount;
            $('#orderCount').val(rowData.orderCount);

            vm.selectData.haveOutbound = rowData.outCount;//outCount
            $('#haveOutbound').val(rowData.outCount);

            //根据所选原料查询所有在库批号信息
            vm.batchArr = vm.initMtrBatch();

			vm.showList = false;
			vm.title = "新增批号";
			vm.outportDetail = {};
			vm.showMtr('add');
		},
        editMtr: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";



            vm.getInfo(id);
            vm.showMtr('edit');
		},
		saveOrUpdate: function (event) {
			var url = vm.outportDetail.id == null ? "storage/outportdetail/save" : "storage/outportdetail/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.outportDetail),
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
        deleteMtr: function (event) {
			var ids = $("#jqGridMtr").getGridParam("selarrrow");
			if(ids == null){
				return ;
			}
            var rowId = $('#jqGrid').jqGrid("getGridParam", "selrow");
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "storage/outportdetail/delete",
                    contentType: "application/json",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
                                $("#jqGridMtr").jqGrid('setGridParam',{
                                    datatype:'json',
                                    postData:{'orderId': rowId},
                                }).trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
        showMtr:function(type){
            vm.getSelectDataMtr();
            var rowId = $('#jqGrid').jqGrid("getGridParam", "selrow");
            if(type == 'add'){
                //客户订单信息
                $.get(baseURL + "sales/productionorder/info/"+rowId, function(r){
                    vm.productionOrder = r.productionOrder;
                });
                // console.log(vm.productionOrder);
            }else if(type == 'edit'){
                var mtrRowId = $('#jqGridMtr').jqGrid("getGridParam", "selrow");
                $.get(baseURL + "storage/outportdetail/info/"+mtrRowId, function(r){
                    vm.outportDetail = r.outportDetail;

                    $('#selectMtr').val(r.outportDetail.mtrName);
                    $('#miniUnitName').val(r.outportDetail.outUnit);
                    $('#orderCount').val(r.outportDetail.orderCount);
                    $('#outCount').val(r.outportDetail.outCount);

                    vm.outportDetail.orderCount = r.outportDetail.orderCount;

                    // console.log(vm.outportDetail);
                });

            }
            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: vm.title,
                area: ['600px', '480px'],
                shadeClose: false,
                content: jQuery("#addLayer"),
                btn: ['提交', '取消'],
                btn1: function (event) {
                    // alert('新增批号确认');
                    // console.log(vm.productionOrder);
                    // console.log(vm.mtrInfo);
                    // console.log(vm.selectData);
                    //vm.productionOrder：id,productionNo,customerId,customerName,customerNo
                    //vm.mtrInfo:id,mtrCode,mtrName,typeName
                    //vm.selectData:orderCount,outAmount,batchNo
                    if(type=='add'){
                        vm.outportDetail.orderId = vm.productionOrder.id;
                        vm.outportDetail.customerId = vm.productionOrder.customerId;
                        vm.outportDetail.customerName = vm.productionOrder.customerName;
                        vm.outportDetail.customerNo = vm.productionOrder.customerNo;

                        vm.outportDetail.mtrId = vm.mtrInfo.id;
                        vm.outportDetail.mtrNo = vm.mtrInfo.mtrCode;
                        vm.outportDetail.mtrName = vm.mtrInfo.mtrName;
                        vm.outportDetail.mtrTypeName = vm.mtrInfo.typeName;

                        vm.outportDetail.orderCount = vm.selectData.orderCount;
                        // vm.outportDetail.outCount = vm.selectData.realCount;
                        vm.outportDetail.outCount = vm.selectData.outAmount;
                        vm.outportDetail.batchNo = vm.selectData.batchNo;



                        $.ajax({
                            type: "POST",
                            async:false,
                            url: baseURL + "storage/outportdetail/save",
                            contentType: "application/json",
                            data: JSON.stringify(vm.outportDetail),
                            success: function(r){
                                if(r.code == 0){
                                    alert('操作成功', function(index){
                                        $("#jqGridMtr").jqGrid('setGridParam',{
                                            datatype:'json',
                                            postData:{'orderId': rowId},
                                        }).trigger("reloadGrid");
                                    });
                                }else{
                                    alert(r.msg);
                                }
                            }
                        });
                    }else{
                        // vm.outportDetail.orderCount = $('#orderCount').val();
                        // vm.outportDetail.outCount = $('#outCount').val();
                        // $.ajax({
                        //     type: "POST",
                        //     async:false,
                        //     url: baseURL + "storage/outportdetail/update",
                        //     contentType: "application/json",
                        //     data: JSON.stringify(vm.outportDetail),
                        //     success: function(r){
                        //         if(r.code == 0){
                        //             alert('操作成功', function(index){
                        //                 $("#jqGridMtr").jqGrid('setGridParam',{
                        //                     datatype:'json',
                        //                     postData:{'orderId': rowId},
                        //                 }).trigger("reloadGrid");
                        //             });
                        //         }else{
                        //             alert(r.msg);
                        //         }
                        //     }
                        // });
                    }
                    layer.close(num);
                    vm.outportDetail = {};
                    vm.mtrInfo = {};
                    vm.selectData = {};
                    vm.selectArr = {};
                },
                btn2: function (event) {
                    vm.outportDetail = {};
                    layer.close(num);
                }
            });
        },
        createOutport:function(){
            var rowId = $('#jqGrid').jqGrid("getGridParam", "selrow");
            var rowData = $('#jqGrid').jqGrid("getRowData",rowId);
            if(!rowId){
                alert('请选择要领料的单据！');
                return;
            }
            if(rowData.status == 1){
                alert('请先确认领料的单据！');
                return;
            }
            vm.showDetail = true;
            vm.showList = false;

            $.get(baseURL + "sales/productionorder/info/"+rowId, function(r){
                vm.detail = r.productionOrder;
                vm.detail.outportNo = 'dwadwadwadwa';
                $('#detailOutportNo').val('dwadwadwadwa');
                console.log(vm.detail);
            });

            //jqGridMtr
            $("#jqGridMtr").jqGrid('setGridParam',{
                datatype: "json",
                postData:{'orderId': rowId}
            }).trigger("reloadGrid");

            // $.ajax({
            //     type: "POST",
            //     async:false,
            //     url: baseURL + "storage/outportdetail/confirmOrder",
            //     contentType: "application/json",
            //     data: JSON.stringify(ids),
            //     success: function(r){
            //         if(r.code == 0){
            //             alert('操作成功', function(index){
            //                 $("#jqGrid").trigger("reloadGrid");
            //             });
            //         }else{
            //             alert(r.msg);
            //         }
            //     }
            // });
        },
        addOutport:function(){
            var rowId = $('#jqGrid').jqGrid("getGridParam", "selrow");
            var rowData = $('#jqGrid').jqGrid("getRowData",rowId);
            if(!rowId){
                alert('请选择要领料的单据！');
                return;
            }
            if(rowData.status == 1){
                alert('请先确认领料的单据！');
                return;
            }
            vm.showDetail = true;
            vm.showList = false;
            $("#jqGridMtr").jqGrid('setGridParam',{
                datatype:'json',
                postData:{'orderId': rowId},
            }).trigger("reloadGrid");
        },
		getInfo: function(id){
			$.get(baseURL + "storage/outportdetail/info/"+id, function(r){
                vm.outportDetail = r.outportDetail;
            });
		},
		reload: function (event) {
			vm.showList = true;
			vm.showDetail = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
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
        getSelectDataMtr:function(){
            $('#selectMtr').typeahead({
                source: function (query, process) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "common/commonUtil/getTableData",
                        data: "tableName=MTR_DATA&fieldName=MTR_NAME:MTR_PY&searchWord=" + query,
                        success: function (r) {
                            var resultList = r.data.map(function (item) {
                                var aItem = {id: item.id, py: item.MTR_PY, name: item.MTR_NAME};
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

                    vm.selectData.mtrId=item.id;

                    return item.name;
                },
                afterSelect:function(obj){
                    $.ajax({
                        type: "POST",
                        url: baseURL + "baseData/mtrdata/info/"+vm.selectData.mtrId,
                        async:true,
                        success: function (r) {
                            vm.selectData = r.mtrData;
                            vm.selectData.mtrId = r.mtrData.id;
                            vm.selectData.mtrName = r.mtrData.mtrName;
                            console.log(vm.selectData);
                        }
                    });
                }
            })
		},
        selectVal:function(type){
            var customerNo;
            var customerName;
            if(type == 'customerId'){
                $.get(baseURL + "sales/customerinfo/info/"+vm.productionOrder.customerId, function(r){
                    customerNo = r.customerInfo;
                    customerName = r.customerName;
                });
            }
            vm.productionOrder.customerNo = customerNo;
            vm.productionOrder.customerName = customerName;
		},
        selectBatchVal:function(){
            //所选原料信息
            var rowId = $('#jqGridMtr').jqGrid("getGridParam", "selrow");
            var rowData = $('#jqGridMtr').jqGrid("getRowData",rowId);

            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "storage/importmtrbatch/getCurrentCount",
                // contentType: "application/json",
                data: {mtrId:rowData.mtrId,batchNo:vm.selectData.batchNo},
                success: function(r){
                    vm.selectData.inventory = r.currentCount;
                    $('#inventory').val(r.currentCount+'【'+vm.mtrInfo.purchaseUnitName+'】');

                    //最小单位库存计算
                    //最小单位库存量=库存量*采购转换率*最小转换率
                    var miniInventory = Number(Number(r.currentCount)*Number(vm.mtrInfo.purchaseRate)*Number(vm.mtrInfo.miniRate),2);
                    vm.selectData.inventoryMiniUnit = miniInventory;
                    $('#inventoryMiniUnit').val(miniInventory+'【'+vm.mtrInfo.miniUnitName+'】');
                }
            });
        },
        initMtrBatch:function(){
            var rowId = $('#jqGridMtr').jqGrid("getGridParam", "selrow");
            var rowData = $('#jqGridMtr').jqGrid("getRowData",rowId);

            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_import_mtr_batch",search:"MTR_ID="+rowData.mtrId,returnField:"BATCH_NO as value,BATCH_NO as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
        textChange:function(){
            var inputCount = $('#outCount').val();

            // 实际出库量=领料量/最小转换率/采购转换率
            // 剩余库存量=库存量-实际出库量
            var realCount = Number(Number(Number(inputCount)/Number(vm.mtrInfo.miniRate),2)/Number(vm.mtrInfo.purchaseRate),2);
            vm.selectData.realCount = realCount;
            var residueCount = Number(vm.selectData.inventory)-realCount;
            vm.selectData.residueCount = residueCount.toFixed(2);
            $('#realCount').val(realCount);
            $('#residueCount').val(residueCount.toFixed(2));
        }
	}
});
vm.customerArr = vm.initCsutomerInfoArr();