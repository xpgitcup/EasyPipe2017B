/**
 * Created by LiXiaoping on 2017/5/30.
 */

var listSystemLogDiv;
var paginationListSystemLog;
var listSystemChatDiv;
var paginationListSystemChatDiv;

$(function() {
    console.info("这是首页...");

    //获取当前页面的div
    listSystemLogDiv = $("#listSystemLogDiv");
    paginationListSystemLogDiv = $("#paginationListSystemLogDiv")
    listSystemChatDiv = $("#listSystemChatDiv");
    paginationSystemChatDiv = $("#paginationSystemChatDiv");

    //获取当前页
    var currentPgaeSystemLog = readCookie("currentPgaeSystemLog", 1);
    var pageSizeSystemLog = readCookie("pageSizeSystemLog", pageSize);
    var totalSystemLog = countSystemLog();
    console.info("记录总数：" + totalSystemLog);

    //加载数据
    listSystemLog(currentPgaeSystemLog, pageSizeSystemLog);

    //分页
    paginationListSystemLogDiv.pagination({
        pageSize: pageSizeSystemLog,
        total: totalSystemLog,
        showPageList: true,
        displayMsg: '',
        layout: ['first', 'prev', 'links', 'next', 'last'],
        //翻页函数
        onSelectPage:function(pageNumber, pageSize){
            listSystemLog(pageNumber, pageSize);
        }
    });

    paginationListSystemChatDiv.pagination({
        pageSize: pageSizeSystemChat,
        total: totalSystemChat,
        showPageList: true,
        displayMsg: '',
        layout: ['first', 'prev', 'links', 'next', 'last'],
        //翻页函数
        onSelectPage:function(pageNumber, pageSize){
            listSystemChat(pageNumber, pageSize);
        }
    });

});



