package pages

/**
 */
import geb.Page

class TaxaAtrasoPoliticoPage extends Page{
    static at = {
        title ==~ /Ver Atraso/
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

    def verifyTaxa(String taxa){
        boolean find = false
        def politicoRows = getDisplayedFields()

        politicoRows.each {politicoRow -> find = (find || politicoRow.text() == taxa)}
        return find
    }

    def getDisplayedFields(){
        def listDiv = $('div', id: 'list-taxaatraso')
        def politicoTable = (listDiv.find('h2'))

        return politicoTable
    }

}

