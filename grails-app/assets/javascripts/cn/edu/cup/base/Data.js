

var operation4DataDiv
var currentPageOperation4DataDiv

var listDataKey_ProjectDiv
var paginationListDataKey_ProjectDiv

$(function(){
    console.info($("title").text() + "加载成功...");

    //整体的tab控制
    operation4DataDiv = $("#operation4DataDiv");

    currentPageOperation4DataDiv = readCookie("currentPageOperation4DataDiv", "项目列表");


    operation4DataDiv.tabs({
        onSelect: function (title, index) {
            console.info("选择标签：" + title + "---" + index);
            if (title !== "数据编辑") {
                $.cookie("currentPageOperation4DataDiv", title, {path:'/'});
            }
        }
    })

    //------------------------------------------------------------------------------------------------------------------
    //数据项
    //获取当前页面的div
    listDataKey_ProjectDiv = $("#listDataKey_ProjectDiv");
    paginationListDataKey_ProjectDiv = $("#paginationListDataKey_ProjectDiv");

    //获取当前页
    var currentPgaeDataKey_Project = readCookie("currentPgaeDataKey_Project", 1);
    var pageSizeDataKey_Project = readCookie("pageSizeDataKey_Project", pageSize);
    var totalDataKey_Project = countDataKey_Project();
    //console.info("记录总数：" + totalDataKey);


    //分页
    paginationListDataKey_ProjectDiv.pagination({
        pageSize: pageSizeDataKey_Project,
        total: totalDataKey_Project,
        showPageList: true,
        displayMsg: '',
        layout: ['first', 'prev', 'links', 'next', 'last'],
        //翻页函数
        onSelectPage: function (pageNumber, pageSize) {
            listDataKey_Project(pageNumber, pageSize);
            $.cookie("currentPgaeDataKey", pageNumber);
        }
    });
    paginationListDataKey_ProjectDiv.pagination("select", currentPgaeDataKey_Project);
    //------------------------------------------------------------------------------------------------------------------

    //这个放在最后
    operation4DataDiv.tabs("select", currentPageOperation4DataDiv); //激活上一次所停留的页面

});


/*
 * 统计记录总数
 * */
function countDataKey_Project() {
    //console.info("开始统计...")
    var total = ajaxCalculate("operation4Data/countDataKey/?dataType=project");
    //console.info("正在听统计结果：" + total);
    return total;
}

/*
* 列表显示当前所有对象
* */
function listDataKey_Project(pageNumber, pageSize) {
    //console.info("列表显示对象：");
    ajaxRun("operation4Data/listDataKey/?dataType=project&" + getParams(pageNumber, pageSize), 0, "listDataKey_ProjectDiv");
}
