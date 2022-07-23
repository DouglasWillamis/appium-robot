*** Settings ***
Resource    ../Base.robot


*** Keywords ***
Input Nome
    [Arguments]    ${nome}
    Wait Until Page Contains Element    TextInputNome    10
    Input Text    TextInputNome    ${nome}

Input Email
    [Arguments]    ${email}
    Wait Until Page Contains Element    TextInputEmail    10
    Input Text    TextInputEmail    ${email}

Selecionar Identificação
    [Arguments]    ${identificacao}
    Click Text    ${identificacao}

Selecionar Estado
    [Arguments]    ${estado}
    Wait Until Page Contains    Acre
    Click text    Acre
    Wait Until Page Contains    ${estado}
    Click Text    ${estado}

Click Botão Cadastrar
    Click Element    BotaoCadastrar

Click Botão Voltar
    Click Element    BotaoVoltar

Obter Texto Snackbar Toast
    Wait Until Page Contains Element    snackbar_text    10
    ${texto}    Get Text    snackbar_text
    RETURN    ${texto}


Obter Texto validação Input Text
    Wait Until Page Contains Element    textinput_error    10
    ${texto}    Get Text    textinput_error
    RETURN    ${texto}

