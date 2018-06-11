$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    }

    $("#jqGrid").jqGrid({
        url: baseURL + 'storage/pdinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', key: true ,hidden:true},
			{ label: '盘点单号', name: 'pdNo', index: 'PD_NO', width: 80 }, 			
			{ label: '盘点类型', name: 'pdType', index: 'PD_TYPE', width: 80 ,formatter:function(value, options, row){//0-原料盘点，1-半成品盘点
                var msg = "";
                if(value == 0){
                    msg = '原料盘点';
                }else if(value == 1){
                    msg = '半成品盘点';
                }
                return msg;
            },unformat:function(value, options, row){
                if($.trim(value)=="原料盘点"){
                    return "0";
                }else if($.trim(value)=="半成品盘点"){
                    return "1";
                }
            }},
			{ label: '开始日期', name: 'pdStartDate', index: 'PD_START_DATE', width: 80 }, 			
			{ label: '截止日期', name: 'pdEndDate', index: 'PD_END_DATE', width: 80 }, 			
			{ label: '盘点机构ID(仓库、站点）', name: 'pdOrgId', index: 'PD_ORG_ID',hidden:true},
			{ label: '盘点机构', name: 'pdOrgId', index: 'PD_ORG_ID', width: 80 },
			{ label: '机构名称', name: 'pdOrgName', index: 'PD_ORG_NAME', width: 80 },
			{ label: '创建日期', name: 'createDate', index: 'CREATE_DATE', width: 80 },
			{ label: '创建人', name: 'createUser', index: 'CREATE_USER', width: 80 },
            { label: '状态', name: 'pdStatus', index: 'PD_STATUS', width: 80 ,formatter:function(value, options, row){//0-已删除，1-初始，2-已确认，3-已结转
                var msg = "";
                if(value == 0){
                    msg = '<p class="bg-danger">已删除</p>';
                }else if(value == 1){
                    msg = '<p class="bg-success">待确认</p>';
                }else if(value == 2){
                    msg = '<p class="bg-info">已确认</p>';
                }else if(value == 3){
                    msg = '<p class="bg-warning">已结转</p>';
                }
                return msg;
            },unformat:function(value, options, row){
                if($.trim(value)=="已删除"){
                    return "0";
                }else if($.trim(value)=="待确认"){
                    return "1";
                }else if($.trim(value)=="已确认"){
                    return "2";
                }else if($.trim(value)=="已结转"){
                    return "3";
                }
            }},
            { label: '操作', name: 'operation', index: 'operation', width: 150,formatter:function(value, options, row){

            }}
        ],
		viewrecords: true,
        height: "auto",
        rowNum: 9999999,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        // pager: "#jqGridPager",
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

    var newDate = new Date();
    var currentDate = newDate.toJSON();

    $("#pdStartDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        // initialDate:'2018-05-27',
        weekStart:1,
        endDate:new Date(currentDate)
    });
    $('#pdStartDate').datetimepicker().on('hide', function (ev) {
        var value = $("#pdStartDate").val();
        vm.pdInfo.pdStartDate = value;
    });

    $("#pdEndDate").datetimepicker({
        format: 'yyyy-mm-dd',
        language:'zh-CN',
        autoclose:true,
        minView:2,
        todayBtn:true,
        todayHighlight:true,
        // initialDate:'2018-05-27',
        weekStart:1,
        endDate:new Date(currentDate)
    });
    $('#pdEndDate').datetimepicker().on('hide', function (ev) {
        var value = $("#pdEndDate").val();
        vm.pdInfo.pdEndDate = value;
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
        orgArr:null,
		pdInfo: {}
	},
	methods: {
        createNewNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/createBillNo",
                data:"billType=4",//0-采购单，1-采购入库单，2-领料出库单，3-客户订单，4-盘点单
                success: function(r){
                    no = r.newBillNo;
                }
            });
            return no;
        },
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.pdInfo = {};
			var newNo = vm.createNewNo();
			vm.pdInfo.pdNo = newNo;
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
			var url = vm.pdInfo.id == null ? "storage/pdinfo/save" : "storage/pdinfo/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.pdInfo),
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
				    url: baseURL + "storage/pdinfo/delete",
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
			$.get(baseURL + "storage/pdinfo/info/"+id, function(r){
                vm.pdInfo = r.pdInfo;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
        initTypeInfoArr:function(parentId){
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_type_info",search:"PARENT_ID in("+parentId+")",returnField:"ID as value,TYPE_NAME as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        }

	}
});
vm.orgArr = vm.initTypeInfoArr('23,48');