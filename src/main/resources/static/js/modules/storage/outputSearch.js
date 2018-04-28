$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/search/outStoreSearch',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '出库单号', name: 'OUTPORT_NO', index: 'OUTPORT_NO', width: 120 },
			{ label: '销售订单ID', name: 'ORDER_ID', index: 'ORDER_ID', width: 80 ,hidden:true},
			{ label: '销售单编号', name: 'PRODUCTION_NO', index: 'PRODUCTION_NO', width: 120 },
			{ label: '订单类型', name: 'ORDER_TYPE_NAME', index: 'ORDER_TYPE_NAME', width: 80 },
			{ label: '售点', name: 'PLACE_NAME', index: 'PLACE_NAME', width: 120 },
			{ label: '客户编号', name: 'CUSTOMER_NO', index: 'CUSTOMER_NO', width: 80 },
			{ label: '客户名称', name: 'CUSTOMER_NAME', index: 'CUSTOMER_NAME', width: 160 },
            { label: '出库日期', name: 'OUT_DATE', index: 'OUT_DATE', width: 100},
            { label: '操作人', name: 'CREATE_USER', index: 'CREATE_USER', width: 80 }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 9999999,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
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
            var url = baseURL + 'storage/search/outStoreDetailSearch?outputId='+row_id;
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
                { label: 'id', name: 'ID', index: 'ID', width: 50, key: true ,hidden:true},
                { label: '原料ID', name: 'MTR_ID', index: 'MTR_ID', width: 80 ,hidden:true},
                { label: '原料编码', name: 'MTR_CODE', index: 'MTR_CODE', width: 80 },
                { label: '原料名称', name: 'MTR_NAME', index: 'MTR_NAME', width: 80 },
                { label: '原料类型名称', name: 'MTR_TYPE_NAME', index: 'MTR_TYPE_NAME', width: 80 },
                { label: '出库批次号', name: 'BATCH_NO', index: 'BATCH_NO', width: 80 },
                { label: '需求数量', name: 'ORDER_COUNT', index: 'ORDER_COUNT', width: 80},
                { label: '出库数量', name: 'OUT_COUNT', index: 'OUT_COUNT', width: 80 ,formatter : "number"},
                { label: '生产日期', name: 'PRODUCTION_DATE', index: 'PRODUCTION_DATE', width: 80 },
                { label: '失效日期', name: 'EFFECTIVE_DATE', index: 'EFFECTIVE_DATE', width: 80 }
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
        search:{
        }

	},
	methods: {
        query: function () {
            vm.reload();
        },
        outSearch:function(){
            alert('查询开始');
            //校验查询条件
            //1.出库单号以及订单号是否存在


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
        }
    }
});

vm.getFieldData();
