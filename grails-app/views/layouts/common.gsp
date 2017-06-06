<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- 界面设置开始 -->
        <asset:stylesheet src="application.css"/>

        <!--引入easyui的相关内容-->
        <asset:stylesheet src="easyui/themes/default/easyui.css"/>
        <asset:stylesheet src="easyui/themes/icon.css"/>
        <asset:stylesheet src="easyui/themes/color.css"/>
        <!--asset:stylesheet src="easyui/themes/bootstrap/easyui.css"/-->
        <!--引入树形结构显示组件-->
        <asset:stylesheet src="bootstrap-treeview/bootstrap-treeview.min.css"/>
        <!--引入jqpagination的样式-->
        <!--asset:stylesheet src="jqpagination/jqpagination.css"/-->

        <!--引入CUP的相关内容-->
        <asset:stylesheet src="cn/edu/cup/cupEasyUi.css"/>

        <!--JS加载-->
        <asset:javascript src="jquery-2.2.0.min.js"/>

        <asset:javascript src="easyui/jquery.easyui.min.js"/>

        <asset:javascript src="bootstrap.js"/>
        <asset:javascript src="bootstrap-treeview/bootstrap-treeview.min.js"/>
        <asset:javascript src="jquery/jquery.cookie.js"/>
        <!--引入jqpagination-->
        <!--asset:javascript src="jqpagination/jquery.jqpagination.min.js"/-->
        <!--用户自定义的-->
        <asset:javascript src="cn/edu/cup/common/common.js"/>
        <asset:javascript src="cn/edu/cup/common/mainEasyUI.js"/>

        <!-- 界面设置结束 -->

    </head>
    <body>
    </body>
</html>
