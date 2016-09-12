<%@ page import="obraspublicas.Politico" %>



<div class="fieldcontain ${hasErrors(bean: politicoInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="politico.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" required="" value="${politicoInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: politicoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="politico.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${politicoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: politicoInstance, field: 'telefones', 'error')} ">
	<label for="telefones">
		<g:message code="politico.telefones.label" default="Telefones" />

	</label>

	<ul class="one-to-many">
		<g:each in="${politicoInstance?.telefones?}" var="t">
			<li><g:link controller="telefone" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="telefone" action="create" params="['politico.id': politicoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefone.label', default: 'Telefone')])}</g:link>
		</li>
	</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: politicoInstance, field: 'obras', 'error')} ">
	<label for="obras">
		<g:message code="politico.obras.label" default="Obras" />

	</label>

	<ul class="one-to-many">
		<g:each in="${politicoInstance?.obras?}" var="o">
			<li><g:link controller="obra" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="obra" action="create" params="['politico.id': politicoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'obra.label', default: 'Obra')])}</g:link>
		</li>
	</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: politicoInstance, field: 'foto', 'error')} required">
	<label for="foto">
		<g:message code="politico.foto.label" default="Foto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="foto" required="" value="${politicoInstance?.foto}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: politicoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="politico.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${politicoInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: politicoInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="politico.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${politicoInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: politicoInstance, field: 'partido', 'error')} required">
	<label for="partido">
		<g:message code="politico.partido.label" default="Partido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="partido" required="" value="${politicoInstance?.partido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: politicoInstance, field: 'qualidade', 'error')} required">
	<label for="qualidade">
		<g:message code="politico.qualidade.label" default="Qualidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="qualidade" value="${fieldValue(bean: politicoInstance, field: 'qualidade')}" required=""/>

</div>

