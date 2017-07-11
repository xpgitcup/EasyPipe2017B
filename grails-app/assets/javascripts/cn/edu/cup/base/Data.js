

var operation4DataDiv
var currentPageOperation4DataDiv

var listDataKey_ProjectDiv
var paginationListDataKey_ProjectDiv

var listDataKey_ProjecCasetDiv
var paginationListDataKey_ProjectCaseDiv

var listDataKey_DataModelDiv
var paginationListDataKey_DataModelDiv


var listDataKey_DataDiv
var paginationListDataKey_DataDiv

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
            $.cookie("currentPgaeDataKey_Project", pageNumber);
        }
    });
    paginationListDataKey_ProjectDiv.pagination("select", currentPgaeDataKey_Project);
    //------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------------------------------------------------------------------------
    //数据项
    //获取当前页面的div
    listDataKey_ProjectCaseDiv = $("#listDataKey_ProjectCaseDiv");
    paginationListDataKey_ProjectCaseDiv = $("#paginationListDataKey_ProjectCaseDiv");

    //获取当前页
    var currentPgaeDataKey_ProjectCase = readCookie("currentPgaeDataKey_ProjectCase", 1);
    var pageSizeDataKey_ProjectCase = readCookie("pageSizeDataKey_ProjectCase", pageSize);
    var totalDataKey_ProjectCase = countDataKey_ProjectCase();
    //console.info("记录总数：" + totalDataKey);


    //分页
    paginationListDataKey_ProjectCaseDiv.pagination({
        pageSize: pageSizeDataKey_ProjectCase,
        total: totalDataKey_ProjectCase,
        showPageList: true,
        displayMsg: '',
        layout: ['first', 'prev', 'links', 'next', 'last'],
        //翻页函数
        onSelectPage: function (pageNumber, pageSize) {
            listDataKey_ProjectCase(pageNumber, pageSize);
            $.cookie("currentPgaeDataKey_ProjectCase", pageNumber);
        }
    });
    paginationListDataKey_ProjectCaseDiv.pagination("select", currentPgaeDataKey_ProjectCase);
    //------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------------------------------------------------------------------------
    //数据模型项
    //获取当前页面的div
    listDataKey_DataModelDiv = $("#listDataKey_DataModelDiv");
    paginationListDataKey_DataModelDiv = $("#paginationListDataKey_DataModelDiv");

    //获取当前页
    var currentPgaeDataKey_DataModel = readCookie("currentPgaeDataKey_DataModel", 1);
    var pageSizeDataKey_DataModel = readCookie("pageSizeDataKey_DataModel", pageSize);
    var totalDataKey_DataModel = countDataKey_DataModel();
    //console.info("记录总数：" + totalDataKey);


    //分页
    paginationListDataKey_DataModelDiv.pagination({
        pageSize: pageSizeDataKey_DataModel,
        total: totalDataKey_DataModel,
        showPageList: true,
        displayMsg: '',
        layout: ['first', 'prev', 'links', 'next', 'last'],
        //翻页函数
        onSelectPage: function (pageNumber, pageSize) {
            listDataKey_DataModel(pageNumber, pageSize);
            $.cookie("currentPgaeDataKey_DataModel", pageNumber);
        }
    });
    paginationListDataKey_DataModelDiv.pagination("select", currentPgaeDataKey_DataModel);
    //------------------------------------------------------------------------------------------------------------------

    //------------------------------------------------------------------------------------------------------------------
    //数据模型项
    //获取当前页面的div
    listDataKey_DataDiv = $("#listDataKey_DataDiv");
    paginationListDataKey_DataDiv = $("#paginationListDataKey_DataDiv");

    //获取当前页
    var currentPgaeDataKey_Data = readCookie("currentPgaeDataKey_Data", 1);
    var pageSizeDataKey_Data = readCookie("pageSizeDataKey_Data", pageSize);
    var totalDataKey_Data = countDataKey_Data();
    //console.info("记录总数：" + totalDataKey);


    //分页
    paginationListDataKey_DataDiv.pagination({
        pageSize: pageSizeDataKey_Data,
        total: totalDataKey_Data,
        showPageList: true,
        displayMsg: '',
        layout: ['first', 'prev', 'links', 'next', 'last'],
        //翻页函数
        onSelectPage: function (pageNumber, pageSize) {
            listDataKey_Data(pageNumber, pageSize);
            $.cookie("currentPgaeDataKey_Data", pageNumber);
        }
    });
    paginationListDataKey_DataDiv.pagination("select", currentPgaeDataKey_Data);
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
    ajaxRun("operation4Data/listDataKey/" + getParams(pageNumber, pageSize) + "&dataType=project", 0, "listDataKey_ProjectDiv");
}

/*
 * 统计记录总数
 * */
function countDataKey_ProjectCase() {
    //console.info("开始统计...")
    var total = ajaxCalculate("operation4Data/countDataKey/?dataType=projectCase");
    //console.info("正在听统计结果：" + total);
    return total;
}

/*
* 列表显示当前所有对象
* */
function listDataKey_ProjectCase(pageNumber, pageSize) {
    //console.info("列表显示对象：");
    ajaxRun("operation4Data/listDataKey/" + getParams(pageNumber, pageSize) + "&dataType=projectCase", 0, "listDataKey_ProjectCaseDiv");
}

/*
 * 统计记录总数
 * */
function countDataKey_DataModel() {
    //console.info("开始统计...")
    var total = ajaxCalculate("operation4Data/countDataKey/?dataType=dataModel");
    //console.info("正在听统计结果：" + total);
    return total;
}

/*
* 列表显示当前所有对象
* */
function listDataKey_DataModel(pageNumber, pageSize) {
    //console.info("列表显示对象：");
    ajaxRun("operation4Data/listDataKey/" + getParams(pageNumber, pageSize) + "&dataType=dataModel", 0, "listDataKey_DataModelDiv");
}

/*
 * 统计记录总数
 * */
function countDataKey_Data() {
    //console.info("开始统计...")
    var total = ajaxCalculate("operation4Data/countDataKey");
    //console.info("正在听统计结果：" + total);
    return total;
}

/*
* 列表显示当前所有对象
* */
function listDataKey_Data(pageNumber, pageSize) {
    //console.info("列表显示对象：");
    ajaxRun("operation4Data/listDataKey/" + getParams(pageNumber, pageSize) + "", 0, "listDataKey_DataDiv");
}
