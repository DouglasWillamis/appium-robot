*** Settings ***
Documentation       Suite de Teste para cadastro de pessoa

Resource            ../../resources/Base.robot
Library             ../../resources/factories/Pessoa.py

Test Setup          Open Session
Test Teardown       Close Session


*** Test Cases ***
Deve cadastrar uma pessoa
    [Tags]    regression

    ${pessoa}    Factory Pessoa

    Click Botão Cadastrar Pessoa

    Input Nome    ${pessoa['nome']}
    Input Email    ${pessoa['email']}
    Selecionar Identificação  Homem
    Selecionar Estado    Alagoas
    Click Botão Cadastrar

    ${mensagemSucesso}     Obter Texto Snackbar Toast
    Should Be Equal    Cadastro realizado com sucesso    ${mensagemSucesso}

Não deve cadastrar uma pessoa com o nome vázio
    [Tags]    regression

    ${pessoa}    Factory Pessoa

    Click Botão Cadastrar Pessoa

    Input Email    ${pessoa['email']}
    Selecionar Identificação  Mulher
    Selecionar Estado    Ceará
    Click Botão Cadastrar

    ${nomeVazioValidacao}     Obter Texto validação Input Text
    Should Be Equal    Insira o nome completo    ${nomeVazioValidacao}

Não deve cadastrar uma pessoa com o email vázio
    [Tags]    regression

    ${pessoa}    Factory Pessoa

    Click Botão Cadastrar Pessoa

    Input Nome    ${pessoa['nome']}
    Selecionar Identificação  Mulher
    Selecionar Estado    Bahia
    Click Botão Cadastrar

    ${emailVazioValidacao}     Obter Texto validação Input Text
    Should Be Equal    Insira um email válido    ${emailVazioValidacao}

Não deve cadastrar uma pessoa com o mesmo email
    [Tags]    regression

    ${pessoa}    Factory Pessoa

    Click Botão Cadastrar Pessoa

    Input Nome    ${pessoa['nome']}
    Input Email    ${pessoa['email']}
    Selecionar Identificação  Homem
    Selecionar Estado    Mato Grosso
    Click Botão Cadastrar

    Input Nome    ${pessoa['nome']}
    Input Email    ${pessoa['email']}

    Wait Until Page Does Not Contain Element    snackbar_text    10

    Click Botão Cadastrar

    ${emailDuplicadoValidacao}     Obter Texto Snackbar Toast
    Should Be Equal    Email já cadastrado    ${emailDuplicadoValidacao}