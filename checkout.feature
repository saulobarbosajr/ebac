Feature: Tela de Cadastro - Checkout
  Como cliente da EBAC-SHOP
  Quero concluir meu cadastro
  Para finalizar minha compra

  Scenario: Cadastro com todos os campos preenchidos
    Dado que estou na página de cadastro
    Quando preencher todos os campos obrigatórios marcados com asteriscos
    E clicar no botão "finalizar"
    Então o sistema deve cadastrar o usuário com sucesso
    E redirecionar para a tela de finalização da compra

  Scenario Outline: Cadastro com e-mail inválido
    Dado que estou na página de cadastro
    Quando preencher o campo de e-mail com <email>
    E preencher os demais campos obrigatórios
    E clicar no botão "finalizar"
    Então o sistema deve exibir a mensagem "Formato de e-mail inválido"

    Examples:
      | email          |
      | email_invalido |
      | teste@com      |

  Scenario: Cadastro com campos obrigatórios vazios
    Dado que estou na página de cadastro
    Quando deixar de preencher algum campo obrigatório
    Então o sistema deve exibir a mensagem "Todos os campos devem ser preenchidos"
