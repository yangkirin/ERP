$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'purchase/procurementplan/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
			{ label: '采购计划编号', name: 'procurementNo', index: 'PROCUREMENT_NO', width: 80 }, 			
			{ label: '期望到货日期', name: 'expectDate', index: 'EXPECT_DATE', width: 80 ,formatter:function(value,options,row){
                var crtTime = new Date(value);
                return dateFtt("yyyy-MM-dd",crtTime);
            }},
			{ label: '制单日期', name: 'createDate', index: 'CREATE_DATE', width: 80 }, 			
			{ label: '制单人', name: 'createUser', index: 'CREATE_USER', width: 80 }, 			
			{ label: '发送日期', name: 'sendDate', index: 'SEND_DATE', width: 80 }, 			
			{ label: '确认人', name: 'confirmUser', index: 'CONFIRM_USER', width: 80 }, 			
			{ label: '状态', name: 'status', index: 'STATUS', width: 80 ,formatter: function(value, options, row){
                return value === 0 ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            }},
            { label: '操作', name: 'oper', index: 'SPEC', width: 150,formatter:function(value, options, row){
                return "<button type='button' class='btn btn-primary btn-xs' onclick='showDetail("+row.id+")'>明&nbsp;&nbsp;细</button>";
            }}
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        // multiselect: true,
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

    $("#jqGridMtr").jqGrid({
        url: baseURL + 'purchase/procurementdetail/list',
		// editurl:baseURL + 'purchase/procurementdetail/saveOrUpdate',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '计划ID', name: 'procurementId', index: 'PROCUREMENT_ID', width: 80,hidden:true },
            { label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80 ,hidden:true},
            { label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 150 },
            { label: '原料代码', name: 'mtrCode', index: 'MTR_CODE', width: 80 },
            { label: '供应商ID', name: 'supplierId', index: 'SUPPLIER_ID', width: 350 ,hidden:true},
            { label: '供应商名称', name: 'supplierName', index: 'SUPPLIER_NAME', width: 150,editable:true},
            { label: '供应商编码', name: 'supplierCode', index: 'SUPPLIER_CODE', width: 80 },
            { label: '采购编码', name: 'purchaseNo', index: 'PURCHASE_NO', width: 80 },
            { label: '采购单位', name: 'unit', index: 'UNIT', width: 60 },
            { label: '转换率', name: 'rate', index: 'RATE', width: 60 },
            { label: '采购数量', name: 'count', index: 'COUNT', width: 80 ,editable:true},
            { label: '规格', name: 'spec', index: 'SPEC', width: 80 }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 50,
        rowList : [50,100,150],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        // multiselect: true,
        pager: "#jqGridPagerMtr",
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
            $("#jqGridMtr").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    $('#jqGridMtr').navGrid('#jqGridPagerMtr',
        { edit: false, add: false, del: false, search: false, refresh: false, view: false, position: "left", cloneToTop: false });

    var newDate = new Date();
    var currentDate = newDate.toJSON();

    $(".form_datetime").datetimepicker({
		format: 'yyyy-mm-dd',
		language:'zh-CN',
		autoclose:true,
		minView:2,
		todayBtn:true,
		todayHighlight:true,
		weekStart:1,
		startDate:new Date(currentDate)
	});
});

function showDetail(id){
    var rowId = $('#jqGrid').jqGrid("getGridParam","selrow");
    if(!rowId){
        rowId = id;
    }
    vm.showList = false;
    vm.showForm = false;
    vm.showListMtr = true;
    var page = $("#jqGridMtr").jqGrid('getGridParam','page');
    $("#jqGridMtr").jqGrid('setGridParam',{
        postData:{'procurementId': rowId},
    }).trigger("reloadGrid");
    vm.procurementDetail={};
}

function editOrsaveMtr(event,rowId){
    // console.log($(event).text().replace(/\s+/g, ""));
    var rowData = $('#jqGridMtr').jqGrid("getRowData",rowId);
    vm.procurementDetail.id=rowData.id;
    vm.procurementDetail.procurementId = rowData.procurementId;
    vm.procurementDetail.mtrId = rowData.mtrId;
    vm.procurementDetail.supplierId = rowData.supplierId;
    vm.procurementDetail.unit = rowData.unit;
    vm.procurementDetail.rate = rowData.rate;
    vm.procurementDetail.count = $('#'+rowId+'_count').val();
    vm.procurementDetail.spec = rowData.spec;
    var currentText = $(event).text().replace(/\s+/g, "");
    if(currentText == '修改'){
        $(event).text('保  存');
        $("#jqGridMtr").jqGrid("editRow",rowId,true);

	}else{
		$('#jqGridMtr').jqGrid('saveRow',rowId,{
			mtype: "POST",
			extraparam:{oper:'edit',detail:JSON.stringify(vm.procurementDetail)}
		});
        $(event).text('修  改');
	}

}


function deleteMtr(rowId){
    alert('开始删除行：'+rowId);
    $('#jqGridMtr').jqGrid('saveRow',rowId);
}

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
        showForm:false,
        showListMtr:false,
		title: null,
		procurementPlan: {
        },
        procurementDetail:{
            id:null,
            procurementId:null,
            mtrId:null,
            mtrName:null,
            mtrCode:null,
            purchaseNo:null,
            supplierId:null,
            supplierName:null,
            supplierCode:null,
            unit:null,
            rate:null,
            count:null,
            spec:null
        },
        supplierArr:null
	},
	methods: {
	    supplierSelected:function(){
            var mtrId = vm.procurementDetail.mtrId;
            var supplierId = vm.procurementDetail.supplierId;
            if(mtrId && supplierId){
                $.ajax({
                    type:"POST",
                    async:false,
                    url: baseURL + "purchase/suppiermtr/getSuppierMtrEntity",
                    data:"mtrId="+mtrId+"&supplierId="+supplierId,
                    success: function(r){
                        vm.procurementDetail.supplierCode = r.data[0].suppierCode;
                        vm.procurementDetail.purchaseNo = r.data[0].purchaseNo;
                        vm.procurementDetail.supplierId = r.data[0].suppierId;
                        $('#supplierCode').val(r.data[0].suppierCode);
                        $('#purchaseNo').val(r.data[0].purchaseNo);
                    }
                });
            }

        },
		query: function () {
			vm.reload();
		},
		createNewNo:function(){
			var no = '';
			$.ajax({
				type:"POST",
				async:false,
				url: baseURL + "common/commonUtil/getTableNewNo",
				data:"tableName=tb_procurement_plan&noField=PROCUREMENT_NO",
				success: function(r){
                    no = r.newNo;
				}
			});
			return no;
		},
		add: function(){
			vm.showList = false;
			vm.showForm = true;
			vm.title = "新增";
			vm.procurementPlan = {
				status:'1',
                procurementNo:vm.createNewNo()
			};
            $("#jqGridMtr").jqGrid('setGridParam',{
                postData:{'procurementId': 0},
            }).trigger("reloadGrid");
		},
		update: function (event) {
			var id = getSelectedRow();
            var id = $('#jqGrid').jqGrid("getGridParam","selrow");
			if(id == null){
				return ;
			}
			vm.showList = false;
			vm.showForm = true;
            vm.title = "修改";
            vm.getInfo(id);
            // $("#jqGridMtr").jqGrid('setGridParam',{
            //     postData:{'procurementId': id},
            // }).trigger("reloadGrid");
		},
		saveOrUpdate: function (event) {
			var url = vm.procurementPlan.id == null ? "purchase/procurementplan/save" : "purchase/procurementplan/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.procurementPlan),
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
				    url: baseURL + "purchase/procurementplan/delete",
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
			$.get(baseURL + "purchase/procurementplan/info/"+id, function(r){
                vm.procurementPlan = r.procurementPlan;
            });
		},
		reload: function (event) {
			vm.showList = true;
			vm.showForm = false;
			vm.showListMtr = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
			vm.procurementPlan={};
		},
        formatTime:function(row,column){
		    console.log(row);
		    console.log(column);
        },
        reloadMtr: function (event) {
			vm.showList = false;
			vm.showForm = false;
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                return ;
            }
			var page = $("#jqGridMtr").jqGrid('getGridParam','page');
            $("#jqGridMtr").jqGrid('setGridParam',{
                postData:{'procurementId': id},
            }).trigger("reloadGrid");
            vm.procurementDetail={};
		},
        addMtr:function(){
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                return ;
            }
            vm.showList = false;
            vm.showForm = false;
            vm.showListMtr = true;

            vm.getInfo(id);
            vm.getFieldData();

            vm.procurementDetail.procurementId = id;

            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "新增原料",
                area: ['700px', '480px'],
                shadeClose: false,
                content: jQuery("#detailLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {
                    var url = "purchase/procurementdetail/save";
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.procurementDetail),
                        success: function(r){
                            if(r.code === 0){
                                alert('操作成功', function(index){
                                    layer.close(num);
                                    vm.reloadMtr();
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                },
                btn2:function(event){
                    vm.procurementDetail = {};
                }
            });
		},
        editMtr:function(){
            var id = $("#jqGridMtr").jqGrid('getGridParam','selrow');

            if(id == null){
                return ;
            }
            $.get(baseURL + "purchase/procurementdetail/info/"+id, function(r){
                vm.procurementDetail = r.procurementDetail;
                vm.initSupplierArr(r.procurementDetail.mtrId);
            });


            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "编辑原料",
                area: ['700px', '480px'],
                shadeClose: false,
                content: jQuery("#detailLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {
                    var url = "purchase/procurementdetail/update";
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.procurementDetail),
                        success: function(r){
                            if(r.code === 0){
                                alert('操作成功', function(index){
                                    layer.close(num);
                                    vm.reloadMtr();
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                },
                btn2:function(event){
                    vm.procurementDetail = {};
                }
            });
        },
        getFieldData:function(){
            $('#mtrName').typeahead({
                source: function (query, process) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "common/commonUtil/getTableData",
                        data: "tableName=MTR_DATA&fieldName=MTR_NAME:MTR_PY&searchWord=" + query,
                        success: function (r) {
                            var resultList = r.data.map(function (item) {
                                var aItem = {id: item.id, py: item.MTR_PY, name: item.MTR_NAME};
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
                    vm.procurementDetail.mtrId=item.id;
                    vm.procurementDetail.mtrName=item.name;

                    $.get(baseURL + "baseData/mtrdata/info/"+vm.procurementDetail.mtrId, function(r){
                        // vm.procurementDetail.mtrName=r.mtrData.mtrName;
                        vm.procurementDetail.mtrCode=r.mtrData.mtrCode;
                        vm.procurementDetail.unit = r.mtrData.purchaseUnitName;
                        vm.procurementDetail.rate = r.mtrData.purchaseRate;

                        $('#mtrCode').val(r.mtrData.mtrCode);
                        $('#unit').val(r.mtrData.purchaseUnitName);
                        $('#rate').val(r.mtrData.purchaseRate);
                    });

                    return item.name;
                },
                afterSelect:function(obj){
                    vm.initSupplierArr(vm.procurementDetail.mtrId);
                }
            });
            // vm.initSupplierArr(vm.procurementDetail.mtrId);
        },
        initSupplierArr:function(mtrId){
            $.get(baseURL + "purchase/suppiermtr/getCommbox/"+mtrId, function(r){
                vm.supplierArr = r.data;
            });
        },
        createOrder:function(){
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            alert(id);
            $.get(baseURL + "purchase/procurementplan/createOrder/"+id, function(r){
                console.log(r);
                if(r.code === 0){
                    alert('操作成功');
                }else{
                    alert(r.msg);
                }
            });
        }

	}
});