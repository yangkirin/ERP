$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        $("#jqGridMtr").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    };

    mygrid = $("#jqGrid").jqGrid({
        url: baseURL + 'purchase/supplierinfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true ,  search:false,hidden:true},
			{ label: '供应商名称', name: 'suppierName', index: 'suppierName', width: 120 },
			{ label: '代码', name: 'suppierCode', index: 'suppierCode', width: 60 },
			{ label: '简称', name: 'suppierShortName', index: 'suppierShortName', search:false, width: 120 ,hidden:true},
			{ label: '类型', name: 'typeName', index: 'typeName', search:false, width: 80 },
			{ label: '拼音码', name: 'suppierPy', index: 'suppierPy', width: 80 },
			{ label: '联系人', name: 'linkMan', index: 'link_man', search:false, width: 60 },
			{ label: '联系电话', name: 'linkPhone', index: 'link_phone', search:false, width: 80 },
			{ label: '固定电话', name: 'linkTell', index: 'link_tell', search:false, width: 80 },
			{ label: '地址', name: 'address', index: 'address', search:false, width: 80 },
			{ label: '税率', name: 'taxRate', index: 'tax_rate', search:false, width: 60 },
			{ label: '账期', name: 'paymentDays', index: 'payment_days', search:false, width: 60 },
			{ label: '状态', name: 'status', index: 'status', width: 60 , search:false,formatter: function(value, options, row){
                return value === 0 ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            }},
			{ label: '创建人', name: 'createUser', index: 'create_user', search:false, width: 80,hidden:true },
			{ label: '备注', name: 'remark', index: 'remark', width: 80 , search:false,hidden:true},
			{ label: '操作', name: 'operation', index: 'operation', search:false, width: 150 ,formatter:function(value, options, row){
				var optionStr = "<button type='button' class='btn btn-primary btn-xs' onclick='editInfo("+row.id+")'>修改</button>" +
				 "&nbsp;&nbsp;<button type='button' class='btn btn-primary btn-xs' onclick='mtrConfig("+row.id+")'>原料配置</button>";
				return optionStr;
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
        scroll:true,
        // pager: "#jqGridPager",
        toppager: true,
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
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var rowData = $("#jqGrid").jqGrid('getRowData',row_id);
            var url = baseURL + 'purchase/suppiermtr/list?suppierId='+rowData.id;
            createSubGrid(subgrid_id,row_id,url);
        }
    });

    $("#jqGrid").jqGrid('navGrid','#jqGrid_toppager', {edit:false,add:false,del:false,search:false,refresh:true});
    $("#jqGrid").jqGrid('navButtonAdd',"#jqGrid_toppager", {
        caption:"切换",
        title:"切换搜索工具栏",
        buttonicon:"ui-icon-search",
        onClickButton:function(){
            mygrid[0].toggleToolbar()
        }
    });
    $("#jqGrid").jqGrid('navButtonAdd',"#jqGrid_toppager",{
        caption:"清空",
        title:"清空搜索栏",
        buttonicon :'ui-icon-refresh',
        onClickButton:function(){
            mygrid[0].clearToolbar()
        }
    });
    $("#jqGrid").jqGrid('filterToolbar');

    function createSubGrid(subgrid_id,row_id,url){
        var subgrid_table_id, pager_id;
        subgrid_table_id = subgrid_id + "_t";
        pager_id = "p_" + subgrid_table_id;
        $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
        jQuery("#" + subgrid_table_id).jqGrid({
            url : url,
            datatype : "json",
            colModel : [
                { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
                { label: '供应商', name: 'suppierIdName', index: 'suppier_id_name', width: 150 ,hidden:true},
                { label: '原料ID', name: 'mtrId', index: 'mtr_id', width: 80 ,hidden:true},
                { label: '原料名称', name: 'mtrIdName', index: 'mtr_id_name', width: 200 },
                { label: '采购规格[单位-转换率-单价]', name: 'mtrExtendDesc', index: 'mtr_extend_desc', width: 200 },
                { label: '采购编码', name: 'purchaseNo', index: 'purchase_no', width: 100 },
                { label: '采购价', name: 'price', index: 'price', width: 80 },
                { label: '状态', name: 'status', index: 'status', width: 50 ,formatter: function(value, options, row){
                    return value === 0 ?
                        '<span class="label label-danger">禁用</span>' :
                        '<span class="label label-success">正常</span>';
                }},
                { label: '修改人', name: 'lastEditUser', index: 'last_edit_user', width: 80 },
                { label: '修改日期', name: 'lastEditDate', index: 'last_edit_date', width: 120 }
            ],
            rowNum : 999999,
            // pager : pager_id,
            height : '100%',
            rowList : [10,30,50],
            rownumbers: true,
            rownumWidth: 25,
            autowidth:true,
            multiselect: false,
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
                $("#" + subgrid_table_id).closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
            }
        });
    }

    $("#jqGridMtr").jqGrid({
        url: baseURL + 'purchase/suppiermtr/list',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '供应商ID', name: 'suppierId', index: 'suppier_id', width: 80 ,hidden:true},
            { label: '供应商', name: 'suppierIdName', index: 'suppier_id_name', width: 150 },
            { label: '原料ID', name: 'mtrId', index: 'mtr_id', width: 80 ,hidden:true},
            { label: '原料名称', name: 'mtrIdName', index: 'mtr_id_name', width: 200 },
            { label: '采购规格[单位-转换率-单价]', name: 'mtrExtendDesc', index: 'mtr_extend_desc', width: 200 },
            { label: '采购编码', name: 'purchaseNo', index: 'purchase_no', width: 100 },
            { label: '采购价', name: 'price', index: 'price', width: 80 },
            { label: '状态', name: 'status', index: 'status', width: 50 ,formatter: function(value, options, row){
                return value === 0 ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            }},
            { label: '修改人', name: 'lastEditUser', index: 'last_edit_user', width: 80 },
            { label: '修改日期', name: 'lastEditDate', index: 'last_edit_date', width: 120 }
        ],
        viewrecords: true,
        height: "auto",
        rowNum: 99999999,
        rowList : [50,100,150],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: true,
        scroll:true,
        // pager: "#jqGridPagerMtr",
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

    $("#mtrSelectExtend").on("change",function(){
        var data = $(this).val();
        var text = $(this).find("option:selected").text();
        if(data != null && data != 0){
            $.get(baseURL + "baseData/mtrextend/info/"+data, function(r){
                vm.mtrData.purchaseRate = r.mtrExtend.unitRate;
                vm.mtrData.price = r.mtrExtend.price;
                vm.mtrData.purchaseUnitName = r.mtrExtend.unitName;

                vm.supplierMtr.mtrExtendId = r.mtrExtend.id;
                vm.supplierMtr.mtrExtendDesc = r.mtrExtend.unitName+'-'+r.mtrExtend.unitRate+'-¥:'+r.mtrExtend.price;

            });
        }else{
            vm.supplierMtr.mtrExtendId = data;
            vm.supplierMtr.mtrExtendDesc = $.trim(text);
        }
    });
});

function mtrConfig(rowid){
    vm.showInfo = false;
    vm.showListMtr = true;
    vm.supplierMtr.suppierId = rowid;
    vm.getTypeInfoTree();
    vm.reloadMtrConfig(rowid);
}

function editInfo(rowid){
    vm.update(rowid);
}

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
        typeInfo: {
            parentName:null,
            parentId:0
        },
        showInfo:true,
        showListMtr:true,
        mtrData:{
            mtrId:null,
            typeId:null,
            typeName:null,
            mtrName:null,
            mtrCode:null,
            price:null,
            purchaseUnitName:null,
            purchaseRate:null,
            purcycle:null,
            taxRate:null,
            wgtUnit1:null,
            wgtUnit2:null

        },
        supplierMtr:{
            id:null,
            suppierId:null,
            mtrId:null,
            purchaseNo:null,
            price:null,
            status:'1'
        },
		showList: true,
		title: null,
        titleMtr:null,
		supplierInfo: {},
        mtrExtendArr: {},
        typeArr:{}
	},
	methods: {
		query: function () {
			vm.reloadInfo();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.supplierInfo = {
                status:'1',
                suppierCode:vm.createNewNo()
			};
		},
		update: function (id) {
			// var id = getSelectedRow();
			// if(id == null){
			// 	return ;
			// }
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.supplierInfo.id == null ? "purchase/supplierinfo/save" : "purchase/supplierinfo/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.supplierInfo),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reloadInfo();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var ids = [];
            var id = $('#jqGrid').jqGrid("getGridParam","selrow");
			if(id == null){
				return ;
			}
			ids[0] = id;
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "purchase/supplierinfo/delete",
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
			$.get(baseURL + "purchase/supplierinfo/info/"+id, function(r){
                vm.supplierInfo = r.supplierInfo;
            });
		},
		reloadInfo: function (event) {
			vm.showList = true;
			vm.showInfo=true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
        getPinying:function(event){
			var word = vm.supplierInfo.suppierName;
			var py = '';
            if(typeof(word)!="undefined"){
                $.ajax({
                    url: baseURL + "common/commonUtil/word2pinying/"+word,
                    success: function(r){
						// vm.supplierInfo.suppierPy = r.pinying;
						// py = r.pinying;

                        vm.supplierInfo.suppierPy = r.pinying;
                        $('#supplierPy').val(r.pinying);
                    }
                });
            }

        },
		addMtr:function(){
			vm.showListMtr=false;
			vm.titleMtr = '新增原料';
            vm.mtrData = {
                status:'1'
            };
			vm.getFieldData();
		},
        updateMtr:function(){
			vm.showListMtr=false;
            vm.titleMtr = '编辑原料';

            var id = $("#jqGridMtr").jqGrid('getGridParam','selrow');
            if(id == null){
                return ;
            }
            vm.showList = false;
            vm.title = "修改";

            var rowData = $("#jqGridMtr").jqGrid("getRowData",id);
            vm.mtrExtendArr = vm.initMtrExtendArr(rowData.mtrId);

            vm.getInfoMtr(id)
		},
        delMtr:function(){
            var ids = $("#jqGridMtr").jqGrid('getGridParam',"selarrrow");
            if(ids == null){
                return ;
            }
            confirm('确定要删除选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: baseURL + "purchase/suppiermtr/delete/",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function(r){
                        if(r.code == 0){
                            alert('操作成功', function(index){
                                // $("#jqGridMtr").trigger("reloadGrid");
                                vm.reloadMtrConfig();
                            });
                        }else{
                            alert(r.msg);
                        }
                    }
                });
            });
		},
        getInfoMtr:function(id){
            $.get(baseURL + "purchase/suppiermtr/info/"+id, function(r){
                vm.supplierMtr = r.suppierMtr;
                vm.mtrData = r.mtrData;
                vm.mtrData.extendId = vm.supplierMtr.mtrExtendId;
            });
        },
        saveOrUpdateMtr:function(){
            vm.supplierMtr.purchaseNo=vm.mtrData.mtrCode;
            vm.supplierMtr.price=vm.mtrData.price;
            vm.supplierMtr.status=vm.mtrData.status;
            var url = vm.supplierMtr.id == null ? "purchase/suppiermtr/save" : "purchase/suppiermtr/update";
            $.ajax({
                type: "POST",
                url: baseURL + url,
                contentType: "application/json",
                data: JSON.stringify(vm.supplierMtr),
                success: function(r){
                    if(r.code === 0){
                        alert('操作成功', function(index){
                            vm.reloadMtrConfig();
                        });
                    }else{
                        alert(r.msg);
                    }
                }
            });
		},
		reloadMtrConfig:function(rowid){
        	// vm.showInfo=false;
            // var id = rowid;
            // if(id == null){
            //     id = getSelectedRow();
            // }
            // var id = $("#jqGrid").jqGrid('getGridParam','selrow');
        	vm.showListMtr=true;
            $("#jqGridMtr").jqGrid('setGridParam',{
                postData:{'suppierId': vm.supplierMtr.suppierId}
            }).trigger("reloadGrid");
		},
        getTypeInfoTree:function(){
            $.ajax({
                type: "POST",
                url: baseURL + "baseData/typeinfo/select",
                data:{parentId:4},
                success: function(r){
                    ztree = $.fn.zTree.init($("#typeInfoTree"), setting, r.typeInfoList);
                    var node = ztree.getNodeByParam("id", vm.typeInfo.parentId);
                    ztree.selectNode(node);
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
                    if(opeation == 'typeName'){
                        // vm.q.prdType = node[0].id;
                        vm.mtrData.typeName = node[0].typeName;
                        $('#typeName').val(node[0].typeName);
                    }else if(opeation == 'purchaseUnitName'){
                        // vm.q.orderType = node[0].id;
                        vm.mtrData.purchaseUnitName = node[0].typeName;
                        $('#purchaseUnitName').val(node[0].typeName);
                    }
                    layer.close(index);
                },
                btn2:function(event){
                    // vm.addPrdData = {};
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

                    vm.mtrData.mtrId=item.id;
                    vm.mtrExtendArr = vm.initMtrExtendArr(item.id);
                    return item.name;
                },
                afterSelect:function(obj){
                    $.ajax({
                        type: "POST",
                        url: baseURL + "baseData/mtrdata/info/"+vm.mtrData.mtrId,
                        async:true,
                        success: function (r) {
                            // vm.mtrData.mtrId=r.mtrData.id;
                            // vm.mtrData.typeId=r.mtrData.typeId;
                            // vm.mtrData.typeName=r.mtrData.typeName;
                            // vm.mtrData.mtrName=r.mtrData.mtrName;
                            // vm.mtrData.mtrCode=r.mtrData.mtrCode;
                            // vm.mtrData.price = r.mtrData.price;
                            // vm.mtrData.purchaseUnitName = r.mtrData.purchaseUnitName;
                            // vm.mtrData.purchaseRate = r.mtrData.purchaseRate;
                            // vm.mtrData.purcycle = r.mtrData.purcycle;
                            // vm.mtrData.taxRate = r.mtrData.taxRate;
                            // vm.mtrData.wgtUnit1 = r.mtrData.wgtUnit1;
                            // vm.mtrData.wgtUnit2 = r.mtrData.wgtUnit2;
                            vm.mtrData = r.mtrData;
                            vm.mtrData.mtrId = r.mtrData.id;
                            vm.supplierMtr.mtrId=r.mtrData.id;
                        }
                    });
                }
            })
        },
        createNewNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/getTableNewNo",
                data:"tableName=tb_supplier_info&noField=suppier_code",
                success: function(r){
                    no = r.newNo;
                }
            });
            return no;
        },
        initMtrExtendArr:function(mtrIdVal){
            // getDataToCommbox
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "baseData/mtrextend/getDataToCommbox",
                data: {mtrId:mtrIdVal},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
        search:function(){
            var postData = {
                suppierCode: $('#search').val(),
                suppierName: $('#search').val(),
                suppierShortName: $('#search').val(),
                suppierPy: $('#search').val()
            };
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData:postData,
                page:page
            }).trigger("reloadGrid");
            // vm.reload();
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
        }
	}
});

vm.typeArr = vm.initTypeInfoArr('115');