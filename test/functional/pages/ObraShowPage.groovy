package pages

import geb.Page

class ObraShowPage extends Page{
    static at = {
        title ==~ /Ver Obra/
    }

    static content = {
    }

    def select(String e, v) {
        if (v == 'delete') {
            assert withConfirm(true) { $("form").find(e, class: v).click() }
        } else {
            $("form").find(e, class: v).click()
        }
    }

    def verifyNomeObra(String nomeObra){
        boolean find = false
        def obraRows = getDisplayedFields()

        obraRows.each {obraRow -> find = (find || (obraRow.find('span')[1].text() == nomeObra))}
        return find
    }

    def getDisplayedFields(){
        def listDiv = $('div', id: 'show-obra')
        def obraTable = (listDiv.find('ol'))[0]
        def obraRows  = obraTable.find('li')

        return obraRows
    }

}
