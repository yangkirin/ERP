$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sales/customerprd/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true },
			{ label: '客户ID', name: 'customerId', index: 'CUSTOMER_ID', width: 80 }, 			
			{ label: '产品ID', name: 'prdId', index: 'PRD_ID', width: 80 }, 			
			{ label: '产品编号', name: 'prdNo', index: 'PRD_NO', width: 80 }, 			
			{ label: '产品售价', name: 'prdPrice', index: 'PRD_PRICE', width: 80 }, 			
			{ label: '标签规格', name: 'tagSpec', index: 'TAG_SPEC', width: 80 }, 			
			{ label: '标签编号', name: 'tagNo', index: 'TAG_NO', width: 80 }, 			
			{ label: '标签条码', name: 'tagCode', index: 'TAG_CODE', width: 80 }, 			
			{ label: '加热时长', name: 'tagPower', index: 'TAG_POWER', width: 80 }, 			
			{ label: '生产时间', name: 'tagProdTime', index: 'TAG_PROD_TIME', width: 80 }, 			
			{ label: '保质期', name: 'tagQgp', index: 'TAG_QGP', width: 80 }, 			
			{ label: '储存条件', name: 'tagStorage', index: 'TAG_STORAGE', width: 80 }, 			
			{ label: '净含量', name: 'tagNetwgt', index: 'TAG_NETWGT', width: 80 }, 			
			{ label: '标签价格', name: 'tagPrice', index: 'TAG_PRICE', width: 80 }, 			
			{ label: '地址', name: 'tagAddr', index: 'TAG_ADDR', width: 80 }, 			
			{ label: '产地', name: 'tagProdAddr', index: 'TAG_PROD_ADDR', width: 80 }, 			
			{ label: '制造商', name: 'tagManufacturer', index: 'TAG_MANUFACTURER', width: 80 }, 			
			{ label: '联系电话', name: 'tagLinkphone', index: 'TAG_LINKPHONE', width: 80 }, 			
			{ label: '配料表', name: 'tagBurdenList', index: 'TAG_BURDEN_LIST', width: 80 }, 			
			{ label: '许可编号', name: 'tagLicenseNo', index: 'TAG_LICENSE_NO', width: 80 }, 			
			{ label: '状态', name: 'status', index: 'STATUS', width: 80 }, 			
			{ label: '备注', name: 'remark', index: 'REMARK', width: 80 }			
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
		customerPrd: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.customerPrd = {};
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
			var url = vm.customerPrd.id == null ? "sales/customerprd/save" : "sales/customerprd/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.customerPrd),
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
				    url: baseURL + "sales/customerprd/delete",
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
			$.get(baseURL + "sales/customerprd/info/"+id, function(r){
                vm.customerPrd = r.customerPrd;
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