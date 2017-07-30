<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'pipeNetwork.label', default: 'PipeNetwork')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-pipeNetwork" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div id="list-pipeNetwork" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <th>管道名称</th>
        <th>节点数</th>
        <th>连接关系数</th>
        </thead>
        <tbody>
        <g:each in="${pipeNetworkList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>${item.name}</td>
                <td>${item.hydraulicVertexes?.size()}</td>
                <td>${item.hydraulicEdges?.size()}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <!--f:table collection="${pipeNetworkList}" /-->

</div>
</body>
</html>