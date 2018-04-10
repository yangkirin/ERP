$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/importmtrbatch/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true },
			{ label: '入库单ID', name: 'importId', index: 'IMPORT_ID', width: 80 }, 			
			{ label: '入库明细ID', name: 'importDetailId', index: 'IMPORT_DETAIL_ID', width: 80 }, 			
			{ label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80 }, 			
			{ label: '采购单位ID', name: 'orderUnitId', index: 'ORDER_UNIT_ID', width: 80 }, 			
			{ label: '采购单位', name: 'orderUnitName', index: 'ORDER_UNIT_NAME', width: 80 }, 			
			{ label: '采购单位转换率', name: 'orderUnitRate', index: 'ORDER_UNIT_RATE', width: 80 }, 			
			{ label: '入库单位ID', name: 'inUnitId', index: 'IN_UNIT_ID', width: 80 }, 			
			{ label: '入库单位', name: 'inUnitName', index: 'IN_UNIT_NAME', width: 80 }, 			
			{ label: '入库单位转换率', name: 'inUnitRate', index: 'IN_UNIT_RATE', width: 80 }, 			
			{ label: '入库单价', name: 'inPrice', index: 'IN_PRICE', width: 80 }, 			
			{ label: '入库数量', name: 'inCount', index: 'IN_COUNT', width: 80 }, 			
			{ label: '入库总金额', name: 'inTotla', index: 'IN_TOTLA', width: 80 }, 			
			{ label: '批次号', name: 'batchNo', index: 'BATCH_NO', width: 80 }, 			
			{ label: '生产日期', name: 'productionDate', index: 'PRODUCTION_DATE', width: 80 }, 			
			{ label: '有效日期', name: 'effectiveDate', index: 'EFFECTIVE_DATE', width: 80 }, 			
			{ label: '状态', name: 'status', index: 'STATUS', width: 80 }			
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
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		importMtrBatch: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.importMtrBatch = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.importMtrBatch.id == null ? "storage/importmtrbatch/save" : "storage/importmtrbatch/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.importMtrBatch),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "storage/importmtrbatch/delete",
                    contentType: "application/json",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get(baseURL + "storage/importmtrbatch/info/"+id, function(r){
                vm.importMtrBatch = r.importMtrBatch;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});