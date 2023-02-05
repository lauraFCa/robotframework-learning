*** Settings ***
Library    SeleniumLibrary
Library    func.py

*** Variables ***
${BROWSER}    chrome  #WARNING config windows size
${URL}                 https://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${LOGO_SITE}           //a[contains(@class,'nav-logo-link nav-progressive-attribute')]

${TODOS_MENU}    //a[contains(@role,'button')]
${VER_TUDO}    (//a[contains(.,'ver tudo')])[1]
${MENU_ELETRONICOS_TV_AUDIO}    //a[@class='hmenu-item'][contains(.,'Eletrônicos, TV e Áudio')]
${MENU_TUDO_ELETRONICOS}    //a[contains(.,'Tudo em Eletrônicos')]

${BARRA_PESQUISA}    twotabsearchtextbox
${SUBMIT_SEARCH}     nav-search-submit-button

*** Keywords ***
# Setup e Teardown
Abrir o navegador   # titulo da keyword
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    #Capture Page Screenshot
    Close Browser

Antes de toda a suite
    Sleep    1

Após toda a suite
    Sleep    1
    Organizando

# Tests Methods
Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Wait Until Element Is Visible    ${LOGO_SITE}

Entrar no menu "${MENU}"
    Click Element    ${TODOS_MENU}
    Wait Until Element Is Visible    ${VER_TUDO}
    Click Element    ${VER_TUDO}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS_TV_AUDIO}
    Click Element    ${MENU_ELETRONICOS_TV_AUDIO}
    Wait Until Element Is Visible    ${MENU_TUDO_ELETRONICOS}
    Click Element    ${MENU_TUDO_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    ${FRASE}

Verificar se o título da página fica "${TITULO-H1}"
    Wait Until Element Is Visible    //h1[contains(.,'${TITULO-H1}')]
    ${title}    Get Title
    Log    ${title}
    Should Contain    ${title}    ${TITULO-H1}
    # Element Should Contain    //h1[contains(.,'${TITULO-H1}')]    ${TITULO-H1}

Verficar se aparece a categoria "${NOME_CATEGORIA}"
    Wait Until Element Is Visible    //a[@aria-label='${NOME_CATEGORIA}']
    Element Should Be Visible    //a[@aria-label='${NOME_CATEGORIA}'] 

Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Input Text    ${BARRA_PESQUISA}     ${NOME_PRODUTO}

Clicar no botão de pesquisa
    Click Element    ${SUBMIT_SEARCH}

Verificar o resultado da pesquisa se está listando o produto "${NOME_PRODUTO}"
    Wait Until Element Is Visible    //span[contains(.,'resultado')]
    Wait Until Element Is Visible    //h2//a//span[contains(.,'${NOME_PRODUTO}')]
    Element Should Contain    //h2//a//span[contains(.,'${NOME_PRODUTO}')]    ${NOME_PRODUTO}


# GHERKIN STEPS
Dado que estou na homepage da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "${MENU}"
    Entrar no menu "${MENU}"

E o texto "${FRASE}" deve ser exibido na página
    Verificar se aparece a frase "${FRASE}"

Então o título da pagina deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"
    

E a categoria "${NOME_CATEGORIA}" deve ser exibida na página
    Verficar se aparece a categoria "${NOME_CATEGORIA}"

Quando pesquisar pelo produto "${NOME_PRODUTO}"
    Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa

E um produto da linha "${NOME_PRODUTO}" deve ser exibida na página
    Verificar o resultado da pesquisa se está listando o produto "${NOME_PRODUTO}"

Adicionar o produto "${NOME_PRODUTO}" no carrinho
    Click Element    (//h2//a//span[contains(.,'${NOME_PRODUTO}')])[1]
    Wait Until Element Is Visible    add-to-cart-button
    Click Element    add-to-cart-button
    Sleep    2    Wait for possible sidebar
    ${sidebar}=    SeleniumLibrary.Get Element Count  attach-warranty-header
    IF    ${sidebar} != 0
        Click Element    //input[@aria-labelledby='attachSiNoCoverage-announce']
    END
    Wait Until Element Is Visible    add-to-cart-confirmation-image

Verificar se o produto "${NOME_PRODUTO}" foi adicionado com sucesso
    Element Should Be Visible    add-to-cart-confirmation-image
    Click Element    nav-cart
    Wait Until Element Is Visible    //h1[contains(.,'Carrinho de compras')]
    Wait Until Element Is Visible    //li//span[contains(.,'${NOME_PRODUTO}')]

Remover o produto "${NOME_PRODUTO}" do carrinho
    Click Element    //input[@value='Excluir']
    Wait Until Element Is Visible    //h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]

Verificar se o carrinho fica vazio
    Element Should Be Visible    //h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]

Quando adicionar o produto "${NOME_PRODUTO}" no carrinho
    Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Adicionar o produto "${NOME_PRODUTO}" no carrinho

Então o produto "${NOME_PRODUTO}" deve ser mostrado no carrinho
    Verificar se o produto "${NOME_PRODUTO}" foi adicionado com sucesso

E existe o produto "${NOME_PRODUTO}" no carrinho
    Quando adicionar o produto "${NOME_PRODUTO}" no carrinho
    Verificar se o produto "${NOME_PRODUTO}" foi adicionado com sucesso

Quando remover o produto "${NOME_PRODUTO}" do carrinho
    Remover o produto "${NOME_PRODUTO}" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
