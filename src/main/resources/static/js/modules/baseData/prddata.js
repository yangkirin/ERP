$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'baseData/prddata/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
			{ label: '产品编号', name: 'prdCode', index: 'PRD_CODE', width: 80 }, 			
			{ label: '产品名称', name: 'prdName', index: 'PRD_NAME', width: 80 ,formatter:function(value,options,row){
                if(row.semiFinished == '1'){
                    // return '*'+value;
                    return value;
                }else{
                    return value;
                }
            }},
			{ label: '拼音码', name: 'prdPy', index: 'PRD_PY', width: 80,hidden:true },
			{ label: '产品类别', name: 'typeId', index: 'TYPE_ID', width: 80 ,hidden:true},
			{ label: '产品类别', name: 'typeName', index: 'TYPE_NAME', width: 80 },
			{ label: '锅重', name: 'potWeight', index: 'POT_WEIGHT', width: 80 ,hidden:true},
			{ label: '盒重', name: 'boxWeight', index: 'BOX_WEIGHT', width: 80 ,hidden:true},
			{ label: '参考售价', name: 'referencePrice', index: 'REFERENCE_PRICE', width: 80 ,hidden:true},
			{ label: '生产工艺', name: 'process', index: 'PROCESS', width: 80 ,hidden:true},
			{ label: '是否半成品', name: 'semiFinished', index: 'SEMI_FINISHED', width: 80 ,hidden:true},
			{ label: '生产站点', name: 'pdcStn', index: 'PDC_STN', width: 80,hidden:true },
			{ label: '订单类别', name: 'orderType', index: 'ORDER_TYPE', width: 80 ,hidden:true},
			{ label: '额外成本', name: 'extraCost', index: 'EXTRA_COST', width: 80 ,hidden:true},
			{ label: '烹调方式', name: 'cookType', index: 'COOK_TYPE', width: 80,hidden:true },
			{ label: '单锅生产时间', name: 'productionTime', index: 'PRODUCTION_TIME', width: 80 ,hidden:true},
			{ label: '是否速冷', name: 'quickCooling', index: 'QUICK_COOLING', width: 80 ,hidden:true},
			{ label: '速冷率', name: 'quickCoolingRate', index: 'QUICK_COOLING_RATE', width: 80 ,hidden:true},
			{ label: '是否取整', name: 'rounding', index: 'ROUNDING', width: 80 ,hidden:true},
			{ label: '取整重', name: 'roundWeight', index: 'ROUND_WEIGHT', width: 80 ,hidden:true},
			{ label: '备注', name: 'remark', index: 'REMARK', width: 80 ,hidden:true},
			{ label: '创建者', name: 'createUser', index: 'CREATE_USER', width: 80 ,hidden:true},
			{ label: '创建日期', name: 'createDate', index: 'CREATE_DATE', width: 80 ,hidden:true},
			{ label: '状态', name: 'status', index: 'STATUS', width: 80 ,hidden:true}
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
            vm.prdId = id;
            $.get(baseURL + "baseData/prddata/info/"+id, function(r){
                vm.prdData = r.prdData;
                if(r.prdData.semiFinished == '1'){//0-成品，1-半成品
                    // vm.prdData.prdName = "*" + r.prdData.prdName;
                    vm.sfbcp = '1';
                }

                $.ajax({
                    url: baseURL + "/common/commonUtil/compBomCount",
                    sync:true,
                    data: {id:id,type:'PRD'},
                    success: function(r){
                        vm.bomCount = r.count;
                    }
                });

                $(".select2.select2-container.select2-container--default").attr("class","select2 select2-container select2-container--default select2-container--below select2-container--focus");
                $("#select2-prdTypeId-container").attr("title",vm.prdData.typeName);
                $("#select2-prdTypeId-container").text(vm.prdData.typeName);
            });
            $.get(baseURL + "baseData/prdncinfo/infoByPrdId/"+id, function(r){
                if(r.prdNcInfo != null){
                    vm.prdNcInfo = r.prdNcInfo;
                }
            });


            // $("#prdTypeId").val(vm.prdData.typeId);
            // $("#prdTypeId option[value="+vm.prdData.typeId+"]").attr("selected", true);
            // $('#select2-prdTypeId-container').attr('title',vm.prdData.typeName);
            // $('#select2-prdTypeId-container').text(vm.prdData.typeName);

            vm.initPrdNcInfoForm('show');
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });


    $('#prdTypeId').select2({
        language: "zh-CN",
        multiple: false
    });
    $('#prdTypeId').on("select2:select",function(){
        var data = $(this).val();
        vm.prdData.typeId = data;
    });

    $('#selectTypeId').select2({
        language: "zh-CN",
        multiple: false
    });

    $('#selectTypeId').on("select2:select",function(){
        var data = $(this).val();
        vm.prdData.typeId = data;
    });

    $('#addPrdType').select2({
        language:"zh-CN",
        multiple: false

    });
    $("#addPrdType").on("select2:select",function(){
        var data = $(this).val();
        // console.log(data);
        vm.addPrdData.typeId = data;
        vm.createNewNo(data);
    });
    $("#accordion").accordion({active: false, collapsible: true});


    $("#bomGrid").jqGrid({
        url: baseURL + 'baseData/bominfo/listByMtrId',
        datatype: "json",
        postData: {prdId: "0"},
        colModel: [
            {label: 'id', name: 'id', index: 'id', width: 50, key: true, hidden: true},
            {label: '配方名称', name: 'bomName', index: 'bom_name', width: 120},
            {label: '产品ID', name: 'prdId', index: 'prd_id', width: 80, hidden: true},
            {
                label: '产品名称',
                name: 'prdIdName',
                index: 'prd_id_name',
                width: 120,
                hidden: true,
                formatter: function (value, options, row) {
                    // if(row.semiFinished == '1'){
                    //     return value.slice(1);
                    // }else{
                    return value;
                    // }
                }
            },
            {label: '产品类别', name: 'prdTypeName', index: 'prdTypeName', width: 80},
            {label: '产品编码', name: 'prdCode', index: 'prdCode', width: 80},
            {label: '生产站点', name: 'pdcStnName', index: 'pdcStnName', width: 80},
            {label: '拼音码', name: 'bomPy', index: 'bom_py', width: 80},
            {label: '售价', name: 'price', index: 'price', width: 60},
            {label: '锅重', name: 'potWgt', index: 'potWgt', width: 60, hidden: true},
            {label: '盒重', name: 'boxWgt', index: 'boxWgt', width: 60, hidden: true},
            {label: '总毛重', name: 'sumGrossWgt', index: 'sum_gross_Wgt', width: 60, hidden: true},
            {label: '总净重', name: 'sumNetWgt', index: 'sum_net_Wgt', width: 60, hidden: true},
            {label: '总熟重', name: 'sumModiWgt', index: 'sum_modi_Wgt', width: 60, hidden: true},
            {label: '配方成本', name: 'cost', index: 'cost', width: 60, hidden: true},
            {
                label: '成本率',
                name: 'sumCostRate',
                index: 'sumCostRate',
                width: 60,
                hidden: true,
                formatter: function (value, options, row) {
                    if (value == null) {
                        return "";
                    } else {
                        return value + '%';
                    }
                }
            },
            {
                label: '状态',
                name: 'status',
                index: 'status',
                width: 40,
                hidden: true,
                formatter: function (value, options, row) {
                    return value === 0 ?
                        '<span class="label label-danger">禁用</span>' :
                        '<span class="label label-success">正常</span>';
                }
            },
            {label: '备注', name: 'remark', index: 'remark', width: 80, hidden: true},
            {label: '创建者', name: 'createUser', index: 'create_user', width: 80, hidden: true},
            {label: '创建日期', name: 'createDate', index: 'create_date', width: 80, hidden: true},
            {label: '修改者', name: 'updateUser', index: 'create_user', width: 80, hidden: true},
            {
                label: '修改日期',
                name: 'updateDate',
                index: 'create_date',
                width: 80,
                hidden: true,
                formatter: function (value, options, row) {
                    if (value == null) {
                        return "";
                    } else {
                        return value;
                    }
                }
            },
            {label: '是否半成品', name: 'semiFinished', index: 'SEMIFINISHED', editable: true, width: 80, hidden: true}
        ],
        viewrecords: true,
        height: "auto",
        rowNum: 999999,
        rowList: [10, 30, 50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth: true,
        multiselect: false,
        // pager: "#jqGridPager",
        jsonReader: {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order"
        },
        subGrid: true,
        subGridRowExpanded: function (subgrid_id, row_id) {
            var rowData = $("#bomGrid").jqGrid('getRowData', row_id);
            var url = baseURL + 'baseData/bomdetail/list?bomInfoId=' + row_id;
            createSubGrid(subgrid_id, row_id, url);
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#bomGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });

    function createSubGrid(subgrid_id, row_id, url) {
        var subgrid_table_id, pager_id;
        subgrid_table_id = subgrid_id + "_t";
        pager_id = "p_" + subgrid_table_id;
        $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
        jQuery("#" + subgrid_table_id).jqGrid({
            url: url,
            datatype: "json",
            colModel: [
                {label: 'id', name: 'id', index: 'id', width: 50, key: true, hidden: true},
                {label: 'mtrId', name: 'mtrId', index: 'mtrId', width: 50, hidden: true},
                {
                    label: '原料名称',
                    name: 'mtrIdName',
                    index: 'MTR_ID_NAME',
                    width: 80,
                    formatter: function (value, options, row) {
                        if (row.semiFinished == '1') {//0-成品，1-半成品
                            return '*' + value;
                        } else {
                            return value;
                        }
                    }
                },
                {label: '类别', name: 'typeIdName', index: 'TYPE_ID_NAME', width: 80, hidden: false},
                {label: '切割形状', name: 'mtrCutIdName', index: 'MTR_CUT_ID_NAME', width: 100, hidden: true},
                {label: '规格说明', name: 'mtrExtendDesc', index: 'MTR_EXTEND_DESC', width: 100, hidden: true},
                {label: '净菜', name: 'netWgt', index: 'NET_WGT', editable: true, width: 40, hidden: true},
                {
                    label: '净菜得率',
                    name: 'netRate',
                    index: 'NET_RATE',
                    editable: true,
                    width: 40,
                    hidden: true,
                    formatter: function (value, options, row) {
                        if (value == null) {
                            return 1;
                        } else {
                            return value;
                        }
                    }
                },
                {label: '毛菜', name: 'grossWgt', index: 'GROSS_WGT', editable: true, width: 40, hidden: true},
                {label: '熟菜得率', name: 'modiRate', index: 'MODI_RATE', editable: true, width: 40, hidden: true},
                {label: '熟菜', name: 'modiWgt', index: 'MODI_WGT', editable: true, width: 40, hidden: true},
                {
                    label: '单价',
                    name: 'price',
                    index: 'PRICE',
                    editable: true,
                    width: 40,
                    hidden: true,
                    formatter: function (value, options, row) {
                        if (value == null) {
                            return Number(0).toFixed(2);
                        } else {
                            return Number(value).toFixed(2);
                        }
                    }
                },
                {
                    label: '成本',
                    name: 'cost',
                    index: 'COST',
                    width: 80,
                    hidden: true,
                    formatter: function (value, options, row) {
                        if (value == null) {
                            return Number(0).toFixed(2);
                        } else {
                            return Number(value).toFixed(2);
                        }
                    }
                },
                {
                    label: '成本率',
                    name: 'costRate',
                    index: 'COST_RATE',
                    width: 80,
                    hidden: true,
                    formatter: function (value, options, row) {
                        return value + '%';
                    }
                },
                {label: '备注', name: 'remark', index: 'REMARK', editable: true, width: 80, hidden: true},
                {label: '是否半成品', name: 'semiFinished', index: 'SEMIFINISHED', editable: true, width: 80, hidden: true}
            ],
            rowNum: 20,
            // pager : pager_id,
            height: '100%',
            rowList: [10, 30, 50],
            rownumbers: true,
            rownumWidth: 25,
            autowidth: true,
            multiselect: false,
            jsonReader: {
                root: "page.list",
                page: "page.currPage",
                total: "page.totalPage",
                records: "page.totalCount"
            },
            prmNames: {
                page: "page",
                rows: "limit",
                order: "order"
            },
            gridComplete: function () {
                //隐藏grid底部滚动条
                $("#" + subgrid_table_id).closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
            },
            subGrid: true,
            subGridRowExpanded: function (subgrid_id, row_id) {
                var rowData = $("#" + subgrid_table_id).jqGrid('getRowData', row_id);
                if (rowData.semiFinished == '1') {//0-成品，1-半成品
                    var url = baseURL + 'baseData/bomdetail/listByPrdId?prdId=' + rowData.mtrId;
                    createSubGrid(subgrid_id, row_id, url);
                } else {
                    return false;
                }
            }
        });
    }

});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		prdData: {
            typeId:null,
            typeName:null,
            pdcStn:null,
            pdcStnName:null,
            orderType:null,
            orderTypeName:null,
            cookType:null,
            status: 2,
            cookTypeName:null
		},
        prdNcInfo:{
            prdId:null
        },
        addPrdData:{
			typeId:null,
            typeIdName:null,
            pdcStn:null,
            pdcStnName:null,
            prdCode:null,
            prdPy:null
		},
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
            isFinished:-1
		},
        orderTypeArr:{},
        prdTypeArr_s:{},
        prdTypeArr:{},
        pdcStnArr:{},
        cookTypeArr:{},
        sfbcp:null,
        bomCount: 0,
        prdId: 0
	},
	methods: {
		query: function () {
		    vm.q.prdType = $('#selectTypeId').val();
			vm.reload();
		},
		add: function(){
            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "新增产品",
                area: ['750px', '450px'],
                shadeClose: false,
                content: jQuery("#addLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {
                    var url = "baseData/prddata/save";
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.addPrdData),
                        success: function(r){
                            if(r.code === 0){
                                alert('操作成功', function(index){
                                    layer.close(num);
                                    vm.reload();
                                    vm.addPrdData = {};
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                },
                btn2:function(event){
                    vm.addPrdData = {};
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
			// var url = vm.prdData.id == null ? "baseData/prddata/save" : "baseData/prddata/update";
            var data = $("#prdTypeId").select2("data")[0];
            if(data){
                vm.prdData.typeId=data.id;
                vm.prdData.typeName=data.text;
            }
            console.log(vm.prdData);
            // if(vm.prdData.semiFinished == '1'){
            //     vm.prdData.prdName = vm.prdData.prdName.substring(1,vm.prdData.prdName.length);
            // }
			var url = "baseData/prddata/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.prdData),
			    success: function(r){
			    	if(r.code === 0){
                        vm.updatePrdNcInfo();
						alert('操作成功', function(index){

                            vm.prdData = {};
                            vm.q = {};
                            vm.q.prdName=null;
                            // $('#searchName').val();
                            console.log($('#searchName').val());

                            vm.reload();
                            // vm.getFieldData();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
        updatePrdNcInfo:function(){
            vm.prdNcInfo.prdId = vm.prdData.id;
            $.ajax({
                type: "POST",
                url: baseURL + "baseData/prdncinfo/updateInfo",
                contentType: "application/json",
                data: JSON.stringify(vm.prdNcInfo),
                success: function(r){
                    if(r.code === 0){
                        // alert('操作成功', function(index){
                        //     vm.reload();
                        //
                        // });
                        return true;
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
				    url: baseURL + "baseData/prddata/delete/"+id,
                    // contentType: "application/json",
                    // data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
								vm.prdData = {};
								vm.prdNcInfo={};
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
        startPrd: function () {
            var id = $("#jqGrid").jqGrid('getGridParam', 'selrow');
            if (id == null) {
                return;
            }
            confirm('确定要启用该产品？', function (index) {
                vm.changestatus(1, id);

            });
        },
        stopPrd: function () {
            var id = $("#jqGrid").jqGrid('getGridParam', 'selrow');
            if (id == null) {
                return;
            }
            confirm('确定要禁用该产品？', function () {
                vm.changestatus(0, id);
            });
        },
        changestatus: function (newstatus, prdId) {
            var url = "baseData/prddata/changestatus";
            var info = {
                prdId: prdId,
                status: newstatus
            }
            $.ajax({
                type: "POST",
                url: baseURL + url,
                contentType: "application/json",
                data: JSON.stringify(info),
                // async: false,
                success: function (r) {
                    if (r.code === 0) {
                        alert('操作成功', function (index) {
                            console.log("状态已更改！");

                            $("#jqGrid").trigger("reloadGrid");
                            vm.prdData = {};
                            vm.prdNcInfo = {};
                        });
                    } else {
                        alert(r.msg);
                    }
                }
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
                postData:{'typeId': vm.q.prdType==0?null:vm.q.prdType,'orderType':vm.q.orderType==0?null:vm.q.orderType,'prdCode':vm.q.prdCode,'searchWord':vm.q.prdName,'isFinished':vm.q.isFinished==-1?null:vm.q.isFinished},
                page:page
            }).trigger("reloadGrid");
            vm.prdData = {};
            vm.prdNcInfo = {};
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
                    // console.log(dataSource);
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
                data:{parentId:48},
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
                    if(opeation == 'editpdcStn'){
                        vm.prdData.pdcStn = node[0].id;
                        // vm.q.prdTypeName = node[0].typeName;
                        $('#editpdcStn').val(node[0].typeName);
                        vm.prdData.pdcStnName = node[0].typeName;
                    }else if(opeation == 'addPdcStn'){
                        vm.addPrdData.pdcStn = node[0].id;
                        $('#addPdcStnName').val(node[0].typeName);
                        vm.addPrdData.pdcStnName = node[0].typeName;
                    }
                    layer.close(index);
                },
                btn2:function(event){
                    // vm.addPrdData = {};
                }
            });
        },
        createNewNo:function(typeInfoId){
            $.ajax({
                type:"POST",
                url: baseURL + "common/commonUtil/createNewNo/",
                data:"tableName=PRD_DATA&id=id&typeInfoId="+typeInfoId,
                success: function(r){
                    // vm.newNo = r.newNo;
                    // $("#mtrCode").val(r.newNo);
                    vm.addPrdData.prdCode=r.newNo;
                }
            });
        },
        getPinying:function(opeation){
            var word = opeation == "addPrdName" ? this.addPrdData.prdName : this.prdData.prdName;
            if(typeof(word)!="undefined"){
                $.ajax({
                    url: baseURL + "common/commonUtil/word2pinying/"+word,
                    success: function(r){
                        if(opeation == "addPrdName"){
                            vm.addPrdData.prdPy = r.pinying;
                        }else if(opeation == "editPrdName"){
                            vm.prdData.prdPy = r.pinying;
                        }
                    }
                });
            }
        },
        initPrdNcInfoForm:function(operation){
            if(operation == 'show'){
                $("#prdNcInfo :input").each(function(){
                    $(this).removeAttr("readonly");
                });
            }else if(operation == 'hide'){
                $("#prdNcInfo :input").each(function(){
                    $(this).attr("readonly","readonly");
                });
            }
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
        initTypeSelect2:function(id){
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "baseData/typeinfo/getTypeInfoForSelectTree",
                // contentType: "application/json",
                data: {parentId:id},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
        showBom: function () {
            if (vm.bomCount == 0)
                return;
            $("#bomGrid").jqGrid('setGridParam', {
                postData: {'prdId': vm.prdId},
            }).trigger("reloadGrid");
            $("#myModal").modal("show");
        }
	}
});

vm.initPrdNcInfoForm('hide');

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

vm.orderTypeArr = vm.initTypeInfoArr('40');
// vm.prdTypeArr = vm.initTypeInfoArr('31');
vm.prdTypeArr_s = vm.initTypeSelect2('31');
vm.prdTypeArr = vm.initTypeSelect2('31');
// vm.pdcStnArr = vm.initTypeInfoArr('48');
vm.cookTypeArr = vm.initTypeInfoArr('87');