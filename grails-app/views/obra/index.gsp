
<%@ page import="obraspublicas.Obra" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css', file: 'obra.css')}"/>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'obra.label', default: 'Obra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-obra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-obra" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="nome" title="${message(code: 'obra.nome.label', default: 'Nome')}" />

						<g:sortableColumn property="descricao" title="${message(code: 'obra.descricao.label', default: 'Descrição')}" />

						<g:sortableColumn property="precoPlanejado" title="${message(code: 'obra.precoPlanejado.label', default: 'Preco Planejado')}" />
					
						<g:sortableColumn property="dataPlanejada" title="${message(code: 'obra.dataPlanejada.label', default: 'Data Planejada')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${obraInstanceList}" status="i" var="obraInstance">
					<tr  class="${obraInstance.statusAndamento ? 'highLightGreen' : 'highLightRed'}">

						<td><g:link action="show" id="${obraInstance.id}">${fieldValue(bean: obraInstance, field: "nome")}</g:link></td>

						<td>${fieldValue(bean: obraInstance, field: "descricao")}</td>

						<td>
							<g:form url="[resource:obraInstance, action:'verificarStatusAndamentoObra']">
								<fieldset class="buttons">
									<g:actionSubmit class="Verificar" action="verificarStatusAndamentoObra" value="Verificar Andamento"/>
								</fieldset>
							</g:form>
						</td>

						<td><g:link class="edit" action="edit" resource="${obraInstance}"><img src="${assetPath(src: 'editIco.png')}" width="50px"/></g:link></td>


						<td>
						<g:form url="[resource:obraInstance, action:'delete']" method="DELETE">
							<g:actionSubmitImage value="${message(code: 'default.button.delete.label', default: 'Delete')}" action="delete"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
								 src="${assetPath(src: 'deleteIco.png')}" width="50px"/>
						</g:form>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${obraInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
