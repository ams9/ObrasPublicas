Feature: Engenheiros
  As a usuário do sistema
  I want to adicionar, remover, modificar e visualizar engenheiros no sistema
  So That eu posso gerar páginas web para exibir informações sobre do engenheiro

  #CONTROLLER
   Scenario: Adicionar engenheiro nao existente
    Given que o sistema nao tem um engenheiro com CPF "01234567891" 
    When eu tentar cadastrar um engenheiro com CPF "01234567891"
    Then o sistema ira cadastrar o engenheiro de CPF "01234567891" 

  Scenario: Adicionar engenheiro existente
    Given que o sistema tem um engenheiro de CPF "98765432109" 
    When eu tentar cadastrar um engenheiro de cpf "98765432109"
    Then o sistema nao ira cadastrar o engenheiro de CPF "98765432109"



  Scenario: Remover engenheiro existente
    Given que o sistema tem um engenheiro de nome “José da Silva” and cpf “123456789-01”
    When eu deleto o engenheiro “José da Silva” com cpf “123456789-01”
    Then o engenheiro “José da Silva” com cpf “123456789-01” é devidamente removido do sistema

  Scenario: Adicionar engenheiro invalido (cpf em branco)
    Given que o sistema não tem um engenheiro de nome “José da Silva” and cpf “123456789-01”
    When eu adicionar o engenheiro “José da Silva” com o número de cpf em branco
    Then o sistema não irá criar o engenheiro “José da Silva” porque o número de cpf está inválido

 






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


  Scenario: Adicionar engenheiro já existente
    Given que estou na página de adicionar engenheiro
    And Preencho os dados do engenheiro “José da Silva” com cpf “123456789-01”
    Then recebo uma mensagem “o engenheiro José da Silva de cpf 123456789-01 foi adicionado ao sistema”
    When Volto para a página de adicionar engenheiro
    And Preencho os dados do engenheiro “José da Silva” com cpf “123456789-01”
    Then recebo uma mensagem “O engenheiro José da Silva já existe no sistema e por isso não foi adicionado”

  Scenario: Adicionar engenheiro inválido(cpf em branco)
    Given que estou na página de adicionar engenheiro
    When preencho todos os dados do engenheiro “José da Silva” exceto o campo de cpf
    And seleciono a opção de adicionar engenheiro
    Then recebo uma mensagem de erro “O campo de Cpf encontra-se em branco”