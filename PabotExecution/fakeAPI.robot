*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource    resourceFakeAPI.robot
Suite Setup    Conectar minha API

*** Test Cases ***
Buscar a litagem de todos os livros (GET livros)
    Requisitar todos os livros
    Conferir o status code    200
    Conferir o reason    OK
    Conferir se retornam uma lista com "200" livros

Requisitar um livro especifico (GET um livro)
    Requisitar o livro "20"
    Conferir o status code    200
    Conferir o reason    OK
    Conferir dados do livro "20"