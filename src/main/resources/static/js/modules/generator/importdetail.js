$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/importdetail/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true },
			{ label: '入库单ID', name: 'importId', index: 'IMPORT_ID', width: 80 }, 			
			{ label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80 }, 			
			{ label: '原料编号', name: 'mtrNo', index: 'MTR_NO', width: 80 }, 			
			{ label: '入库单位', name: 'inUnit', index: 'IN_UNIT', width: 80 }, 			
			{ label: '入库转换率', name: 'inRate', index: 'IN_RATE', width: 80 }, 			
			{ label: '采购数量', name: 'orderCount', index: 'ORDER_COUNT', width: 80 }, 			
			{ label: '采购单价', name: 'orderPrice', index: 'ORDER_PRICE', width: 80 }, 			
			{ label: '采购金额', name: 'orderSumPrice', index: 'ORDER_SUM_PRICE', width: 80 }, 			
			{ label: '入库数量', name: 'inCount', index: 'IN_COUNT', width: 80 }, 			
			{ label: '入库单价', name: 'inPrice', index: 'IN_PRICE', width: 80 }, 			
			{ label: '入库金额', name: 'inSumPrice', index: 'IN_SUM_PRICE', width: 80 }, 			
			{ label: '入库重量', name: 'inWgt', index: 'IN_WGT', width: 80 }, 			
			{ label: '入库日期', name: 'inDate', index: 'IN_DATE', width: 80 }, 			
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
		importDetail: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.importDetail = {};
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
			var url = vm.importDetail.id == null ? "storage/importdetail/save" : "storage/importdetail/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.importDetail),
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
				    url: baseURL + "storage/importdetail/delete",
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
			$.get(baseURL + "storage/importdetail/info/"+id, function(r){
                vm.importDetail = r.importDetail;
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