$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'baseData/bomdetail/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '配方ID', name: 'bomId', index: 'bom_id', width: 80 }, 			
			{ label: '原料ID', name: 'mtrId', index: 'mtr_id', width: 80 }, 			
			{ label: '切割形状ID', name: 'mtrCutId', index: 'mtr_cut_id', width: 80 }, 			
			{ label: '毛重', name: 'grossWgt', index: 'gross_wgt', width: 80 }, 			
			{ label: '净重', name: 'netWgt', index: 'net_wgt', width: 80 }, 			
			{ label: '净得率', name: 'netRate', index: 'net_rate', width: 80 }, 			
			{ label: '熟重', name: 'modiWgt', index: 'modi_wgt', width: 80 }, 			
			{ label: '熟得率', name: 'modiRate', index: 'modi_rate', width: 80 }, 			
			{ label: '是否半成品', name: 'semiFinished', index: 'semi_finished', width: 80 }			
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
		bomDetail: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.bomDetail = {};
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
			var url = vm.bomDetail.id == null ? "baseData/bomdetail/save" : "baseData/bomdetail/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.bomDetail),
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
				    url: baseURL + "baseData/bomdetail/delete",
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
			$.get(baseURL + "baseData/bomdetail/info/"+id, function(r){
                vm.bomDetail = r.bomDetail;
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