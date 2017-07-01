<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
</head>

<body>
<table>
    <thead>
    <th>名称</th>
    <th>说明</th>
    <th>标准单位</th>
    <th>单位数量</th>
    <th colspan="3">操作</th>
    </thead>
    <tbody>
    <g:each in="${physicalQuantityList}" var="item" status="i">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>${item.quantityName}</td>
            <td>${item.description}</td>
            <td>${item.isoUnit}</td>
            <td>${item?.getQuantityUnits().size()}</td>
            <td>
                <a href="operation4Physical/editPhysicalQuantity/${item.id}">编辑</a>
            </td>
            <td>
                <a href="operation4Physcial/createQuantityUnit/${item.id}">新建物理量单位</a>
            </td>
            <td>
                <g:if test="${item?.getQuantityUnits().size()<1}">
                    <a href="operation4Physical/deletePhysicalQuantity/${item.id}">删除</a>
                </g:if>
                <g:else>
                    不能删除
                </g:else>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>
