package pages

import geb.Page
import obraspublicas.Politico


class PoliticoListPage extends Page{
    static url = "politico/index"

    static at = {
        title ==~ /Politico Listagem/
    }

    static content = {
    }

    def checkPoliticoAtList(cpf){
        def politicoRows = getTableRows()
        def testPolitico = Politico.findByCpf(cpf)

        boolean find = false
        politicoRows.each {politicoRow -> find = (find || (politicoRow.find('td')[0].text() == testPolitico.cpf))}

        return find
    }

    def selectPoliticoAtList(String cpf) {
        def politicoRow  = getTableRows()
        def showLink = politicoRow.find('td').find([text:cpf])
        showLink.click()
    }
    def selectTaxaAtrasada() {
        def politicoRow  = getTableRows()
        def showLink = politicoRow.find('td').find("taxasAtrasadasPolitico")
        showLink.click()
    }
    def getTableRows(){
        def listDiv = $('div', id: 'list-politico')
        def obraTable = (listDiv.find('table'))[0]
        def obraRow  = obraTable.find('tbody').find('tr')

        return obraRow
    }
}
