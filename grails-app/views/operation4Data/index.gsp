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
<!--针对域类的包含-->
    <g:set var="entityName" value="Data"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${entityName}维护</title>
    <asset:javascript src="cn/edu/cup/base/${entityName}.js"/>
    <!--end 针对域类的包含-->
</head>

<body>
<div class="easyui-tabs" id="operation4DataDiv">
    <div title="项目列表">
        <div id="listDataKey_ProjectDiv"></div>
        <div id="paginationListDataKey_ProjectDiv" class="easyui-pagination"></div>
    </div>
    <div title="模型列表"></div>
    <div title="数据列表"></div>
    <div title="数据编辑"></div>

</div>

</body>
</html>
