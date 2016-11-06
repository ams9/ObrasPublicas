Feature: Engenheiros
  As a usuário do sistema
  I want to adicionar, remover, modificar e visualizar engenheiros no sistema
  So That eu posso gerar páginas web para exibir informações sobre do engenheiro

  #CONTROLLER
   Scenario: Adicionar engenheiro nao existente
    Given que o sistema nao tem um engenheiro com CPF "01234567891" 
      When eu tentar cadastrar um engenheiro com CPF "01234567891"
    Then o sistema ira cadastrar o engenheiro de CPF "01234567891"

  Scenario: Adicionar um engenheiro existente
    Given que o sistema tem um engenheiro de CPF "98765432109" 
    When eu tentar cadastrar um engenheiro com cpf "98765432109"
    Then o sistema nao ira cadastrar o engenheiro de CPF "98765432109"

  #Gui
  Scenario: Novo engenheiro
    Given que eu estou no menu “Engenheiro”
    And não existe nenhum engenheiro com o nome “Anderson” com o CPF “102.102.152-15”
    When eu seleciono a opção “Cadastrar”
    And eu tento cadastrar o Engenheiro “Anderson” com CPF “102.102.152-15” e seleciono “Salvar”
    Then eu recebo a mensagem de confirmação
    And Consigo ver as informações do engenheiro cadastrado

  Scenario: Editar informações de um engenheiro
    Given que o usuário esta na tela de atualizar engenheiro visualizando o engeheiro “Eduardo” com cpf “01234567890”
    When ao  tentar atualizar os dados do engenheiro “Eduardo” com cpf “01234567890”
    Then eu recebo a mensagem de confirmação
    And Consigo ver as novas informações do engenheiro cadastrado