*** Settings ***
Documentation    Descrição do arquivo/classe/Suite

Library    RequestsLibrary    # biblioteca para realizar os requests da API
Library    Collections    # biblioteca que permite as validações em JSON

Suite Setup       Ação que será executada antes de toda a classe de testes
Suite Teardown    Ação que será executada ao final de toda a classe de testes
Test Setup        Ação que será executada antes de cada um dos testes
Test Teardown     Ação que será executada ao final de cada um dos testes

*** Variables ***
${VARIAVEL}    Valor da variavel

*** Test Cases ***
Caso de teste 01
    [Documentation]    Descrição do método
    [Tags]    tag1    tag2    iIcluir
    Primeira ação a ser executada    ${VARIAVEL}    # variavel de input para o teste
    Segunda ação a ser executada

Caso de teste 01
    [Documentation]    Descrição do método
    [Tags]    tag1    Exckuir
    Primeira outra ação a ser executada
    Segunda ação a ser executada    # mesma para ambos os testes


*** Keywords ***
# SETUPS E TEARDOWS
Ação que será executada antes de toda a classe de testes
    [Documentation]    Descrição da keyword (método)
    Log    Este é o Suite Setup
    Create Session    ${ALIAS}    https://endpoint.com
Ação que será executada ao final de toda a classe de testes
    [Documentation]    Descrição da keyword (método)
    Log    Este é o Suite Teardown
    Delete All Sessions
Ação que será executada antes de cada um dos testes
    [Documentation]    Descrição da keyword (método)
    Log    Este é o Test Setup
Ação que será executada ao final de cada um dos testes
    [Documentation]    Descrição da keyword (método)
    Log    Este é o Test Teardown


# METODOS
Primeira ação a ser executada
    [Documentation]    Descrição da keyword (método)
    [Arguments]    ${parametro}
    Log    ${parametro}    # printa o valor no Log de execução
    Log to Console    ${parametro}    #printa o valor no terminal

Segunda ação a ser executada
    [Documentation]    Descrição da keyword (método)
    GET On Session    ${ALIAS}    Books    # GET na sessão criada previamente, no endpoint ${ALIAS}/Books

Primeira outra ação a ser executada
    [Documentation]    Descrição da keyword (método)
    Log    \nOutra ação
