package support

import geb.Browser
import geb.binding.BindingUpdater
import obraspublicas.Obra
import obraspublicas.Politico
import org.codehaus.groovy.grails.test.support.GrailsTestRequestEnvironmentInterceptor

import static cucumber.api.groovy.Hooks.*

Before () {
    bindingUpdater = new BindingUpdater(binding, new Browser())
    bindingUpdater.initialize()
    scenarioInterceptor = new GrailsTestRequestEnvironmentInterceptor (appCtx)
    scenarioInterceptor.init ()
}

After () {
    Obra.list().each { obra ->
        obra.delete(flush:true)
    }
    Politico.list().each { politico ->
        politico.delete(flush: true)
    }
    scenarioInterceptor.destroy ()
    bindingUpdater.remove ()
}