
<%@ page import="util.Endereco" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-endereco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="show-endereco" class="content scaffold-show" role="main">
	<h1><g:message code="default.show.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<ol class="property-list endereco">

		<g:if test="${enderecoInstance?.CEP}">
			<li class="fieldcontain">
				<span id="CEP-label" class="property-label"><g:message code="endereco.CEP.label" default="CEP" /></span>

				<span class="property-value" aria-labelledby="CEP-label"><g:fieldValue bean="${enderecoInstance}" field="CEP"/></span>

			</li>
		</g:if>

		<g:if test="${enderecoInstance?.bairro}">
			<li class="fieldcontain">
				<span id="bairro-label" class="property-label"><g:message code="endereco.bairro.label" default="Bairro" /></span>

				<span class="property-value" aria-labelledby="bairro-label"><g:fieldValue bean="${enderecoInstance}" field="bairro"/></span>

			</li>
		</g:if>

		<g:if test="${enderecoInstance?.cidade}">
			<li class="fieldcontain">
				<span id="cidade-label" class="property-label"><g:message code="endereco.cidade.label" default="Cidade" /></span>

				<span class="property-value" aria-labelledby="cidade-label"><g:fieldValue bean="${enderecoInstance}" field="cidade"/></span>

			</li>
		</g:if>

		<g:if test="${enderecoInstance?.estado}">
			<li class="fieldcontain">
				<span id="estado-label" class="property-label"><g:message code="endereco.estado.label" default="Estado" /></span>

				<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${enderecoInstance}" field="estado"/></span>

			</li>
		</g:if>

		<g:if test="${enderecoInstance?.numero}">
			<li class="fieldcontain">
				<span id="numero-label" class="property-label"><g:message code="endereco.numero.label" default="Numero" /></span>

				<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${enderecoInstance}" field="numero"/></span>

			</li>
		</g:if>

		<g:if test="${enderecoInstance?.rua}">
			<li class="fieldcontain">
				<span id="rua-label" class="property-label"><g:message code="endereco.rua.label" default="Rua" /></span>

				<span class="property-value" aria-labelledby="rua-label"><g:fieldValue bean="${enderecoInstance}" field="rua"/></span>

			</li>
		</g:if>

	</ol>
	<g:form url="[resource:enderecoInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit" action="edit" resource="${enderecoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
			<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</fieldset>
	</g:form>
</div>
</body>
</html>
