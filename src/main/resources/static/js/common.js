//jqGrid的配置信息
$.jgrid.defaults.width = 1000;
$.jgrid.defaults.responsive = true;
$.jgrid.defaults.styleUI = 'Bootstrap';

//工具集合Tools
window.T = {};

// 获取请求参数
// 使用示例
// location.href = http://localhost/index.html?id=123
// T.p('id') --> 123;
var url = function (name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
};
T.p = url;

//请求前缀
var baseURL = "/erp/";

//登录token
var token = localStorage.getItem("token");
if (token == 'null') {
    parent.location.href = baseURL + 'login.html';
}

//jquery全局配置

$.ajaxSetup({
    dataType: "json",
    cache: false,
    headers: {
        "token": token
    },
    xhrFields: {
        withCredentials: true
    },
    beforeSend:function(xhr){
        showLoading();
    },
    complete: function (xhr) {
        // console.log(xhr);
        hideLoading();
        //token过期，则跳转到登录页面
        if (xhr.responseJSON != undefined && xhr.responseJSON.code == 401) {
            parent.location.href = baseURL + 'login.html';
        } else {
            // xhr.onload = function() {
            //     if (this.status == 200) {
            //         var blob = this.response;
            //         var img = document.createElement("img");
            //         img.onload = function(e) {
            //             window.URL.revokeObjectURL(img.src);
            //         };
            //         img.src = window.URL.createObjectURL(blob);
            //         // $("#imgcontainer").html(img);
            //     }
            // }
            // xhr.send();

        }

    }
});

//jqgrid全局配置
$.extend($.jgrid.defaults, {
    ajaxGridOptions: {
        headers: {
            "token": token
        }
    }
});

//权限判断
function hasPermission(permission) {
    if (window.parent.permissions.indexOf(permission) > -1) {
        return true;
    } else {
        return false;
    }
}

//重写alert
window.alert = function (msg, callback) {
    parent.layer.alert(msg, function (index) {
        parent.layer.close(index);
        if (typeof(callback) === "function") {
            callback("ok");
        }
    });
}

//重写confirm式样框
window.confirm = function (msg, callback) {
    parent.layer.confirm(msg, {btn: ['确定', '取消']},
        function () {//确定事件
            if (typeof(callback) === "function") {
                callback("ok");
            }
        });
}

//选择一条记录
function getSelectedRow() {
    var grid = $("#jqGrid");
    var rowKey = grid.getGridParam("selrow");
    if (!rowKey) {
        alert("请选择一条记录");
        return;
    }

    var selectedIDs = grid.getGridParam("selarrrow");
    if (selectedIDs.length > 1) {
        alert("只能选择一条记录");
        return;
    }

    return selectedIDs[0];
}

//选择多条记录
function getSelectedRows() {
    var grid = $("#jqGrid");
    var rowKey = grid.getGridParam("selrow");
    if (!rowKey) {
        alert("请选择一条记录");
        return;
    }
    return grid.getGridParam("selarrrow");
}

//选择多条记录
function getSelectedRows(gridIdName) {
    var grid = $("#" + gridIdName);
    var rowKey = grid.getGridParam("selrow");
    if (!rowKey) {
        // alert("请选择一条记录");
        return;
    }
    return grid.getGridParam("selarrrow");
}

function getGridAllData(gridId) {
    var obj = jQuery("#" + gridId);
    //获取当前显示的数据
    //获取grid表中所有的rowid值
    var rowIds = obj.jqGrid('getDataIDs');
    //初始化一个数组arrayData容器，用来存放rowData
    // console.log(rowIds);
    var arrayData = new Array();
    if (rowIds.length > 0) {
        for (var i = 0; i < rowIds.length; i++) {
            //rowData=obj.getRowData(rowid);//这里rowid=rowIds[i];
            arrayData.push(obj.jqGrid('getRowData',rowIds[i]));
        }
    }
    return arrayData;
}

//选择多条记录
// function getSelectedRows() {
//     var grid = $("#jqGrid");
//     var rowKey = grid.getGridParam("selrow");
//     if(!rowKey){
//         alert("请选择一条记录");
//         return ;
//     }
//
//     return grid.getGridParam("selarrrow");
// }

function getSelectedRowCell(cellName) {
    var grid = $("#jqGrid");
    var rowKey = grid.getGridParam("selrow");
    if (!rowKey) {
        alert("请选择一条记录");
        return;
    }
    return grid.getCell(rowKey, cellName);
}

//判断是否为空
function isBlank(value) {
    return !value || !/\S/.test(value)
}

//日期处理
function dateFtt(fmt, date) {
    var o = {
        "M+": date.getMonth() + 1,                 //月份
        "d+": date.getDate(),                    //日
        "h+": date.getHours(),                   //小时
        "m+": date.getMinutes(),                 //分
        "s+": date.getSeconds(),                 //秒
        "q+": Math.floor((date.getMonth() + 3) / 3), //季度
        "S": date.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

Array.prototype.indexOf = function (val) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) return i;
    }
    return -1;
};

Array.prototype.remove = function (val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};

//自适应
function pageSize() {
    var winW, winH;
    if (window.innerHeight) {// all except IE
        winW = window.innerWidth;
        winH = window.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) {// IE 6 Strict Mode
        winW = document.documentElement.clientWidth;
        winH = document.documentElement.clientHeight;
    } else if (document.body) { // other
        winW = document.body.clientWidth;
        winH = document.body.clientHeight;
    }  // for small pages with total size less then the viewport
    return {WinW: winW, WinH: winH};
}

//loading效果
function initLoading() {
    $("body").append("<!-- loading -->" +
        "<div class='modal fade' id='loading' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' data-backdrop='static'>" +
        "<div class='modal-dialog' role='document'>" +
        "<div class='modal-content'>" +
        "<div class='modal-header'>" +
        "<h4 class='modal-title' id='myModalLabel'>提示</h4>" +
        "</div>" +
        "<div id='loadingText' class='modal-body'>" +
        "<span class='glyphicon glyphicon-refresh' aria-hidden='true'></span>" +
        "处理中，请稍候。。。" +
        "</div>" +
        "</div>" +
        "</div>" +
        "</div>"
    );
    $("#loading").modal("hide");
}

function showLoading(text) {
    $("#loadingText").html(text);
    $("#loading").modal("show");
}

function hideLoading() {
    $("#loading").modal("hide");
}

function openWindow(name)  {
    var iWidth=1100; //弹出窗口的宽度;
    var iHeight=550; //弹出窗口的高度;
    var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
    var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
    window.open('about:blank',name,"height="+iHeight+", width="+iWidth+", top="+iTop+", left="+iLeft+",toolbar=no, menubar=no,  scrollbars=yes,resizable=yes,location=no, status=no");
}

function openPostWindow(url, data, name){
    var tempForm = $("<form>");
    tempForm.attr("id", "tempForm1");
    tempForm.attr("style", "display:none");
    tempForm.attr("target", name);
    tempForm.attr("method", "post");
    tempForm.attr("action", url);
    var input1 = $("<input>");
    input1.attr("type", "hidden");
    input1.attr("name", "printData");
    input1.attr("value", data);
    tempForm.append(input1);
    tempForm.on("submit", function(){openWindow(name);}); // 必须用name不能只用url，否则无法传值到新页面
    tempForm.trigger("submit");
    $("body").append(tempForm);//将表单放置在web中
    tempForm.submit();
    $("tempForm1").remove();
}
