/**
 * Created by LiXiaoping on 2017/4/5.
 */

//物理量维护--变量部分
var PhysicalQuantityDiv;
var listPhysicalQuantityDiv;
var paginationPhysicalQuantityDiv;

$(function () {
    console.info("物理单位管理...");

    //总体设置-----------------------------------------------------------------------------------------------------------
    //获取当前tabs的变量
    operation4PhysicalQuantityDiv = $("#PhysicalQuantityDiv");
    //读取上次所停留的页面
    var currentTabPhysicalQuantityDiv = readCookie("currentTabPhysicalQuantityDiv", "我在听");
    //页面跳转
    operation4PhysicalQuantityDiv.tabs("select", currentTabPhysicalQuantityDiv);
    //设置页面跳转函数
    operation4PhysicalQuantityDiv.tabs({
        onSelect: function (title) {
            $.cookie("currentTabPhysicalQuantityDiv", title);
        }
    })
    //------------------------------------------------------------------------------------------------------------------

    //物理量维护---------------------------------------------------------------------------------------------------------
    //获取当前页面的div
    listPhysicalQuantityDiv = $("#listPhysicalQuantityDiv");
    paginationListPhysicalQuantityDiv = $("#paginationListPhysicalQuantityDiv");

    //获取当前页
    var currentPgaePhysicalQuantity = readCookie("currentPgaePhysicalQuantity", 1);
    var pageSizePhysicalQuantity = readCookie("pageSizePhysicalQuantity", pageSize);
    var totalPhysicalQuantity = countPhysicalQuantity();
    console.info("记录总数：" + totalPhysicalQuantity);

    //加载数据
    listPhysicalQuantity(currentPgaePhysicalQuantity, pageSizePhysicalQuantity);

    //分页
    paginationListPhysicalQuantityDiv.pagination({
        pageSize: pageSizePhysicalQuantity,
        total: totalPhysicalQuantity,
        showPageList: true,
        displayMsg: '',
        layout: ['first', 'prev', 'links', 'next', 'last'],
        //翻页函数
        onSelectPage: function (pageNumber, pageSize) {
            listPhysicalQuantity(pageNumber, pageSize);
            $.cookie("currentPgaePhysicalQuantity", pageNumber);
        }
    });
    paginationListPhysicalQuantityDiv.pagination("select", currentPgaePhysicalQuantity);
    //------------------------------------------------------------------------------------------------------------------
});

/*
 * 统计记录总数
 * */
function countPhysicalQuantity() {
    console.info("开始统计...")
    var total = ajaxCalculate("operation4Physical/countPhysicalQuantity");
    console.info("正在听统计结果：" + total);
    return total;
}

/*
* 列表显示当前所有对象
* */
function listPhysicalQuantity(pageNumber, pageSize) {
    console.info("列表显示对象：");
    ajaxRun("operation4Physical/listPhysicalQuantity" + getParams(pageNumber, pageSize), 0, "listPhysicalQuantityDiv");
}

//----------------------------------------------------------------------------------------------------------------------
/*
 * 新建
 * */
function createPhysicalQuantity(id) {
    PhysicalQuantityDiv.tabs("select", "对话");
    ajaxRun("operation4Physical/createPhysicalQuantity", id, "showPhysicalQuantityDiv");
}

/*
 * 编辑
 * */
function editPhysicalQuantity(id) {
    console.info("编辑PhysicalQuantity." + id);
    ajaxRun("operation4Physical/editPhysicalQuantity", id, "showPhysicalQuantityDiv");
}

/*
 * 显示当前
 * */
function showPhysicalQuantity(id) {
    console.info("显示当前" + id);
    if (id) {
        ajaxRun("operation4PhysicalQuantity/getPhysicalQuantity", id, "showPhysicalQuantityDiv");
    }
}

