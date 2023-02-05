*** Settings ***
Library   String

*** Variables ***
&{NOMES_PESSOA}   nome=Laura   sobrenome=C

*** Test Cases ***
Print e-mail
    ${EMAIL}    Criar e-mail    ${NOMES_PESSOA.nome}    ${NOMES_PESSOA.sobrenome}
    Log To Console     ${EMAIL}


*** Keywords ***
Criar e-mail
    [Arguments]       ${NOME}  ${SOBRENOME}
    ${ALEATORIA}      Generate Random String
    ${EMAIL_FINAL}    Set Variable    ${NOME}${SOBRENOME}${ALEATORIA}@testerobot.com
    [Return]          ${EMAIL_FINAL}