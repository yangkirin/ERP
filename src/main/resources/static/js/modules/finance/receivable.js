$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        // $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    };
    $("#jqGrid").jqGrid({
        url: baseURL + 'finance/search/receivableSumInfo',
        datatype: "json",
        colModel: [
            { label: 'CUSTOMER_ID', name: 'CUSTOMER_ID', index: 'CUSTOMER_ID', key: true ,hidden:true},
            { label: '客户名称', name: 'CUSTOMER_NAME', index: 'CUSTOMER_NAME', width: 180 },
            { label: '客户编号', name: 'CUSTOMER_NO', index: 'CUSTOMER_NO', width: 120 },
            { label: '订单总金额', name: 'ORDER_MONEY', index: 'ORDER_MONEY', width: 100 },
            { label: '折扣总金额', name: 'DISCOUNT_MONEY', index: 'DISCOUNT_MONEY', width: 80 },
            { label: '利润总金额', name: 'REVENUE_MONEY', index: 'REVENUE_MONEY', width: 80 }
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
            // var rowData = $("#jqGrid").jqGrid("getRowData",row_id);

            var startDate = vm.finance.startDate ===undefined ? null : vm.finance.startDate;
            var endDate = vm.finance.endDate ===undefined ? null : vm.finance.endDate;
            var placeId = vm.finance.placeId ===undefined ? null : vm.finance.placeId;
            var orderTypeId = vm.finance.orderTypeId ===undefined ? null : vm.finance.orderTypeId;

            var param = "customerId="+row_id;

            if(typeof(vm.finance.startDate) != 'undefined'){
                param += "&startDate="+startDate;
            }
            if(typeof(vm.finance.endDate) != 'undefined'){
                param += "&endDate="+endDate;
            }
            if(typeof(vm.finance.placeId) != 'undefined'){
                param += "&placeId="+placeId;
            }
            if(typeof(vm.finance.orderTypeId) != 'undefined'){
                param += "&orderTypeId="+orderTypeId;
            }

            var url = baseURL + 'finance/search/receivableSumDetail?'+param;
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
                { label: 'id', name: 'PRD_ID', index: 'PRD_ID', width: 50, key: true ,hidden:true},
                { label: '产品名称', name: 'PRD_NAME', index: 'PRD_NAME', width: 160 },
                { label: '产品编号', name: 'PRD_NO', index: 'PRD_NO', width: 140},
                { label: '产品类型', name: 'PRD_TYPE_NAME', index: 'PRD_TYPE_NAME', width: 120},
                { label: '售点', name: 'PLACE_NAME', index: 'PLACE_NAME', width: 120 },
                { label: '定价', name: 'PRICE1', index: 'PRICE1', width: 80 ,formatter : "number"},
                { label: '售价', name: 'PRICE2', index: 'PRICE2', width: 60 ,formatter : "number"},
                { label: '数量', name: 'AMOUNT', index: 'AMOUNT', width: 60 },
                { label: '订单金额', name: 'ORDER_MONEY', index: 'ORDER_MONEY', width: 60 ,formatter : "number"},
                { label: '折扣金额', name: 'DISCOUNT_MONEY', index: 'DISCOUNT_MONEY', width: 60 ,formatter : "number"},
                { label: '利润', name: 'REVENUE_MONEY', index: 'REVENUE_MONEY', width: 60 ,formatter : "number"}
            ],
            rowNum : 9999999,
            height : 'auto',
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
        finance: {},
        customerArr:null,
        placeArr:null,
        orderTypeArr:null
    },
    methods: {
        query: function () {
            vm.reload();
        },
        initCustomerCommbox:function(){
            $.ajax({
                type: "POST",
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_customer_info",search:"STATUS=1",returnField:"ID as value,CUSTOMER_NAME as text"},
                success: function(r){
                    vm.customerArr = r.data;
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
                data: {tableName:"tb_type_info",search:"PARENT_ID in("+parentId+")",returnField:"ID as value,TYPE_NAME as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
        reload:function(){
            $("#jqGrid").jqGrid('setGridParam',{
                postData:vm.finance
            }).trigger("reloadGrid");
        },
        print:function(){
            var orderNo = "";
            alert("打印");
            // if(vm.productionOrder.productionNo !== undefined){
            //     orderNo = vm.productionOrder.productionNo;
            // }
            // window.open(baseURL + "businessPrint/biSearch/PrintLL?token="+token+"&createDate="+vm.productionOrder.createDate+"&orderNo="+orderNo+"&takeStn="+vm.productionOrder.takeStn);
        }
    }
});
vm.placeArr = vm.initTypeInfoArr('82');
vm.orderTypeArr = vm.initTypeInfoArr('40');
vm.initCustomerCommbox();
