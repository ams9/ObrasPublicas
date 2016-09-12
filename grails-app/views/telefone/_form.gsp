<%@ page import="util.Telefone" %>



<div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'ddd', 'error')} required">
	<label for="ddd">
		<g:message code="telefone.ddd.label" default="Ddd" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ddd" type="number" value="${telefoneInstance.ddd}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'pessoa', 'error')} required">
	<label for="pessoa">
		<g:message code="telefone.pessoa.label" default="Pessoa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pessoa" name="pessoa.id" from="${obraspublicas.Pessoa.list()}" optionKey="id" required="" value="${telefoneInstance?.pessoa?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'telefone', 'error')} required">
	<label for="telefone">
		<g:message code="telefone.telefone.label" default="Telefone" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="telefone" type="number" value="${telefoneInstance.telefone}" required=""/>

</div>

