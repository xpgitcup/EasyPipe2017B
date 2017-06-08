<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!--asset:stylesheet src="application.css"/-->

    <g:render template="layouts/common"/>

    <g:layoutHead/>
</head>

<body>
<div class="container">

    %{--导航栏kq--}%
    <!--div class="navbar navbar-default navbar-static-top" role="navigation"-->
    <div class="navbar navbar-static-top" role="navigation">

        %{--标题--}%
        <span class="navbar-header">
            <a href="${createLink(uri: '/')}">
                <asset:image src="cn/edu/cup/${cn.edu.cup.system.SystemTitle.last()?.applicationLogo}"
                             class="img-rounded"/>
            </a>
        </span>
        <span class="applicationTitle">
            <g:if test="${cn.edu.cup.system.SystemTitle.last()}">
                <a href="${createLink(uri: '/home')}">
                    ${cn.edu.cup.system.SystemTitle.last()?.applicationTitle}
                </a>
            </g:if>
            <g:else>
                替换成应用程序的标题
            </g:else>
        </span>

        <span class="navbar-collapse collapse  navbar-right" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav">
                <g:pageProperty name="page.nav"/>
                %{--每页的nav可以不同--}%
            </ul>
        </span>
    </div>
    %{--页面正文--}%
    <g:layoutBody/>
</div>

%{--页脚--}%
<div class="footer" role="contentinfo">
    <hr>

    <div class="text-center">
        <ul class="nav">
            <!--g:each in="${cn.edu.cup.system.SystemSponser.findAllBySystemTitle(cn.edu.cup.system.SystemTitle.last())}" var="item" status="i" 这个也没有问题-->
            <g:each in="${cn.edu.cup.system.SystemTitle.last().systemSponser}" var="item" status="i">
                <asset:image src="cn/edu/cup/${item.logo}" title="${item.name}" class="img-circle"/>
            </g:each>
        </ul>

        <p>
            © 2015-2017 中国石油大学（北京）多相流课题组 <a href="#" target="_blank"></a>
        </p>
    </div>
</div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<!--asset:javascript src="application.js"/-->

</body>
</html>
