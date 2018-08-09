$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        // $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    }

    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/search/outStoreSearch',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'OUTPORT_ID', index: 'OUTPORT_ID', width: 50, key: true ,hidden:true},
			{ label: '出库单号', name: 'OUTPORT_NO', index: 'OUTPORT_NO', width: 120 },
			{ label: '销售订单ID', name: 'ORDER_ID', index: 'ORDER_ID' ,hidden:true},
			{ label: '销售单编号', name: 'PRODUCTION_NO', index: 'PRODUCTION_NO', width: 120 },
			{ label: '订单类型ID', name: 'ORDER_TYPE_ID', index: 'ORDER_TYPE_ID' ,hidden:true },
			{ label: '订单类型', name: 'ORDER_TYPE_NAME', index: 'ORDER_TYPE_NAME', width: 80 },
			{ label: '售点', name: 'PLACE_NAME', index: 'PLACE_NAME', width: 100 },
			{ label: '客户编号', name: 'CUSTOMER_ID', index: 'CUSTOMER_ID' ,hidden:true},
			{ label: '客户编号', name: 'CUSTOMER_NO', index: 'CUSTOMER_NO', width: 80 },
			{ label: '客户名称', name: 'CUSTOMER_NAME', index: 'CUSTOMER_NAME', width: 160 },
            { label: '出库日期', name: 'OUT_DATE', index: 'OUT_DATE', width: 100},
            { label: '操作人', name: 'CREATE_USER', index: 'CREATE_USER', width: 80 }
        ],
		viewrecords: true,
        // height: 385,
        height: "auto",
        rowNum: 9999999,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: false,
        // scroll:true,
        // pager: "#jqGridPager",
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
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var rowData = $("#jqGrid").jqGrid("getRowData",row_id);
            var url = baseURL + 'storage/search/outStoreDetailSearch?outputId='+rowData.OUTPORT_ID;
            createSubGrid(subgrid_id,row_id,url);
        },
        onSelectRow:function(id){

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
                { label: '原料ID', name: 'MTR_ID', index: 'MTR_ID', key: true,hidden:true},
                { label: '原料编码', name: 'MTR_CODE', index: 'MTR_CODE', width: 80 },
                { label: '原料名称', name: 'MTR_NAME', index: 'MTR_NAME', width: 80 },
                { label: '原料类型名称', name: 'MTR_TYPE_NAME', index: 'MTR_TYPE_NAME', width: 80 },
                { label: '单位', name: 'MINI_UNIT_NAME', index: 'MINI_UNIT_NAME', width: 80 },
                { label: '需求数量', name: 'ORDER_COUNT', index: 'ORDER_COUNT', width: 80},
                { label: '出库数量', name: 'OUT_COUNT', index: 'OUT_COUNT', width: 80 ,formatter : "number"}
            ],
            rowNum : 20,
            height : '100%',
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

    $("#outStartDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1,
        endDate:new Date(currentDate)
    });

    $('#outStartDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.search.inStartDate = newDate;

        $("#outEndDate").datetimepicker({
            startDate:new Date(newDate)
        });
    });


    $("#outEndDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1

    });

    $('#outEndDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.search.inEndDate = newDate;
    });

    $('#outStartDate').click(function(e){
        // document.getElementsByClassName("form_datetime1")[0].addEventListener('click', function(e) {
            e.currentTarget.blur();
        // });
    });

});

var vm = new Vue({
	el:'#rrapp',
	data:{
        showList:true,
        newOutportLayer:false,
        search:{},
        outportInfo:{},
        orderTypeArr:{},
        placeArr:{},
        customerArr:{}
	},
	methods: {
        query: function () {
            vm.reload();
        },
        createNewNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/createBillNo",
                data:"billType=2",
                success: function(r){
                    no = r.newBillNo;
                }
            });
            return no;
        },
        outSearch:function(){
            alert('查询开始');
            //校验查询条件
            //1.出库单号以及订单号是否存在


        },
        addNewOutport:function(){
            vm.showList=false;
            vm.newOutportLayer = true;
            vm.outportInfo.outporrtNo = vm.createNewNo();
        },
        saveOrUpdate:function(){

            console.log(vm.outportInfo);
        },
        reload:function(){
            vm.showList=true;
            vm.newOutportLayer = false;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                page:page
            }).trigger("reloadGrid");
        },
        clean:function(){

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
        getFieldData:function(){
            var param = "tableName=MTR_DATA&fieldName=MTR_NAME:MTR_PY&searchWord=";
            if(vm.type == '0'){//查询成品&半成品
                param = "tableName=PRD_DATA&fieldName=PRD_NAME:PRD_PY&searchWord=";
            }

            $('#searchName').typeahead({
                source: function (query, process) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "common/commonUtil/getTableData",
                        data: param + query,
                        success: function (r) {
                            var resultList = r.data.map(function (item) {
                                var aItem = {id: item.id, py: item.MTR_PY, name: item.MTR_NAME};
                                if(vm.type == '0'){
                                    aItem = {id: item.id, py: item.PRD_PY, name: item.PRD_NAME};
                                }
                                return JSON.stringify(aItem);
                            });
                            process(resultList);
                        }
                    });
                },
                highlighter: function (obj) {
                    var item = JSON.parse(obj);
                    var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
                    return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                        return '<strong>' + match + '</strong>'
                    });
                },
                updater: function (obj) {
                    var item = JSON.parse(obj);
                    return item.name;
                },
                afterSelect:function(obj){
                    // $.ajax({
                    //     type: "POST",
                    //     url: baseURL + "baseData/mtrdata/info/"+vm.mtrData.mtrId,
                    //     async:true,
                    //     success: function (r) {
                    //         vm.mtrData = r.mtrData;
                    //         vm.mtrData.mtrId = r.mtrData.id;
                    //         vm.supplierMtr.mtrId=r.mtrData.id;
                    //     }
                    // });
                }
            })
        },
        selectVal:function(type){
            var i=0;
            var typeInfo;
            var customerNo;
            var customerName;
            var placeInfo;
            if(type == 'orderTypeId'){
                i=1;
                $.get(baseURL + "baseData/typeinfo/info/"+vm.outportInfo.orderTypeId, function(r){
                    typeInfo = r.typeInfo;
                    vm.outportInfo.orderTypeName = typeInfo.typeName
                });
            }else if(type == 'customerId'){
                i=2;
                $.get(baseURL + "sales/customerinfo/info/"+vm.outportInfo.customerId, function(r){
                    customerNo = r.customerInfo;
                    customerName = r.customerName;
                    vm.outportInfo.customerNo = customerNo.customerCode;
                    vm.outportInfo.customerName = customerNo.customerName;
                    $('#addCustomerNo').val(customerNo.customerCode);
                });
            }else if(type == 'placeId'){
                i=3;
                $.get(baseURL + "baseData/typeinfo/info/"+vm.outportInfo.placeId, function(r){
                    placeInfo = r.typeInfo;
                    vm.outportInfo.placeName = placeInfo.typeName;
                });
            }
            // if(i == 3){
            //     vm.outportInfo.orderTypeName = typeInfo.typeName;
            //     vm.outportInfo.customerNo = customerNo.customerCode;
            //     vm.outportInfo.customerName = customerNo.customerName;
            //     vm.outportInfo.placeName = placeInfo.typeName;
            //
            // }
        },
        initCsutomerInfoArr:function(){
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_customer_info",search:"STATUS='1'",returnField:"ID as value,CUSTOMER_NAME as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
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
        }
    }
});
vm.orderTypeArr = vm.initTypeInfoArr(40);
vm.placeArr = vm.initTypeInfoArr(82);
vm.customerArr = vm.initCsutomerInfoArr();

vm.getFieldData();
