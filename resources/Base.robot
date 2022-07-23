*** Settings ***
Documentation       Configurações comuns

Library             AppiumLibrary
Resource            pages/MainPage.robot
Resource            pages/PesssoaPage.robot


*** Keywords ***
Open Session
    Set Appium Timeout    10
    Open Application    http://0.0.0.0:4723/wd/hub
    ...    platformName=Android
    ...    deviceName=Any
    ...    app=${CURDIR}/apks/app-curso-appium.apk
    ...    appPackage=com.example.cursoappium

Close Session
    Capture Page Screenshot
    Close Application
