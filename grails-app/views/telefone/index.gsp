
<%@ page import="util.Telefone" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'telefone.label', default: 'Telefone')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-telefone" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="list-telefone" class="content scaffold-list" role="main">
	<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<table>
		<thead>
		<tr>

			<g:sortableColumn property="ddd" title="${message(code: 'telefone.ddd.label', default: 'Ddd')}" />

			<th><g:message code="telefone.pessoa.label" default="Pessoa" /></th>

			<g:sortableColumn property="telefone" title="${message(code: 'telefone.telefone.label', default: 'Telefone')}" />

		</tr>
		</thead>
		<tbody>
		<g:each in="${telefoneInstanceList}" status="i" var="telefoneInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show" id="${telefoneInstance.id}">${fieldValue(bean: telefoneInstance, field: "ddd")}</g:link></td>

				<td>${fieldValue(bean: telefoneInstance, field: "pessoa")}</td>

				<td>${fieldValue(bean: telefoneInstance, field: "telefone")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${telefoneInstanceCount ?: 0}" />
	</div>
</div>
</body>
</html>
