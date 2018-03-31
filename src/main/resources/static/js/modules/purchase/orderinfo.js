$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'purchase/orderinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '订单编号', name: 'orderNo', index: 'ORDER_NO', width: 80 },
            { label: '计划单号', name: 'procurementNo', index: 'PROCUREMENT_NO', width: 80,hidden:true },
			{ label: '供应商ID', name: 'supplierId', index: 'SUPPLIER_ID', width: 80 ,hidden:true},
			{ label: '供应商', name: 'supplierName', index: 'SUPPLIER_NAME', width: 80 },
            { label: '订购总额', name: 'orderSumPrice', index: 'ORDER_SUM_PRICE', width: 80 ,formatter : "number"},
            { label: '入库总额', name: 'inSumPrice', index: 'IN_SUM_PRICE', width: 80 ,formatter : "number"},
			{ label: '计划ID', name: 'procurementId', index: 'PROCUREMENT_ID', width: 80,hidden:true },
			{ label: '期望到货日期', name: 'exceptionDate', index: 'EXCEPTION_DATE', width: 80 },
			{ label: '状态', name: 'status', index: 'STATUS', width: 80 ,formatter: function(value, options, row){
			    var msg = "";
			    if(value == 0){
                    msg = '<span class="label label-danger">已禁用</span>';
                }else if(value == 1){
                    msg = '<span class="label label-info">待确认</span>';
                }else if(value == 2){
                    msg = '<span class="label label-primary">已确认</span>';
                }else{
                    msg = '<span class="label label-default">已结转</span>';
                }
                return msg;
            },unformat:function(value, options, row){
                if($.trim(value).trim()=="已禁用"){
                    return "0";
                }else if($.trim(value)=="待确认"){
                    return "1";
                }else if($.trim(value)=="已确认"){
                    return "2";
                }else{
                    return "3";
                }
            }}
            // { label: '操作', name: 'oper', index: 'SPEC', width: 150,formatter:function(value, options, row){
            //     var show1 = row.status == 1 ? "" : "disabled=true";
            //     var show2 = row.status == 2 ? "" : "disabled=true";
            //     return "<button type='button' class='btn btn-primary btn-xs' onclick='showDetail("+row.id+")'>详&nbsp;&nbsp;情</button>&nbsp;&nbsp;"
            //         // "<button type='button' class='btn btn-primary btn-xs' "+show1+" onclick='editStatus("+row.id+",2)'>仓库确认</button>&nbsp;&nbsp;" +
            //         // "<button type='button' class='btn btn-primary btn-xs' "+show2+" onclick='editStatus("+row.id+",3)'>财务确认</button>&nbsp;&nbsp;";
            // }}
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
        onSelectRow:function(id){
            var ids = $('#jqGrid').getGridParam("selarrrow");
            if(ids != null && ids.length > 1){
                $('#print_order_btn').attr("disabled",true);
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
            }else{
                
                $('#print_order_btn').attr("disabled",false);
            }


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
                    {label: '实际入库日期', name: 'inDate', index: 'IN_DATE', width: 80}
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
            {label: '实际入库日期', name: 'inDate', index: 'IN_DATE', width: 80}
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
                        console.log(data);
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
            vm.orderDetail.id = id;
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            // $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});

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
        weekStart:1,
        startDate:new Date(currentDate)
    });

    $('.form_datetime').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.orderInfo.exceptionDate = newDate;
            // if (ev.date.valueOf() < date-start-display.valueOf()){
            //
            // }
        });
});

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
                url: baseURL + "common/commonUtil/getTableNewNo",
                data:"tableName=TB_ORDER_INFO&noField=ORDER_NO",
                success: function(r){
                    no = r.newNo;
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
			vm.title = "新增";
            vm.orderInfo = {
                status:"1",
                orderNo:vm.createNewNo()
            };
            $('#jqGridMtr').jqGrid("clearGridData");

            $('#addMtr_btn').attr("disabled",true);
            $('#editMtr_btn').attr("disabled",true);
            $('#delMtr_btn').attr("disabled",true);
            $('#saveMtr_btn').attr("disabled",true);

            $('#confirm_storg').hide();
            $('#confirm_finance').hide();
            $('#confirm_back').hide();

            vm.getFieldData();
		},
		update: function (event) {
			var id = $('#jqGrid').getGridParam("selrow");
            var ids = $('#jqGrid').getGridParam("selarrrow");

            if(ids != null && ids.length > 1){
                alert('不能选择多条记录进行修改！');
                return ;
            }else if(id == null){
			    alert('请选择要修改的数据！');
				return ;
			}
			var rowData = $('#jqGrid').jqGrid("getRowData",id);

			vm.showList = false;
			vm.showForm = true;
            vm.title = "修改";

            if(rowData.status == '0'){
                $('#confirm_storg').hide();
                $('#confirm_finance').hide();
            }else if(rowData.status == '1'){
                $('#confirm_storg').show();
                $('#confirm_finance').hide();
            }else if(rowData.status == '2'){
                $('#confirm_storg').hide();
                $('#confirm_finance').show();
            }else{
                $('#confirm_storg').hide();
                $('#confirm_finance').hide();
            }

            vm.getInfo(id);
            vm.reloadMtr();
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
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
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

                console.log(detailRowData);

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
                            var page = $("#jqGridMtr").jqGrid('getGridParam','page');
                            $("#jqGridMtr").jqGrid('setGridParam',{
                                postData:{'orderId': orderId},
                            }).trigger("reloadGrid");
                            alert('操作成功！');
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
            // console.log(removeData);
            // console.log(gridData[delIndex]);

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
                            vm.orderInfo = r.orderInfo;
                            alert('操作成功！');
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
                    // console.log(vm.addRow);
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

            vm.addRow=[];
            vm.orderInfo={};
            vm.orderDetail={};
            vm.reload();

        },
        reloadMtr:function(){
            var rowId = $('#jqGrid').jqGrid("getGridParam","selrow");
            if(!rowId){
                return;
            }
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
                            // console.log(gridData);
                            var newAmonut = vm.orderDetail.amount;
                            var oldAmonut;
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
                            // alert(sumAmonut);
                            vm.orderDetail.amount = Number(Number(newAmonut)+Number(oldAmonut)).toFixed(2).toString();
                            console.log(vm.orderDetail);
                            console.log(url);
                        }
                        // return;

                        vm.orderDetail.orderId=id;
                        $.ajax({
                            type: "POST",
                            contentType: "application/json",
                            url: baseURL + url,
                            data: JSON.stringify(vm.orderDetail),
                            success: function (r) {
                                if(r.code === 0){
                                    vm.reloadMtr();
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
        print:function(typeName){
            var rowId = $('#jqGrid').jqGrid("getGridParam","selrow");
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
        confirm:function(type){//各级确认与反确认操作
            var orderId = $("#jqGrid").jqGrid('getGridParam','selrow');
            var url = "";
            var dataParam = "";
            if(type == 'storg'){
                url = "purchase/orderdetail/storgConfirm";
                dataParam = "orderId="+orderId;
            }else if(type == 'finance'){
                url = "purchase/orderdetail/financeConfirm";
                dataParam = "orderId="+orderId;
            }else if(type == 'back'){
                url = "purchase/orderdetail/backConfirm";
                dataParam = "orderId="+orderId;
            }else if(type == 'order'){
                url = "purchase/orderdetail/orderConfirm";
                dataParam = "orderId="+orderId;
            }
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
	}
});