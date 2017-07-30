var operation4PipeSimulationDiv;
var currentTabPipeSimulationDiv;

var listHydraulicProjectDiv;
var paginationListHydraulicProjectDiv;

$(function() {
    console.info("管道模拟...");

    //------------------------------------------------------------------------------------------------------------------
    //总体设置
    operation4PipeSimulationDiv = $("#operation4PipeSimulationDiv");
    currentTabPipeSimulationDiv = readCookie("currentTabPipeSimulationDiv", "模拟工程");

    //设置页面跳转函数
    operation4PipeSimulationDiv.tabs({
        onSelect: function (title, index) {
            console.info("选择标签：" + title + "---" + index);
            if (title !== "编辑") {
                $.cookie("currentTabPipeSimulationDiv", title, {path:'/'});
                //$.cookie("currentTabPhysicalDiv", title);
            }
        }
    })

    //------------------------------------------------------------------------------------------------------------------
    //页面跳转--放到最后，试试看
    operation4PipeSimulationDiv.tabs("select", currentTabPipeSimulationDiv);

    //----------------------------------------------------------------------------------------------------------------
    //获取当前页面的div
    listHydraulicProjectDiv = $("#listHydraulicProjectDiv");
    paginationListHydraulicProjectDiv = $("#paginationListHydraulicProjectDiv");

    //获取当前页
    var currentPgaeHydraulicProject = readCookie("currentPgaeHydraulicProject", 1);
    var pageSizeHydraulicProject = readCookie("pageSizeHydraulicProject", pageSize);
    var totalHydraulicProject = countHydraulicProject();
    //console.info("记录总数：" + totalHydraulicProject);


    //分页
    paginationListHydraulicProjectDiv.pagination({
        pageSize: pageSizeHydraulicProject,
        total: totalHydraulicProject,
        showPageList: true,
        displayMsg: '',
        layout: ['first', 'prev', 'links', 'next', 'last'],
        //翻页函数
        onSelectPage: function (pageNumber, pageSize) {
            listHydraulicProject(pageNumber, pageSize);
            $.cookie("currentPgaeHydraulicProject", pageNumber);
        }
    });
    paginationListHydraulicProjectDiv.pagination("select", currentPgaeHydraulicProject);
    //------------------------------------------------------------------------------------------------------------------

});

/*
 * 统计记录总数
 * */
function countHydraulicProject() {
    console.info("开始统计...")
    var total = ajaxCalculate("operation4PipeSimulation/countHydraulicProject");
    console.info("正在听统计结果：" + total);
    return total;
}

/*
* 列表显示当前所有对象
* */
function listHydraulicProject(pageNumber, pageSize) {
    //console.info("列表显示对象：");
    ajaxRun("operation4PipeSimulation/listHydraulicProject" + getParams(pageNumber, pageSize), 0, "listHydraulicProjectDiv");
}

/*
 * 新建
 * */
function createHydraulicProject(id) {
    operation4PipeSimulationDiv.tabs("select", "编辑")
    ajaxRun("operation4PipeSimulation/createHydraulicProject", id, "editHydraulicProjectDiv");
}

/*
 * 编辑
 * */
function editHydraulicProject(id) {
    operation4PipeSimulationDiv.tabs("select", "编辑")
    //console.info("编辑HydraulicProject." + id);
    ajaxRun("operation4PipeSimulation/editHydraulicProject", id, "editHydraulicProjectDiv");
}
