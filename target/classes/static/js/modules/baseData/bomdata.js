$(function () {
    $("#jqGridBom").jqGrid({
        url: baseURL + 'baseData/bomdata/list',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
            { label: '产品ID', name: 'prdId', index: 'PRD_ID', width: 80 ,hidden:true},
            { label: '产品类别', name: 'typeId', index: 'TYPE_ID', width: 80 ,hidden:true},
            { label: '产品类别', name: 'typeName', index: 'TYPE_NAME', width: 80 },
            { label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 80 },
            { label: '成本率', name: 'costRate', index: 'COST_RATE', width: 80 }

            // { label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80 },
            // { label: '切割形状ID', name: 'mtrCutId', index: 'MTR_CUT_ID', width: 80 },
            // { label: '原料类别', name: 'mtrTypeId', index: 'MTR_TYPE_ID', width: 80 },
            // { label: '领料站点', name: 'takeStn', index: 'TAKE_STN', width: 80 },
            // { label: '是否半成品', name: 'semiFinished', index: 'SEMI_FINISHED', width: 80 },
            // { label: '材料毛重', name: 'grossWgt', index: 'GROSS_WGT', width: 80 },
            // { label: '净重', name: 'netWgt', index: 'NET_WGT', width: 80 },
            // { label: '净得率', name: 'netRate', index: 'NET_RATE', width: 80 },
            // { label: '熟重', name: 'modiWgt', index: 'MODI_WGT', width: 80 },
            // { label: '熟得率', name: 'modiRate', index: 'MODI_RATE', width: 80 },
            // { label: '备注', name: 'remark', index: 'REMARK', width: 80 },
            // { label: '创建者', name: 'createUser', index: 'CREATE_USER', width: 80 },
            // { label: '创建日期', name: 'createDate', index: 'CREATE_DATE', width: 80 },
            // { label: '状态', name: 'status', index: 'STATUS', width: 80 }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: false,
        rownumWidth: 25,
        autowidth:true,
        multiselect: false,
        pager: "#jqGridPagerBom",
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
        onSelectRow:function(id){

        },
        gridComplete:function(){
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    $("#jqGrid").jqGrid({
        url: baseURL + 'baseData/prddata/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
			{ label: '产品ID', name: 'prdId', index: 'PRD_ID', width: 80 ,hidden:true},
            { label: '产品类别', name: 'typeId', index: 'TYPE_ID', width: 80 ,hidden:true},
            { label: '产品类别', name: 'typeName', index: 'TYPE_NAME', width: 80 },
            { label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 80 },
            { label: '成本率', name: 'costRate', index: 'COST_RATE', width: 80 }

			// { label: '原料ID', name: 'mtrId', index: 'MTR_ID', width: 80 },
			// { label: '切割形状ID', name: 'mtrCutId', index: 'MTR_CUT_ID', width: 80 },
			// { label: '原料类别', name: 'mtrTypeId', index: 'MTR_TYPE_ID', width: 80 },
			// { label: '领料站点', name: 'takeStn', index: 'TAKE_STN', width: 80 },
			// { label: '是否半成品', name: 'semiFinished', index: 'SEMI_FINISHED', width: 80 },
			// { label: '材料毛重', name: 'grossWgt', index: 'GROSS_WGT', width: 80 },
			// { label: '净重', name: 'netWgt', index: 'NET_WGT', width: 80 },
			// { label: '净得率', name: 'netRate', index: 'NET_RATE', width: 80 },
			// { label: '熟重', name: 'modiWgt', index: 'MODI_WGT', width: 80 },
			// { label: '熟得率', name: 'modiRate', index: 'MODI_RATE', width: 80 },
			// { label: '备注', name: 'remark', index: 'REMARK', width: 80 },
			// { label: '创建者', name: 'createUser', index: 'CREATE_USER', width: 80 },
			// { label: '创建日期', name: 'createDate', index: 'CREATE_DATE', width: 80 },
			// { label: '状态', name: 'status', index: 'STATUS', width: 80 }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: false,
        rownumWidth: 25, 
        autowidth:true,
        multiselect: false,
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
        onSelectRow:function(id){
            $.get(baseURL + "baseData/prddata/info/"+id, function(r){
                vm.prdData = r.prdData;
            });

            $("#bomGrid").jqGrid('setGridParam',{datatype: "json",
                postData:{'prdId': id}
            }).trigger("reloadGrid");
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });

    //配方明细Grid
    $("#bomGrid").jqGrid({
        url: baseURL + 'baseData/bomdata/list',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
            { label: '类别', name: 'mtrTypeIdName', index: 'MTR_TYPE_ID', width: 80 ,hidden:false},
            { label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 80 ,hidden:false},
            { label: '切割形状', name: 'mtrCutName', index: 'MTR_CUT_NAME', width: 80 },
            { label: '净菜', name: 'netWgt', index: 'NET_WGT', width: 80 },
            { label: '净菜得率', name: 'netRate', index: 'NET_RATE', width: 80 },
            { label: '毛菜', name: 'grossWgt', index: 'GROSS_WGT', width: 80 },
            { label: '熟菜', name: 'modiWgt', index: 'MODI_WGT', width: 80 },
            { label: '熟菜得率', name: 'modiRate', index: 'MODI_RATE', width: 80 },
            { label: '单价', name: 'price', index: 'PRICE', width: 80 },
            { label: '成本', name: 'cost', index: 'COST', width: 80 },
            { label: '成本率', name: 'costRate', index: 'COST_RATE', width: 80 },
            { label: '备注', name: 'remark', index: 'REMARK', width: 80 }

        ],
        viewrecords: true,
        height: 160,
        rownumbers: false,
        rownumWidth: 25,
        autowidth:true,
        multiselect: false,
        pager: "#bomGridPager",
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
            $("#bomGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    $('#bomGrid').navGrid('#bomGridPager',
        { edit: false, add: false, del: false, search: false, refresh: false, view: false, position: "left", cloneToTop: false });

    var addId;
    var operation = '';

    $('#bomGrid').navButtonAdd('#bomGridPager',{
        id:"save_btn",
        buttonicon: "ui-icon-add",
        caption: "<a class=\"btn btn-primary\">新增</a>",
        position: "last",
        onClickButton: function(){
            if(isBlank(vm.prdData.id)){
                alert("请选择产品！");
                return;
            }
			vm.add();
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		bomData: {},
        typeInfo: {
            parentName:null,
            parentId:0
        },
		q:{
            prdType:null,
            prdTypeName:null,
            orderType:null,
            orderTypeName:null,
            prdCode:null,
            prdName:null,
            status:null
		},
        prdData:{}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			// vm.showList = false;
			// vm.title = "新增";
			// vm.bomData = {};

            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "添加原料",
                area: ['750px', '450px'],
                shadeClose: false,
                content: jQuery("#infoLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {
                    var url = "baseData/mtrdata/save";
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.bomData),
                        success: function(r){
                            if(r.code === 0){
                                alert('操作成功', function(index){
                                    layer.close(num);
                                    vm.reload();
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                },
                btn2:function(event){
                    vm.bomData = {};
                }
            });

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
			var url = vm.bomData.id == null ? "baseData/bomdata/save" : "baseData/bomdata/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.bomData),
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
				    url: baseURL + "baseData/bomdata/delete",
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
			$.get(baseURL + "baseData/prddata/info/"+id, function(r){
                vm.prdData = r.prdData;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
        getFieldData:function(){
            var query = $('#searchName').val();
            $.ajax({
                type:"POST",
                url: baseURL + "common/commonUtil/getTableData",
                data:"tableName=PRD_DATA&fieldName=PRD_NAME:PRD_PY&searchWord="+query,
                success: function(r){
                    var resultList = r.data.map(function (item) {
                        var aItem = {py: item.PRD_PY, name: item.PRD_NAME};
                        return JSON.stringify(aItem);
                    });
                    dataSource = resultList;
                    $('#searchName').typeahead({
                        source:dataSource,
                        highlighter: function (obj) {
                            var item = JSON.parse(obj);
                            var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
                            return item.name.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                                return '<strong>' + match + '</strong>'
                            });
                        },
                        updater: function (obj) {
                            var item = JSON.parse(obj);
                            vm.q.prdName = item.name;
                            return item.name;
                        }
                    });
                }
            });
        },
        getTypeInfoTree:function(){
            //加载树
            $.ajax({
                type: "POST",
                url: baseURL + "baseData/typeinfo/select",
                success: function(r){
                    ztree = $.fn.zTree.init($("#typeInfoTree"), setting, r.typeInfoList);
                    var node = ztree.getNodeByParam("id", vm.typeInfo.parentId);
                    ztree.selectNode(node);
                    vm.q.typeName = node.typeName;
                }
            });

        },
        typeInfoTree: function(opeation){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择类别",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#typeInfoLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    if(opeation == 'prdTypeSearch'){
                        vm.q.prdType = node[0].id;
                        vm.q.prdTypeName = node[0].typeName;
                    }else if(opeation == 'orderTypeSearch'){
                        vm.q.orderType = node[0].id;
                        vm.q.orderTypeName = node[0].typeName;
                    }else if(opeation == 'addTypeId'){
                        // vm.addPrdData.typeId = node[0].id;
                        // vm.addPrdData.typeIdName = node[0].typeName;
                        vm.createNewNo(node[0].id);
                    }else if(opeation == 'addPdcStn'){
                        // vm.addPrdData.pdcStn = node[0].id;
                        // vm.addPrdData.pdcStnName = node[0].typeName;
                    }
                    layer.close(index);
                },
                btn2:function(event){
                    // vm.addPrdData = {};
                }
            });
        }
	}
});

var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url:"nourl",
            name:"typeName"
        }
    }
};

var ztree;

vm.getTypeInfoTree();
var dataSource = ["a","b","1","测试","dd","10a","a测","yi","yidaiyilu","shuohua","1touzhu"];
vm.getFieldData();