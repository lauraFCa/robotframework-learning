*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource    resourceFakeAPI.robot
Suite Setup    Conectar minha API

*** Test Cases ***

Example - Editar corpo de um JSON passado
    ${json_string}    Catenate
    ...    {
    ...        "p": "10",
    ...        "v": 100,
    ...        "vt": {
    ...            "dp": "Field to be edited"
    ...        }
    ...    }

    Log to console    \nOriginal JSON:\n${json_string}
    ${newJSON}    Alterar corpo de um json    ${json_string}    vt    the new value
    Log to console    \nNew JSON string:\n${newJSON}


*** Keywords ***
Alterar corpo de um json
    [Arguments]    ${jsonOriginal}    ${parametroAlterar}    ${novoValor}
    ${json}    Evaluate    json.loads('''${jsonOriginal}''')    json
    Set to Dictionary    ${json["${parametroAlterar}"]}    dp=${novoValor}
    ${novoJson}    Evaluate    json.dumps(${json})    json
    [Return]    ${novoJson}