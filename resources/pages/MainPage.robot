*** Settings ***
Resource    ../Base.robot


*** Keywords ***
Click Botão Cadastrar Pessoa
    Wait Until Page Contains Element    button_cadastrar
    Click Element    button_cadastrar
