$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/search/inventorySearch',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '名称', name: 'MTR_NAME', index: 'MTR_NAME', width: 160 },
			{ label: '原料编码', name: 'MTR_CODE', index: 'MTR_CODE', width: 80 },
            { label: '采购单位', name: 'PURCHASE_UNIT', index: 'PURCHASE_UNIT', width: 60},
            { label: '采购转换率', name: 'PURCHASE_RATE', index: 'PURCHASE_RATE', width: 60},
            { label: '最小单位', name: 'MINI_UNIT', index: 'MINI_UNIT', width: 60},
            { label: '最小转换率', name: 'MINI_RATE', index: 'MINI_RATE', width: 60},
            { label: '配方单位', name: 'FORMULA_UNIT', index: 'FORMULA_UNIT', width: 80},
            { label: '入库数量', name: 'IN_COUNT', index: 'IN_COUNT', width: 80},
            { label: '出库数量', name: 'OUT_COUNT', index: 'OUT_COUNT', width: 80},
            { label: '库存数量', name: 'STORE_COUNT', index: 'STORE_COUNT', width: 80}
        ],
		viewrecords: true,
        height: 385,
        rowNum: 999999,
		rowList : [500,1000,2000],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: false,
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
            var url = baseURL + 'storage/search/batchInventorySearch?mtrId='+row_id;
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
                { label: '批次号', name: 'BATCH_NO', index: 'BATCH_NO', width: 80 },
                { label: '原料名称', name: 'MTR_NAME', index: 'MTR_NAME', width: 140},
                { label: '生产日期', name: 'PRODUCTION_DATE', index: 'PRODUCTION_DATE', width: 120},
                { label: '失效日期', name: 'EFFECTIVE_DATE', index: 'EFFECTIVE_DATE', width: 120 },
                { label: '原料ID', name: 'MTR_ID', index: 'MTR_ID', width: 80 ,hidden:true },
                { label: '入库数量', name: 'IN_COUNT', index: 'IN_COUNT', width: 60 ,formatter : "number" },
                { label: '入库单位', name: 'IN_UNIT_NAME', index: 'IN_UNIT_NAME', width: 60 },
                { label: '入库转换率', name: 'IN_UNIT_RATE', index: 'IN_UNIT_RATE', width: 60 },
                { label: '采购单价', name: 'ORDER_PRICE', index: 'ORDER_PRICE', width: 60 ,formatter : "number"},
                { label: '入库金额', name: 'IN_TOTLA_PRICE', index: 'IN_TOTLA_PRICE', width: 60 ,formatter : "number"}
            ],
            rowNum : 9999999,
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

    $("#inStartDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1,
        endDate:new Date(currentDate)
    });

    $('#inStartDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.search.inStartDate = newDate;

        $("#inEndDate").datetimepicker({
            startDate:new Date(newDate)
        });
    });


    $("#inEndDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        weekStart:1

    });

    $('#inEndDate').datetimepicker().on('changeDate', function(ev){
        var newDate = dateFtt('yyyy-MM-dd',ev.date);
        vm.search.inEndDate = newDate;
    });

    $('#inStartDate').click(function(e){
        // document.getElementsByClassName("form_datetime1")[0].addEventListener('click', function(e) {
            e.currentTarget.blur();
        // });
    });

    $('#selType').on("change",function(){
        var data = $(this).val();
        var text = $(this).find("option:selected").text();

        vm.search.name = '';
        $('#searchName').val('');
    });


});

var vm = new Vue({
	el:'#rrapp',
	data:{
        showList:true,
        search:{
            type:'1'
        },
        orgArr:{}

	},
	methods: {
        query: function () {
            vm.reload();
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

vm.orgArr = vm.initTypeInfoArr('23');
vm.getFieldData();
