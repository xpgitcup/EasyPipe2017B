<div class="nav" role="navigation">
    <ul><li>当前物理量：${physical.quantityName}</li></ul>
</div>

<div id="create-quantityUnit" class="content scaffold-create" role="main">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${quantityUnitInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${quantityUnitInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="saveQuantityUnit" controller="operation4Physical">
        <fieldset class="form">
            <g:render template="formQuantityUnit"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
