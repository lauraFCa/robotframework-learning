# Robot Framework

## Pré-requisitos: 
- Instalar [Python](https://www.python.org/downloads/)
- Adicionar às variáveis de ambiente

*Sugestão*: criar um ambiente virtual `python -m venv venv`

Instalar [Robot Framework](https://robotframework.org/)  
` pip install robotframework`  
`robot --version  (para checar a instalação) `

Para testes de API - instalar biblioteca de requests ([Requests Library](https://github.com/MarketSquare/robotframework-requests))  
`pip install robotframework-requests`

Para execuções em paralelo - instalar [Pabot](https://pabot.org/)  
`pip install -U robotframework-pabot`

## Estrutura do Robot  

Arquivo dividido em seções: Settings, Variables, Test Cases e Keywords;

- Settings: configuração/definições do arquivo (documentações, importações, etc);
- Variables: Variáveis que serão usadas naquele arquivo;
- Test Cases: Os casos (métodos) de teste;
- Keywords: os métodos criados para execução dos testes;

**Importante:** Baseia-se totalmente no espaçamento: sempre dar um mínimo de dois espaços entre os argumentos;

## Exemplo de arquivo

```
*** Settings ***
Documentation    Descrição deste arquivo (ou desta Suite de testes)


Library    RequestsLibrary    # biblioteca para realizar os requests da API
Library    Collections    # biblioteca que permite as validações em JSON


Suite Setup       Ação que será executada antes de toda a classe de testes
Suite Teardown    Ação que será executada ao final de toda a classe de testes
Test Setup        Ação que será executada antes de cada um dos testes
Test Teardown     Ação que será executada ao final de cada um dos testes


*** Variables ***
${VARIAVEL}    Valor da variável


*** Test Cases ***
Caso de teste 01
    [Documentation]    Descrição do método
    [Tags]    tag1    tag2    Incluir
    Primeira ação a ser executada    ${VARIAVEL}    # variável de input para o teste
    Segunda ação a ser executada


Caso de teste 01
    [Documentation]    Descrição do método
    [Tags]    tag1    Excluir
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
    Log    Este é o Test Setup    # printa o valor no Log de execução do Robot
Ação que será executada ao final de cada um dos testes
    [Documentation]    Descrição da keyword (método)
    Log    Este é o Test Teardown


# METODOS
Primeira ação a ser executada
    [Documentation]    Descrição da keyword (método)
    [Arguments]    ${parametro}
    Log to Console    ${parametro}    #printa o valor no terminal


Segunda ação a ser executada
    [Documentation]    Descrição da keyword (método)
    ${RESPOSTA}	GET On Session    ${ALIAS}    Books    # GET na sessão criada previamente, no endpoint https://endpoint.com/Books
    # resposta do GET salva na variável ${RESPOSTA}


Primeira outra ação a ser executada
    [Documentation]    Descrição da keyword (método)
    Log    \nOutra ação
```
<br>

## Documentações

Usando o **VSCode**, instalar apenas a extensão: [Robot Framework Language Server (Robocorp)](https://marketplace.visualstudio.com/items?itemName=robocorp.robotframework-lsp)

[Requests Library](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)

[BuiltIn Library](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html) (padrão - importada automaticamente)

[Collections Library](https://robotframework.org/robotframework/latest/libraries/Collections.html) (padrão, mas precisa ser importada)

[Robot Framework](https://robotframework.org/?tab=2#getting-started)

[Pabot](https://github.com/mkorpela/pabot)

[Robot Framework CI/CD with Azure DevOps](https://milannovovic.medium.com/robot-framework-ci-cd-with-azure-devops-cf708a64b389)

[Curso - Automação de Testes com Robot Framework - Básico](https://www.udemy.com/course/automacao-de-testes-com-robot-framework-basico/)

Exemplos de requests - [HTTP request method examples](https://robocorp.com/docs/development-guide/http/http-examples)

Linkedin Learning:
- [Robot Framework Test Automation: Level 1 (Selenium)](https://www.linkedin.com/learning/robot-framework-test-automation-level-1-selenium?u=102064650)
- [Robot Framework Test Automation: Level 2](https://www.linkedin.com/learning/robot-framework-test-automation-level-2?u=102064650)
- [Robot Framework Test Automation: Jenkins CI and Git Version Control](https://www.linkedin.com/learning/robot-framework-test-automation-jenkins-ci-and-git-version-control?u=102064650)
- [Robot Framework Test Automation: Sauce Labs](https://www.linkedin.com/learning/robot-framework-test-automation-sauce-labs?u=102064650)

Quick tip - [Você quer Paralelismo, Métricas e Histórico? Venha para o RobotFramework.]()

