
import static cucumber.api.groovy.EN.*
import obraspublicas.*
import pages.ObraListPage
import steps.TestDataAndOperations
import pages.EgenheiroShowPage
import pages.EngenheiroListPage


/**
 * @author = ams9
 */
//Scenario: Adicionar engenheiro nao existente
//Given que o sistema nao tem um engenheiro com CPF "01234567891"
//When eu tentar cadastrar um engenheiro com CPF "01234567891"
//Then o sistema ira cadastrar o engenheiro de CPF "01234567891"


Given (~'^que o sistema nao tem um engenheiro com CPF "([^"]*)"$') {
    String cpf ->
        Engenheiro engenheiro = Engenheiro.findByCpf(cpf)
        assert engenheiro == null
}
def when = When (~'^eu tentar cadastrar um engenheiro com CPF "([^"]*)"$'){
    String cpf ->
        TestDataAndOperations.createEngenheiro(cpf)
}
when
Then (~'^o sistema ira cadastrar o engenheiro de CPF "([^"]*)"$'){
    String cpf ->
        Engenheiro engenheiro = Engenheiro.findByCpf(cpf)
        assert TestDataAndOperations.engenheiroCompatibleTo(engenheiro, cpf)
}

/**
 * @author = ams9
 */
//Scenario: Adicionar um engenheiro existente
//Given que o sistema tem um engenheiro de CPF "98765432109"
//When eu tentar cadastrar um engenheiro de cpf "98765432109"
//Then o sistema nao ira cadastrar o engenheiro de CPF "98765432109"


Given (~'^que o sistema tem um engenheiro de CPF "([^"]*)"$'){
    String cpf ->
        TestDataAndOperations.createEngenheiro(cpf)
        Engenheiro engenheiro = Engenheiro.findByCpf(cpf)
        assert engenheiro != null
}

Then (~'^o sistema nao ira cadastrar o engenheiro de CPF "([^"]*)"$'){
    String cpf->
        engenheiros = Engenheiro.findAllByCpf(cpf)
        assert engenheiros.size() == 1
}
