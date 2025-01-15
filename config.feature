Feature: Configurar Produto
  Como cliente da EBAC-SHOP
  Quero configurar meu produto de acordo com meu tamanho, gosto e quantidade
  Para depois inserir no carrinho

  Scenario: Seleções obrigatórias
    Dado que estou na página de configuração do produto
    Quando não selecionar cor, tamanho ou quantidade
    Então o sistema deve exibir uma mensagem indicando que as seleções são obrigatórias

  Scenario Outline: Limite de produtos por venda
    Dado que estou na página de configuração do produto
    Quando selecionar <quantidade> unidade(s)
    Então o sistema deve exibir a mensagem "O limite é de 10 produtos por venda"

    Examples:
      | quantidade |
      | 11         |
      | 12         |

  Scenario: Limpar seleção
    Dado que estou na página de configuração do produto
    Quando selecionar tamanho, cor e quantidade
    E clicar no botão "limpar"
    Então todas as seleções devem ser removidas e os campos devem retornar ao estado original
