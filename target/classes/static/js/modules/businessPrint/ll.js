$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'businessPrint/dataSearch/DataSearchLL',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'mtrId', index: 'mtrId', width: 50, key: true ,hidden:true},
            { label: '产品ID', name: 'prdId', index: 'PRD_ID', width: 80,hidden:true },
            { label: '产品编号', name: 'prdCode', index: 'PRD_CODE', width: 80 },
            { label: '产品类型', name: 'prdTypeName', index: 'PRD_TYPE_NAME', width: 80 },
            { label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 80 },
            { label: '原料编号', name: 'mtrCode', index: 'MTR_CODE', width: 80 },
            { label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 80 },
            { label: '原料类型', name: 'mtrTypeName', index: 'MTR_TYPE_NAME', width: 80 },
            { label: '需求数量', name: 'orderCount', index: 'ORDER_COUNT', width: 80 },
            { label: '领料单位', name: 'outUnit', index: 'OUT_UNIT', width: 80 },
            { label: '领料站点', name: 'takeStnName', index: 'OUT_UNIT', width: 80 },
            { label: '所属仓库', name: 'wareHouseName', index: 'OUT_UNIT', width: 80 },
            { label: '领料数量', name: 'outCount', index: 'OUT_COUNT', width: 80 }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
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
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
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
                    vm.productionOrder.warehouse = 0;
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



            window.open(baseURL + "businessPrint/print/ll?token="+token+"&createDate="+vm.productionOrder.createDate+"&warehouse="+vm.productionOrder.warehouse+"&takeStn="+vm.productionOrder.takeStn);
        }
    }
});
vm.takeStnArr = vm.initTypeInfoArr('48');
vm.initCommbox();
vm.productionOrder.takeStn = 0;
vm.productionOrder.takeStn = 0;
