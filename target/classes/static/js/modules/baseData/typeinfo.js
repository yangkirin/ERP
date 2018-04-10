/*
$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'baseData/typeinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '类型编码', name: 'typeCode', index: 'TYPE_CODE', width: 80 }, 			
			{ label: '类型名称', name: 'typeName', index: 'TYPE_NAME', width: 80 }, 			
			{ label: '拼音码', name: 'typePy', index: 'TYPE_PY', width: 80 }, 			
			{ label: '状态', name: 'status', index: 'STATUS', width: 80 ,formatter: function(value, options, row){
                return value === 0 ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            }}
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
*/

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

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			searchWord:null
		},
		showList: true,
		title: null,
		typeInfo: {
            typePy:'',
			parentName:null,
			parentId:0
		}
	},
	methods: {
		getTypeInfoTree:function(){
            //加载树
            $.ajax({
                type: "POST",
                url: baseURL + "baseData/typeinfo/select",
                data:{parentId:null},
                success: function(r){
                    ztree = $.fn.zTree.init($("#typeInfoTree"), setting, r.typeInfoList);
                    var node = ztree.getNodeByParam("id", vm.typeInfo.parentId);
                    ztree.selectNode(node);
                    vm.typeInfo.parentName = node.typeName;
				}
			});

		},
        typeInfoTree: function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择菜单",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#typeInfoLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    //选择上级菜单
                    vm.typeInfo.parentId = node[0].id;
                    vm.typeInfo.parentName = node[0].typeName;
                    vm.getMaxNo(node[0].id);
                    layer.close(index);
                }
            });
        },
		search: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
            vm.typeInfo = {
                parentName:null,
                parentId:0,
                status:'1'
            };
			vm.getTypeInfoTree();
			//当前一级分类最大编码
            vm.getMaxNo(0);
		},
		update: function (event) {
			var id = getTypeInfoId();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id);
            vm.getTypeInfoTree();
		},
		saveOrUpdate: function (event) {
			var url = vm.typeInfo.id == null ? "baseData/typeinfo/save" : "baseData/typeinfo/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.typeInfo),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
            var id = getTypeInfoId();
            if(id == null){
                return ;
            }
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "baseData/typeinfo/delete",
					data:"typeInfoId="+id,
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
                                vm.reload();
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get(baseURL + "baseData/typeinfo/info/"+id, function(r){
                vm.typeInfo = r.typeInfo;
            });
		},
		reload: function (event) {
			vm.showList = true;
            TypeInfo.table.data = {'searchWord':'03'};
            TypeInfo.table.refresh();
		},
		getPinying:function(){
			var word = this.typeInfo.typeName;
            if(typeof(word)!="undefined"){
                $.ajax({
                    url: baseURL + "common/commonUtil/word2pinying/"+word,
                    success: function(r){
                        $("#typePy").val(r.pinying);
                        vm.typeInfo.typePy = r.pinying;
                    }
                });
			}
		},
        getMaxNo:function(parentId){
            $.ajax({
                url:baseURL + "baseData/typeinfo/createMaxNo/"+parentId,
                async:false,
                success:function(r){
                    vm.typeInfo.typeCode = r.maxNo;
                    $('#typeCode').val(r.maxNo);
                }
            });
        }
	}
});


var TypeInfo = {
    id: "typeTable",
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
TypeInfo.initColumn = function () {
    var columns = [
        {field: 'selectItem', radio: true},
        {title: '类型名称', field: 'typeName', align: 'center', valign: 'middle', sortable: true, width: '180px'},
        {title: '类型编码', field: 'typeCode', align: 'center', valign: 'middle', sortable: true, width: '180px'},
        {title: '上级', field: 'parentName', align: 'center', valign: 'middle', sortable: true, width: '100px'},
        {title: '拼音码', field: 'typePy', align: 'center', valign: 'middle', sortable: true, width: '180px'},
        {title: '状态', field: 'status', align: 'center', valign: 'middle', sortable: true, width: '100px', formatter: function(item, index){
            return item.status === 0 ?
                '<span class="label label-danger">禁用</span>' :
                '<span class="label label-success">正常</span>';
        }}]
    return columns;
};

function getTypeInfoId () {
    var selected = $('#typeTable').bootstrapTreeTable('getSelections');
    if (selected.length == 0) {
        alert("请选择一条记录");
        return false;
    } else {
        return selected[0].id;
    }
}

$(function () {
    var colunms = TypeInfo.initColumn();
    var table = new TreeTable(TypeInfo.id, baseURL + "baseData/typeinfo/listAll", colunms);
    table.setExpandColumn(1);
    table.setIdField("id");
    table.setCodeField("id");
    table.setParentCodeField("parentId");
    table.setExpandAll(false);
    table.init();
    TypeInfo.table = table;
});