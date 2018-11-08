$(function () {

    window.onresize = function _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW - 10).jqGrid('setGridHeight', ss.WinH - 200);
        // $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    }

    $("#jqGrid").jqGrid({
        url: baseURL + 'businessPrint/biSearch/DataSearchQCLZY',
        datatype: "local",
        colModel: [
            {label: 'id', name: 'mtrId', index: 'mtrId', width: 50, key: true, hidden: true},
            {label: '编号', name: 'mtrCode', index: 'mtrCode', width: 80},
            {label: '品名', name: 'mtrIdName', index: 'mtrIdName', width: 80},
            {label: '生产量', name: 'sumDemandWgt', index: 'sumDemandWgt', width: 80,formatter:function(value, options, row){
                // if(row.miniRate){
                //     return Number(Number(value)/Number(row.miniRate)).toFixed(4);
                // }else{
                    return value;
                // }
            }},
            {label: '单位', name: 'miniUnitName', index: 'miniUnitName', width: 80},
            {label: '转换率', name: 'miniRate', index: 'miniRate', width: 80},
            { label: '生产站点', name: 'takeStnIdName', index: 'takeStnIdName', width: 80 },
            { label: '生产站点', name: 'takeStnId', index: 'takeStnId', width: 80 , hidden: true},

            {label: '总锅数', name: 'sumPotCount', index: 'sumPotCount', width: 80, hidden: true},
            {label: '单锅重', name: 'potWeight', index: 'potWeight', width: 80, hidden: true},
            {label: '尾锅重', name: 'lastPotWeight', index: 'lastPotWeight', width: 80, hidden: true}
            // { label: '尾锅数', name: 'lastPotCount', index: 'lastPotCount', width: 80 }
            // {label: '品名', name: 'mtrName', index: 'mtrName', width: 80},
            // {label: '总用量', name: 'bomWgt', index: 'bomWgt', width: 80, hidden: true},
            // {label: '单位', name: 'formulaUnit', index: 'formulaUnit', width: 80}
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
        loadComplete:function(){
            if(vm.gridAlldata == null){
                vm.gridAlldata = getGridAllData('jqGrid');
            }else if(vm.gridAlldata.length == 0){
                vm.gridAlldata = getGridAllData('jqGrid');
            }
            vm.gridCurrentdata = getGridAllData('jqGrid');
        },
        subGrid: false,
        subGridRowExpanded: function (subgrid_id, row_id) {
            var rowData = $("#jqGrid").jqGrid('getRowData', row_id);
            var url = baseURL + 'businessPrint/biSearch/DataSearchDetailQCLZY?prdId=' + rowData.mtrId + '&prdCount=' + rowData.sumDemandWgt;
            createSubGrid(subgrid_id, row_id, url);
        }
    });

    function createSubGrid(subgrid_id, row_id, url) {
        var subgrid_table_id, pager_id;
        subgrid_table_id = subgrid_id + "_t";
        pager_id = "p_" + subgrid_table_id;
        $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
        jQuery("#" + subgrid_table_id).jqGrid({
            url: url,
            datatype: "json",
            colModel: [
                {label: 'mtrId', name: 'mtrId', index: 'mtrId', key: true, hidden: true},
                {label: '原料编号', name: 'mtrCode', index: 'mtrCode', width: 120},
                {label: '原料名称', name: 'mtrName', index: 'mtrName', width: 180},
                {label: '原料类型', name: 'mtrTypeName', index: 'mtrTypeName', width: 120},
                {label: '单位', name: 'formulaUnitName', index: 'formulaUnitName', width: 80},
                {label: '净重', name: 'netWgt', index: 'netWgt', width: 80},
                {label: '毛重', name: 'grossWgt', index: 'grossWgt', width: 80},
                {label: '熟重', name: 'cookedWgt', index: 'cookedWgt', width: 80}
            ],
            rowNum: 9999999,
            // pager : pager_id,
            height: '100%',
            rowList: [10, 30, 50],
            // rownumbers: true,
            // rownumWidth: 25,
            autowidth: true,
            multiselect: false,
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
                $("#" + subgrid_table_id).closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
            }
        });
    }


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
    // $("#takeStn").bind("change", function () {
    //     var data = $(this).val();
    //     var text = $(this).find("option:selected").text();
    //     vm.takeStn = text;
    //     var takeStnData;
    //
    //     if(data == 0){
    //         takeStnData = vm.gridAlldata;
    //     }else{
    //         takeStnData = vm.gridAlldata.filter(function (e) { return e.takeStnId == data; });
    //     }
    //
    //     $("#jqGrid").jqGrid("clearGridData");
    //     $("#jqGrid").jqGrid('setGridParam',{
    //         datatype: 'local',
    //         data:takeStnData
    //     }).trigger("reloadGrid");
    //
    // });

    // $("#warehouse").bind("change", function () {
    //     var data = $(this).val();
    //     var text = $(this).find("option:selected").text();
    //     var takeStnId = $('#takeStn').val();
    //     var warehouseData;
    //     if(data == 0 && takeStnId == 0){
    //         warehouseData = vm.gridAlldata;
    //     }else if(data == 0 && takeStnId != 0){
    //         warehouseData = vm.gridAlldata.filter(function (e) { return e.TAKE_STN_ID == takeStnId; });
    //     }else if(data != 0 && takeStnId == 0){
    //         warehouseData = vm.gridAlldata.filter(function (e) { return e.WAREHOUSE_ID == data; });
    //     }else if(data != 0 && takeStnId != 0){
    //         warehouseData = vm.gridAlldata.filter(function (e) { return e.WAREHOUSE_ID == data; });
    //         warehouseData = warehouseData.filter(function (e) { return e.TAKE_STN_ID == takeStnId; });
    //     }
    //
    //     vm.gridCurrentdata = warehouseData;
    //
    //     $("#jqGrid").jqGrid("clearGridData");
    //     $("#jqGrid").jqGrid('setGridParam',{
    //         datatype: 'local',
    //         data:warehouseData
    //     }).trigger("reloadGrid");
    //
    // });

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
        typeInfo: {
            parentName:null,
            parentId:0
        },
        selectArr: null,
        takeStnArr: null,
        warehouseArr: null,
        orderTypeArr: null,
        orderIds: null,
        gridAlldata: null,
        gridCurrentdata: null,
        takeStn: ''
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
            // console.log(JSON.stringify(vm.productionOrder));
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
                productionNo: null,
                takeStnName:''
            };
            $("#jqGrid").jqGrid('setGridParam',{
                datatype: "local"
            }).trigger("reloadGrid");
        },
        initCommbox: function () {
            $.ajax({
                type: "POST",
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName: "tb_type_info", search: "PARENT_ID=23", returnField: "ID as value,TYPE_NAME as text"},
                success: function (r) {
                    vm.selectArr = r.data;
                    // vm.productionOrder.warehouse = 0;
                }
            });
        },
        getTypeInfoTree:function(){
            //加载树
            $.ajax({
                type: "POST",
                url: baseURL + "baseData/typeinfo/select",
                data:{parentId:48},
                success: function(r){
                    ztree = $.fn.zTree.init($("#typeInfoTree"), setting, r.typeInfoList);
                    var node = ztree.getNodeByParam("id", vm.typeInfo.parentId);
                    ztree.selectNode(node);
                    // vm.q.typeName = node.typeName;
                }
            });

        },
        typeInfoTree: function(opeation){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择类别",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#typeInfoLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {

                    var nodes = ztree.getCheckedNodes(true);
                    if(0 === nodes.length) {
                        alert("请选择!");
                        return;
                    }
                    var dataNodesName = "";
                    var dataNodesId = "";
                    for(var i = 0; i < nodes.length; i++) {
                        console.log(nodes[i].getCheckStatus());
                        if(!nodes[i].getCheckStatus().half && !nodes[i].isParent){
                            dataNodesName += nodes[i].typeName + ",";
                            dataNodesId += nodes[i].id + ",";
                        }
                    }
                    dataNodesName = dataNodesName.substr(0,dataNodesName.length-1);
                    dataNodesId = dataNodesId.substr(0,dataNodesId.length-1);
                    // alert(dataNodes); //获取选中节点的值

                    var node = ztree.getSelectedNodes();
                    if(opeation == 'takeStn'){
                        vm.productionOrder.takeStn = dataNodesId;
                        vm.productionOrder.takeStnName = dataNodesName;
                        $('#takeStn').val(dataNodesName);
                    }
                    //数据过滤加载
                    vm.takeStn = (dataNodesName);
                    var takeStnData;

                    // if(node[0].id == 0){
                    //     takeStnData = vm.gridAlldata;
                    // }else{
                        takeStnData = vm.gridAlldata.filter(function (e) {
                            // return e.takeStnId == node[0].id;
                            return (dataNodesId.indexOf(e.takeStnId) != -1);
                        });
                    // }

                    $("#jqGrid").jqGrid("clearGridData");
                    $("#jqGrid").jqGrid('setGridParam',{
                        datatype: 'local',
                        data:takeStnData
                    }).trigger("reloadGrid");

                    layer.close(index);
                },
                btn2:function(event){
                    // vm.addPrdData = {};
                }
            });
        },
        initTypeInfoArr: function (parentId) {
            var dataArr = "";
            $.ajax({
                type: "POST",
                async: false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {
                    tableName: "tb_type_info",
                    search: "PARENT_ID=" + parentId,
                    returnField: "ID as value,TYPE_NAME as text"
                },
                success: function (r) {
                    dataArr = r.data;
                }
            });
            return dataArr;
        },
        reload: function () {
            $("#jqGrid").jqGrid('setGridParam', {
                postData: vm.productionOrder
            }).trigger("reloadGrid");
        },
        print: function () {
            // console.log(vm.productionOrder);
            // var orderNo = "";
            // if (vm.productionOrder.productionNo !== undefined) {
            //     orderNo = vm.productionOrder.productionNo;
            // }
            // window.open(baseURL + "businessPrint/biSearch/PrintQCLZY?token=" + token + "&createDate=" + vm.productionOrder.createDate + "&orderNo=" + orderNo + "&takeStn=" + vm.productionOrder.takeStn);

            if(vm.orderIds == null){
                alert("未选择任何订单！");
            }
            var printData;
            if(vm.gridCurrentdata == null){
                printData = vm.gridAlldata;
            }else{
                printData = vm.gridCurrentdata;
            }
            // console.log(printData);
            // var printData = getGridAllData('jqGrid');
            // var postData = {};
            // postData.printData = printData;

            openPostWindow(baseURL + "businessPrint/biSearch/PrintQCLZYNew?token=" + token+"&takeStn="+vm.takeStn+"&demandDate="+vm.productionOrder.demandDate,JSON.stringify(printData),'printQCLZY');
        }
    }
});
var setting = {
    check: {
        enable: true
    },
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url:"nourl",
            name:"typeName"
        }
    }
};

var ztree;
vm.getTypeInfoTree();

// vm.takeStnArr = vm.initTypeInfoArr('48');
vm.warehouseArr = vm.initTypeInfoArr('23');
vm.orderTypeArr = vm.initTypeInfoArr('40');
vm.initCommbox();
