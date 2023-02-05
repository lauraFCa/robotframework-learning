*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/v1/
${ALIAS}      fakeAPI
&{BOOK_15}    id=15    
...           title=Book 15
...           description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n
...           pageCount=1500
...           excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n
...           publishDate=2022-02-15T11:31:31.015427+00:00

*** Keywords ***
### SETUPS e TEARDOWS
Conectar minha API
    Create Session    ${ALIAS}    ${URL_API}


### ACTIONS
Requisitar todos os livros
    ${RESPOSTA}    GET On Session    ${ALIAS}    Books
    Log    ${RESPOSTA.text}    # text -> simplifica leitura no Loh.html
    Set Test Variable    ${RESPOSTA}

Conferir o status code
    [Arguments]    ${STATUS_CODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUS_CODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retornam uma lista com "${QNT_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}    ${QNT_LIVROS}

Requisitar o livro "${LIVRO_ID}"
    ${RESPOSTA}    GET On Session    ${ALIAS}    Books/${LIVRO_ID}
    Log    ${RESPOSTA.text}    # text -> simplifica leitura no Loh.html
    Set Test Variable    ${RESPOSTA}

Conferir dados do livro "${LIVRO_ID}"
    #   API esta mandando alguns campos com valor aleatorio aleatorio entao nao e possivel validar individualmente
    Dictionary Should Contain Item    ${RESPOTA.json()}    "{LIVRO_ID}"    ${BOOK_15.id}
    Dictionary Should Contain Item    ${RESPOTA.json()}    title    ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPOTA.json()}    pageCount    ${BOOK_15.pageCount}
    #    Validar estes campos nao estao vazios
    Should Not Be Empty    ${RESPOTA.json()["description"]}
    Should Not Be Empty    ${RESPOTA.json()["excerpt"]}
    Should Not Be Empty    ${RESPOTA.json()["publishDate"]}


