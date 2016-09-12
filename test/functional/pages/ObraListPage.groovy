package pages

import geb.Page
import obraspublicas.Obra


class ObraListPage extends Page{
    static url = "obra/index"

    static at = {
        title ==~ /Obra Listagem/
    }

    static content = {
    }

    def checkObraAtList(nomeObra){
        def obraRows = getTableRows()
        def testObra = Obra.findByNome(nomeObra)

        boolean find = false
        obraRows.each {obraRow -> find = (find || (obraRow.find('td')[0].text() == testObra.nome && obraRow.find('td')[1].text() == testObra.descricao))}

        return find
    }

    def selectObraAtList(String nomeObra) {
        def obraRow  = getTableRows()
        def showLink = obraRow.find('td').find([text:nomeObra])
        showLink.click()
    }

    def getTableRows(){
        def listDiv = $('div', id: 'list-obra')
        def obraTable = (listDiv.find('table'))[0]
        def obraRow  = obraTable.find('tbody').find('tr')

        return obraRow
    }
}
