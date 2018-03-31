$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'baseData/prdncinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '产品ID', name: 'prdCode', index: 'PRD_CODE', width: 80 }, 			
			{ label: '能量／千焦', name: 'energy', index: 'ENERGY', width: 80 }, 			
			{ label: '能量／NRV%', name: 'energyNrv', index: 'ENERGY_NRV', width: 80 }, 			
			{ label: '蛋白质／克', name: 'protein', index: 'PROTEIN', width: 80 }, 			
			{ label: '蛋白质／NRV%', name: 'proteinNrv', index: 'PROTEIN_NRV', width: 80 }, 			
			{ label: '脂肪／克', name: 'fat', index: 'FAT', width: 80 }, 			
			{ label: '脂肪／NRV%', name: 'fatNrv', index: 'FAT_NRV', width: 80 }, 			
			{ label: '碳水化合物／克', name: 'carbohydrate', index: 'CARBOHYDRATE', width: 80 }, 			
			{ label: '碳水化合物／NRV%', name: 'carbohydrateNrv', index: 'CARBOHYDRATE_NRV', width: 80 }, 			
			{ label: '钠／毫克', name: 'sodium', index: 'SODIUM', width: 80 }, 			
			{ label: '钠／NRV%', name: 'sodiumNrv', index: 'SODIUM_NRV', width: 80 }, 			
			{ label: '备注', name: 'remark', index: 'REMARK', width: 80 }, 			
			{ label: '创建者', name: 'createUser', index: 'CREATE_USER', width: 80 }, 			
			{ label: '创建日期', name: 'createDate', index: 'CREATE_DATE', width: 80 }, 			
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
		prdNcInfo: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.prdNcInfo = {};
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
			var url = vm.prdNcInfo.id == null ? "baseData/prdncinfo/save" : "baseData/prdncinfo/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.prdNcInfo),
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
				    url: baseURL + "baseData/prdncinfo/delete",
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
			$.get(baseURL + "baseData/prdncinfo/info/"+id, function(r){
                vm.prdNcInfo = r.prdNcInfo;
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