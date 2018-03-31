$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'baseData/typedata/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'ID', width: 50, key: true ,hidden:true},
			{ label: '编码', name: 'dataCode', index: 'DATA_CODE', width: 80 },
			{ label: '名称', name: 'dataName', index: 'DATA_NAME', width: 80 },
			{ label: '分类', name: 'typeId', index: 'TYPE_ID', width: 80 ,hidden:true},
            { label: '分类', name: 'typeName', index: 'TYPEName', width: 80 ,formatter: function(value, options, row){
            	var text = "";
            	$.each(vm.options,function(index,item){
					if(row.typeId == item.value){
						text = item.text;
						return false;
					}
				});
            	return text;
			}},
			{ label: '拼音码', name: 'dataPy', index: 'DATA_PY', width: 80 ,hidden:true},
			{ label: '状态', name: 'status', index: 'STATUS', width: 80 ,hidden:true}
        ],
		viewrecords: true,
        height: 385,
        rowNum: 999999,
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
            records: "page.totalCount",
			repeatitems:false
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
		beforeSelectRow:function(){
            $("#jqGrid").jqGrid("resetSelection");
            return(true);
		},
        onSelectRow:function(id){
            $.get(baseURL + "baseData/typedata/info/"+id, function(r){
                vm.typeData = r.typeData;
            });
		}
    });

    jQuery("#jqGrid").jqGrid('navGrid','#jqGridPager',{edit:false,add:false,del:false});
    jQuery("#jqGrid").jqGrid('bindKeys', {"onEnter":function( rowid ) { alert("你enter了一行， id为:"+rowid)} } );

    /*
    $('#jqGrid').keypress(function(e)
    {
        if(e.keyCode == 38 || e.keyCode == 40)  //up/down arrow override
        {
            var gridArr = $('#jqGrid').getDataIDs();
            var selrow = $('#jqGrid').getGridParam("selrow");
            var curr_index = 0;
            for(var i = 0; i < gridArr.length; i++)
            {
                if(gridArr[i]==selrow)
                    curr_index = i;
            }

            if(e.keyCode == 38) //up
            {
                if((curr_index-1)>=0)
                    $('#jqGrid').resetSelection().setSelection(gridArr[curr_index-1],true);
            }
            if(e.keyCode == 40) //down
            {
                if((curr_index+1)<gridArr.length)
                    $('#jqGrid').resetSelection().setSelection(gridArr[curr_index+1],true);
            }
        }

    });
    */
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		typeData: {},
		typeDataAdd:{},
        options:null,
        q:{
            typeId:null,
			dataCode:null,
			dataName:null
        }
	},
	created:function(){
        $.ajax({
			type: "POST",
			url: baseURL+"baseData/typeinfo/getTypeInfo2Commbom",
			contentType: "application/json",
			success: function(r){
				vm.options = r.dataJson;
			}
		})
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.typeData = {};
		},
        insert: function(){
            var num = layer.open({
                type: 1,
                skin: 'layui-layer-molv',
                title: "修改密码",
                area: ['550px', '350px'],
                shadeClose: false,
                content: jQuery("#addLayer"),
                btn: ['提交','取消'],
                btn1: function (event) {
                    var url = "baseData/typedata/save";
                    $.ajax({
                        type: "POST",
                        url: baseURL + url,
                        contentType: "application/json",
                        data: JSON.stringify(vm.typeDataAdd),
                        success: function(r){
                            if(r.code === 0){
                                alert('操作成功', function(index){
                                    layer.close(num);
                                    vm.reload();
                                    vm.typeDataAdd = {};
                                });
                            }else{
                                alert(r.msg);
                            }
                        }
                    });
                },
				btn2:function(event){
                    vm.typeDataAdd = {};
				}
            });
        },
		update: function (event) {
			var url = vm.typeData.id == null ? "baseData/typedata/save" : "baseData/typedata/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.typeData),
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
				    url: baseURL + "baseData/typedata/delete",
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
			$.get(baseURL + "baseData/typedata/info/"+id, function(r){
                vm.typeData = r.typeData;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{
                postData:{'typeId': vm.q.typeId,'dataCode':vm.q.dataCode,'dataName':vm.q.dataName},
                page:page
            }).trigger("reloadGrid");
		},
        getPinying:function(){
            var word = this.typeDataAdd.dataName;
            if(typeof(word)!="undefined"){
                $.ajax({
                    url: baseURL + "common/commonUtil/word2pinying/"+word,
                    success: function(r){
                        $("#dataPy").val(r.pinying);
                        vm.typeDataAdd.dataPy = r.pinying;

                    }
                });
            }
        }
	}
});