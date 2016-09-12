
<%@ page import="util.Endereco" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-endereco" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="list-endereco" class="content scaffold-list" role="main">
	<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<table>
		<thead>
		<tr>

			<g:sortableColumn property="CEP" title="${message(code: 'endereco.CEP.label', default: 'CEP')}" />

			<g:sortableColumn property="bairro" title="${message(code: 'endereco.bairro.label', default: 'Bairro')}" />

			<g:sortableColumn property="cidade" title="${message(code: 'endereco.cidade.label', default: 'Cidade')}" />

			<g:sortableColumn property="estado" title="${message(code: 'endereco.estado.label', default: 'Estado')}" />

			<g:sortableColumn property="numero" title="${message(code: 'endereco.numero.label', default: 'Numero')}" />

			<g:sortableColumn property="rua" title="${message(code: 'endereco.rua.label', default: 'Rua')}" />

		</tr>
		</thead>
		<tbody>
		<g:each in="${enderecoInstanceList}" status="i" var="enderecoInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show" id="${enderecoInstance.id}">${fieldValue(bean: enderecoInstance, field: "CEP")}</g:link></td>

				<td>${fieldValue(bean: enderecoInstance, field: "bairro")}</td>

				<td>${fieldValue(bean: enderecoInstance, field: "cidade")}</td>

				<td>${fieldValue(bean: enderecoInstance, field: "estado")}</td>

				<td>${fieldValue(bean: enderecoInstance, field: "numero")}</td>

				<td>${fieldValue(bean: enderecoInstance, field: "rua")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${enderecoInstanceCount ?: 0}" />
	</div>
</div>
</body>
</html>
