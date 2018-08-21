$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'businessPrint/biSearch/DataSearchLL',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'id', key: true ,hidden:true},
            { label: 'mtrId', name: 'mtrId', index: 'mtrId' ,hidden:true},
            { label: '原料编号', name: 'mtrCode', index: 'mtrCode', width: 120 },
            { label: '原料名称', name: 'mtrName', index: 'mtrName', width: 180 },
            { label: '原料类型', name: 'mtrTypeName', index: 'mtrTypeName', width: 100 },
            {label: '配方重量', name: 'bomWgt', index: 'bomWgt', width: 80, hidden: true},
            {label: '配方单位', name: 'formulaUnit', index: 'formulaUnit', width: 80, hidden: true},
            {label: '采购重量', name: 'purchaseWgt', index: 'purchaseWgt', width: 80},
            {label: '采购单位', name: 'purchaseUnit', index: 'purchaseUnit', width: 80},
            {label: 'purchaserate', name: 'purchaseRate', index: 'purchaseRate', width: 80, hidden: true},
            {label: 'minirate', name: 'miniRate', index: 'miniRate', width: 80, hidden: true},
            { label: '需求数量', name: 'orderWgt', index: 'orderWgt', width: 80 },
            { label: '领料单位', name: 'outUnit', index: 'outUnit', width: 80 },
            {label: '库存数', name: 'storeCount', index: 'storeCount', width: 80},
            {label: '件重', name: 'wgtUnit', index: 'wgtUnit', width: 80, hidden: true},
            {label: '件数', name: 'numberCase', index: 'numberCase', width: 80, hidden: true},
            { label: '所属仓库', name: 'wareHouseName', index: 'wareHouseName', width: 120 }
        ],
        viewrecords: true,
        height: "auto",
        rowNum: 9999999,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: false,
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

});

var vm = new Vue({
    el: '#rrapp',
    data: {
        productionOrder: {},
        selectArr:null,
        takeStnArr:null,
    },
    methods: {
        query: function () {
            console.log(JSON.stringify(vm.productionOrder));
            vm.reload();
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
            var orderNo = "";
            if(vm.productionOrder.productionNo !== undefined){
                orderNo = vm.productionOrder.productionNo;
            }
            console.log(vm.productionOrder);
            window.open(baseURL + "businessPrint/biSearch/PrintLL?token="+token+"&createDate="+vm.productionOrder.createDate+"&orderNo="+orderNo+"&takeStn="+vm.productionOrder.takeStn);
        }
    }
});
vm.takeStnArr = vm.initTypeInfoArr('19');
vm.initCommbox();
vm.productionOrder.takeStn = 0;
