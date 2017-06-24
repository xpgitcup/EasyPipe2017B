<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'physicalQuantity.label', default: 'PhysicalQuantity')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-physicalQuantity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
			</ul>
		</div>
		<div id="create-physicalQuantity" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${physicalQuantityInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${physicalQuantityInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<!--g:form url="[resource:physicalQuantityInstance, action:'save']" -->
			<g:form controller="operation4Physical" action="savePhysicalQuantity" id="${physicalQuantityInstance.id}">
				<fieldset class="form">
					<g:render template="formPhysicalQuantity4Create"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
