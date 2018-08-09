$(function () {
    window.onresize = function  _doResize() {
        var ss = pageSize();
        $("#jqGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
        $("#bomDetailGrid").jqGrid('setGridWidth', ss.WinW-10).jqGrid('setGridHeight', ss.WinH-200);
    };

    $("#jqGrid").jqGrid({
        url: baseURL + 'baseData/bominfo/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
			{ label: '配方名称', name: 'bomName', index: 'bom_name', width: 120,hidden:true },
			{ label: '产品ID', name: 'prdId', index: 'prd_id', width: 80 ,hidden:true},
			{ label: '产品名称', name: 'prdIdName', index: 'prd_id_name', width: 120 ,formatter:function(value, options, row){
                // if(row.semiFinished == '1'){
                //     return value.slice(1);
                // }else{
                    return value;
                // }
            }},
            { label: '产品类别', name: 'prdTypeName', index: 'prdTypeName', width: 80 },
            { label: '产品编码', name: 'prdCode', index: 'prdCode', width: 80 },
            { label: '生产站点', name: 'pdcStnName', index: 'pdcStnName', width: 80 },
            { label: '拼音码', name: 'bomPy', index: 'bom_py', width: 80 },
            { label: '售价', name: 'price', index: 'price', width: 60 },
            { label: '锅重', name: 'potWgt', index: 'potWgt', width: 60 },
            { label: '盒重', name: 'boxWgt', index: 'boxWgt', width: 60 },
            { label: '总毛重', name: 'sumGrossWgt', index: 'sum_gross_Wgt', width: 60 },
            { label: '总净重', name: 'sumNetWgt', index: 'sum_net_Wgt', width: 60 },
            { label: '总熟重', name: 'sumModiWgt', index: 'sum_modi_Wgt', width: 60 },
            { label: '配方成本', name: 'cost', index: 'cost', width: 60 },
            { label: '成本率', name: 'sumCostRate', index: 'sumCostRate', width: 60,formatter:function(value, options, row){
                if(value == null){
                    return "";
                }else{
                    return value+'%';
                }
            } },
			{ label: '状态', name: 'status', index: 'status', width: 40 ,formatter: function(value, options, row){
                return value === 0 ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            }},
			{ label: '备注', name: 'remark', index: 'remark', width: 80 }, 			
			{ label: '创建者', name: 'createUser', index: 'create_user', width: 80 ,hidden:true},
			{ label: '创建日期', name: 'createDate', index: 'create_date', width: 80 ,hidden:true},
            { label: '修改者', name: 'updateUser', index: 'create_user', width: 80 ,hidden:true},
            { label: '修改日期', name: 'updateDate', index: 'create_date', width: 80 ,hidden:true,formatter:function(value, options, row){
                if(value == null){
                    return "";
                }else{
                    return value;
                }
            }},
            { label: '是否半成品', name: 'semiFinished', index: 'SEMIFINISHED', editable:true,width: 80 ,hidden:true}
        ],
		viewrecords: true,
        height: 'auto',
        rowNum: 999999,
		rowList : [50,100,150],
        rownumbers: true,
        rownumWidth: 25, 
        autowidth:true,
        multiselect: false,
        // scroll:true,
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
        onSelectRow:function(id){
            // var rowData = $("#jqGrid").jqGrid('getRowData',id);
            // $.get(baseURL + "baseData/prddata/info/"+rowData.prdId, function(r){
            //     vm.prdInfo = r.prdData;
            // });
			// vm.bomInfo.id = id;
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        	// $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-y" : "scroll" });
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var rowData = $("#jqGrid").jqGrid('getRowData',row_id);
            var url = baseURL + 'baseData/bomdetail/list?bomInfoId='+row_id;
            createSubGrid(subgrid_id,row_id,url);
        }
    });

    $("#bomDetailGrid").jqGrid({
        url: baseURL + 'baseData/bomdetail/list',
        datatype: "json",
        colModel: [
            { label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
            { label: 'mtrId', name: 'mtrId', index: 'mtrId', width: 50 ,hidden:true},
            { label: '类别', name: 'typeIdName', index: 'TYPE_ID_NAME', width: 80 ,hidden:false},
            { label: '原料名称', name: 'mtrIdName', index: 'MTR_ID_NAME', width: 200 ,formatter:function(value, options, row){
                if(row.semiFinished == '1'){//0-成品，1-半成品
                    return '*'+value;
                }else{
                    return value;
                }
            }},
            { label: '切割形状', name: 'mtrCutIdName', index: 'MTR_CUT_ID_NAME', width: 120 },
            { label: '规格说明', name: 'mtrExtendDesc', index: 'MTR_EXTEND_DESC', width: 150},
            { label: '净菜', name: 'netWgt', index: 'NET_WGT', editable:true,width: 40 },
            { label: '净菜得率', name: 'netRate', index: 'NET_RATE', editable:true,width: 40,formatter:function(value, options, row){
                if(value == null){
                    return 1;
                }else{
                    return value;
                }
            } },
            { label: '毛菜', name: 'grossWgt', index: 'GROSS_WGT', editable:true,width: 40,formatter:function(value, options, row){
                if(value == null){
                    return Number(row.netWgt)*Number(1);
                }else{
                    return value;
                }
            } },
            { label: '熟菜得率', name: 'modiRate', index: 'MODI_RATE', editable:true,width: 40 },
            { label: '熟菜', name: 'modiWgt', index: 'MODI_WGT',editable:true, width: 40 },
            { label: '单价', name: 'price', index: 'PRICE', editable:true,width: 40 ,formatter:function(value, options, row){
                if(value == null){
                    return Number(0).toFixed(2);
                }else{
                    return Number(value).toFixed(2);
                }
            } },
            { label: '成本', name: 'cost', index: 'COST', width: 40 ,formatter:function(value, options, row){
                if(value == null){
                    return Number(0).toFixed(2);
                }else{
                    return Number(value).toFixed(2);
                }
            } },
            { label: '成本率', name: 'costRate', index: 'COST_RATE', width: 40 ,hidden:true,formatter:function(value, options, row){
                return value+'%';
            }},
            { label: '备注', name: 'remark', index: 'REMARK', editable:true,width: 150 },
            { label: '是否半成品', name: 'semiFinished', index: 'SEMIFINISHED', editable:true,width: 80 ,hidden:true}

        ],
        viewrecords: true,
        height: "auto",
        rowNum: 999999,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: false,
        // scroll:true,
        // pager: "#bomDetailGridPager",
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
            // $.get(baseURL + "baseData/mtrcut/getCommbox", function(r){
            //     vm.cutArr = r.data;
            // });
            var rowData = $("#bomDetailGrid").jqGrid('getRowData',id);
            if(rowData.semiFinished == '0'){
                vm.mtrExtendArr = vm.initMtrExtendArr(rowData.mtrId);
            }

        },
        gridComplete:function(){
            //隐藏grid底部滚动条
            $("#bomDetailGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){

            // var url = baseURL + 'baseData/bomdetail/list?bomInfoId='+row_id;
            // createSubGrid(subgrid_id,row_id,url);

            var rowData = $("#bomDetailGrid").jqGrid('getRowData',row_id);
            if(rowData.semiFinished == '1'){//0-成品，1-半成品
                var url = baseURL + 'baseData/bomdetail/listByPrdId?prdId='+rowData.mtrId;
                createSubGrid(subgrid_id,row_id,url);
            }else{
                return false;
            }
        }
	});

    function createSubGrid(subgrid_id,row_id,url){
        var subgrid_table_id, pager_id;
        subgrid_table_id = subgrid_id + "_t";
        pager_id = "p_" + subgrid_table_id;
        $("#" + subgrid_id).html("<table id='" + subgrid_table_id + "' class='scroll'></table><div id='" + pager_id + "' class='scroll'></div>");
        jQuery("#" + subgrid_table_id).jqGrid({
            url : url,
            datatype : "json",
            colModel : [
                { label: 'id', name: 'id', index: 'id', width: 50, key: true ,hidden:true},
                { label: 'mtrId', name: 'mtrId', index: 'mtrId', width: 50,hidden:true},
                { label: '类别', name: 'typeIdName', index: 'TYPE_ID_NAME', width: 80 ,hidden:false},
                { label: '原料名称', name: 'mtrIdName', index: 'MTR_ID_NAME', width: 80 ,formatter:function(value, options, row){
                    if(row.semiFinished == '1'){//0-成品，1-半成品
                        return '*'+value;
                    }else{
                        return value;
                    }
                }},
                { label: '切割形状', name: 'mtrCutIdName', index: 'MTR_CUT_ID_NAME', width: 100 },
                { label: '规格说明', name: 'mtrExtendDesc', index: 'MTR_EXTEND_DESC', width: 100},
                { label: '净菜', name: 'netWgt', index: 'NET_WGT', editable:true,width: 40 },
                { label: '净菜得率', name: 'netRate', index: 'NET_RATE', editable:true,width: 40,formatter:function(value, options, row){
                    if(value == null){
                        return 1;
                    }else{
                        return value;
                    }
                } },
                { label: '毛菜', name: 'grossWgt', index: 'GROSS_WGT', editable:true,width: 40 },
                { label: '熟菜得率', name: 'modiRate', index: 'MODI_RATE', editable:true,width: 40 },
                { label: '熟菜', name: 'modiWgt', index: 'MODI_WGT',editable:true, width: 40  },
                { label: '单价', name: 'price', index: 'PRICE', editable:true,width: 40 ,formatter:function(value, options, row){
                    if(value == null){
                        return Number(0).toFixed(2);
                    }else{
                        return Number(value).toFixed(2);
                    }
                } },
                { label: '成本', name: 'cost', index: 'COST', width: 80 ,formatter:function(value, options, row){
                    if(value == null){
                        return Number(0).toFixed(2);
                    }else{
                        return Number(value).toFixed(2);
                    }
                } },
                { label: '成本率', name: 'costRate', index: 'COST_RATE', width: 80,hidden:true,formatter:function(value, options, row){
                    return value+'%';
                } },
                { label: '备注', name: 'remark', index: 'REMARK', editable:true,width: 80 },
                { label: '是否半成品', name: 'semiFinished', index: 'SEMIFINISHED', editable:true,width: 80 ,hidden:true}
            ],
            rowNum : 20,
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
            },
            subGrid:true,
            subGridRowExpanded:function(subgrid_id,row_id){
                var rowData = $("#" + subgrid_table_id).jqGrid('getRowData',row_id);
                if(rowData.semiFinished == '1'){//0-成品，1-半成品
                    var url = baseURL + 'baseData/bomdetail/listByPrdId?prdId='+rowData.mtrId;
                    createSubGrid(subgrid_id,row_id,url);
                }else{
                    return false;
                }
            }
        });
    }


    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        // 获取已激活的标签页的名称
        // vm.bomDetail = {};
        // var id = $("#jqGrid").jqGrid('getGridParam','selrow');
        // vm.bomDetail.bomId = id;
        activeTab = $(e.target).text();

        // $('#myTab a[href="#profile"]').tab('show')

        // // 获取前一个激活的标签页的名称
        // var previousTab = $(e.relatedTarget).text();
        // $(".active-tab span").html(activeTab);
        // $(".previous-tab span").html(previousTab);

        // vm.addMtrData={};
    });

    $("#addMtrSelectExtend").on("change",function(){
        var data = $(this).val();
        var text = $(this).find("option:selected").text();
        vm.bomDetail.mtrExtendId = data;
        vm.bomDetail.mtrExtendDesc = $.trim(text);

    });
});

var activeTab;

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
        addForm:false,
        showDetailList:false,
		title: null,
        prdInfo:null,
        typeInfo: {
            parentName:null,
            parentId:0
        },
        bomInfo: {
            prdId:null,
            prdIdName:null
        },
        editBomName:'',
        editBomInfo:{
            prdId:null,
            prdIdName:null
		},
        addMtrData:{
		    id:null,
            bomId:null,
            typeId:null,
            typeIdName:null,
            mtrId:null,
            mtrName:null,
            takeStnId:null,
            takeStnIdName:null
        },
        bomDetail:{
            bomId:null,
            mtrId:null,
            mtrIdName:null,
            typeId:null,
            typeIdName:null,
            mtrCutId:null,
            mtrCutIdName:null,
            takeStnId:null,
            takeStnIdName:null,
            grossWgt:null,
            netWgt:null,
            netRate:null,
            modiWgt:null,
            modiRate:null,
            semiFinished:null
        },
        bomDetailPrd:{
            bomId:null,
            mtrId:null,
            mtrIdName:null,
            typeId:null,
            typeIdName:null,
            mtrCutId:null,
            mtrCutIdName:null,
            takeStnId:null,
            takeStnIdName:null,
            grossWgt:null,
            netWgt:null,
            netRate:null,
            modiWgt:null,
            modiRate:null,
            semiFinished:null
        },
        takestnArr:{},
        cutArr:{},
        mtrExtendArr:{},
        tempDataMtr:null,
        tempDataPrd:null
	},
    created:function(){
        this.$data.tempDataMtr = JSON.parse(JSON.stringify(this.$data.bomDetail));
        this.$data.tempDataPrd = JSON.parse(JSON.stringify(this.$data.bomDetailPrd));
    },
	methods: {
        initBomDetail:function(){
            this.$data.bomDetail = Object.assign({},this.$data.tempDataMtr);
            this.$data.bomDetailPrd = Object.assign({},this.$data.tempDataPrd);
        },
        getTypeInfoTree:function(){
            //加载树
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
                title: "选择",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#typeInfoLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    if(opeation == 'add_mtr_typeId'){
                        vm.bomDetail.typeId = node[0].id;
                        vm.bomDetail.typeIdName = node[0].typeName;
                    }else if(opeation=='add_mtr_takeStnId'){
                        // $('#mtr_takeStnName').val(node[0].typeName);
                        vm.bomDetail.takeStnId = node[0].id;
                        vm.bomDetail.takeStnIdName = node[0].typeName;
                    }
                    layer.close(index);
                },
                btn2:function(event){
                    // vm.bomDetail = {};
                }
            });
        },
        getTypeInfoTakeStnTree:function(){
            //加载树
            $.ajax({
                type: "POST",
                url: baseURL + "baseData/typeinfo/select",
                data:{parentId:19},
                success: function(r){
                    ztree = $.fn.zTree.init($("#typeInfoTakeStnTree"), setting, r.typeInfoList);
                    var node = ztree.getNodeByParam("id", vm.typeInfo.parentId);
                    ztree.selectNode(node);
                }
            });
        },
        typeInfoTakeStnTree: function(opeation){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#typeInfoTakeStnLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                        // $('#mtr_takeStnName').val(node[0].typeName);
                    vm.bomDetail.takeStnId = node[0].id;
                    vm.bomDetail.takeStnIdName = node[0].typeName;
                    layer.close(index);
                },
                btn2:function(event){
                    // vm.bomDetail = {};
                }
            });
        },
		query: function () {//查询
			vm.reload();
		},
        getInfo: function(id){
            $.get(baseURL + "baseData/bominfo/info/"+id, function(r){
                vm.bomInfo = r.bomInfo;
            });
        },
		add: function(){//新增配方
            // 新增配方时，需要将配方名称编辑框设置为可编辑状态
            $('#addPrdIdName').attr('readonly', false);
			vm.showList = false;
			vm.addForm = true;
			vm.title = "新增";
			vm.bomInfo = {
                status:1
			};
            vm.getFieldData2();
		},
        update: function (event) {//修改配方
            // var id = vm.bomInfo.id;
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                return ;
            }
            // 为确保一个产品只和一个配料关联，在修改配方时，不允许修改产品名称
            $('#addPrdIdName').attr('readonly', true);
            vm.showList = false;
            vm.addForm = true;
            vm.showDetailList = false;
            vm.title = "修改";
            vm.getFieldData();
            vm.getInfo(id);
        },
        del:function(){
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                return ;
            }
            var ids = new Array();
            ids[0] = id;
            confirm('确定要删除选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: baseURL + "baseData/bominfo/delete",
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
        saveOrUpdate: function (event) {//保存 新增或修改的配方信息
            var url = vm.bomInfo.id == null ? "baseData/bominfo/save" : "baseData/bominfo/update";
            $.ajax({
                type: "POST",
                url: baseURL + url,
                contentType: "application/json",
                data: JSON.stringify(vm.bomInfo),
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
        search:function(){
            console.log(vm.orderInfo);
            var postData = {
                bomName: $('#search').val(),
                bomPy: $('#search').val()
                // prdIdName: $('#search').val()
            };
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData:postData,
                page:page
            }).trigger("reloadGrid");
            // vm.reload();
        },


        //原料配置
        detailConfig:function(){
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id == null){
            	alert("请选择配方进行维护！");
                return ;
            }
            vm.bomInfo.id = id;
            vm.showList = false;
            vm.addForm = false;
            vm.showDetailList = true;
            var rowData = $("#jqGrid").jqGrid('getRowData',id);
            vm.editBomName = rowData.bomName;

            vm.getFieldDataMTR();
            vm.getFieldDataPRD();
            // vm.initCutArr();

            $("#bomDetailGrid").jqGrid('setGridParam',{datatype: "json",
                postData:{'bomInfoId': id}
            }).trigger("reloadGrid");
		},
        addMtr:function(){//新增原料
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                return ;
            }

            //初始化相关数据
            vm.bomDetail.bomId = id;
            vm.bomDetailPrd.bomId = id;
            //显示新增弹窗
            vm.showDetailLayer();

        },
        editMtr:function(){
            var id = $("#bomDetailGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                return ;
            }
            var rowData = $("#bomDetailGrid").jqGrid('getRowData',id);
            if(rowData.semiFinished == '0'){
                vm.mtrExtendArr = vm.initMtrExtendArr(rowData.mtrId);
            }
            vm.getDetailInfo(id);
        },
        showDetailLayer:function(){
            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: vm.title,
                area: ['750px', '350px'],
                shadeClose: false,
                content: jQuery("#addLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {
                    var id = $("#bomDetailGrid").jqGrid('getGridParam','selrow');
                    if(activeTab == '半成品'){
                        vm.bomDetail = vm.bomDetailPrd;
                    }

                    var url = id == null ? "baseData/bomdetail/newSave":"baseData/bomdetail/newUpdate";
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.bomDetail),
                        success: function(r){
                            if(r.code === 0){
                                alert('操作成功', function(index){
                                    layer.close(num);
                                    vm.reloadDetail();
                                    vm.initBomDetail();
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                },
                btn2:function(event){
                    vm.initBomDetail();
                    vm.mtrExtendArr = {};
                }
            });
        },

        delMtr: function (event) {
            var id = $("#bomDetailGrid").jqGrid('getGridParam','selrow');
            if(id == null){
                return ;
            }
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "get",
				    url: baseURL + "baseData/bomdetail/delete/"+id,
                    // contentType: "application/json",
                    // data: JSON.stringify(id),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
                                $("#bomDetailGrid").jqGrid('setGridParam',{
                                    postData:{'bomInfoId': vm.bomInfo.id}
                                }).trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
        getDetailInfo:function(id){
            $.get(baseURL + "baseData/bomdetail/detailInfo/"+id, function(r){

                if(r.bomDetail.semiFinished == '0'){//原料
                    $('#myTab a[href="#mtrTab"]').tab('show');
                    vm.bomDetail = r.bomDetail;
                    vm.bomDetailPrd = {};
                }else if(r.bomDetail.semiFinished == '1'){//半成品
                    $('#myTab a[href="#prdTab"]').tab('show');
                    vm.bomDetail = {};
                    vm.bomDetailPrd = r.bomDetail;
                }
                // console.log(vm.bomDetail);
                // console.log(vm.bomDetailPrd);
                vm.showDetailLayer();
            });
        },

		reload: function (event) {
			vm.showList = true;
            vm.addForm = false;
            vm.showDetailList = false;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");

            vm.bomInfo={};
            vm.bomDetail={};
            vm.addMtrData={};
            vm.editBomInfo={};
		},
        reloadDetail: function (event) {
            vm.showList = false;
            vm.addForm = false;
            vm.showDetailList = true;
            $("#bomDetailGrid").jqGrid('setGridParam',{
                postData:{'bomInfoId': vm.bomInfo.id}
            }).trigger("reloadGrid");

        },
        getPinying:function(opeation){
            var word = this.bomInfo.bomName;
            if(typeof(word)!="undefined"){
                $.ajax({
                    url: baseURL + "common/commonUtil/word2pinying/"+word,
                    success: function(r){
                        if(opeation == "add"){
                            $("#addBomPy").val(r.pinying);
                            vm.bomInfo.bomPy = r.pinying;
                        }
                    }
                });
            }
        },
        getFieldDataPRD:function(){
            var query = $('#prdName').val();
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
                    vm.getInfoMtrOrPrd(item.id,'prd');
                    return item.name;
                }
            });

        },
        getFieldDataMTR:function(){
            // var query = $('#mtrName').val();
            $('#mtrName').typeahead({
                source: function (query, process) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "common/commonUtil/getTableData",
                        data:"tableName=MTR_DATA&fieldName=MTR_NAME:MTR_PY&searchWord="+query,
                        success: function (r) {
                            var resultList = r.data.map(function (item) {
                                var aItem = {id:item.id,py: item.MTR_PY, name: item.MTR_NAME};
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
                    //完善其它信息
                    vm.mtrExtendArr = vm.initMtrExtendArr(item.id);

                    // vm.getInfoMtrOrPrd(item.id,'mtr');

                    $.get(baseURL + "baseData/mtrdata/info/"+item.id, function(r){
                        // vm.addMtrData = r.mtrData;

                        // vm.bomDetail.bomId=vm.bomInfo.id;
                        vm.bomDetail.mtrId=r.mtrData.id;
                        vm.bomDetail.typeId=r.mtrData.typeId;
                        vm.bomDetail.typeIdName=r.mtrData.typeName;
                        vm.bomDetail.mtrIdName=r.mtrData.mtrName;
                        vm.bomDetail.mtrCode=r.mtrData.mtrCode;
                        vm.bomDetail.mtrCutId=r.mtrData.cutId;
                        vm.bomDetail.mtrCutIdName=r.mtrData.cutName;
                        vm.bomDetail.takeStnId=r.mtrData.takeStnId;
                        vm.bomDetail.takeStnIdName=r.mtrData.takeStnName;
                        vm.bomDetail.grossWgt="净菜*净得率";
                        vm.bomDetail.netWgt=null;
                        vm.bomDetail.netRate=r.mtrData.modiRate1;
                        vm.bomDetail.modiWgt="净菜*熟得率";
                        vm.bomDetail.modiRate=r.mtrData.modiRate2;
                        vm.bomDetail.semiFinished='0';


                    });

                    return item.name;

                }
            });
        },
        getFieldData:function(){
            var query = $('#addPrdIdName').val();
            $.ajax({
                type:"POST",
                url: baseURL + "common/commonUtil/getTableData",
                data:"tableName=PRD_DATA&fieldName=PRD_NAME:PRD_PY&searchWord="+query,
                success: function(r){
                    console.log(r);
                    var resultList = r.data.map(function (item) {
                        var aItem = {id:item.id,py: item.PRD_PY, name: item.PRD_NAME};
                        return JSON.stringify(aItem);
                    });
                    dataSource = resultList;
                    $('#addPrdIdName').typeahead({
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
                            vm.bomInfo.prdIdName = item.name;
                            vm.bomInfo.prdId = item.id;
                            vm.bomInfo.bomName = item.name;

                            $("#addBomPy").val(item.py);
                            vm.bomInfo.bomPy = item.py;

                            $('#addBomName').val(item.name);
                            return item.name;
                        }
                    });
                }
            });

        },
        getInfoMtrOrPrd: function(id,type){
            if(type == 'mtr'){
                // $.get(baseURL + "baseDataxxxxs
            }else if(type == 'prd'){
                $.get(baseURL + "baseData/prddata/info/"+id, function(r){

                    vm.bomDetailPrd.mtrId=r.prdData.id;
                    vm.bomDetailPrd.mtrIdName=r.prdData.prdName;
                    vm.bomDetailPrd.mtrCode=r.prdData.prdCode;

                    vm.bomDetailPrd.semiFinished='1';
                });
            }

        },
        countWgt:function(){
            var netWgt = $('#add_mtr_netWgt').val();
            vm.bomDetail.netWgt = netWgt;
            vm.bomDetail.grossWgt= (Number(netWgt)/Number(vm.bomDetail.netRate)).toFixed(2);
            vm.bomDetail.modiWgt= (Number(netWgt)*Number(vm.bomDetail.modiRate)).toFixed(2);
        },
        countPrdWgt:function() {
            vm.bomDetailPrd.modiWgt = (Number(vm.bomDetailPrd.netWgt)*Number(vm.bomDetailPrd.modiRate)).toFixed(2);
            //毛重=净重/净得率
            vm.bomDetailPrd.grossWgt= (Number(vm.bomDetailPrd.netWgt)/Number(vm.bomDetailPrd.netRate)).toFixed(2);
            $('#add_prd_modiWgt').val(vm.bomDetailPrd.modiWgt);
            $('#add_prd_grossWgt').val(vm.bomDetailPrd.grossWgt);
        },

        getFieldData2:function(){
            var query = $('#addPrdIdName').val();

            $('#addPrdIdName').typeahead({
                source:function(query,process){
                    $.ajax({
                        type:"POST",
                        url: baseURL + "common/commonUtil/getTableData",
                        data:"tableName=PRD_DATA&fieldName=PRD_NAME:PRD_PY&searchWord="+query,
                        success: function(r){
                            var resultList = r.data.map(function (item) {
                                var aItem = {id:item.id,py: item.PRD_PY, name: item.PRD_NAME};
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
                    vm.bomInfo.prdIdName = item.name;
                    vm.bomInfo.prdId = item.id;
                    vm.bomInfo.bomName = item.name;

                    $("#addBomPy").val(item.py);
                    vm.bomInfo.bomPy = item.py;

                    $('#addBomName').val(item.name);
                    return item.name;
                }
            });
        },
        initCutArr:function(){
            // $.get(baseURL + "baseData/mtrcut/getCommbox", function(r){
            //     vm.cutArr = r.data;
            // });
        },
        changeRate:function(){
            var netWgt = $('#add_mtr_netWgt').val();
            vm.bomDetail.netWgt = netWgt;
            vm.bomDetail.grossWgt= (Number(netWgt)/Number(vm.bomDetail.netRate)).toFixed(2);
            vm.bomDetail.modiWgt= (Number(netWgt)*Number(vm.bomDetail.modiRate)).toFixed(2);
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
        }
	}
});
vm.getTypeInfoTree();
vm.getTypeInfoTakeStnTree();
var dataSource;
vm.takestnArr = vm.initTypeInfoArr('19');
vm.cutArr = vm.initTypeInfoArr('68');
// vm.mtrExtendArr = {};



