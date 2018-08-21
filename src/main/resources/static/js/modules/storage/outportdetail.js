$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    };

    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/outportdetail/outportInfoList',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '领料单号', name: 'outporrtNo', index: 'OUTPORRT_NO', width: 100},
            { label: '订单编号', name: 'productionNo', index: 'PRODUCTION_NO', width: 100 },
            {label: '需求日期', name: 'demandDate', index: 'demandDate', width: 60},
            { label: '订单ID', name: 'orderId', index: 'ORDER_ID',hidden:true},
            { label: '订单类型名称', name: 'orderTypeName', index: 'ORDER_TYPE_NAME', width: 80 },
            { label: '客户编号', name: 'customerNo', index: 'CUSTOMER_NO', width: 80 },
            { label: '客户名称', name: 'customerName', index: 'CUSTOMER_NAME', width: 80 },
            { label: '售点名称', name: 'placeName', index: 'PLACE_NAME', width: 80 },
            { label: '备注', name: 'remark', index: 'REMARK', width: 80 },
            { label: '状态', name: 'status', index: 'STATUS', width: 50 ,formatter: function(value, options, row){
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
            }},
            { label: '创建者', name: 'createUser', index: 'CREATE_USER', width: 80 ,hidden:true},
            { label: '创建日期', name: 'createDate', index: 'CREATE_DATE', width: 80 ,hidden:true},

            { label: '确认', name: 'operConfirm', index: 'operConfirm', width: 50},
            { label: '编辑领料', name: 'operEditMtr', index: 'operEditMtr', width: 60},
            { label: '打印', name: 'operPrint', index: 'operPrint', width: 50},
            { label: '反确认', name: 'operBack', index: 'operBack', width: 50},
            { label: '确认出库', name: 'operConfirmOut', index: 'operConfirmOut', width: 50},
            { label: '完结', name: 'operClose', index: 'operClose', width: 50},
            { label: '删除', name: 'operDel', index: 'operDel', width: 50}
        ],
        viewrecords: true,
        height: "auto",
        rowNum: 9999999,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: false,
        // scroll:true,
        // pager: "#jqGridPager",
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


            var ids = $("#jqGrid").jqGrid('getDataIDs');
            for ( var i = 0; i < ids.length; i++) {
                var cl = ids[i];
                var row = $("#jqGrid").jqGrid("getRowData",cl);

                var del = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"0\")'>删除</button>";
                var confirmStr = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"1\")'>确认</button>";
                var printStr = "<button type='button' class='btn btn-info btn-xs' onclick='oper("+row.id+",\"2\")'>打印</button>";
                var back = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"3\")'>反确认</button>";
                var over = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"4\")'>完结</button>";
                var configMtr = "<button type='button' class='btn btn-primary btn-xs' onclick='configMtr("+row.id+")'>编辑领料</button>";
                var confirmOut = "<button type='button' class='btn btn-primary btn-xs' onclick='oper("+row.id+",\"5\")'>出库确认</button>";

                var status = row.status;
                if(status == '0'){
                    operatorStr = "";
                }else if(status == '1'){
                    $("#jqGrid").jqGrid('setRowData', ids[i],{
                        operDel : del,
                        operConfirm:confirmStr
                        // operEditMtr:configMtr
                    });
                }else if(status == '2'){
                    $("#jqGrid").jqGrid('setRowData', ids[i],{
                        operPrint : printStr,
                        operEditMtr:configMtr,
                        operConfirmOut:confirmOut,
                        operBack:back
                    });
                }else if(status == '3'){
                    $("#jqGrid").jqGrid('setRowData', ids[i],{
                        operPrint : printStr,
                        operClose:over
                    });
                }else if(status == '4'){
                    $("#jqGrid").jqGrid('setRowData', ids[i],{
                        operPrint : printStr
                    });
                }
            }
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var rowData = $("#jqGrid").jqGrid('getRowData',row_id);
            var orderId = rowData.orderId;
            if(rowData.orderId == null || rowData.orderId == undefined || rowData.orderId == ''){
                orderId = 0;
            }
            var url = baseURL + 'storage/outportdetail/getOrderMtrList?orderId='+orderId+'&outportId='+rowData.id;
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
                { label: '原料ID', name: 'mtrId', index: 'MTR_ID', key: true  ,hidden:true},
                { label: '原料编号', name: 'mtrNo', index: 'MTR_NO', width: 100 },
                { label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 200 },
                { label: '原料类型', name: 'mtrTypeName', index: 'MTR_TYPE_NAME', width: 80 },
                { label: '需求数量', name: 'orderCount', index: 'ORDER_COUNT', width: 80 },
                { label: '单位', name: 'outUnit', index: 'OUT_UNIT', width: 80 },
                { label: '已领数量', name: 'outCount', index: 'OUT_COUNT', width: 80 }
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
        url: baseURL + 'storage/outportdetail/getOrderMtrList',
        datatype: "json",
        colModel: [
            { label: '原料ID', name: 'mtrId', index: 'MTR_ID', key: true  ,hidden:true},
            { label: '出库明细ID', name: 'id', index: 'id' ,hidden:true},
            { label: '原料编号', name: 'mtrNo', index: 'MTR_NO', width: 120 },
            { label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 200 },
            { label: '原料类型', name: 'mtrTypeName', index: 'MTR_TYPE_NAME', width: 150 },
            { label: '需求数量', name: 'orderCount', index: 'ORDER_COUNT', width: 80 },
            { label: '单位', name: 'outUnit', index: 'OUT_UNIT', width: 80 },
            { label: '已领数量', name: 'outCount', index: 'OUT_COUNT', width: 80 }
        ],
        viewrecords: true,
        height: "auto",
        // height: 385,
        rowNum: 9999999,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: false,
        // scroll:true,
        // pager: "#jqGridPagerMtr",
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
            $("#jqGridMtr").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var url = baseURL + 'storage/outportdetail/getOutportDetailList?orderId='+vm.outportInfo.orderId+'&mtrId='+row_id+'&outportId='+vm.outportInfo.id;
            createDetailSubGrid(subgrid_id,row_id,url);
        }
    });

    function createDetailSubGrid(subgrid_id,row_id,url){
        var subgrid_table_id, pager_id;
        subgrid_table_id = subgrid_id + "_t";
        pager_id = "p_" + subgrid_table_id;
        $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
        jQuery("#" + subgrid_table_id).jqGrid({
            url : url,
            datatype : "json",
            colModel : [
                {label: '入库明细ID', name: 'id', index: 'ID', key: true,hidden:true},
                {label: '原料ID', name: 'mtrId', index: 'MTR_ID',hidden:true, width: 100},
                {label: '批次号', name: 'batchNo', index: 'BATCH_NO', width: 100},
                {label: '单位', name: 'mtrUnit', index: 'MTR_UNIT', width: 50},
                {label: '转换率', name: 'mtrRate', index: 'MTR_RATE', width: 80,formatter : "number"},
                {label: '单价', name: 'price', index: 'PRICE', width: 50,editable:false,formatter : "number"},
                {label: '出库数量', name: 'outCount', index: 'OUT_COUNT', width: 80,editable:true,formatter : "number"},
                {label: '出库重量', name: 'outWgt', index: 'OUT_WGT', width: 80,formatter : "number",hidden:true},
                {label: '出库金额', name: 'outPrice', index: 'OUT_PRICE', width: 80,formatter : "number"},
                {label: '出库日期', name: 'outDate', index: 'OUT_DATE', width: 80}
            ],
            rowNum : 9999999,
            // pager : pager_id,
            height : 'auto',
            width:'500',
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
        });
    }

    $("#jqGridOrder").jqGrid({
        url: baseURL + 'sales/productionorder/list',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '订单编号', name: 'productionNo', index: 'PRODUCTION_NO', width: 120 },
            { label: '类型', name: 'orderTypeName', index: 'ORDER_TYPE_NAME', width: 50 },
            { label: '客户编号', name: 'customerNo', index: 'CUSTOMER_NO', width: 80 },
            { label: '客户名称', name: 'customerName', index: 'CUSTOMER_NAME', width: 120 },
            { label: '售点名称', name: 'placeName', index: 'PLACE_NAME', width: 120 },
            { label: '产品总数', name: 'prdMount', index: 'PRD_MOUNT', width: 60,hidden:false },
            { label: '备注', name: 'remark', index: 'REMARK', width: 120 }
        ],
        viewrecords: true,
        height: 'auto',
        rowNum: 9999999,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        width:'700',
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
            $("#jqGridOrder").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });


    var newDate = new Date();
    var currentDate = newDate.toJSON();

    $("#searchCreateDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1
        // startDate:new Date(currentDate)
    });
    $('#searchCreateDate').datetimepicker().on('hide', function (ev) {
        var value = $("#searchCreateDate").val();
        vm.productionOrder.createDate = value;
    });
    $("#searchDemandDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        autoclose: true,
        minView: 2,
        todayBtn: true,
        todayHighlight: true,
        weekStart: 1
        // startDate:new Date(currentDate)
    });
    $('#searchDemandDate').datetimepicker().on('hide', function (ev) {
        var value = $("#searchDemandDate").val();
        vm.productionOrder.demandDate = value;
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
        vm.addOrder.demandDate = value;
    });

    $('#stroageExport').on("select2:select",function(){
        var data = $(this).val();
        vm.exportParam.storage = data;
    });

    $('#outUnitExport').on("select2:select",function(){
        var data = $(this).val();
        vm.exportParam.outUnit = data;
    });

    $('#orderTypeExport').on("select2:select",function(){
        var data = $(this).val();
        vm.exportParam.orderType = data;
    });

    $("#llStartDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1
        // endDate:new Date(currentDate)
    });

    $('#llStartDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.exportParam.llStartDate = newDate;
    });

    $("#llEndDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1
        // endDate:new Date(currentDate)
    });

    $('#llEndDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.exportParam.llEndDate = newDate;
    });

    $("#demandStartDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1
        // endDate:new Date(currentDate)
    });

    $('#demandStartDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.exportParam.demandStartDate = newDate;
    });

    $("#demandEndDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1
        // endDate:new Date(currentDate)
    });

    $('#demandEndDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.exportParam.demandEndDate = newDate;
    });

    $('#isDH').change(function(){
        var data = $(this).val();
        if(data == '0'){
            $('#customerName').removeAttr('disabled');
            $('#orderTypeAdd').removeAttr('disabled');
            $('#placeAdd').removeAttr('disabled');
        }else{
            $('#customerName').attr('disabled','disabled');
            $('#orderTypeAdd').attr('disabled','disabled');
            $('#placeAdd').attr('disabled','disabled');

            $('#customerName').val("");
            $('#orderTypeAdd').val("");
            $('#placeAdd').val("");

            vm.addOrder.customerId = '';
            vm.addOrder.orderTypeId = '';
            vm.addOrder.placeId = '';
        }
    });

    $('#customerName').change(function(){
        var data = $(this).val();
        vm.addOrder.customerId = data;
    });

    $('#orderTypeAdd').change(function(){
        var data = $(this).val();
        vm.addOrder.orderTypeId = data;
    });

    $('#placeAdd').change(function(){
        var data = $(this).val();
        vm.addOrder.placeId = data;
    });
});

/**
 * Grid操作列事件
 * @param rowid 所选择的操作行数据ID
 * @param type 操作类型：0-撤销，1-确认，2-打印，3-反确认，4-已完结，5-确认出库
 */
function oper(rowId,type){
    //根据所选数据的状态来进行业务判断，5种状态说明：0-撤销，1-待确认，2-已确认，3-已出库，4-已完结
    var rowData = $("#jqGrid").jqGrid('getRowData',rowId);
    var msg = '所选单据状态不满足此操作，请选择合适的单据！';
    if(type == "0"){
        $.ajax({
            type:"POST",
            async:false,
            url: baseURL + "storage/outportdetail/deleteInfo/"+rowId,
            success: function(r){
                msg = '操作成功';
                vm.reload();
            }
        });
    }else if(type == "1"){
        $.ajax({
            type:"POST",
            async:false,
            url: baseURL + "storage/outportdetail/updateOutportInfoStatus",
            data:{outportId:rowId,status:"2"},
            success: function(r){
                msg = '操作成功';
                alert(msg);
                vm.reload();
            }
        });
    }else if(type == "2"){
        msg="领料单打印。";
        alert(msg);
    }else if(type == "3"){
        alert("反确认");
    }else if(type == "4"){
        alert("完结");
        $.ajax({
            type:"POST",
            async:false,
            url: baseURL + "storage/outportdetail/updateOutportInfoStatus",
            data:{outportId:rowId,status:"4"},
            success: function(r){
                msg = '操作成功';
                alert(msg);
                vm.reload();
            }
        });
    }else if(type == "5"){
        alert("出库确认");
        confirm("确认保存后无法进行修改，是否继续？",function(){
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "storage/outportdetail/updateOutportInfoStatus",
                data:{outportId:rowId,status:"3"},
                success: function(r){
                    msg = '操作成功';
                    alert(msg);
                    vm.reload();
                }
            });
        });
    }
}

function configMtr(rowId){
    vm.outportInfo={};
    var rowData = $("#jqGrid").jqGrid("getRowData",rowId);
    if(rowData.orderId){
        //根据客户订单Id查询出领料单信息
        $.ajax({
            type:"POST",
            async:false,
            url: baseURL + "storage/outportdetail/outportInfo/"+rowData.orderId,
            success: function(r){
                vm.outportInfo = r.outportInfo;
            }
        });

        vm.showList=false;
        vm.showDetail=true;
        vm.addDetailMtr=false;
        vm.editDetailMtr=true;
        //查询客户订单的原料列表
        $("#jqGridMtr").jqGrid('setGridParam',{
            postData:{'orderId': rowData.orderId}
        }).trigger("reloadGrid");
    }else{

        $.ajax({
            type:"POST",
            async:false,
            url: baseURL + "storage/outportdetail/outportInfoByOutId/"+rowId,
            success: function(r){
                vm.outportInfo = r.outportInfo;
            }
        });
        // if(vm.outportInfo.status == '2'){
        //     alert('领料单已确认，无法进行领料编辑！');
        //     return;
        // }

        vm.showList=false;
        vm.showDetail=true;
        vm.addDetailMtr=true;
        vm.editDetailMtr=false;
        //查询客户订单的原料列表
        $("#jqGridMtr").jqGrid('setGridParam',{
            postData:{'orderId': 0,'outportId':rowData.id}
        }).trigger("reloadGrid");
    }
}

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
        showDetail: false,
        editDetailMtr: false,
        addDetailMtr: false,
		title: null,
        productionOrder:{},
        outportInfo:{},
		outportDetail: {},
        selectData:{},
        customerArr:{},
        batchArr:{},
        mtrdata:{},
        detail:{},
        mtrInfo:{},
        exportParam:{},
        storageArr:{},
        outUnitArr:{},
        placeArr:{},
        orderTypeArr:{},
        addOrder:{}
	},
	methods: {
        search: function () {
            console.log(vm.orderInfo);
            var postData = {
                createDate: vm.productionOrder.createDate,
                customerId: vm.productionOrder.customerId == 0 ? null : vm.productionOrder.customerId,
                productionNo: vm.productionOrder.productionNo,
                demandDate: vm.productionOrder.demandDate
            };
            var page = $("#jqGrid").jqGrid('getGridParam', 'page');
            $("#jqGrid").jqGrid('setGridParam', {
                postData: postData,
                page: page
            }).trigger("reloadGrid");
            // vm.reload();
        },
        createNewNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/createBillNo",
                data:"billType=2",
                success: function(r){
                    no = r.newBillNo;
                }
            });
            return no;
        },
        createOutprotInfo:function(rowId){//领料创建出库单
            //CreateNewBillNo
            var newBillNo = vm.createNewNo();
            $.ajax({
                type: "POST",
                url: baseURL + "storage/outportdetail/createOutportInfo",
                data: {orderId:rowId,billNo:newBillNo},
                success: function(r){
                    if(r.code === 0){
                        alert('操作成功', function(index){
                            vm.outportInfo = r.outportInfo;
                            vm.reload();
                        });
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        getOutportInfo:function(orderId){
            $.get(baseURL + "storage/outportdetail/outportInfo/"+orderId, function(r){
                vm.outportInfo = r.outportInfo;
            });
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
            if(type == 'add'){
                console.log(vm.outportInfo);
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

                        vm.outportDetail.outportId = vm.outportInfo.id;
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
                                            postData:{'orderId': vm.outportInfo.orderId},
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
                    vm.mtrInfo = {};
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
            vm.showDetail = false;
            vm.showList = false;
            //Show AddOutport Form

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
            var mtrId = rowData.mtrId;
            if(!mtrId){
                mtrId = vm.mtrInfo.id;
            }
            if(vm.selectData.batchNo != 0){
                $.ajax({
                    type: "POST",
                    async:false,
                    url: baseURL + "storage/importmtrbatch/getCurrentCount",
                    // contentType: "application/json",
                    data: {mtrId:mtrId,batchNo:vm.selectData.batchNo},
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
            }

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
            // var realCount = Number(Number(Number(inputCount)/Number(vm.mtrInfo.miniRate),2)/Number(vm.mtrInfo.purchaseRate),2);
            var realCount = inputCount;
            vm.selectData.realCount = realCount;
            var residueCount = Number(vm.selectData.inventory)-realCount;
            vm.selectData.residueCount = residueCount.toFixed(2);
            $('#realCount').val(realCount);
            $('#residueCount').val(residueCount.toFixed(2));

        },
        clean:function(){
            vm.productionOrder={
                customerId:0,
                productionNo:null,
                createDate: null,
                demandDate: null
            };
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
        // getFieldData:function(){
        //     var query = $('#searchMtrName').val();
        //     $.ajax({
        //         type:"POST",
        //         url: baseURL + "common/commonUtil/getTableData",
        //         data:"tableName=MTR_DATA&fieldName=MTR_NAME:MTR_PY&searchWord="+query,
        //         success: function(r){
        //             if(r.data){
        //                 var resultList = r.data.map(function (item) {
        //                     var aItem = {py: item.MTR_PY, name: item.MTR_NAME};
        //                     return JSON.stringify(aItem);
        //                 });
        //                 dataSource = resultList;
        //                 $('#searchName').typeahead({
        //                     source:dataSource,
        //                     highlighter: function (obj) {
        //                         var item = JSON.parse(obj);
        //                         var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
        //                         return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
        //                             return '<strong>' + match + '</strong>'
        //                         });
        //                     },
        //                     updater: function (obj) {
        //                         var item = JSON.parse(obj);
        //                         vm.q.prdName = item.name;
        //                         return item.name;
        //                     }
        //                 });
        //             }
        //         }
        //     });
        // },
        outData:function(){
            $("#myModal").modal("show");
        },
        modalCommit:function(){
            console.log(vm.exportParam);

            window.open(baseURL + "storage/outportdetail/export?token="+token
                +"&llStartDate="+vm.exportParam.llStartDate+"&llEndDate="+vm.exportParam.llEndDate
                +"&demandStartDate="+vm.exportParam.demandStartDate+"&demandEndDate="+vm.exportParam.demandEndDate
                +"&storage="+vm.exportParam.storage+"&outUnit="+vm.exportParam.outUnit
                +"&mtrName="+vm.exportParam.mtrName+"&orderType="+vm.exportParam.orderType);
        },
        addOutport:function(){
            $("#newOutPort").modal("show");
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/createBillNo",
                data:"billType=2",
                success: function(r){
                    vm.addOrder.outportNo = r.newBillNo;
                    $('#addOutportNo').val(r.newBillNo);
                }
            });
        },
        addModalCommit:function(){
            //save2
            $.ajax({
                type: "POST",
                url: baseURL + "storage/outportdetail/save2?isDH=" + vm.addOrder.isDH + "&outportNo=" + vm.addOrder.outportNo + "&customerId=" + vm.addOrder.customerId + "&orderTypeId=" + vm.addOrder.orderTypeId + "&placeId=" + vm.addOrder.placeId + "&demandDate=" + vm.addOrder.demandDate,
                contentType: "application/json",
                data: JSON.stringify(vm.addOrder),
                success: function(r){
                    if(r.code === 0){
                        alert('操作成功', function(index){
                            $("#newOutPort").modal("hide");
                            vm.addOrder={};
                            vm.reload();
                        });
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        orderOutport:function(){
            $("#orderOutportModal").modal("show");

            $('#jqGridOrder').jqGrid('setGridParam',{
                postData:{'type': 'allow_outport'}
            }).trigger("reloadGrid");
        },
        createOutport:function(){
            var id = $("#jqGridOrder").jqGrid('getGridParam','selrow');//orderId
            vm.createOutprotInfo(id);
            $("#jqGrid").jqGrid('setGridParam',{
                // page:page
            }).trigger("reloadGrid");

            $('#orderOutportModal').modal('hide')
        },
        getSelectDataMtr:function(){
            var outprotId = $("#jqGrid").jqGrid('getGridParam','selrow');//outprotId
            var query = $('#mtrName').val();
            $.ajax({
                type:"POST",
                url: baseURL + "common/commonUtil/getTableData",
                data:"tableName=MTR_DATA&fieldName=MTR_NAME:MTR_PY&searchWord="+query,
                success: function(r){
                    var resultList = r.data.map(function (item) {
                        var aItem = {id:item.id,py: item.MTR_PY, name: item.MTR_NAME};
                        return JSON.stringify(aItem);
                    });
                    dataSource = resultList;
                    $('#mtrName').typeahead({
                        source:dataSource,
                        highlighter: function (obj) {
                            var item = JSON.parse(obj);
                            var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
                            return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                                return '<strong>' + match + '</strong>'
                            });
                        },
                        updater: function (obj) {
                            var item = JSON.parse(obj);
                            vm.mtrInfo.mtrId = item.id;
                            vm.mtrInfo.mtrName = item.name;
                            return item.name;
                        },
                        afterSelect:function(obj){
                            var mtrId = vm.mtrInfo.mtrId;
                            $.ajax({
                                type: "POST",
                                url: baseURL + "baseData/mtrdata/info/"+mtrId,
                                async:false,
                                success: function (r) {
                                    vm.mtrInfo = r.mtrData;
                                    console.log(vm.mtrInfo);
                                }
                            });

                            $.ajax({
                                type: "POST",
                                async:false,
                                url: baseURL + "common/commonUtil/getDataToCommbox",
                                // contentType: "application/json",
                                data: {tableName:"tb_import_mtr_batch",search:"MTR_ID="+mtrId,returnField:"BATCH_NO as value,BATCH_NO as text"},
                                success: function(r){
                                    vm.batchArr =  r.data;
                                }
                            });
                        }
                    });
                }
            });
        },
        newAddMtr:function(){
            $('#mtrName').removeAttr("readonly");
            vm.getSelectDataMtr();

            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: vm.title,
                area: ['600px', '480px'],
                shadeClose: false,
                content: jQuery("#addLayer"),
                btn: ['提交', '取消'],
                btn1: function (event) {
                    vm.outportDetail.outportId = vm.outportInfo.id;
                    vm.outportDetail.mtrId = vm.mtrInfo.id;
                    vm.outportDetail.mtrNo = vm.mtrInfo.mtrCode;
                    vm.outportDetail.mtrName = vm.mtrInfo.mtrName;
                    vm.outportDetail.mtrTypeName = vm.mtrInfo.typeName;
                    vm.outportDetail.outUnit = vm.mtrInfo.miniUnitName;

                    vm.outportDetail.orderCount = vm.selectData.outAmount;
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
                                        postData:{'outportId': vm.outportInfo.id}
                                    }).trigger("reloadGrid");
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                    layer.close(num);
                    vm.outportDetail = {};
                    vm.mtrInfo = {};
                    vm.selectData = {};
                    vm.selectArr = {};
                },
                btn2: function (event) {
                    vm.outportDetail = {};
                    vm.mtrInfo = {};
                    layer.close(num);
                }
            });
        },
        newEditMtr:function(){

        },
        newDeleteMtr:function(){
            var id = $("#jqGridMtr").jqGrid('getGridParam','selrow');//outprotId
            if(!id){
                alert('请选择要删除的信息！');
                return;
            }
            var rowData = $("#jqGridMtr").jqGrid("getRowData",id);//计划单信息
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "storage/outportdetail/deleteDetail/"+rowData.id,
                contentType: "application/json",
                // data: JSON.stringify(vm.outportDetail),
                success: function(r){
                    if(r.code == 0){
                        alert('操作成功', function(index){
                            $("#jqGridMtr").jqGrid('setGridParam',{
                                datatype:'json',
                                postData:{'outportId': vm.outportInfo.id}
                            }).trigger("reloadGrid");
                        });
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        newSaveOrUpdate:function(){

        }
	}
});
vm.customerArr = vm.initCsutomerInfoArr();
vm.storageArr = vm.initTypeInfoArr('23');
vm.outUnitArr = vm.initTypeInfoArr('10');
vm.orderTypeArr = vm.initTypeInfoArr('40');
vm.placeArr = vm.initTypeInfoArr('82');