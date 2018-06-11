$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/pddetail/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true },
			{ label: '', name: 'pdInfoId', index: 'PD_INFO_ID', width: 80 }, 			
			{ label: '物料ID', name: 'mtrId', index: 'MTR_ID', width: 80 }, 			
			{ label: '物料编号', name: 'mtrCode', index: 'MTR_CODE', width: 80 }, 			
			{ label: '上期结余数量', name: 'lastCount', index: 'LAST_COUNT', width: 80 }, 			
			{ label: '上期结余金额', name: 'lastAmt', index: 'LAST_AMT', width: 80 }, 			
			{ label: '本期盘点数量', name: 'currentCount', index: 'CURRENT_COUNT', width: 80 }, 			
			{ label: '本期盘点金额', name: 'currentAmt', index: 'CURRENT_AMT', width: 80 }, 			
			{ label: '本期入库数量', name: 'currentIn', index: 'CURRENT_IN', width: 80 }, 			
			{ label: '本期出库数量', name: 'currentOut', index: 'CURRENT_OUT', width: 80 }, 			
			{ label: '实际盘点数量', name: 'realCount', index: 'REAL_COUNT', width: 80 }, 			
			{ label: '实际盘点金额', name: 'realAmtlossCount', index: 'REAL_AMTLOSS_COUNT', width: 80 }, 			
			{ label: '盘盈数量', name: 'profttCount', index: 'PROFTT_COUNT', width: 80 }, 			
			{ label: '盘亏数量', name: 'lossCount', index: 'LOSS_COUNT', width: 80 }			
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
		pdDetail: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.pdDetail = {};
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
			var url = vm.pdDetail.id == null ? "storage/pddetail/save" : "storage/pddetail/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.pdDetail),
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
				    url: baseURL + "storage/pddetail/delete",
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
			$.get(baseURL + "storage/pddetail/info/"+id, function(r){
                vm.pdDetail = r.pdDetail;
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