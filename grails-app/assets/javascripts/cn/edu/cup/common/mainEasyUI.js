/**
 * Created by LiXiaoping on 2017/4/3.
 */

var mainSystemMenuDiv;
var currentAccordion;
var currentPanel;
var mainPanel;

$(function () {
    console.info("这是整体布局...");

    mainPanel = $("#mainPanel");
    mainSystemMenuDiv = $("#mainSystemMenuDiv");

    //显示系统菜单
    showSytemMenu();

    //读取当前的Panel
    //currentAccordion = readCookie("currentAccordion", "底层管理");
    currentPanel = readCookie("mainPanel", "底层管理");
    console.info("上一次停留在：" + currentPanel);
    mainPanel.panel('setTitle', "主功能区=>" + currentPanel);  //没有状态---没有状态

    mainSystemMenuDiv.accordion({
        onSelect: function (title, index) {
            console.info("选择：" + title + "---" + index);
            if (index>-1) {
                mainPanel.panel('setTitle', "主功能区=>" + title);
                $.cookie('mainPanel', title, {path: '/'});
            }
        }
    });
    //mainSystemMenuDiv.accordion('select', currentAccordion);
    currentAccordion = mainSystemMenuDiv.accordion('getSelected');
    console.info(currentAccordion.attr('title'));
    if (currentAccordion !== currentPanel) {
        mainSystemMenuDiv.accordion('select', currentPanel);
    }

});

function showSytemMenu() {
    var systemMenuList = getSystemMenuList();
    console.info("获取的菜单：");
    console.info(systemMenuList);
    for(var item in systemMenuList) {
        console.info(systemMenuList[item].panelName);
        /**
        mainSystemMenuDiv.append(" <div title=\"" + systemMenuList[item].panelName + "\" data-options=\"iconCls:\'icon-ok\'\" style=\"overflow:auto\">");
        mainSystemMenuDiv.append("<ul id=\"" + systemMenuList[item].treeDivName + "\" class=\"easyui-tree\" url=\"home/getSystemMenuTree/${menuItem.treeData}\" ></ul>");
        mainSystemMenuDiv.append("</div>")
         **/  //显示不出来
        mainSystemMenuDiv.accordion('add',{
            titel: systemMenuList[item].panelName,
            content: '新增加的',
            select: false
        })
    }
}