*** Settings ***
Documentation   Tarefa - Variaveis
Library    ../resources/func.py
Suite Teardown   Após toda a suite
*** Variable ***
@{MESES}    JAN    FEV    MAR    ABR    MAI    JUN    JUL    AGO    SET    OUT    NOV    DEZ

*** Test Cases ***
Imprimir manualmente todos os meses
    Log To Console    1º mês: ${MESES[0]}
    Log To Console    2º mês: ${MESES[1]}
    Log To Console    3º mês: ${MESES[2]}
    Log To Console    4º mês: ${MESES[3]}
    Log To Console    5º mês: ${MESES[4]}
    Log To Console    6º mês: ${MESES[5]}
    Log To Console    7º mês: ${MESES[6]}
    Log To Console    8º mês: ${MESES[7]}
    Log To Console    9º mês: ${MESES[8]}
    Log To Console    10º mês: ${MESES[9]}
    Log To Console    11º mês: ${MESES[10]}
    Log To Console    12º mês: ${MESES[11]}

Imprimir sozin
    Log To Console    @{MESES},  no_newline=False

*** Keywords ***
Após toda a suite
    Organizando