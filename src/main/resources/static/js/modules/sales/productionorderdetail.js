$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sales/productionorderdetail/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true },
			{ label: '生产订单ID', name: 'productionOrderId', index: 'PRODUCTION_ORDER_ID', width: 80 }, 			
			{ label: '生产订单编号', name: 'productionOrderNo', index: 'PRODUCTION_ORDER_NO', width: 80 }, 			
			{ label: '产品ID', name: 'prdId', index: 'PRD_ID', width: 80 }, 			
			{ label: '产品编号', name: 'prdNo', index: 'PRD_NO', width: 80 }, 			
			{ label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 80 }, 			
			{ label: '产品类型ID', name: 'prdTypeId', index: 'PRD_TYPE_ID', width: 80 }, 			
			{ label: '产品类型名称', name: 'prdTypeName', index: 'PRD_TYPE_NAME', width: 80 }, 			
			{ label: '需求数量', name: 'amount', index: 'AMOUNT', width: 80 }, 			
			{ label: '定价', name: 'price1', index: 'PRICE1', width: 80 }, 			
			{ label: '售价', name: 'price2', index: 'PRICE2', width: 80 }, 			
			{ label: '成本', name: 'cost', index: 'COST', width: 80 }, 			
			{ label: '预估收入', name: 'revenue', index: 'REVENUE', width: 80 }			
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
		productionOrderDetail: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.productionOrderDetail = {};
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
			var url = vm.productionOrderDetail.id == null ? "sales/productionorderdetail/save" : "sales/productionorderdetail/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.productionOrderDetail),
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
				    url: baseURL + "sales/productionorderdetail/delete",
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
			$.get(baseURL + "sales/productionorderdetail/info/"+id, function(r){
                vm.productionOrderDetail = r.productionOrderDetail;
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