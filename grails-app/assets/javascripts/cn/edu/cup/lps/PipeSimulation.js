var operation4PipeSimulationDiv;
var currentTabPipeSimulationDiv;

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

});