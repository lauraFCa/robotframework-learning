*** Settings ***
Documentation    Essa suite testa o site da Amazon.com
Resource         amazon_resources.robot
# robot -d output amazon_test.robot

Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

Suite Setup      Antes de toda a suite
Suite Teardown   Após toda a suite

*** Variables ***

*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Eletrônicos"  # titulo do caso de teste
    [Documentation]  Esse teste verifica o menu eletrônicos do site da amazon.com.br
    ...              e verifica a categoria "Computadores e Informática"
    [Tags]           menus  categorias
    Dado que estou na homepage da Amazon.com.br  # primeiro passo do teste
    Quando acessar o menu "Eletrônicos"
    Então o título da pagina deve ficar "Eletrônicos e Tecnologia"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página
    E a categoria "PC Gamer" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um prduto
    [Tags]           busca_produtos  lista_busca
    Dado que estou na homepage da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da pagina deve ficar "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser exibida na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Console Xbox Series S" no carrinho
    Quando remover o produto "Console Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio