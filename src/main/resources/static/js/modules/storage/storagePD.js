$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/search/pdSearch',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'id', key: true ,hidden:true},
            { label: 'mtrId', name: 'mtrId', index: 'mtrId' ,hidden:true},
            { label: '原料编号', name: 'mtrCode', index: 'mtrCode', width: 120 },
            { label: '原料名称', name: 'mtrName', index: 'mtrName', width: 180 },
            { label: '原料类型', name: 'mtrTypeName', index: 'mtrTypeName', width: 100 },
            { label: '需求数量', name: 'grossWgt', index: 'grossWgt', width: 80 },
            { label: '领料单位', name: 'miniUnitName', index: 'miniUnitName', width: 80 },
            { label: '件重', name: 'wgtUnit', index: 'wgtUnit', width: 80 },
            { label: '件数', name: 'numberCase', index: 'numberCase', width: 80 },
            { label: '所属仓库', name: 'warehouseName', index: 'warehouseName', width: 120 }
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
        }
    });



    var newDate = new Date();
    var currentDate = newDate.toJSON();

    $("#startDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        // initialDate:'2018-05-27',
        weekStart:1,
        endDate:new Date(currentDate)
    });
    $('#startDate').datetimepicker().on('hide', function (ev) {
        var value = $("#startDate").val();
        vm.pd.startDate = value;
    });

    $("#endDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        // initialDate:'2018-05-27',
        weekStart:1,
        endDate:new Date(currentDate)
    });
    $('#endDate').datetimepicker().on('hide', function (ev) {
        var value = $("#endDate").val();
        vm.pd.endDate = value;
    });
});

var vm = new Vue({
    el: '#rrapp',
    data: {
        pd: {},
        selectArr:null,
        orgArr:null,
    },
    methods: {
        query: function () {

            vm.reload();
        },
        // initCommbox:function(){
        //     $.ajax({
        //         type: "POST",
        //         url: baseURL + "common/commonUtil/getDataToCommbox",
        //         // contentType: "application/json",
        //         data: {tableName:"tb_type_info",search:"PARENT_ID=23",returnField:"ID as value,TYPE_NAME as text"},
        //         success: function(r){
        //             vm.selectArr = r.data;
        //         }
        //     });
        // },
        initTypeInfoArr:function(parentId){
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_type_info",search:"PARENT_ID in("+parentId+")",returnField:"ID as value,TYPE_NAME as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
        reload:function(){
            $("#jqGrid").jqGrid('setGridParam',{
                postData:vm.pd
            }).trigger("reloadGrid");
        },
        print:function(){
            var orderNo = "";
            console.log(vm.pd);
            // if(vm.productionOrder.productionNo !== undefined){
            //     orderNo = vm.productionOrder.productionNo;
            // }
            // window.open(baseURL + "businessPrint/biSearch/PrintLL?token="+token+"&createDate="+vm.productionOrder.createDate+"&orderNo="+orderNo+"&takeStn="+vm.productionOrder.takeStn);
        }
    }
});
vm.orgArr = vm.initTypeInfoArr('23,48');
// vm.initCommbox();
