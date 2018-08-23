$(function () {

    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        // $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    }

    $("#jqGrid").jqGrid({
        url: baseURL + 'businessPrint/biSearch/DataSearchPLFX',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'mtrId', index: 'mtrId', width: 50, key: true, hidden: true},
            {label: '产品编号', name: 'mtrprdCode', index: 'mtrprdCode', width: 80},
            {label: '品名', name: 'mtrprdName', index: 'mtrprdName', width: 100},
            {label: '生产量', name: 'modiWgt', index: 'modiWgt', width: 80},
            {label: '单位', name: 'formulaUnit', index: 'formulaUnit', width: 50},
            {label: '份数', name: 'orderCount', index: 'orderCount', width: 80},
            {label: '锅数', name: 'potCount', index: 'potCount', width: 80},
            {label: '单锅量', name: 'pdcStnName', index: 'pdcStnName', width: 80},
            {label: '不足锅量', name: 'prdSumNetWgt', index: 'prdSumNetWgt', width: 80},
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
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var rowData = $("#jqGrid").jqGrid('getRowData',row_id);
            var url = baseURL + 'businessPrint/biSearch/DataSearchDetailPLFX?prdId=' + rowData.mtrId + '&prdCount=' + rowData.orderCount;
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
                { label: 'mtrId', name: 'mtrId', index: 'mtrId', key: true,hidden:true},
                { label: '原料编号', name: 'mtrCode', index: 'mtrCode', width: 120 },
                { label: '原料名称', name: 'mtrName', index: 'mtrName', width: 180 },
                {label: '单锅量', name: 'pot', index: 'pot', width: 100},
                {label: '不足锅量', name: 'lastPot', index: 'lastPot', width: 100},
                {label: '总用量', name: 'totalWgt', index: 'totalWgt', width: 100},
                {label: '单位', name: 'formulaUnit', index: 'formulaUnit', width: 80}
            ],
            rowNum : 9999999,
            // pager : pager_id,
            height : '100%',
            rowList : [10,30,50],
            // rownumbers: true,
            // rownumWidth: 25,
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
        pdcStnArr:null,
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
                    // vm.productionOrder.warehouse = 0;
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
            console.log(vm.productionOrder);
            var orderNo = "";
            if(vm.productionOrder.productionNo !== undefined){
                orderNo = vm.productionOrder.productionNo;
            }
            window.open(baseURL + "businessPrint/biSearch/PrintPLFX?token="+token+"&createDate="+vm.productionOrder.createDate+"&orderNo="+orderNo+"&prdType="+vm.productionOrder.pdcStn);
        }
    }
});
vm.pdcStnArr = vm.initTypeInfoArr('31');
vm.initCommbox();
vm.productionOrder.pdcStn = 0;
