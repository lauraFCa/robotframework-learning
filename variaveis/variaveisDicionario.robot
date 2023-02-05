*** Settings ***
Documentation   Tarefa - Dicionarios
Library    ../resources/func.py
Suite Teardown   Após toda a suite
*** Variable ***
&{DIAS_MES}    JAN=31    FEV=28    MAR=31    ABR=30    MAI=31    JUN=30    JUL=31    AGO=31    SET=30    OUT=31    NOV=30    DEZ=31

*** Test Cases ***
Imprimir dia e mes
    Log To Console    Dias em JAN: ${DIAS_MES.JAN}
    Log To Console    Dias em FEV: ${DIAS_MES.FEV}
    Log To Console    Dias em MAR: ${DIAS_MES.MAR}
    Log To Console    Dias em ABR: ${DIAS_MES.ABR}
    Log To Console    Dias em MAI: ${DIAS_MES.MAI}
    Log To Console    Dias em JUN: ${DIAS_MES.JUN}
    Log To Console    Dias em JUL: ${DIAS_MES.JUL}
    Log To Console    Dias em AGO: ${DIAS_MES.AGO}
    Log To Console    Dias em SET: ${DIAS_MES.SET}
    Log To Console    Dias em OUT: ${DIAS_MES.OUT}
    Log To Console    Dias em NOV: ${DIAS_MES.NOV}
    Log To Console    Dias em DEZ: ${DIAS_MES.DEZ}

*** Keywords ***
Após toda a suite
    Organizando