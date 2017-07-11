<div id="list-dataKey" class="content scaffold-list" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <th>名称</th>
        <th>说明</th>
        <th>详细</th>
        <th>操作</th>
        </thead>
        <tbody>
        <g:each in="${dataKeyList}" var="item" status="i">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    <a href="operation4Data/selectDataKey/${item.id}">
                        ${item.keyContext}
                    </a>
                </td>
                <td>${item.description}</td>
                <td>${item.subKey?.size()}</td>
                <td>${item.upKey}</td>
                <td>
                    <g:if test="${item.dataValueType==cn.edu.cup.dictionary.BaseDataType.dataModel}">
                        <a href="#">输入数据</a>
                    </g:if>
                    <g:else>
                        非可输入项
                    </g:else>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

</div>
