<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 实现可定制的布局 -->
    <g:if test="${layout}">
        <meta name="layout" content="${layout}"/>
    </g:if>
    <g:else>
        <g:if test="${session.layout}">
            <meta name="layout" content="${session.layout}"/>
        </g:if>
        <g:else>
            <meta name="layout" content="main"/>
        </g:else>
    </g:else>
<!-- end 实现可定制的布局 -->

    <g:set var="entityName" value="PipeSimulation"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>

    <!--为了处理cookie工作不正常的问题-->
    <g:javascript>
    function checkSessionPhysicalQuantity(currentTab) {
        console.info("处理前的：" + currentTab);
        var tab = currentTab;
        <% if (session.getAttribute("currentPhysicalQuantity") != null) { %>
        tab = "单位维护页面";
        <% } %>
        console.info("处理后的：" + tab);
        return tab;
    }
    </g:javascript>

    <asset:javascript src="cn/edu/cup/lps/${entityName}.js"/>

    <title>${entityName}维护</title>
</head>

<body>

<div class="nav">
    <ul>
        <li>
            <a href="#" class="create">新建工程</a>
        </li>
        <li>
            <a href="#" class="create">新建管道</a>
        </li>
        <li>
            <a href="#" class="create">新建初始条件</a>
        </li>
        <li>
            <a href="#" class="create">新建边界条件</a>
        </li>
        <li>
            <a href="#" class="create">事件序列</a>
        </li>
    </ul>
</div>

<div class="easyui-tabs" id="operation4PipeSimulationDiv">

    <div title="模拟工程">
        <div id="listHydraulicProjectDiv"></div>
        <div id="paginationListHydraulicProjectDiv"></div>
    </div>

    <div title="管道">
        <div class="easyui-tabs">
            <div title="站点"></div>

            <div title="高程-里程"></div>

            <div title="地温"></div>

            <div title="传热系数"></div>

            <div title="设备"></div>
        </div>
    </div>

    <div title="初始条件"></div>

    <div title="边界条件"></div>

    <div title="事件序列"></div>
</div>
</body>
</html>
