$(function () {

    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        // $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    }

    $("#jqGrid").jqGrid({
        url: baseURL + 'businessPrint/biSearch/DataSearchQCLZY',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'mtrId', index: 'mtrId', width: 50, key: true, hidden: true},
            {label: '原料编号', name: 'mtrCode', index: 'mtrCode', width: 80},
            {label: '品名', name: 'key', index: 'key', width: 80},
            {label: '生产量', name: 'bomWgt', index: 'bomWgt', width: 80},
            {label: '配方单位', name: 'formulaUnit', index: 'formulaUnit', width: 80},
            // { label: '生产站点', name: 'prdStnName', index: 'prdStnName', width: 80 , hidden: true},

            // { label: '需求总净重', name: 'sumNetWgt', index: 'sumNetWgt', width: 80 },
            // { label: '需求总毛重', name: 'sumGrossWgt', index: 'sumGrossWgt', width: 80 },
            // { label: '需求总熟重', name: 'sumCookedWgt', index: 'sumCookedWgt', width: 80 },
            // { label: '需求速冷重', name: 'sumQuickCoolWgt', index: 'sumQuickCoolWgt', width: 80 },

            { label: '总锅数', name: 'sumPotCount', index: 'sumPotCount', width: 80 },
            {label: '单锅重', name: 'potWeight', index: 'potWeight', width: 80},
            { label: '尾锅重', name: 'lastPotWeight', index: 'lastPotWeight', width: 80 },
            // { label: '尾锅数', name: 'lastPotCount', index: 'lastPotCount', width: 80 }
            {label: '品名', name: 'mtrName', index: 'mtrName', width: 80},
            {label: '总用量', name: 'bomWgt', index: 'bomWgt', width: 80},
            {label: '单位', name: 'formulaUnit', index: 'formulaUnit', width: 80}
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
        subGrid: false,
        subGridRowExpanded : function(subgrid_id,row_id){
            var rowData = $("#jqGrid").jqGrid('getRowData',row_id);
            var url = baseURL + 'businessPrint/biSearch/DataSearchDetailQCLZY?prdId='+rowData.prdId+'&prdCount='+rowData.orderCount;
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
            window.open(baseURL + "businessPrint/biSearch/PrintQCLZY?token="+token+"&createDate="+vm.productionOrder.createDate+"&orderNo="+orderNo+"&pdcStn="+vm.productionOrder.pdcStn);
        }
    }
});
vm.pdcStnArr = vm.initTypeInfoArr('48');
vm.initCommbox();
vm.productionOrder.pdcStn = 0;
