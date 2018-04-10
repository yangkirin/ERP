$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'purchase/orderdetail/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true },
			{ label: '订单ID', name: 'orderId', index: 'ORDER_ID', width: 80 }, 			
			{ label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80 }, 			
			{ label: '原料编码', name: 'mtrCode', index: 'MTR_CODE', width: 80 }, 			
			{ label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 80 }, 			
			{ label: '类型ID', name: 'mtrTypeId', index: 'MTR_TYPE_ID', width: 80 }, 			
			{ label: '类型名称', name: 'mtrTypeNaem', index: 'MTR_TYPE_NAEM', width: 80 }, 			
			{ label: '单位', name: 'mtrUnit', index: 'MTR_UNIT', width: 80 }, 			
			{ label: '转换率', name: 'mtrRate', index: 'MTR_RATE', width: 80 }, 			
			{ label: '仓库ID', name: 'warehoseId', index: 'WAREHOSE_ID', width: 80 }, 			
			{ label: '仓库名称', name: 'warehoseName', index: 'WAREHOSE_NAME', width: 80 }, 			
			{ label: '件重', name: 'wgtUnit1', index: 'WGT_UNIT1', width: 80 }, 			
			{ label: '盒重', name: 'wgtUnit2', index: 'WGT_UNIT2', width: 80 }, 			
			{ label: '价格', name: 'price', index: 'PRICE', width: 80 }, 			
			{ label: '成分分类ID', name: 'costTypeId', index: 'COST_TYPE_ID', width: 80 }, 			
			{ label: '成本分类名称', name: 'costTypeName', index: 'COST_TYPE_NAME', width: 80 }			
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
		orderDetail: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.orderDetail = {};
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
			var url = vm.orderDetail.id == null ? "purchase/orderdetail/save" : "purchase/orderdetail/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.orderDetail),
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
				    url: baseURL + "purchase/orderdetail/delete",
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
			$.get(baseURL + "purchase/orderdetail/info/"+id, function(r){
                vm.orderDetail = r.orderDetail;
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