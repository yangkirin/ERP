$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'baseData/mtrdata/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true,hidden:true },
			// { label: '原料编号', name: 'mtrCode', index: 'MTR_CODE', width: 80 ,hidden:true},
			{ label: '原料名称', name: 'mtrName', index: 'MTR_NAME', width: 150 },
			// { label: '拼音码', name: 'mtrPy', index: 'MTR_PY', width: 80 ,hidden:true},
			{ label: '类别', name: 'typeId', index: 'TYPE_ID', width: 80 ,hidden:true},
			{ label: '类别', name: 'typeName', index: 'TYPE_Name', width: 80 },
			{ label: '采购单价', name: 'price', index: 'PRICE', width: 80 }
            // { label: '状态', name: 'status', index: 'STATUS', width: 80 ,formatter: function(value, options, row){
            //     return value === 0 ?
            //         '<span class="label label-danger">禁用</span>' :
            //         '<span class="label label-success">正常</span>';
            // }
            // }
        ],
		viewrecords: true,
        height: 385,
        rowNum: 999999,
		rowList : [10,30,50],
        rownumbers: true, 
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

            $('#addExtend_btn').attr("disabled",false);
            // vm.initExtendArr();
            // $.get(baseURL + "baseData/mtrcut/getCommboxByMtrId/"+id, function(r){
            //     vm.cutArr = r.data;
            // });

            $.get(baseURL + "baseData/mtrdata/info/"+id, function(r){
                vm.mtrData = r.mtrData;
            });

            $.ajax({
                url: baseURL + "/common/commonUtil/compBomCount",
                sync:true,
                data: {id:id,type:'MTR'},
                success: function(r){
                    vm.bomCount = r.count;
                }
            });



            // $("#cutGrid").jqGrid('setGridParam',{datatype: "json",
            //     postData:{'mtrId': id}
            // }).trigger("reloadGrid");
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

    $("#cutGrid").jqGrid({
        url: baseURL + 'baseData/mtrcut/list',
        editurl : baseURL+"baseData/mtrcut/saveOrupdate",
        datatype: "local",
        colModel: [
            {label: 'id', name: 'id', index: 'id', width: 50, key: true, hidden: true},
            {label: '切割形状', name: 'cut', index: 'CUT', editable:true,width: 80},
            {label: '工时', name: 'workHours', index: 'WORK_HOURS', editable:true,width: 80},
            {label: '净菜得率', name: 'netRate', index: 'NET_RATE', editable:true,width: 80},
            {label: '状态', name: 'status', index: 'STATUS', editable:true,width: 80,edittype: "select",
                editoptions: {
                    value:"1:启用;0:禁用"
                },formatter: function(item, index){
                return item.status === 0 ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            }}],
        viewrecords: true,
        height: 160,
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: false,
        ondblClickRow:editRow,
        pager: "#cutGridPager",
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
        gridComplete: function () {
            //隐藏grid底部滚动条
            // $("#cutGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});


        }
    });

    $('#cutGrid').navGrid('#cutGridPager',
        { edit: false, add: false, del: false, search: false, refresh: false, view: false, position: "left", cloneToTop: false });

    var operation = '';
    var addId =0;

    $('#cutGrid').navButtonAdd('#cutGridPager',{
        id:"save_cut_btn",
        buttonicon: "ui-icon-add",
        caption: "<a class=\"btn btn-primary\">保存</a>",
        position: "last",
        onClickButton: function(){
            $('#cutGrid').jqGrid('saveRow',addId,{mtype: "POST",extraparam:{oper:'add',mtrId:vm.mtrData.id}});
            $('#add_cut_btn').css("display","");
            $('#save_cut_btn').css("display","none");
            addId = 0;
        }
    });

    $('#save_cut_btn').css("display","none");
    // add first custom button
    $('#cutGrid').navButtonAdd('#cutGridPager',{
            id:"add_cut_btn",
            buttonicon: "ui-icon-add",
            caption: "<a class=\"btn btn-primary\">新增</a>",
            position: "last",
            onClickButton: addCut
    });

    function addCut() {
        if(isBlank(vm.mtrData.id)){
            alert("请选择要维护的原料信息！");
            return;
        }else if(operation == 'add'){
            return;
        }
        $('#add_cut_btn').css("display","none");
        $('#save_cut_btn').css("display","");
        var count = $("#cutGrid").jqGrid("getGridParam", "records");
        addId = count+1;
        var dataRow = {
            status:'1'
        };
        $('#cutGrid').jqGrid("addRowData",count+1,dataRow,"first");

        $('#cutGrid').jqGrid("editRow",count+1,{
            keys:false,
            mtype: "POST",
            contentType: "application/json",
            extraparam:{oper:'add',mtrId:vm.mtrData.id},
            oneditfunct:function(){
                operation = 'add';
            },
            succesfunc:function(){
                operation='';
                return true;
            }
        });
    };

    //del
    $('#cutGrid').navButtonAdd('#cutGridPager',{
        id:"del_cut_btn",
        buttonicon: "ui-icon-del",
        caption: "<a id=\"del_cut_btn\" class=\"btn btn-primary\">删除</a>",
        position: "last",
        onClickButton: function(){
            var id = $("#cutGrid").jqGrid('getGridParam','selrow');
            $.ajax({
                url: baseURL + "/baseData/mtrcut/delete/"+id,
                success: function(r){
                    $("#cutGrid").trigger("reloadGrid");
                }
            });
        }
    });

    var lastSelection;

    function editRow(id) {
        if (id && id !== lastSelection) {
            $('#add_cut_btn').css("display","none");
            $('#save_cut_btn').css("display","");

            var grid = $("#cutGrid");
            grid.jqGrid('restoreRow',lastSelection);
            grid.jqGrid('editRow',id, {
                keys:false,
                focusField: 1,
                mtype: "POST",
                contentType: "application/json",
                extraparam:{oper:'edit',mtrId:vm.mtrData.id}
            });
            lastSelection = id;
            addId = id;
        }
    }

    $("#jqGridExtend").jqGrid({
        url: baseURL + 'baseData/mtrextend/list',
        datatype: "local",
        colModel: [
            {label: 'id', name: 'id', index: 'id', width: 50, key: true, hidden: true},
            {label: '单位ID', name: 'unitId', index: 'UNIT_ID', width: 80, hidden: true},
            {label: '单位', name: 'unitName', index: 'UNIT_NAME',width: 120},
            {label: '转换率', name: 'unitRate', index: 'UNIT_RATE',width: 80},
            {label: '价格', name: 'price', index: 'PRICE',width: 120},
            {label: '规格', name: 'spec', index: 'SPEC',width: 100},
            {label: '品牌', name: 'brand', index: 'BRAND',width: 180},
            {label: '状态', name: 'status', index: 'STATUS',width: 80,formatter: function(item, index){
                return item === '0' ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            },unformat:function(value, options, row){
                if($.trim(value).trim()=="禁用"){
                    return '0';
                }else if($.trim(value)=="正常"){
                    return '1';
                }
            }}
            // {label: '备注', name: 'remark', index: 'REMARK',width: 150}
            ],
        viewrecords: true,
        height: 200,
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: false,
        pager: "#jqGridExtendPager",
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
            // var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            var rowData = $("#jqGridExtend").jqGrid("getRowData",id);
            vm.mtrExtend = rowData;
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGridExtend").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});

        }
    });

});

$('#addExtend_btn').attr("disabled",true);
$('#addCut_btn').hide();

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
		showList: true,
        showCut: false,
		title: null,
        newNo:null,
        mtrCut:{},
        typeInfo: {
            parentName:null,
            parentId:0
        },
		q:{
			typeId:0,
			typeName:null,
			mtrCode:null,
			mtrName:null
		},
		mtrData: {
			typeName:null
		},
        addMtrData:{
		    typeId:null,
            typeName:null,
            purchaseUnitName:null,
            miniUnitName:null,
            formulaUnitName:null,
            warehouseName:null,
            takeStnName:null,
            costTypeName:null
        },
        cutArr:{},
        unitArr:{},
        warehouseArr:{},
        takestnArr:{},
        costArr:{},
        extendArr:{},
        mtrExtend:{},
        bomCount:0
	},
	methods: {
        getTypeInfoTree:function(){
            //加载树
            $.ajax({
                type: "POST",
                url: baseURL + "baseData/typeinfo/select",
                data: {parentId:4},
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
                title: "选择菜单",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#typeInfoLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    if(opeation == 'search'){
                        vm.q.typeId = node[0].id;
                        vm.q.typeName = node[0].typeName;
                    }else if(opeation == 'add'){
                        console.log(opeation);
                        vm.addMtrData.typeId = node[0].id;
                        vm.addMtrData.typeName = node[0].typeName;
                        $('#addMtrDataType').val(node[0].typeName);
                        vm.createNewNo(node[0].id);

                    }else if(opeation == 'purchaseUnit'){
                        vm.addMtrData.purchaseUnit = node[0].id;
                        vm.addMtrData.purchaseUnitName = node[0].typeName;
                    }else if(opeation == 'miniUnit'){
                        vm.addMtrData.miniUnit = node[0].id;
                        vm.addMtrData.miniUnitName = node[0].typeName;
                    }else if(opeation == 'formulaUnit'){
                        vm.addMtrData.formulaUnit = node[0].id;
                        vm.addMtrData.formulaUnitName = node[0].typeName;
                    }else if(opeation == 'warehouseId'){
                        vm.addMtrData.warehouseId = node[0].id;
                        vm.addMtrData.warehouseName = node[0].typeName;
                    }else if(opeation == 'takeStnId'){
                        vm.addMtrData.takeStnId = node[0].id;
                        vm.addMtrData.takeStnName = node[0].typeName;
                    }else if(opeation == 'costType'){
                        vm.addMtrData.costType = node[0].id;
                        vm.addMtrData.costTypeName = node[0].typeName;
                    }else if(opeation == 'editTypeName'){
                        vm.mtrData.typeId = node[0].id;
                        vm.mtrData.typeName = node[0].typeName;
                    }else if(opeation == 'editPurchaseUnitName'){
                        vm.mtrData.purchaseUnit = node[0].id;
                        vm.mtrData.purchaseUnitName = node[0].typeName;
                    }else if(opeation == 'editMiniUnitName'){
                        vm.mtrData.miniUnit = node[0].id;
                        vm.mtrData.miniUnitName = node[0].typeName;
                    }else if(opeation == 'editFormulaUnitName'){
                        vm.mtrData.formulaUnit = node[0].id;
                        vm.mtrData.formulaUnitName = node[0].typeName;
                    }else if(opeation == 'editWarehouseName'){
                        vm.mtrData.warehouseId = node[0].id;
                        vm.mtrData.warehouseName = node[0].typeName;
                    }else if(opeation == 'editTakeStnName'){
                        vm.mtrData.takeStnId = node[0].id;
                        vm.mtrData.takeStnName = node[0].typeName;
                    }else if(opeation == 'editCostTypeName'){
                        vm.mtrData.costType = node[0].id;
                        vm.mtrData.costTypeName = node[0].typeName;
                    }
                    layer.close(index);
                },
                btn2:function(event){
                    vm.addMtrData = {};
                }
            });

        },
		query: function () {
			vm.reload();
		},
		add: function(){
            vm.addMtrData = {
                status:1,
                fixup:'0',
                modiRate1:'1',
                modiRate2:'1'
            };

            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "新增原料",
                area: ['800px', '500px'],
                shadeClose: false,
                content: jQuery("#addLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {
                    var url = "baseData/mtrdata/save";
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.addMtrData),
                        success: function(r){
                            if(r.code === 0){
                                alert('操作成功', function(index){
                                    layer.close(num);
                                    vm.reload();
                                    vm.addMtrData = {};
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                },
                btn2:function(event){
                    vm.mtrData = {};
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
			// var url = vm.mtrData.id == null ? "baseData/mtrdata/save" : "baseData/mtrdata/update";
			var url = "baseData/mtrdata/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.mtrData),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
                            vm.mtrData = {};
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var id = $("#jqGrid").jqGrid('getGridParam','selrow');

			if(id == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					// type: "POST",
				    url: baseURL + "baseData/mtrdata/delete/"+id,
                    // contentType: "application/json",
				    // data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
                                vm.mtrData = {};
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get(baseURL + "baseData/mtrdata/info/"+id, function(r){
                vm.mtrData = r.mtrData;
            });
            vm.cutArr = vm.initTypeInfoArr('68');
            // $.get(baseURL + "baseData/mtrcut/getCommboxByMtrId/"+id, function(r){
            //     vm.cutArr = r.data;
            // });
            // vm.initCutArr();
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                postData:{'typeId': vm.q.typeId,'mtrCode':vm.q.mtrCode,'mtrName':vm.q.mtrName},
                page:page
            }).trigger("reloadGrid");
		},
        getPinying:function(opeation){
            var word = this.addMtrData.mtrName;
            if(typeof(word)!="undefined"){
                $.ajax({
                    url: baseURL + "common/commonUtil/word2pinying/"+word,
                    success: function(r){
                        if(opeation == "add"){
                            $("#mtrPy").val(r.pinying);
                            vm.addMtrData.mtrPy = r.pinying;
                        }
                    }
                });
            }
        },
        createNewNo:function(typeInfoId){
            $.ajax({
                type:"POST",
                url: baseURL + "common/commonUtil/createNewNo/",
                data:"tableName=MTR_DATA&id=id&typeInfoId="+typeInfoId,
                success: function(r){
                    vm.newNo = r.newNo;
                    $("#mtrCode").val(r.newNo);
                    vm.addMtrData.mtrCode=vm.newNo;
                }
            });
        },
        getFieldData:function(){
            var query = $('#searchName').val();
            $.ajax({
                type:"POST",
                url: baseURL + "common/commonUtil/getTableData",
                data:"tableName=MTR_DATA&fieldName=MTR_NAME:MTR_PY&searchWord="+query,
                success: function(r){
                    var resultList = r.data.map(function (item) {
                        var aItem = {py: item.MTR_PY, name: item.MTR_NAME};
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
                            vm.q.mtrName = item.name;
                            return item.name;
                        }
                    });
                }
            });
        },
        initCutArr:function(){

            $.get(baseURL + "baseData/mtrcut/getCommboxByMtrId/"+id, function(r){
                vm.cutArr = r.data;
            });

            $.ajax({
                type: "POST",
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"MTR_CUT",search:"",returnField:"ID as value,CUT as text"},
                success: function(r){
                    vm.cutArr = r.data;
                }
            });
        },
        addCutNew:function(){
            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "新增形状",
                area: ['350px', '250px'],
                shadeClose: false,
                content: jQuery("#cutInfoLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {
                    var url = "baseData/mtrcut/save";
                    console.log(vm.mtrCut);
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.mtrCut),
                        success: function(r){
                            if(r.code === 0){
                                alert('操作成功', function(index){
                                    layer.close(num);
                                    vm.mtrCut = {};
                                    // vm.initCutArr();
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                },
                btn2:function(event){
                    vm.mtrCut = {};
                }
            });
        },
        initTypeInfoArr:function(parentId){
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_type_info",search:"PARENT_ID="+parentId,returnField:"ID as value,TYPE_NAME as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
        initExtendArr:function(){
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                return;
            }
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"TB_MTR_EXTEND",search:"MTR_ID="+id,returnField:"id as value,CONCAT('[',SPEC,']-[',BRAND,']')as text"},
                success: function(r){
                    vm.extendArr =  r.data;
                }
            });
        },
        addExtend:function(){
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                alert('请选择原料！');
                return;
            }
            //加载已有的规格及单位
            $("#jqGridExtend").jqGrid('setGridParam',{datatype: "json",
                postData:{'mtrId': id}
            }).trigger("reloadGrid");

            vm.mtrExtend = {
                status:1,
                mtrId:id
            };

            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "新增规格",
                area: ['900px', '500px'],
                shadeClose: false,
                content: jQuery("#extendLayer"),
                btn: ['重置','保存','关闭'],
                btn1:function(event){
                    vm.mtrExtend = {
                        status:1
                    };
                    $("#jqGridExtend").jqGrid('setGridParam',{datatype: "json",
                        postData:{'mtrId': id}
                    }).trigger("reloadGrid");
                },
                btn2: function (event) {
                    var url = "baseData/mtrextend/save";
                    if(vm.mtrExtend.id){
                        url = "baseData/mtrextend/update";
                    }

                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.mtrExtend),
                        success: function(r){
                            if(r.code === 0){
                                alert('操作成功', function(index){
                                    $("#jqGridExtend").jqGrid('setGridParam',{datatype: "json",
                                        postData:{'mtrId': id}
                                    }).trigger("reloadGrid");
                                    vm.mtrExtend = {};
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                    return false;
                },
                btn3:function(event){
                    layer.close(num);
                }
            });
        }
	}
});



vm.getTypeInfoTree();

var dataSource = ["a","b","1","测试","dd","10a","a测","yi","yidaiyilu","shuohua","1touzhu"];
vm.getFieldData();

// vm.initCutArr();
vm.cutArr = vm.initTypeInfoArr('68');
vm.unitArr = vm.initTypeInfoArr('10');
vm.warehouseArr = vm.initTypeInfoArr('23');
vm.takestnArr = vm.initTypeInfoArr('19');
vm.costArr = vm.initTypeInfoArr('14');

//
// var getFieldData = function(){
//     var query = $('#searchName').val();
//     $.ajax({
//         type:"POST",
//         url: baseURL + "common/commonUtil/getFieldData",
//         data:"tableName=MTR_DATA&returnField=MTR_NAME&fieldName=MTR_NAME:MTR_PY&searchWord="+query,
//         success: function(r){
//             dataSource=r.data;
//             console.log(dataSource);
//             $('#searchName').typeahead({source:dataSource});
//         }
//     });
// }
// getFieldData();
//
// $('#searchName').input(getFieldData);


