<%@ page import="cn.edu.cup.physical.QuantityUnit" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quantityUnit.label', default: 'QuantityUnit')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-quantityUnit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li>
					${quantityUnitInstance.physicalQuantity}
				</li>
			</ul>
		</div>
		<div id="edit-quantityUnit" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${quantityUnitInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${quantityUnitInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<!--g:form url="[resource:quantityUnitInstance, action:'update']" method="PUT" -->
			<g:form controller="operation4Physical" action="saveQuantityUnit" id="${quantityUnitInstance?.id}">
				<g:hiddenField name="version" value="${quantityUnitInstance?.version}" />
				<fieldset class="form">
					<g:render template="formQuantityUnit"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="saveQuantityUnit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
