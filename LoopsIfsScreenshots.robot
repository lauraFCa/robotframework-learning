*** Settings ***
Documentation   Loops, Condições, Logs e Screenshots
Library         SeleniumLibrary
*** Variables ***
### Indíce da lista          0      1        2       3       4       5
@{MINHA_LISTA_DE_FRUTAS}   maça  abacaxi  banana  morango  laranja  uva
@{FRUTAS}   maça  banana  uva  abacaxi

*** Test Case ***
Teste de REPEAT KEYWORD
    [Documentation]  Chama uma mesma keyword várias vezes
    Usando Repeat keyword

Teste de FOR do tipo IN RANGE
    [Documentation]  Faz um loop dentro de um intervalo que você passar
    Usando FOR IN RANGE

Teste de FOR do tipo IN
    [Documentation]  Faz um loop percorrendo a lista que você passar
    Usando FOR IN

Teste de FOR do tipo IN ENUMERATE
    [Documentation]  Faz um loop percorrendo a lista que você passar e percorre o indíce da lista
    Usando FOR IN ENUMERATE

Teste de Sair do FOR
    [Documentation]  Você controla quando o FOR deve se encerrar antes de terminar todos os LOOPS
    Usando FOR IN com EXIT FOR LOOP IF

Caso de teste exemplo 01
    Usando FOR com RANGE
    Usando FOR com LISTA
    Saindo de um FOR
    Usando a keyword REPEAT

Caso ElseIF
    Set Test Variable    ${status}    True
    Exemplo blocos IF - ELSE IF

Caso de teste exemplo 01
    Usando LOG para mensagens
    Usando LOG Console
    Usando screen shots

Caso de teste exemplo 01
    Rodando uma keyword dada uma condição = true
    Rodando uma keyword dada uma condição = false
    Armazenando um valor em uma variável dada uma condição

*** Keywords ***
Usando LOG para mensagens
    Log     Minha mensagem de LOG
    ${VAR}  Set Variable    variável qualquer
    Log     Posso logar uma ${VAR} no meio de um log

Usando LOG Console
    Log To Console      Posso logar na saída do console
    Log Many            Posso logar minha lista completa @{FRUTAS}
    Log                 Posso logar somente itens da minha lista ${FRUTAS[0]} - ${FRUTAS[1]}

Usando screen shots
    Log     Nos testes web, podemos logar Screenshot com a SeleniumLibrary
    Open Browser    http://www.robotizandotestes.blogspot.com.br    firefox
    Capture Page Screenshot      nome_do_meuscreenshot.png
    Close Browser

Usando Repeat keyword
    Log To Console  ${\n}
    Repeat Keyword    8x    Log To Console    Minha repetição da keyword!!!

Usando FOR IN RANGE
    Log To Console  ${\n}
    FOR  ${CONTADOR}   IN RANGE  0   5
        Log To Console    Minha posição agora é: ${CONTADOR}
        Log   Minha posição agora é: ${CONTADOR}
    END

Usando FOR IN
    Log To Console    ${\n}
    FOR  ${FRUTA}   IN  @{MINHA_LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${FRUTA}!
        No Operation
    END

Usando FOR IN ENUMERATE
    Log To Console    ${\n}
    FOR   ${INDICE}   ${FRUTA}   IN ENUMERATE   @{MINHA_LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${INDICE} --> ${FRUTA}!
        No Operation
    END

Usando FOR IN com EXIT FOR LOOP IF
    Log To Console    ${\n}
    FOR   ${INDICE}   ${FRUTA}   IN ENUMERATE   @{MINHA_LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${INDICE} --> ${FRUTA}!
        Exit For Loop If    '${FRUTA}'=='banana'
    END

Usando FOR com RANGE
    FOR    ${COUNT}    IN RANGE    1    6
        Log    Meu contador atual é: ${COUNT}. O range será de 1 a 5!
        Run Keyword If    ${COUNT} == 5    Log    Acabou o loop!!!
    END

Usando FOR com LISTA
    FOR    ${ITEM}    IN    @{FRUTAS}
        Log    Minha fruta é: ${ITEM}
        Run Keyword If    '${ITEM}' == 'abacaxi'    Log    Acabou o loop!!!
    END

Saindo de um FOR
    FOR    ${ITEM}    IN    @{FRUTAS}
        Exit For Loop If    '${ITEM}' == 'uva'
        Log    Minha fruta é: ${ITEM}
    END

Usando a keyword REPEAT
    Repeat Keyword    4    Log    Vamos logar essa frase 4 vezes!!!

Positive keyword
    Log    True

Negative keyword
    Log    False

Zero keyword
    Log    Zero

Exemplo blocos IF - ELSE IF
    IF   ${status} > 0
        Positive keyword
    ELSE IF    ${status} < 0
        Negative keyword
    ELSE IF    ${status} == 0
        Zero keyword
    ELSE
        IF  ${status} == ${EMPTY}
            Fail   O status está vazio!
        ELSE
            Fail   O status ${status} tem um valor desconhecido!
        END
    END

Rodando uma keyword dada uma condição = true
    Run Keyword If      '${FRUTAS[1]}' == 'banana'      Log   O item número 1 é a banana!!

Rodando uma keyword dada uma condição = false
    Run Keyword Unless  '${FRUTAS[1]}' == 'maça'        Log   O item número 1 não é uma maça!!

Armazenando um valor em uma variável dada uma condição
    ${VAR}     Set Variable If   '${FRUTAS[2]}' == 'uva'     uva
    Log        Minha variável VAR é uma ${VAR}!!