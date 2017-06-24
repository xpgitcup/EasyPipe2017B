<%@ page import="cn.edu.cup.physical.QuantityUnit" %>

<table>
    <thead>
    <tr>
        <th colspan="5">当前物理量：${physical.quantityName}</th>
        <th><a href="javascript: createQuantityUnit(${physical.id})">增加单位</a></th>
    </tr>
    <tr>

        <g:sortableColumn property="unitName"
                          title="${message(code: 'quantityUnit.unitName.label', default: 'Unit Name')}"/>

        <g:sortableColumn property="name" title="${message(code: 'quantityUnit.name.label', default: 'Name')}"/>

        <g:sortableColumn property="label" title="${message(code: 'quantityUnit.label.label', default: 'Label')}"/>

        <g:sortableColumn property="description"
                          title="${message(code: 'quantityUnit.description.label', default: 'Description')}"/>

        <g:sortableColumn property="factorA"
                          title="${message(code: 'quantityUnit.factorA.label', default: 'Factor A')}"/>

        <g:sortableColumn property="factorB"
                          title="${message(code: 'quantityUnit.factorB.label', default: 'Factor B')}"/>

    </tr>
    </thead>
    <tbody>
    <g:each in="${quantityUnitInstanceList}" status="i" var="quantityUnitInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td>
                <a href="javascript: showQuantityUnit(${quantityUnitInstance.id})">${quantityUnitInstance.unitName}</a>
            </td>

            <td>${fieldValue(bean: quantityUnitInstance, field: "name")}</td>

            <td>${fieldValue(bean: quantityUnitInstance, field: "label")}</td>

            <td>${fieldValue(bean: quantityUnitInstance, field: "description")}</td>

            <td>${quantityUnitInstance.factorA}</td>

            <td>${fieldValue(bean: quantityUnitInstance, field: "factorB")}</td>

        </tr>
    </g:each>
    </tbody>
</table>
