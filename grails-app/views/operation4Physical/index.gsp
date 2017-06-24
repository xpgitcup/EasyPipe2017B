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

    <asset:javascript src="cup/physical.js"/>
    <asset:javascript src="cup/physicalDemo.js"/>
    <title>工程单位维护</title>
</head>

<body>
<div id="physicalQuantityIndexDiv" class="easyui-tabs">
    <!--物理量维护页面-->
    <div title="物理量维护页面">
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <a class="create" href="javascript: createPhysicalQuantity()">新增的物理量</a>
                </li>
            </ul>
        </div>

        <div id="list-physicalQuantity" class="content scaffold-list" role="main">
            <table id="physicalQuantityTable">
                <thead>
                <tr>
                    <g:sortableColumn property="quantityName"
                                      title="${message(code: 'physicalQuantity.quantityName.label', default: 'Quantity Name')}"/>
                    <g:sortableColumn property="description"
                                      title="${message(code: 'physicalQuantity.description.label', default: 'Description')}"/>
                    <th><g:message code="physicalQuantity.isoUnit.label" default="Iso Unit"/></th>
                    <th>单位数量</th>
                    <th>操作</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${physicalQuantityInstanceList}" status="i" var="physicalQuantityInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}"
                        onclick="javascript: loadQuantityUnits(${physicalQuantityInstance.id})">
                        <td>
                            <a href="javascript: showPhysicalQuantity(${physicalQuantityInstance.id})">${physicalQuantityInstance.quantityName}</a>
                        </td>
                        <td>${fieldValue(bean: physicalQuantityInstance, field: "description")}</td>
                        <td>${fieldValue(bean: physicalQuantityInstance, field: "isoUnit")}</td>
                        <td>${physicalQuantityInstance?.quantityUnits.size()}</td>
                        <td><a href="javascript: loadQuantityUnits(${physicalQuantityInstance.id})">列出单位</a></td>
                        <td><a href="javascript: createQuantityUnit(${physicalQuantityInstance.id})">添加单位</a></td>
                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="paginationGrails">
                <g:paginate total="${physicalQuantityInstanceCount ?: 0}"/>
            </div>
        </div>
    </div>

    <!--物理量编辑-->
    <div title="物理量编辑">
        <div id="edit-physicalQuantity" class="content scaffold-list" role="main">
            <h1>编辑物理量</h1>

            <div id="physicalQuantityEditDiv"></div>
        </div>
    </div>

    <!--单位维护-->
    <div title="单位维护">
        <div class="nav" role="navigation">
            <ul>
                <li>${physical}对应的单位</li>
            </ul>
        </div>

        <div id="list-quantityUnit" class="content scaffold-list" role="main">
            <div id="quantityUnitDiv"></div>
        </div>
    </div>

    <!--单位编辑-->
    <div title="单位编辑">
        <div id="edit-quantityUnit" class="content scaffold-list" role="main">
            <h1>编辑物理量的单位</h1>

            <div id="quantityUnitEditDiv"></div>
        </div>
    </div>

    <!--单位转换DEMO-->
    <div title="单位转换示例">
        <div id="demo-quantityUnit" class="content scaffold-list" role="main">
            <form>
                <table>
                    <tr>
                        <th>源数据</th>
                        <th>物理量</th>
                        <th>源单位</th>
                        <th>目标单位</th>
                        <th>操作</th>
                        <th>目标</th>
                    </tr>
                    <tr>
                        <td>
                            <label>源数据</label>
                            <input id="sourceValue">
                        </td>
                        <td>
                            <select id="physical4Value" name="physical4Value" onchange="changePhysicalQuantity()">
                                <g:each in="${cn.edu.cup.physical.PhysicalQuantity.list()}" var="physical" status="i">
                                    <option value="${physical.id}">${physical.description}</option>
                                </g:each>
                            </select>
                        </td>
                        <td>
                            <select name="unit4Value" id="unit4Value">
                            </select>
                        </td>
                        <td>
                            <select name="targetUnit4Value" id="targetUnit4Value">
                            </select>
                        </td>
                        <td>
                            <a href="javascript: unitConversion()">转换</a>
                        </td>
                        <td>
                            <label>源数据</label>
                            <input id="targetValue" value="">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>