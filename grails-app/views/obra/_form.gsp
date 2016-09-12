<%@ page import="obraspublicas.Obra" %>



<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'precoPlanejado', 'error')} required">
	<label for="precoPlanejado">
		<g:message code="obra.precoPlanejado.label" default="Preco Planejado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precoPlanejado" value="${fieldValue(bean: obraInstance, field: 'precoPlanejado')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'dataPlanejada', 'error')} required">
	<label for="dataPlanejada">
		<g:message code="obra.dataPlanejada.label" default="Data Planejada" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataPlanejada" precision="day"  value="${obraInstance?.dataPlanejada}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'dataTermino', 'error')} required">
	<label for="dataTermino">
		<g:message code="obra.dataTermino.label" default="Data Termino" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataTermino" precision="day"  value="${obraInstance?.dataTermino}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="obra.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${obraInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'empresaResponsavel', 'error')} required">
	<label for="empresaResponsavel">
		<g:message code="obra.empresaResponsavel.label" default="Empresa Responsavel" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="empresaResponsavel" required="" value="${obraInstance?.empresaResponsavel}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'imagem', 'error')} required">
	<label for="imagem">
		<g:message code="obra.imagem.label" default="Imagem" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="imagem" required="" value="${obraInstance?.imagem}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="obra.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" value="${fieldValue(bean: obraInstance, field: 'latitude')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="obra.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" value="${fieldValue(bean: obraInstance, field: 'longitude')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="obra.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${obraInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'politicoResponsavel', 'error')} required">
	<label for="politicoResponsavel">
		<g:message code="obra.politicoResponsavel.label" default="Politico Responsavel" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="politicoResponsavel" name="politicoResponsavel.id" from="${obraspublicas.Politico.list()}" optionKey="id" required="" value="${obraInstance?.politicoResponsavel?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: obraInstance, field: 'precoFinal', 'error')} required">
	<label for="precoFinal">
		<g:message code="obra.precoFinal.label" default="Preco Final" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precoFinal" value="${fieldValue(bean: obraInstance, field: 'precoFinal')}" required=""/>

</div>

