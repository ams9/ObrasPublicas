
<%@ page import="obraspublicas.Obra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'obra.label', default: 'Obra')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-obra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-obra" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list obra">
			
				<g:if test="${obraInstance?.precoPlanejado}">
				<li class="fieldcontain">
					<span id="precoPlanejado-label" class="property-label"><g:message code="obra.precoPlanejado.label" default="Preco Planejado" /></span>
					
						<span class="property-value" aria-labelledby="precoPlanejado-label"><g:fieldValue bean="${obraInstance}" field="precoPlanejado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.dataPlanejada}">
				<li class="fieldcontain">
					<span id="dataPlanejada-label" class="property-label"><g:message code="obra.dataPlanejada.label" default="Data Planejada" /></span>
					
						<span class="property-value" aria-labelledby="dataPlanejada-label"><g:formatDate date="${obraInstance?.dataPlanejada}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.dataTermino}">
				<li class="fieldcontain">
					<span id="dataTermino-label" class="property-label"><g:message code="obra.dataTermino.label" default="Data Termino" /></span>
					
						<span class="property-value" aria-labelledby="dataTermino-label"><g:formatDate date="${obraInstance?.dataTermino}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="obra.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${obraInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.empresaResponsavel}">
				<li class="fieldcontain">
					<span id="empresaResponsavel-label" class="property-label"><g:message code="obra.empresaResponsavel.label" default="Empresa Responsavel" /></span>
					
						<span class="property-value" aria-labelledby="empresaResponsavel-label"><g:fieldValue bean="${obraInstance}" field="empresaResponsavel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.imagem}">
				<li class="fieldcontain">
					<span id="imagem-label" class="property-label"><g:message code="obra.imagem.label" default="Imagem" /></span>
					
						<span class="property-value" aria-labelledby="imagem-label"><g:fieldValue bean="${obraInstance}" field="imagem"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="obra.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${obraInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="obra.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${obraInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="obra.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${obraInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.politicoResponsavel}">
				<li class="fieldcontain">
					<span id="politicoResponsavel-label" class="property-label"><g:message code="obra.politicoResponsavel.label" default="Politico Responsavel" /></span>
					
						<span class="property-value" aria-labelledby="politicoResponsavel-label"><g:link controller="politico" action="show" id="${obraInstance?.politicoResponsavel?.id}">${obraInstance?.politicoResponsavel?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${obraInstance?.precoFinal}">
				<li class="fieldcontain">
					<span id="precoFinal-label" class="property-label"><g:message code="obra.precoFinal.label" default="Preco Final" /></span>
					
						<span class="property-value" aria-labelledby="precoFinal-label"><g:fieldValue bean="${obraInstance}" field="precoFinal"/></span>
					
				</li>
				</g:if>


				<li class="fieldcontain">
					<span id="statusValor-label" class="property-label">Status</span>

					<span class="property-value" aria-labelledby="statusValor-label">${obraInstance?.statusAndamento}</span>

				</li>



				<g:if test="${obraInstance?.dataTermino>obraInstance?.dataPlanejada}">
					<li class="fieldcontain">
						<span id="statusPrazo-label" class="property-label">Status prazo</span>

						<span class="property-value" aria-labelledby="statusPrazo-label">Obra Atrasada</span>
					</li>
				</g:if>

			</ol>
			<g:form url="[resource:obraInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${obraInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
