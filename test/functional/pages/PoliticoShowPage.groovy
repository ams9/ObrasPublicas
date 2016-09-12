package pages


import geb.Page

class PoliticoShowPage extends Page{
    static at = {
        title ==~ /Ver Politico/
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

    def verifyCpfPolitico(String cpf){
        boolean find = false
        def politicoRows = getDisplayedFields()

        politicoRows.each {politicoRow -> find = (find || (politicoRow.find('span')[1].text() == cpf))}
        return find
    }

    def getDisplayedFields(){
        def listDiv = $('div', id: 'show-politico')
        def politicoTable = (listDiv.find('ol'))[0]
        def politicoRows  = politicoTable.find('li')

        return politicoRows
    }

}

