Feature: Políticos
  As a usuário do sistema
  I want to adicionar, remover, modificar e visualizar políticos no sistema
  So That eu posso gerar páginas web para exibir informações sobre o político

#CONTROLLER
  Scenario: Adicionar politico nao existente
    Given que o sistema nao tem um politico com CPF "01234567891"
    When eu tentar cadastrar um politico com CPF "01234567891"
    Then o sistema ira cadastrar o politico de CPF "01234567891"

  Scenario: Adicionar politico existente
    Given que o sistema tem um politico de CPF "98765432109"
    Then o sistema nao ira cadastrar o politico de CPF "98765432109"

  Scenario: Atualizar o id de um politico
    Given o politico com CPF "01234567891” esta armazenado no sistema
    When eu tentar atualizar o id do politico de CPF "01234567891”
    Then o politico de CPF "01234567891" tera seu id atualizado

  Scenario: Remover político existente
    Given o politico com CPF "01234567891” esta armazenado no sistema
    When eu tentar remover o politico de CPF “01234567891”
    Then o politico de CPF “01234567891” sera removido


#GUI
  Scenario: Novo político
    Given que eu estou no menu “Políticos”
    And não existe nenhum político com o nome “Anderson” com o CPF “102.102.152-15”
    When eu seleciono a opção “Cadastrar”
    And eu tento cadastrar o político “Anderson” com CPF “102.102.152-15” e seleciono “Salvar”
    Then eu recebo a mensagem de confirmação
    And Consigo ver as informações do político cadastrado

Scenario: Editar informações de um politico
    Given que o usuário esta na tela de atualizar político visualizando o  político “Eduardo” com cpf “01234567890”
    When ao  tentar atualizar os dados do político “Eduardo” com cpf “01234567890”
    Then eu recebo a mensagem de confirmação
    And Consigo ver as informações do político cadastrado

Scenario: Visualizar político
    Given que o usuario esta no menu de político e quer visualizar os detalhes do político com o cpf "98765432109"
    When o usuario seleciona o político com o cpf "98765432109"
    Then o sistema exibe os detalhes do político com o cpf "98765432109"

Scenario: Visualizar taxa de atraso de obras de um político
    Given que o usuario esta no menu de político e tem um político com o cpf "98765432109"
    And existe "2" obra associada ao político com o cpf "98765432109"
    And existe "1" obra atrasada associada ao político com cpf "98765432109"
    When o usuário seleciona a opçao de taxa de atraso
    Then ele visualizará "50" % como sendo a taxa de atraso