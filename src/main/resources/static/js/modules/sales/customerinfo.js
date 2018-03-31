$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sales/customerinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true,hidden:true },
			{ label: '客户名称', name: 'customerName', index: 'CUSTOMER_NAME', width: 80 }, 			
			{ label: '客户代码', name: 'customerCode', index: 'CUSTOMER_CODE', width: 80 }, 			
			{ label: '拼音码', name: 'customerPy', index: 'CUSTOMER_PY', width: 80 }, 			
			{ label: '简称', name: 'customerShortName', index: 'CUSTOMER_SHORT_NAME', width: 80 }, 			
			{ label: '联系人', name: 'linkman', index: 'LINKMAN', width: 80 }, 			
			{ label: '联系电话', name: 'linkphone', index: 'LINKPHONE', width: 80 }, 			
			{ label: '地址', name: 'address', index: 'ADDRESS', width: 80 }, 			
			{ label: '状态', name: 'status', index: 'STATUS', width: 80 ,formatter: function(value, options, row){
                return value === 0 ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            }},
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

    $("#jqGridPrd").jqGrid({
        url: baseURL + 'sales/customerprd/list',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '客户ID', name: 'customerId', index: 'CUSTOMER_ID', width: 80 ,hidden:true},
            { label: '产品ID', name: 'prdId', index: 'PRD_ID', width: 80 ,hidden:true},
            { label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 80 },
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
            { label: '地址', name: 'tagAddr', index: 'TAG_ADDR', width: 80},
            { label: '产地', name: 'tagProdAddr', index: 'TAG_PROD_ADDR', width: 80 },
            { label: '制造商', name: 'tagManufacturer', index: 'TAG_MANUFACTURER', width: 80 ,hidden:true},
            { label: '联系电话', name: 'tagLinkphone', index: 'TAG_LINKPHONE', width: 80 ,hidden:true},
            { label: '配料表', name: 'tagBurdenList', index: 'TAG_BURDEN_LIST', width: 80 ,hidden:true},
            { label: '许可编号', name: 'tagLicenseNo', index: 'TAG_LICENSE_NO', width: 80 ,hidden:true},
            { label: '状态', name: 'status', index: 'STATUS', width: 80 ,hidden:true},
            { label: '备注', name: 'remark', index: 'REMARK', width: 80 ,hidden:true}
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPagerPrd",
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
            $("#jqGridPrd").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
        showForm:false,
        showListPrd:false,
        showFormPrd:false,
		title: null,
		customerInfo: {},
        customerPrd:{},
        prdData:{}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.showForm = true;
			vm.showListPrd = false;
			vm.showFormPrd = false;
			vm.title = "新增";
			vm.customerInfo = {
                status : '1',
                customerCode:vm.createNewNo()
			};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
			vm.showForm = true;
            vm.showListPrd = false;
            vm.showFormPrd = false;
            vm.title = "修改";
            
            vm.getInfo(id);
		},
		saveOrUpdate: function (event) {
			var url = vm.customerInfo.id == null ? "sales/customerinfo/save" : "sales/customerinfo/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.customerInfo),
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
				    url: baseURL + "sales/customerinfo/delete",
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
			$.get(baseURL + "sales/customerinfo/info/"+id, function(r){
                vm.customerInfo = r.customerInfo;
                console.log(vm.customerInfo);
                if(vm.customerInfo.customerCode == null || vm.customerInfo.customerCode == ''){
                    vm.customerInfo.customerCode = vm.createNewNo();
                }
            });


		},
		reload: function (event) {
			vm.showList = true;
			vm.showForm = false;
            vm.showListPrd = false;
            vm.showFormPrd = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
        getPinying:function(event){
            var word = vm.customerInfo.customerName;
            var py = '';
            if(typeof(word)!="undefined"){
                $.ajax({
                    url: baseURL + "common/commonUtil/word2pinying/"+word,
                    success: function(r){
                        vm.customerInfo.customerPy = r.pinying;
                        $('#customerPy').val(r.pinying);
                    }
                });
            }
        },
        prdconfig:function(){
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                return ;
            }
            vm.showList = false;
			vm.showForm = false;
			vm.showListPrd = true;
            vm.showFormPrd = false;
            $("#jqGridPrd").jqGrid('setGridParam',{
                postData:{'customerId': id}
            }).trigger("reloadGrid");
		},
		addPrd:function(){
            vm.customerPrd={};
            vm.title = "新增";
            vm.showList = false;
            vm.showForm = false;
            vm.showListPrd = false;
            vm.showFormPrd = true;
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');//客户ID
			vm.customerPrd.customerId = id;
			vm.getSelectPrdData();
		},
		updatePrd:function(){
            vm.customerPrd={};
            vm.title = "修改";
            vm.showList = false;
            vm.showForm = false;
            vm.showListPrd = false;
            vm.showFormPrd = true;
            var id = $("#jqGridPrd").jqGrid('getGridParam','selrow');//产品ID
            vm.customerPrd.id = id;
            vm.getSelectPrdData();
            vm.getInfoPrd(id);
		},
		delPrd:function(){
            // var id = $("#jqGridPrd").jqGrid('getGridParam','selrow');//产品ID
            var ids = $("#jqGridPrd").jqGrid('getGridParam',"selarrrow");
            if(ids == null){
                return ;
            }
            confirm('确定要删除选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: baseURL + "sales/customerprd/delete/",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function(r){
                        if(r.code == 0){
                            alert('操作成功', function(index){
                                // $("#jqGridMtr").trigger("reloadGrid");
                                vm.reloadPrd();
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            });
		},
        getInfoPrd: function(id){
            $.get(baseURL + "sales/customerprd/info/"+id, function(r){
                vm.customerPrd = r.customerPrd;
            });
        },
        saveOrUpdatePrd: function (event) {
            var url = vm.customerPrd.id == null ? "sales/customerprd/save" : "sales/customerprd/update";
            $.ajax({
                type: "POST",
                url: baseURL + url,
                contentType: "application/json",
                data: JSON.stringify(vm.customerPrd),
                success: function(r){
                    if(r.code === 0){
                        alert('操作成功', function(index){
                            vm.reloadPrd();
                        });
                    }else{
                        alert(r.msg);
                    }
                }
            });
        },
        reloadPrd:function(){
            vm.prdconfig();
        },
        getSelectPrdData:function(){
            $('#prdName').typeahead({
                source: function (query, process) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "common/commonUtil/getTableData",
                        data:"tableName=PRD_DATA&fieldName=PRD_NAME:PRD_PY&searchWord="+query,
                        success: function (r) {
                            var resultList = r.data.map(function (item) {
                                var aItem = {id:item.id,py: item.PRD_PY, name: item.PRD_NAME,code:item.PRD_CODE};
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
                    //完善其它信息
                    var item = JSON.parse(obj);
                    $.get(baseURL + "baseData/prddata/info/"+item.id, function(r){
                        vm.prdData = r.prdData;
                        vm.customerPrd.prdId = item.id;
                        vm.customerPrd.prdName = item.name;
                        vm.customerPrd.prdNo = r.prdData.prdCode;
                        vm.customerPrd.prdPrice = r.prdData.referencePrice;

                        $('#prdNo').val(vm.customerPrd.prdNo);
                        $('#prdPrice').val(vm.customerPrd.prdPrice);
                    });
                    return item.name;
                },
                afterSelect:function(obj){
                    console.log(vm.customerPrd);

                    // vm.initSupplierArr(vm.procurementDetail.mtrId);
                }
            });
        },
        initPrdInfo:function(){
            // vm.customerPrd
        },
        createNewNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/getTableNewNo",
                data:"tableName=TB_CUSTOMER_INFO&noField=CUSTOMER_CODE&length=4",
                success: function(r){
                    no = r.newNo;
                }
            });
            return no;
        }
	}
});