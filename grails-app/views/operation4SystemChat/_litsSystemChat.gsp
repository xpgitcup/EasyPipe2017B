<%@ page contentType="text/html;charset=UTF-8" %>

<table>
    <thead>
    <td>姓名</td>
    </thead>
    <g:each in="${systemChatList}" var="item" status="i">
        <tr>
            <td>${item}</td>
        </tr>
    </g:each>
</table>
