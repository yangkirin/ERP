$(function () {
    $("#jqGrid").jqGrid({
        // url: baseURL + 'storage/import/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '出库单号', name: 'outportNo', index: 'OUTPORT_NO', width: 80 },
			{ label: '订单编号', name: 'orderNo', index: 'ORDER_NO', width: 80 },
			{ label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 80 },
			{ label: '原料编号', name: 'mtrNo', index: 'MTR_NO', width: 80 },
			{ label: '原料类型', name: 'mtrTypeName', index: 'MTR_TYPE_NAME', width: 80 },
			{ label: '需求数量', name: 'orderCount', index: 'ORDER_COUNT', width: 80 },
			{ label: '出库数量', name: 'outCount', index: 'OUT_COUNT', width: 80 },
            { label: '出库日期', name: 'outDate', index: 'OUT_DATE', width: 100}
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
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
            var url = baseURL + 'storage/importdetail/list?importId='+row_id;
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
                { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
                { label: '入库单ID', name: 'importId', index: 'IMPORT_ID', width: 80 ,hidden:true},
                { label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80,hidden:true },
                { label: '原料编号', name: 'mtrNo', index: 'MTR_NO', width: 80 },
                { label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 80 },
                { label: '入库单位', name: 'inUnit', index: 'IN_UNIT', width: 80 },
                { label: '入库转换率', name: 'inRate', index: 'IN_RATE', width: 80 ,formatter : "number"},
                { label: '采购数量', name: 'orderCount', index: 'ORDER_COUNT', width: 80 ,formatter : "number"},
                { label: '采购单价', name: 'orderPrice', index: 'ORDER_PRICE', width: 80 ,formatter : "number"},
                { label: '采购金额', name: 'orderSumPrice', index: 'ORDER_SUM_PRICE', width: 80 ,formatter : "number"},
                { label: '入库数量', name: 'inCount', index: 'IN_COUNT', width: 80 ,formatter : "number"},
                { label: '入库单价', name: 'inPrice', index: 'IN_PRICE', width: 80 ,formatter : "number"},
                { label: '入库金额', name: 'inSumPrice', index: 'IN_SUM_PRICE', width: 80,formatter : "number" },
                { label: '入库重量', name: 'inWgt', index: 'IN_WGT', width: 80 ,formatter : "number"},
                { label: '入库日期', name: 'inDate', index: 'IN_DATE', width: 80 }
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
