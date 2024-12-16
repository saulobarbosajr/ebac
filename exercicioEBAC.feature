Feature: Configurar Produto
  Como cliente da EBAC-SHOP
  Quero configurar meu produto de acordo com meu tamanho e gosto
  E escolher a quantidade
  Para depois inserir no carrinho

  Scenario: Seleções obrigatórias
    Given estou na página de configuração do produto
    When não seleciono cor, tamanho ou quantidade
    And tento adicionar o produto ao carrinho
    Then o sistema deve exibir uma mensagem indicando que as seleções são obrigatórias

  Scenario: Limite máximo de produtos por venda
    Given estou na página de configuração do produto
    When seleciono 11 unidades do produto
    And tento adicionar ao carrinho
    Then o sistema deve exibir uma mensagem de erro informando o limite de 10 produtos por venda

  Scenario: Limpar seleção
    Given estou na página de configuração do produto
    And seleciono uma cor, tamanho e quantidade
    When clico no botão "limpar"
    Then todas as seleções devem ser removidas e os campos devem retornar ao estado original
Feature: Login na Plataforma
  Como cliente da EBAC-SHOP
  Quero fazer o login (autenticação) na plataforma
  Para visualizar meus pedidos

  Scenario: Login com dados válidos
    Given estou na página de login
    When insiro "usuario_valido" no campo de usuário
    And insiro "senha_valida" no campo de senha
    And clico no botão "entrar"
    Then devo ser redirecionado para a tela de checkout

  Scenario: Login com dados inválidos
    Given estou na página de login
    When insiro "usuario_invalido" no campo de usuário
    Or insiro "senha_invalida" no campo de senha
    And clico no botão "entrar"
    Then o sistema deve exibir a mensagem "Usuário ou senha inválidos"
Feature: Tela de Cadastro - Checkout
  Como cliente da EBAC-SHOP
  Quero concluir meu cadastro
  Para finalizar minha compra

  Scenario: Cadastro com todos os campos preenchidos
    Given estou na página de cadastro
    When preencho todos os campos obrigatórios marcados com asteriscos
    And clico no botão "finalizar"
    Then o sistema deve cadastrar o usuário com sucesso
    And redirecionar para a tela de finalização da compra

  Scenario: Cadastro com e-mail em formato inválido
    Given estou na página de cadastro
    When preencho o campo de e-mail com "email_invalido"
    And preencho os demais campos obrigatórios
    And clico no botão "finalizar"
    Then o sistema deve exibir a mensagem de erro "Formato de e-mail inválido"

  Scenario: Cadastro com campos obrigatórios vazios
    Given estou na página de cadastro
    When deixo um ou mais campos obrigatórios vazios
    And clico no botão "finalizar"
    Then o sistema deve exibir uma mensagem de alerta indicando que todos os campos devem ser preenchidos