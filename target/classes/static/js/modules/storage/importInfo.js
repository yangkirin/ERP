$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/import/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '入库单号', name: 'importNo', index: 'IMPORT_NO', width: 80 }, 			
			{ label: '订单ID', name: 'orderId', index: 'ORDER_ID', width: 80 ,hidden:true},
            { label: '订单编号', name: 'orderNo', index: 'ORDER_NO', width: 100},
            { label: '期望到货日期', name: 'exceptionDate', index: 'ORDER_NO', width: 80,formatter:'date',
                formatoptions:{newformat:'Y-m-d'},unformat:function(value, options, row){
                    var dateTemp = new Date(value);
                    return dateTemp;
            }},
			{ label: '供应商ID', name: 'supplierId', index: 'SUPPLIER_ID', width: 80 ,hidden:true},
			{ label: '供应商名称', name: 'supplierName', index: 'SUPPLIER_NAME', width: 80 }, 			
			{ label: '供应商编号', name: 'supplierNo', index: 'SUPPLIER_NO', width: 80 }, 			
			{ label: '入库日期', name: 'importDate', index: 'IMPORT_DATE', width: 80 }, 			
			{ label: '状态', name: 'status', index: 'STATUS', width: 80,formatter: function(value, options, row){
                return value === '1' ?
                    '<span class="label label-info">待入库</span>' :
                    '<span class="label label-success">已入库</span>';
            },unformat:function(value, options, row){
                if($.trim(value).trim()=="待入库"){
                    return "1";
                }else if($.trim(value)=="已入库"){
                    return "2";
                }
            }},
			{ label: '入库人', name: 'createUser', index: 'CREATE_USER', width: 80 }			
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
            var rowData = $("#jqGrid").jqGrid("getRowData",row_id);
            var url = baseURL + 'storage/importdetail/list?importId='+row_id;
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


            // if(ids != null && ids.length > 1){
            //     $('#printImport').attr("disabled",true);
            //     $('#confirm_storg').attr("disabled", true);
            // }else {
            //
            //
            //
            //     $('#printImport').attr("disabled", false);
            //     var rowData = $("#jqGrid").jqGrid("getRowData", id);
            //     if (rowData != null && rowData.status == '2') {
            //         $('#confirm_storg').attr("disabled", true);
            //     } else {
            //         $('#confirm_storg').attr("disabled", false);
            //     }
            // }
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
                { label: '入库单ID', name: 'importId', index: 'IMPORT_ID', width: 80 ,hidden:true},
                { label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80,hidden:true },
                { label: '原料编号', name: 'mtrNo', index: 'MTR_NO', width: 80 },
                { label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 80 },
                { label: '入库单位', name: 'inUnit', index: 'IN_UNIT', width: 80 },
                { label: '入库转换率', name: 'inRate', index: 'IN_RATE', width: 80 ,formatter : "number"},
                { label: '采购数量', name: 'orderCount', index: 'ORDER_COUNT', width: 80 ,formatter : "number"},
                { label: '采购单价', name: 'orderPrice', index: 'ORDER_PRICE', width: 80 ,formatter : "number"},
                { label: '采购金额', name: 'orderSumPrice', index: 'ORDER_SUM_PRICE', width: 80 ,formatter : "number"},
                { label: '入库数量', name: 'inCount', index: 'IN_COUNT', width: 80 ,formatter : "number"},
                { label: '入库单价', name: 'inPrice', index: 'IN_PRICE', width: 80 ,formatter : "number"},
                { label: '入库金额', name: 'inSumPrice', index: 'IN_SUM_PRICE', width: 80,formatter : "number" },
                { label: '入库重量', name: 'inWgt', index: 'IN_WGT', width: 80 ,formatter : "number"},
                { label: '入库日期', name: 'inDate', index: 'IN_DATE', width: 80 }
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
        url: baseURL + 'storage/importdetail/list',
        editurl : baseURL+"storage/importdetail/editDetail",
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '入库单ID', name: 'importId', index: 'IMPORT_ID', width: 80 ,hidden:true},
            { label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80,hidden:true },
            { label: '原料编号', name: 'mtrNo', index: 'MTR_NO', width: 80 },
            { label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 220 },
            { label: '入库单位', name: 'inUnit', index: 'IN_UNIT', width: 80  ,hidden:true,align:'right'},
            { label: '入库转换率', name: 'inRate', index: 'IN_RATE', width: 80 ,formatter : "number" ,hidden:true},
            { label: '采购数量', name: 'orderCount', index: 'ORDER_COUNT', width: 120 ,formatter : "number",align:'right'},
            { label: '采购单价', name: 'orderPrice', index: 'ORDER_PRICE', width: 120 ,formatter : "number",align:'right'},
            { label: '采购金额', name: 'orderSumPrice', index: 'ORDER_SUM_PRICE', width: 120 ,formatter : "number",align:'right'},
            { label: '件重', name: 'orderMtrWgt', index: 'ORDER_MTR_WGT', width: 120,formatter : "number",align:'right'},
            { label: '入库数量', name: 'inCount', index: 'IN_COUNT', width: 60 ,editable:true,formatter : "number" ,hidden:true},
            { label: '入库单价', name: 'inPrice', index: 'IN_PRICE', width: 60 ,formatter : "number" ,hidden:true},
            { label: '入库金额', name: 'inSumPrice', index: 'IN_SUM_PRICE', width: 80 ,formatter : "number" ,hidden:true},
            { label: '入库重量', name: 'inWgt', index: 'IN_WGT', width: 120,formatter : "number" ,align:'right'},
            { label: '入库日期', name: 'inDate', index: 'IN_DATE', width: 120 }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
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
                        $("#jqGridMtr").jqGrid('setGridParam',{
                            postData:{'importId': orderId},
                        }).trigger("reloadGrid");
                    }
                });
                lastSelection = id;
            }

        },
        pager: "#jqGridPagerMtr",
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
            // $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});

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
        mtrExtendArr:{}
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
			var url = vm.importInfo.id == null ? "storage/import/save" : "storage/import/update";
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
		getInfo: function(id){
			$.get(baseURL + "storage/import/info/"+id, function(r){
                vm.importInfo = r.importInfo;
            });
		},
		reload: function (event) {
			vm.showList = true;
			vm.showDetail = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                postData:vm.orderInfo,
                page:page
            }).trigger("reloadGrid");
		},
		deleteMtr:function(){

		},
        save:function(){
            var importId = $("#jqGrid").jqGrid('getGridParam','selrow');
            $.ajax({
                type: "POST",
                url: baseURL + "storage/import/updateInfo",
                data: {id:importId,status:'2'},
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
        confirm:function(type){//各级确认与反确认操作
            var importId = $("#jqGrid").jqGrid('getGridParam','selrow');
            var url = "";
            var dataParam = "";
            if(type == 'storg'){
                vm.showDetail = true;
                vm.showList = false;


                $("#jqGridMtr").jqGrid('setGridParam',{
                    postData:{'importId': importId},
                }).trigger("reloadGrid");

                url = "purchase/orderdetail/storgConfirm";
                dataParam = "importId="+importId;
            }else if(type == 'finance'){
                url = "purchase/orderdetail/financeConfirm";
                dataParam = "importId="+importId;
            }else if(type == 'back'){
                url = "storage/import/updateInfo";
                $.ajax({
                    type: "POST",
                    url: baseURL + url,
                    data: {id:importId,status:'1'},
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
        print:function(typeName){
            var rowId = $('#jqGrid').jqGrid("getGridParam","selrow");
            if(!rowId){
                alert('请先选择要打印的订单！');
                return;
            }
            if(typeName == 'order'){
                window.open(baseURL + "purchase/orderinfo/printPdf?token="+token+"&orderId="+rowId);
            }else if(typeName == 'import'){
                window.open(baseURL + "purchase/orderinfo/inputPrint?token="+token+"&importId="+rowId);
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
            var id = $('#jqGrid').getGridParam("selrow");
            var rowData = $('#jqGrid').jqGrid("getRowData",id);
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
                                        postData:{'importId': id},
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
            var id = $('#jqGrid').getGridParam("selrow");
            var rowData = $('#jqGrid').jqGrid("getRowData",id);
            //原料信息
            var detailId = $('#jqGridMtr').getGridParam("selrow");
            var rowDetailData = $('#jqGridMtr').jqGrid("getRowData",detailId);

            vm.importMtrBatch.importId = id;
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
            vm.importMtrBatch.inPrice = rowDetailData.inPrice;//price
            // vm.importMtrBatch.inUnitId = rowDetailData.mtrData.miniUnit;
            vm.importMtrBatch.inUnitName = rowDetailData.inUnit;
            vm.importMtrBatch.inUnitRate = rowDetailData.inRate;
            vm.importMtrBatch.inUnit1Count = 0;//件数==入库数
            vm.importMtrBatch.wgtUnit1 = rowDetailData.orderMtrWgt;



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

        }
	}
});

vm.getFieldData();