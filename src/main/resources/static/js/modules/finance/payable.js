$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        // $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    };

    $("#jqGrid").jqGrid({
        url: baseURL + 'finance/search/payableSumInfo',
        datatype: "json",
        colModel: [
            { label: 'SUPPLIER_ID', name: 'SUPPLIER_ID', index: 'SUPPLIER_ID', key: true ,hidden:true},
            { label: '供应商名称', name: 'SUPPLIER_NAME', index: 'SUPPLIER_NAME' , width: 180 },
            { label: '供应商编号', name: 'SUPPLIER_NO', index: 'SUPPLIER_NO', width: 120 },
            { label: '需求总金额', name: 'SUM_ORDER_MONEY', index: 'SUM_ORDER_MONEY', width: 80 ,formatter : "number"},
            { label: '实际入库总金额', name: 'SUM_IN_MONEY', index: 'SUM_IN_MONEY', width: 80 ,formatter : "number"}
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
            var typeId = vm.finance.typeId ===undefined ? null : vm.finance.typeId;

            var param = "supplierId="+row_id;

            if(typeof(vm.finance.startDate) != 'undefined'){
                param += "&startDate="+startDate;
            }
            if(typeof(vm.finance.endDate) != 'undefined'){
                param += "&endDate="+endDate;
            }
            if(typeof(vm.finance.typeId) != 'undefined'){
                param += "&typeId="+typeId;
            }

            var url = baseURL + 'finance/search/payableSumDetail?'+param;
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
                { label: 'id', name: 'MTR_ID', index: 'MTR_ID', width: 50, key: true ,hidden:true},
                { label: '原料编号', name: 'MTR_NO', index: 'MTR_NO', width: 160 },
                { label: '原料名称', name: 'MTR_NAME', index: 'MTR_NAME', width: 140},
                { label: '原料类型', name: 'TYPE_NAME', index: 'TYPE_NAME', width: 120},
                { label: '仓库', name: 'WAREHOUSE_NAME', index: 'WAREHOUSE_NAME', width: 120 },
                { label: '站点', name: 'TAKE_STN_NAME', index: 'TAKE_STN_NAME', width: 120 },
                { label: '总采购数量', name: 'SUM_ORDER_COUNT', index: 'SUM_ORDER_COUNT', width: 80 ,formatter : "number"},
                { label: '实际入库数', name: 'SUM_IN_COUNT', index: 'SUM_IN_COUNT', width: 60 ,formatter : "number"},
                { label: '采购价', name: 'PRICE', index: 'PRICE', width: 60 ,formatter : "number"},
                { label: '采购金额', name: 'SUM_ORDER_MONEY', index: 'SUM_ORDER_MONEY', width: 60 ,formatter : "number"},
                { label: '实际金额', name: 'SUM_IN_MONEY', index: 'SUM_IN_MONEY', width: 60 ,formatter : "number"}
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

var setting = {
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

var vm = new Vue({
    el: '#rrapp',
    data: {
        finance: {},
        supplierArr:null,
        typeInfo: {
            parentName:null,
            parentId:0
        }
    },
    methods: {
        query: function () {
            vm.reload();
        },
        initCommbox:function(){
            $.ajax({
                type: "POST",
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_supplier_info",search:"status=1",returnField:"ID as value,suppier_name as text"},
                success: function(r){
                    vm.supplierArr = r.data;
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
        getTypeInfoTree:function(){
            //加载树
            $.ajax({
                type: "POST",
                url: baseURL + "baseData/typeinfo/select",
                data: {parentId:4},
                success: function(r){
                    ztree = $.fn.zTree.init($("#typeInfoTree"), setting, r.typeInfoList);
                    var node = ztree.getNodeByParam("id", vm.typeInfo.parentId);
                    ztree.selectNode(node);
                }
            });

        },
        typeInfoTree:function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择菜单",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#typeInfoLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    vm.finance.typeId = node[0].id;
                    vm.finance.typeName = node[0].typeName;
                    $('#typeName').val(node[0].typeName);
                    console.log(vm.finance);
                    layer.close(index);
                },
                btn2:function(event){
                    vm.finance.typeId = '';
                    vm.finance.typeName = '';
                }
            });
        },
        reload:function(){
            $("#jqGrid").jqGrid('setGridParam',{
                postData:vm.finance
            }).trigger("reloadGrid");
        },
        print:function(){
            var orderNo = "";
            console.log(vm.finance);
            // if(vm.productionOrder.productionNo !== undefined){
            //     orderNo = vm.productionOrder.productionNo;
            // }
            // window.open(baseURL + "businessPrint/biSearch/PrintLL?token="+token+"&createDate="+vm.productionOrder.createDate+"&orderNo="+orderNo+"&takeStn="+vm.productionOrder.takeStn);
        }
    }
});
vm.initCommbox();
vm.getTypeInfoTree();