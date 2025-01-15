Feature: Login na Plataforma
  Como cliente da EBAC-SHOP
  Quero fazer login na plataforma
  Para visualizar meus pedidos

  Scenario: Login com dados válidos
    Dado que estou na página de login
    Quando preencher "usuario_valido" no campo de usuário
    E preencher "senha_valida" no campo de senha
    E clicar no botão "entrar"
    Então devo ser redirecionado para a tela de checkout

  Scenario Outline: Login com dados inválidos
    Dado que estou na página de login
    Quando preencher <usuário> no campo de usuário
    E preencher <senha> no campo de senha
    E clicar no botão "entrar"
    Então o sistema deve exibir a mensagem "Usuário ou senha inválidos"

    Examples:
      | usuário          | senha           |
      | usuario_invalido | senha_valida    |
      | usuario_valido   | senha_invalida  |
      | usuario_invalido | senha_invalida  |
