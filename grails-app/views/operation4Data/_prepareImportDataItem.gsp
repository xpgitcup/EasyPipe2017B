<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'dataItem.label', default: 'DataItem')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-dataItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div id="list-dataItem" class="content scaffold-list" role="main">
    <h1>${dataKey}</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <fieldset>
        <table>
            <tr>
                <td>数据格式模板可以下载：</td>
                <td>
                    <a href="${request.getContextPath()}operation4Data/localDownLoad?downLoadFileName=${fileName}">数据模板1</a>
                    <a href="operation4Data/getTemplate/?downLoadFileName=${fileName}">数据模板2</a>
                    <a href="javascript: testDownload('yyy')">数据模板3</a>
                    <a href="operation4Data/getTemplate/?downLoadFileName=templates/key000.xls">数据模板4</a>
                    <a href="operation4Data/getTemplate?downLoadFileName=${request.getContextPath()}\templates/key000.xls">数据模板5</a>
                </td>
                <td>
                    <a href="operation4Data/downLoadTemplate/${dataKey.id}">
                        下载数据模板("${dataKey.dataCount()}")
                    </a>
                </td>
            </tr>
        </table>
        <g:uploadForm controller="operation4Data" action="importDataItem">
            <table>
                <tr>
                    <td>
                        <label>请上传数据文件(*.xls)</label>
                    </td>
                    <td>
                        <input type="file" name="uploadedFile">
                        <g:hiddenField name="id" value="${dataKey.id}"/>
                    </td>
                </tr>
            </table>
            <fieldset class="buttons">
                <g:submitButton name="create" class="save"
                                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </fieldset>
        </g:uploadForm>
    </fieldset>
</div>
</body>
</html>