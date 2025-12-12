*** Settings ***
Documentation    Curso introdutorio de appium
Library          AppiumLibrary
Suite Setup      Inicializando O App
Suite Teardown   Close Application

*** Variables ***
${START}    QAX

*** Test Cases ***
Abrir o menu lateral e verificar o clique simples
    [Documentation]    Teste para abrir o menu lateral e verificar o clique simples
    ...                Codigo usado para estudo no curso introdutorio de appium
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Clique em Botões
    Validando Primeiro Botao

*** Keywords ***
Inicializando O App
    Open Application    http://127.0.0.1:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/yodapp.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

Acessando A Tela Principal
    ${status}    Run Keyword And Return Status    Wait Until Page Contains
    ...          Mobile Trainings
    ...          timeout=10
    IF     ${status}    Click Text    ${START}
    Log    ${status}
    Wait Until Page Contains    Clique em Botões  timeout=10

Acessando O Menu E Clicando Em
    [Arguments]    ${texto}
    Click Element    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]
    Click Element    xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${texto}"]

Validando Primeiro Botao
    Wait Until Page Contains    Clique simples    timeout=10
    Click Element               xpath=//*[@resource-id="com.qaxperience.yodapp:id/rvSubMenu"]//*[@text="Clique simples"]
    Wait Until Page Contains    CLIQUE SIMPLES    timeout=10
    Click Text                  CLIQUE SIMPLES
    Wait Until Page Contains    Isso é um clique simples
