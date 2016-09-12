
<%@ page import="util.Telefone" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'telefone.label', default: 'Telefone')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-telefone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="show-telefone" class="content scaffold-show" role="main">
	<h1><g:message code="default.show.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<ol class="property-list telefone">

		<g:if test="${telefoneInstance?.ddd}">
			<li class="fieldcontain">
				<span id="ddd-label" class="property-label"><g:message code="telefone.ddd.label" default="Ddd" /></span>

				<span class="property-value" aria-labelledby="ddd-label"><g:fieldValue bean="${telefoneInstance}" field="ddd"/></span>

			</li>
		</g:if>

		<g:if test="${telefoneInstance?.pessoa}">
			<li class="fieldcontain">
				<span id="pessoa-label" class="property-label"><g:message code="telefone.pessoa.label" default="Pessoa" /></span>

				<span class="property-value" aria-labelledby="pessoa-label"><g:link controller="pessoa" action="show" id="${telefoneInstance?.pessoa?.id}">${telefoneInstance?.pessoa?.encodeAsHTML()}</g:link></span>

			</li>
		</g:if>

		<g:if test="${telefoneInstance?.telefone}">
			<li class="fieldcontain">
				<span id="telefone-label" class="property-label"><g:message code="telefone.telefone.label" default="Telefone" /></span>

				<span class="property-value" aria-labelledby="telefone-label"><g:fieldValue bean="${telefoneInstance}" field="telefone"/></span>

			</li>
		</g:if>

	</ol>
	<g:form url="[resource:telefoneInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit" action="edit" resource="${telefoneInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
			<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</fieldset>
	</g:form>
</div>
</body>
</html>
