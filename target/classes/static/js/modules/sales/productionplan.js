$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'sales/productionplan/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '计划编号', name: 'planNo', index: 'PLAN_NO', width: 80 }, 			
			{ label: '序号', name: 'planSortNo', index: 'PLAN_SORT_NO', width: 80 ,hidden:true},
			{ label: '完成率', name: 'planCompletionRate', index: 'PLAN_COMPLETION_RATE', width: 80 },
            { label: '产品总数', name: 'prdMount', index: 'PRD_MOUNT', width: 80 },
            { label: '创建日期', name: 'createDate', index: 'CREATE_DATE', width: 80 },
			{ label: '创建人', name: 'createUser', index: 'CREATE_USER', width: 80 ,hidden:true},
			{ label: '状态', name: 'status', index: 'STATUS', width: 80 ,formatter: function(value, options, row){
                return value === 0 ?
                    '<span class="label label-danger">禁用</span>' :
                    '<span class="label label-success">正常</span>';
            }},
			{ label: '备注', name: 'remark', index: 'REMARK', width: 80 }, 			
			{ label: '成本', name: 'prdCost', index: 'PRD_COST', width: 80 ,hidden:true},
			{ label: '收入', name: 'prdIncome', index: 'PRD_INCOME', width: 80 ,hidden:true},
			{ label: '折后收入', name: 'discountIncome', index: 'DISCOUNT_INCOME', width: 80,hidden:true },
			{ label: '折扣成本比', name: 'discountCostRate', index: 'DISCOUNT_COST_RATE', width: 80 ,hidden:true},
			{ label: '成本率', name: 'costRate', index: 'COST_RATE', width: 80 ,hidden:true}
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
        },
        subGrid : true,
        subGridRowExpanded : function(subgrid_id,row_id){
            var url = baseURL + 'sales/productionorder/list?planId='+row_id;
            createSubGrid(subgrid_id,row_id,url);
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
                { label: 'id', name: 'id', index: 'ID', width: 50, key: true,hidden:true },
                { label: '生产订单编号', name: 'productionNo', index: 'PRODUCTION_NO', width: 80 },
                { label: '计划单ID', name: 'planId', index: 'PLAN_ID', width: 80 ,hidden:true},
                { label: '计划单编号', name: 'planNo', index: 'PLAN_NO', width: 80 },
                { label: '订单类型ID', name: 'orderTypeId', index: 'ORDER_TYPE_ID', width: 80 ,hidden:true},
                { label: '订单类型名称', name: 'orderTypeName', index: 'ORDER_TYPE_NAME', width: 80 },
                { label: '客户ID', name: 'customerId', index: 'CUSTOMER_ID', width: 80 ,hidden:true},
                { label: '客户编号', name: 'customerNo', index: 'CUSTOMER_NO', width: 80 },
                { label: '客户名称', name: 'customerName', index: 'CUSTOMER_NAME', width: 80 },
                { label: '售点ID', name: 'placeId', index: 'PLACE_ID', width: 80 ,hidden:true},
                { label: '售点名称', name: 'placeName', index: 'PLACE_NAME', width: 80 },
                { label: '操作', name: 'oper', index: 'SPEC', width: 150,formatter:function(value, options, row){
                    return "<button type='button' class='btn btn-primary btn-xs' onclick='showDetail("+row.id+","+row.planId+")'>明&nbsp;&nbsp;细</button>";
                }}
            ],
            rowNum : 20,
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
        })
    };


    $("#jqGridPRD").jqGrid({
        url: baseURL + 'sales/productionorderdetail/list',
        datatype: "json",
        colModel: [
            //dataRow={prdTypeName:prdData.typeName,prdTypeId:prdData.typeId,prdId:prdData.id,prdNo:prdData.prdNo,prdName:prdData.prdName,amount:vm.selectData.amount,PRICE1:0,PRICE2:prdData.referencePrice,COST:prdData.cost,revenue:0};
            { label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
            { label: '类型', name: 'prdTypeName', index: 'PRD_TYPE_NAME', width: 150 },
            { label: '类型', name: 'prdTypeId', index: 'PRD_TYPE_NAME', width: 150 ,hidden:true},
            { label: '名称', name: 'prdId', index: 'PRD_ID', width: 250,hidden:true },
            { label: '编号', name: 'prdNo', index: 'PRD_NO', width: 250 },
            { label: '名称', name: 'prdName', index: 'PRD_NAME', width: 250 },
            { label: '需求量', name: 'amount', index: 'AMOUNT', width: 100 },
            { label: '定价', name: 'price1', index: 'PRICE1', width: 100 },//建议售价
            { label: '售价', name: 'price2', index: 'PRICE2', width: 100 },//报价
            { label: '成本', name: 'cost', index: 'COST', width: 100 },
            { label: '预估收入', name: 'revenue', index: 'REVENUE', width: 100 }
        ],
        viewrecords: true,
        height: 255,
        rowNum: 10,
        rowList : [10,30,50],
        // rownumbers: true,
        // rownumWidth: 25,
        autowidth:true,
        // pager: "#jqGridPagerPRD",
        toolbar:[true,"top"],
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
            $("#jqGridPRD").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });

        $('#t_jqGridPRD').append('<input type="button" class="btn btn-primary" id="PRD_Add_btn" onclick="addRowData(this)" value="新增" title="新增"/>&nbsp;&nbsp;');
        $('#t_jqGridPRD').append('<input type="button" class="btn btn-primary" id="PRD_edit_btn" onclick="updateRowData(this)" value="修改" title="修改"/>&nbsp;&nbsp;');
        $('#t_jqGridPRD').append('<input type="button" class="btn btn-primary" id="PRD_del_btn" onclick="deleteRowData(this)" value="删除" title="删除"/>&nbsp;&nbsp;');
});


function addRowData(event){
    vm.addForm(event);
}

function updateRowData(event){
    vm.addForm(event);
}

function deleteRowData(event){

}

function showDetail(orderId,planId){
    vm.showList = false;
    vm.showForm = true;
    vm.title = "详情";

    vm.getInfo(planId);
    vm.getInfoOrder(orderId);
    $("#jqGridPRD").jqGrid('setGridParam',{
        postData:{'productionOrderId': orderId}
    }).trigger("reloadGrid");
}

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
        showForm: false,
		title: null,
        typeName:null,
        layerTitle:null,
		productionPlan: {},
        productionOrder:{},
        productionOrderDetail:{},
		info:{},
		detail:{},
        dataRow:{},
        selectData:{},
        selectGrid:null,
        orderTypeArr:{},
        customerArr:{},
        placeArr:{}
	},
	methods: {
	    initBtn:function(){
        },
        initGrid:function(){
        },
        getSelectDataPrd:function(){
            $('#prd').typeahead({
                source: function (query, process) {
                    $.ajax({
                        type: "POST",
                        url: baseURL + "sales/customerprd/list?&limit=100&page=1&searchWord="+query+"&customerId="+vm.productionOrder.customerId,
                        // async:false,
                        // data: "searchWord="+query+"&customerId="+vm.productionOrder.customerId,
                        success: function (r) {
                            var resultList = r.page.list.map(function (item) {
                                var aItem  = {id: item.prdId,py: item.prdPy, name: item.prdName};
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
                    vm.selectData.id=item.id;
                    vm.selectData.prdName=item.name;
                    return item.name;
                },
                afterSelect:function(obj){
                    // vm.productionOrder.customerId
                    $.ajax({
                        type: "POST",
                        url: baseURL + "sales/customerprd/getCustomerPrdById",
                        async:false,
                        data: {customerId:vm.productionOrder.customerId,prdId:vm.selectData.id},
                        success: function (r) {
                            vm.selectData.price1 = r.data.price1;
                            vm.selectData.price2 = r.data.price2;
                            $('#selectPrice1').val(r.data.price1);
                            $('#selectPrice2').val(r.data.price2);
                        }
                    });
                }
            });
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
                data:"tableName=TB_PRODUCTION_PLAN&noField=PLAN_NO",
                success: function(r){
                    no = r.newNo;
                }
            });
            return no;
        },
        createNewOrderNo:function(){
            var no = '';
            $.ajax({
                type:"POST",
                async:false,
                url: baseURL + "common/commonUtil/getTableNewNo",
                data:"tableName=TB_PRODUCTION_ORDER&noField=PRODUCTION_NO",
                success: function(r){
                    no = r.newNo;
                }
            });
            return no;
        },
		addForm:function(eventBtn){
            //判断是否是客户端&服务端操作---如存在计划Id则为服务端操作，否则为客户端操作。
            var id = $("#jqGrid").jqGrid('getGridParam','selrow');//计划单Id
            var rowData = $("#jqGrid").jqGrid("getRowData",id);//计划单信息

            //判断是否进行明细修改
            var prdRowId = $("#jqGridPRD").jqGrid('getGridParam','selrow');
            if(prdRowId){//修改Detail
                title = '编辑信息';
                url = "purchase/orderdetail/update";
                $.get(baseURL + "sales/productionplandetail/info/"+prdRowId, function(r){
                    console.log(r);
                });
            }else{//新增Detail
                title = '新增信息';
                url = "purchase/orderdetail/save";

            }
            vm.getSelectDataPrd();

            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: eventBtn.title+"产品",
                area: ['350px', '400px'],
                shadeClose: false,
                content: jQuery("#addLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {

                    var count = vm.getGridMaxId($('#jqGridPRD'));
                    var dataRow = {};
                    var prdData ;
                    $.ajax({
                        type:"POST",
                        async:false,
                        url: baseURL + "baseData/prddata/info/"+vm.selectData.id,
                        success: function(r){
                            prdData = r.prdData;
                            var newNo = vm.createNewOrderNo();
                            vm.productionOrder.productionNo=newNo;
                            // dataRow={prdTypeName:prdData.typeName,prdName:prdData.prdName,amount:vm.selectData.amount,PRICE1:0,PRICE2:prdData.referencePrice,COST:prdData.cost,revenue:0};
                            dataRow={prdTypeName:prdData.typeName,prdTypeId:prdData.typeId,prdId:prdData.id,prdNo:prdData.prdCode,prdName:prdData.prdName,amount:vm.selectData.amount,price1:vm.selectData.price1,price2:vm.selectData.price2,cost:prdData.cost,revenue:0};
                        }
                    });

                    $("#jqGridPRD").jqGrid("addRowData",Number(count)+1,dataRow,"first");
                    $("#jqGridPRD").jqGrid("setSelection",Number(count)+1);

                    layer.close(num);
                    vm.selectData = {};
                },
                btn2:function(event){
                    layer.close(num);
                    vm.selectData = {};
                    vm.initBtn();
                }
            });
		},
		add: function(){
			vm.showList = false;
			vm.showForm = true;
			vm.title = "新增";
			vm.productionPlan = {
                planNo:vm.createNewNo(),
				status:'1'
			};

            $('#PRD_Add_btn').attr("disabled",true);
            $('#PRD_edit_btn').attr("disabled",true);
            $('#PRD_del_btn').attr("disabled",true);


            $('#jqGridPRD').jqGrid("clearGridData");
            // vm.getSelectDataType();
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.showForm = true;
            vm.title = "修改";

            vm.getInfo(id);
            vm.productionOrder={
                planId:id
            };
            vm.productionOrderDetail={};
            $('#jqGridPRD').jqGrid("clearGridData");

            vm.getSelectDataType();
            vm.getSelectDataCustomer();
            vm.getSelectDataPlace();
		},
		saveOrUpdate: function (event) {
			var url = vm.productionPlan.id == null ? "sales/productionplan/save" : "sales/productionplan/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.productionPlan),
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
        saveOrUpdateDetail:function(){
            var plan_url = vm.productionPlan.id == null ? "sales/productionplan/save" : "sales/productionplan/update";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + plan_url,
                contentType: "application/json",
                data: JSON.stringify(vm.productionPlan),
                success: function(r){
                    console.log(r);
                    vm.productionOrder.planId = r.data.id;
                    vm.productionOrder.planNo = r.data.planNo;
                    // if(r.code === 0){
                    //     alert('操作成功', function(index){
                    //         vm.reload();
                    //     });
                    // }else{
                    //     alert(r.msg);
                    // }
                }
            });
            var order_url = vm.productionOrder.id == null ? "sales/productionorder/save" : "sales/productionorder/update";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + order_url,
                contentType: "application/json",
                data: JSON.stringify(vm.productionOrder),
                success: function(r){
                    console.log(r);
                    vm.productionOrder.id = r.data.id;
                }
            });


            var ids = $('#jqGridPRD').jqGrid("getDataIDs");
            alert(ids.length);

            if(ids.length > 0){
                //删除明细
                $.ajax({
                    type: "POST",
                    url: baseURL + "sales/productionorderdetail/deleteByOrderId",
                    // contentType: "application/json",
                    data: "orderId="+vm.productionOrder.id,
                    success: function(r){
                        console.log(r);
                        // if(r.code == 0){
                        //     alert('操作成功', function(index){
                        //         $("#jqGrid").trigger("reloadGrid");
                        //     });
                        // }else{
                        //     alert(r.msg);
                        // }
                    }
                });
            }

            $(ids).each(function(index,element){
                var rowData = $('#jqGridPRD').getRowData(element);
                console.log(rowData);
                vm.productionOrderDetail = rowData;
                vm.productionOrderDetail.productionOrderId=vm.productionOrder.id;
                vm.productionOrderDetail.id = null,
                console.log(vm.productionOrderDetail);
                //保存明细
                $.ajax({
                    type: "POST",
                    url: baseURL + "sales/productionorderdetail/save",
                    contentType: "application/json",
                    // data: rowData,
                    data: JSON.stringify(vm.productionOrderDetail),
                    success: function(r){
                        console.log(r);
                        // if(r.code == 0){
                        //     alert('操作成功', function(index){
                        //         $("#jqGrid").trigger("reloadGrid");
                        //     });
                        // }else{
                        //     alert(r.msg);
                        // }
                    }
                });
            });

            // var allRowData = $('#jqGridPRD').jqGrid("getRowData");
            // alert(allRowData.length);
            // $(allRowData).each(function(index,element){
            //     console.log(element);
            // });
            // var one = $('#jqGridPRD').jqGrid("getRowData",0);
            // console.log(one);
            vm.reload();
        },
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "sales/productionplan/delete",
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
			$.get(baseURL + "sales/productionplan/info/"+id, function(r){
                vm.productionPlan = r.productionPlan;
            });
		},
        getInfoOrder: function(id){
            $.get(baseURL + "sales/productionorder/info/"+id, function(r){
                vm.productionOrder = r.productionOrder;
            });
        },
		reload: function (event) {
			vm.showList = true;
			vm.showForm = false;


            vm.initBtn();
            vm.initGrid();

			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		},
        getGridMaxId:function(gridObj){
		    var ids = $(gridObj).jqGrid('getDataIDs');
		    var j=0;
		    for(var i=0;i<ids.length;i++){
		        if(ids[i]>j){
                    j=ids[i];
                }
            }
            return j;
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
        initCsutomerInfoArr:function(){
            var dataArr = "";
            $.ajax({
                type: "POST",
                async:false,
                url: baseURL + "common/commonUtil/getDataToCommbox",
                // contentType: "application/json",
                data: {tableName:"tb_customer_info",search:"STATUS='1'",returnField:"ID as value,CUSTOMER_NAME as text"},
                success: function(r){
                    dataArr =  r.data;
                }
            });
            return dataArr;
        },
        selectVal:function(type){
            var i=0;
            if(type == 'orderTypeId'){
                i=1;
                console.log(vm.productionOrder.orderTypeId);
            }else if(type == 'customerId'){
                i=2
                console.log(vm.productionOrder.customerId);
            }else if(type == 'placeId'){
                i=3
                console.log(vm.productionOrder.placeId);
            }
            if(i == 3){

                $('#PRD_Add_btn').attr("disabled",false);
                $('#PRD_edit_btn').attr("disabled",false);
                $('#PRD_del_btn').attr("disabled",false);
            }
        }
	}
});

vm.orderTypeArr = vm.initTypeInfoArr(40);
vm.placeArr = vm.initTypeInfoArr(82);
vm.customerArr = vm.initCsutomerInfoArr();