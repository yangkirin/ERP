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
            { label: 'id', name: 'prdId', index: 'prdId', width: 50, key: true ,hidden:true},
            { label: '产品编号', name: 'prdCode', index: 'prdCode', width: 80 },
            { label: '产品类型', name: 'prdTypeName', index: 'prdTypeName', width: 80 },
            { label: '产品名称', name: 'prdName', index: 'prdName', width: 200 },
            { label: '需求数量', name: 'orderCount', index: 'orderCount', width: 80 },
            { label: '生产站点', name: 'pdcStnName', index: 'pdcStnName', width: 80 },

            { label: '需求总净重', name: 'prdSumNetWgt', index: 'prdSumNetWgt', width: 80 },
            { label: '需求总毛重', name: 'prdSumGrossWgt', index: 'prdSumGrossWgt', width: 80 },
            { label: '需求总熟重', name: 'prdSumCookedWgt', index: 'prdSumCookedWgt', width: 80 },
            { label: '总盒重', name: 'prdSumBoxWgt', index: 'prdSumBoxWgt', width: 80 },
            { label: '总盒数', name: 'prdBoxCount', index: 'prdBoxCount', width: 80 }
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
            var url = baseURL + 'businessPrint/biSearch/DataSearchDetailPLFX?prdId='+rowData.prdId+'&prdCount='+rowData.orderCount;
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
                { label: '原料类型', name: 'mtrTypeName', index: 'mtrTypeName', width: 120 },
                { label: '单位', name: 'formulaUnitName', index: 'formulaUnitName', width: 80 },
                { label: '净重', name: 'netWgt', index: 'netWgt', width: 80 },
                { label: '毛重', name: 'grossWgt', index: 'grossWgt', width: 80 },
                { label: '熟重', name: 'cookedWgt', index: 'cookedWgt', width: 80 }
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
