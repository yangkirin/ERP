$(function () {

    window.onresize = function _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW - 10).jqGrid('setGridHeight', ss.WinH - 200);
        // $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    }

    $("#jqGrid").jqGrid({
        url: baseURL + 'businessPrint/biSearch/DataSearchCPBZ',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'prdId', index: 'prdId', width: 50, key: true, hidden: true},
            {label: '产品编号', name: 'prdNo', index: 'prdNo', width: 80},
            {label: '品名', name: 'prdName', index: 'prdName', width: 100},
            {label: '生产量', name: 'amount', index: 'amount', width: 80},
            {label: '单位', name: 'unit', index: 'unit', width: 50},
            {label: '锅数', name: 'potCount', index: 'potCount', width: 80}
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
        subGrid: true,
        subGridRowExpanded: function (subgrid_id, row_id) {
            var rowData = $("#jqGrid").jqGrid('getRowData', row_id);
            var url = baseURL + 'businessPrint/biSearch/DataSearchDetailCPBZ?prdId=' + rowData.prdId + '&amount=' + rowData.amount;
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
                {label: '单锅量', name: 'pot', index: 'pot', width: 100},
                {label: '不足锅量', name: 'lastPot', index: 'lastPot', width: 100},
                {label: '总用量', name: 'totalWgt', index: 'totalWgt', width: 100},
                {label: '单位', name: 'formulaUnit', index: 'formulaUnit', width: 80}
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

    $(".form_datetime").datetimepicker({
        format: 'yyyy-mm-dd',
        language: 'zh-CN',
        autoclose: true,
        minView: 2,
        todayBtn: true,
        todayHighlight: true,
        weekStart: 1
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
        productionOrder: {
            pdcStn: 0,
            pdcStnName: null,
            createDate: ''
        },
        selectArr: null,
        pdcStnArr: null,
        typeInfo: {
            parentName: null,
            parentId: 0
        }
    },
    methods: {
        query: function () {
            console.log(JSON.stringify(vm.productionOrder));
            vm.reload();
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
        // initTypeInfoArr:function(parentId){
        //     var dataArr = "";
        //     $.ajax({
        //         type: "POST",
        //         async:false,
        //         url: baseURL + "common/commonUtil/getDataToCommbox",
        //         // contentType: "application/json",
        //         data: {tableName:"tb_type_info",search:"PARENT_ID="+parentId,returnField:"ID as value,TYPE_NAME as text"},
        //         success: function(r){
        //             dataArr =  r.data;
        //         }
        //     });
        //     return dataArr;
        // },
        reload: function () {
            $("#jqGrid").jqGrid('setGridParam', {
                postData: vm.productionOrder
            }).trigger("reloadGrid");
        },
        print: function () {
            console.log(vm.productionOrder);
            var orderNo = "";
            if (vm.productionOrder.productionNo !== undefined) {
                orderNo = vm.productionOrder.productionNo;
            }
            window.open(baseURL + "businessPrint/biSearch/PrintCPBZ?token=" + token + "&createDate=" + vm.productionOrder.createDate + "&orderNo=" + orderNo + "&pdcStn=" + vm.productionOrder.pdcStn);
        },
        getTypeInfoTree: function () {
            //加载树
            $.ajax({
                type: "POST",
                url: baseURL + "baseData/typeinfo/select",
                data: {parentId: 48},
                success: function (r) {
                    ztree = $.fn.zTree.init($("#typeInfoTree"), setting, r.typeInfoList);
                    var node = ztree.getNodeByParam("id", vm.typeInfo.parentId);
                    ztree.selectNode(node);
                    // vm.q.typeName = node.typeName;
                }
            });

        },
        editpdcStn: function () {
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
                    var node = ztree.getSelectedNodes();
                    vm.productionOrder.pdcStn = node[0].id;
                    // vm.q.prdTypeName = node[0].typeName;
                    $('#editpdcStn').val(node[0].typeName);
                    vm.productionOrder.pdcStnName = node[0].typeName;
                    layer.close(index);
                },
                btn2: function (event) {
                    // vm.addPrdData = {};
                }
            });
        },
    }
});
// vm.pdcStnArr = vm.initTypeInfoArr('48');
vm.initCommbox();
vm.productionOrder.pdcStn = 0;

var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url: "nourl",
            name: "typeName"
        }
    }
};
var ztree;
vm.getTypeInfoTree();
