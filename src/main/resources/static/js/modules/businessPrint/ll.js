$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'businessPrint/biSearch/DataSearchLL',
        datatype: "local",
        colModel: [
            // { label: 'id', name: 'id', index: 'id', key: true ,hidden:true},
            { label: 'mtrId', name: 'mtrId', index: 'mtrId' ,key: true ,hidden:true},
            { label: '原料编号', name: 'mtrCode', index: 'mtrCode', width: 120 },
            { label: '原料名称', name: 'mtrName', index: 'mtrName', width: 180 },
            { label: '原料类型', name: 'mtrTypeName', index: 'mtrTypeName', width: 100 },
            { label: '领料站点', name: 'takeStnName', index: 'takeStnName', width: 100 },
            {label: '配方重量', name: 'bomWgt', index: 'bomWgt', width: 80, hidden: true},
            {label: '配方单位', name: 'formulaUnit', index: 'formulaUnit', width: 80, hidden: true},
            {label: '采购重量', name: 'purchaseWgt', index: 'purchaseWgt', width: 80, hidden: true},
            {label: '采购单位', name: 'purchaseUnit', index: 'purchaseUnit', width: 80, hidden: true},
            {label: 'purchaserate', name: 'purchaseRate', index: 'purchaseRate', width: 80, hidden: true},
            {label: 'TAKE_STN_ID', name: 'TAKE_STN_ID', index: 'TAKE_STN_ID', width: 80, hidden: true},
            {label: 'WAREHOUSE_ID', name: 'WAREHOUSE_ID', index: 'WAREHOUSE_ID', width: 80, hidden: true},
            { label: '基本单位', name: 'miniUnitName', index: 'miniUnitName', width: 80 },
            {label: '基本转换率', name: 'miniRate', index: 'miniRate', width: 80},
            { label: '需求量', name: 'orderWgt', index: 'orderWgt', width: 80 },
            {label: '库存数', name: 'storeCount', index: 'storeCount', width: 80},
            {label: '件重', name: 'wgtUnit', index: 'wgtUnit', width: 80, hidden: true},
            {label: '件数', name: 'numberCase', index: 'numberCase', width: 80, hidden: true},
            { label: '所属仓库', name: 'wareHouseName', index: 'wareHouseName', width: 100 }
        ],
        viewrecords: true,
        height: "auto",
        rowNum: 9999999,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: true,
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
        postData: vm.productionOrder,
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        },
        loadComplete:function(){
            if(vm.gridAlldata == null){
                vm.gridAlldata = getGridAllData('jqGrid');
            }else if(vm.gridAlldata.length == 0){
                vm.gridAlldata = getGridAllData('jqGrid');
            }

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

    $("#searchEndDemandDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        autoclose: true,
        minView: 2,
        todayBtn: true,
        todayHighlight: true,
        weekStart: 1
        // startDate:new Date($("#searchDemandDate").val())
    });
    $('#searchDemandDate').datetimepicker().on('hide', function (ev) {
        var value = $("#searchDemandDate").val();
        vm.productionOrder.demandDate = value;

        $('#searchEndDemandDate').datetimepicker("setStartDate", new Date(value));
    });

    $('#searchEndDemandDate').datetimepicker().on('hide', function (ev) {
        var value = $("#searchEndDemandDate").val();
        vm.productionOrder.demandEndDate = value;
    });


    //数据选择getGridAllData
    $("#takeStn").bind("change", function () {
        var data = $(this).val();
        var text = $(this).find("option:selected").text();
        vm.takeStn = text;
        var warehouseId = $('#warehouse').val();
        var takeStnData;

        if(data == 0 && warehouseId == 0){
            takeStnData = vm.gridAlldata;
        }else if(data == 0 && warehouseId != 0){
            takeStnData = vm.gridAlldata.filter(function (e) { return e.WAREHOUSE_ID == warehouseId; });
        }else if(data != 0 && warehouseId == 0){
            takeStnData = vm.gridAlldata.filter(function (e) { return e.TAKE_STN_ID == data; });
        }else if(data != 0 && warehouseId != 0){
            takeStnData = vm.gridAlldata.filter(function (e) { return e.TAKE_STN_ID == data; });
            takeStnData = takeStnData.filter(function (e) { return e.WAREHOUSE_ID == warehouseId; });
        }

        vm.gridCurrentdata = takeStnData;

        $("#jqGrid").jqGrid("clearGridData");
        $("#jqGrid").jqGrid('setGridParam',{
            datatype: 'local',
            data:takeStnData
        }).trigger("reloadGrid");

    });

    $("#warehouse").bind("change", function () {
        var data = $(this).val();
        var text = $(this).find("option:selected").text();
        var takeStnId = $('#takeStn').val();
        var warehouseData;
        if(data == 0 && takeStnId == 0){
            warehouseData = vm.gridAlldata;
        }else if(data == 0 && takeStnId != 0){
            warehouseData = vm.gridAlldata.filter(function (e) { return e.TAKE_STN_ID == takeStnId; });
        }else if(data != 0 && takeStnId == 0){
            warehouseData = vm.gridAlldata.filter(function (e) { return e.WAREHOUSE_ID == data; });
        }else if(data != 0 && takeStnId != 0){
            warehouseData = vm.gridAlldata.filter(function (e) { return e.WAREHOUSE_ID == data; });
            warehouseData = warehouseData.filter(function (e) { return e.TAKE_STN_ID == takeStnId; });
        }

        vm.gridCurrentdata = warehouseData;

        $("#jqGrid").jqGrid("clearGridData");
        $("#jqGrid").jqGrid('setGridParam',{
            datatype: 'local',
            data:warehouseData
        }).trigger("reloadGrid");

    });


    //init salesOrderGrid
    $("#salesOrderGrid").jqGrid({
        url: baseURL + 'sales/productionorder/reportSearch',
        datatype: "local",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '订单编号', name: 'productionNo', index: 'PRODUCTION_NO', width: 80 },
            { label: '订单类型ID', name: 'orderTypeId', index: 'ORDER_TYPE_ID', width: 80 ,hidden:true},
            { label: '类型', name: 'orderTypeName', index: 'ORDER_TYPE_NAME', width: 60 },
            { label: '客户ID', name: 'customerId', index: 'CUSTOMER_ID', width: 80 ,hidden:true},
            { label: '客户编号', name: 'customerNo', index: 'CUSTOMER_NO', width: 60 },
            {label: '客户名称', name: 'customerName', index: 'CUSTOMER_NAME', width: 120},
            { label: '售点ID', name: 'placeId', index: 'PLACE_ID', width: 80,hidden:true },
            { label: '售点名称', name: 'placeName', index: 'PLACE_NAME', width: 60 },
            { label: '成本', name: 'prdCost', index: 'PRD_COST', width: 80,hidden:true },
            { label: '收入', name: 'prdIncome', index: 'PRD_INCOME', width: 80 ,hidden:true},
            { label: '折后收入', name: 'discountIncome', index: 'DISCOUNT_INCOME', width: 80,hidden:true },
            { label: '产品总数', name: 'prdMount', index: 'PRD_MOUNT', width: 60,hidden:true },
            { label: '成本率', name: 'costRate', index: 'COST_RATE', width: 80,hidden:true },
            { label: '折扣成本比', name: 'discountCostRate', index: 'DISCOUNT_COST_RATE', width: 80,hidden:true },
            {label: '需求日期', name: 'demandDate', index: 'DEMAND_DATE', width: 60},
            {label: '制单日期', name: 'createDate', index: 'CREATE_DATE', width: 80}
        ],
        viewrecords: true,
        height: "auto",
        width: "960",
        rowNum: 9999999,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        // autowidth: true,
        multiselect: true,
        multikey:'id',
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
            $("#salesOrderGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    $("#accordionSearch").collapse('show');
    $("#accordionScreen").collapse('hide');

});

var vm = new Vue({
    el: '#rrapp',
    data: {
        productionOrder: {
            typeId: 2,
            createDate: null,
            demandDate: null,
            takeStn: 0,
            warehouse: 0,
            orderType: 0,
            productionNo: null
        },
        selectArr:null,
        takeStnArr:null,
        warehouseArr:null,
        orderTypeArr:null,
        orderIds:null,
        gridAlldata:null,
        gridCurrentdata:null,
        takeStn:''
    },
    methods: {
        query: function () {
            $("#jqGrid").jqGrid('setGridParam',{
                datatype: 'json'
            });
            $("#salesOrderGrid").jqGrid('setGridParam',{
                datatype: 'json',
                postData:vm.productionOrder
            }).trigger("reloadGrid");
            console.log(JSON.stringify(vm.productionOrder));
            $("#myModal").modal("show");
            // vm.reload();
        },
        modalCommit:function(){
            //获取选择的订单ID
            var orderIds = getSelectedRows('salesOrderGrid');
            if(orderIds == null){
                alert('未选择任何订单');
                return;
            }
            vm.orderIds = orderIds;
            vm.gridAlldata = null;
            vm.gridCurrentdata = null;
            //根据所选订单生成进行领料数据查询
            $("#jqGrid").jqGrid('setGridParam',{
                datatype: 'json',
                postData:{params:JSON.stringify(vm.productionOrder),orderIds:orderIds.join(",")}
            }).trigger("reloadGrid");

            $("#myModal").modal("hide");
        },
        reset:function(){
            vm.productionOrder = {
                typeId: 2,
                createDate: null,
                demandDate: null,
                takeStn: 0,
                warehouse: 0,
                orderType: 0,
                productionNo: null
            };
            $("#jqGrid").jqGrid('setGridParam',{
                datatype: "local"
            }).trigger("reloadGrid");
        },
        initCommbox:function(){
            $.ajax({
                type: "POST",
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_type_info",search:"PARENT_ID=23",returnField:"ID as value,TYPE_NAME as text"},
                success: function(r){
                    vm.selectArr = r.data;
                }
            });
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
        reload:function(){
            $("#jqGrid").jqGrid('setGridParam',{
                postData:vm.productionOrder
            }).trigger("reloadGrid");
        },
        print:function(){
            if(vm.orderIds == null){
                alert("未选择任何订单！");
            }
            var printData;
            if(vm.gridCurrentdata == null){
                printData = vm.gridAlldata;
            }else{
                printData = vm.gridCurrentdata;
            }
            console.log(printData);
            // var printData = getGridAllData('jqGrid');
            // var postData = {};
            // postData.printData = printData;

            openPostWindow(baseURL + "businessPrint/biSearch/PrintLLNew?token=" + token+"&takeStn="+vm.takeStn+"&demandDate="+vm.productionOrder.demandDate,JSON.stringify(printData),'printLL');

        }
    }
});
vm.takeStnArr = vm.initTypeInfoArr('19');
vm.warehouseArr = vm.initTypeInfoArr('23');
vm.orderTypeArr = vm.initTypeInfoArr('40');
vm.initCommbox();

