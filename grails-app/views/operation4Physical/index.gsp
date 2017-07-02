<%--
  Created by IntelliJ IDEA.
  User: Win10Lxp
  Date: 2016/8/13
  Time: 15:04
--%>

<%@ page import="cn.edu.cup.physical.PhysicalQuantity" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<!--meta name="layout" content="main"-->
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

    <title>工程单位维护</title>

    <g:set var="entityName" value="Physical"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/base/${entityName}.js"/>

</head>

<body>

<div id="operation4PhysicalDiv" class="easyui-tabs">

    <!--PhysicalQuantity维护页面-->
    <div title="物理量维护页面">
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <!--各种工具的链接如下所示：-->
                    <a class="create" href="javascript: createPhysicalQuantity()">新增PhysicalQuantity</a>
                </li>
            </ul>
        </div>

        <div id="listPhysicalQuantityDiv"></div>

        <div id="paginationListPhysicalQuantityDiv" class="easyui-pagination"></div>
    </div>

    <!--QuantityUnit维护页面-->
    <div title="单位维护页面">
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <!--各种工具的链接如下所示：-->
                    <a class="create" href="javascript: createQuantityUnit()">新增QuantityUnit</a>
                </li>
            </ul>
        </div>

        <div id="listQuantityUnitDiv"></div>

        <div id="paginationListQuantityUnitDiv" class="easyui-pagination"></div>
    </div>

    <!--UnitSystem维护页面-->
    <div title="单位制维护页面">
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <!--各种工具的链接如下所示：-->
                    <a class="create" href="javascript: createUnitSystem()">新增UnitSystem</a>
                </li>
            </ul>
        </div>

        <div id="listUnitSystemDiv"></div>

        <div id="paginationListUnitSystemDiv" class="easyui-pagination"></div>
    </div>

    <!--编辑页面-->
    <div title="编辑">
        <div class="easyui-tabs">
            <div title="编辑物理量">
                <div id="editPhysicalQuantityDiv"></div>
            </div>
        </div>
    </div>

</div>

</body>
</html>