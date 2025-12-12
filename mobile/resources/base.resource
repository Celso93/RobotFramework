*** Settings ***
Documentation    Encapsulamento comportamentos repetidos do pro
Library          AppiumLibrary
Library          BuiltIn

*** Variables ***
${START}    QAX

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
    ...          Mobile Training
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

Validar O Botao
    [Arguments]    ${botao}
    Wait Until Page Contains    Clique simples    timeout=10
    IF    '${botao}' == 'Clique Simples'
        Click Element               xpath=//*[@resource-id="com.qaxperience.yodapp:id/rvSubMenu"]//*[@text="Clique simples"]
        Wait Until Page Contains    CLIQUE SIMPLES    timeout=10
        Click Text                  CLIQUE SIMPLES
        Wait Until Page Contains    Isso é um clique simples
    ELSE IF    '${botao}' == 'Clique Longo'
        Click Element               xpath=//*[@resource-id="com.qaxperience.yodapp:id/rvSubMenu"]//*[@text="Clique longo"]
        Wait Until Page Contains    CLIQUE LONGO    timeout=10
        # Exemplo abaixo foi o gerado no appium inspect
        # Tap With Positions
        # @{finger}       Create List    ${534}    ${1299}
        # @{positions}    Create List    ${finger}
        # Tap With Positions    ${100}    ${positions}
        # https://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html#Tap%20With%20Positions
        
        # comando abaixo pode dar falso positivo se voce estiver passando o elemento errado
        ${location}    Get Element Location    com.qaxperience.yodapp:id/long_click
        @{positions}   Create List    ${location['x']}    ${location['y']}
        Log    ${location}
        Log    ${location['x']}
        Log    ${location['y']}
        Log    ${positions}
        Tap With Positions          2s    ${positions}
        Wait Until Page Contains    Isso é um clique longo
    END

Check Em Todas As Tecnologias Que Utilizam Appium
    Wait Until Page Contains    Check e Radio    timeout=10
    Click Text    Checkbox
    @{tecnologias}    Create List    Ruby   Python    Java    Javascript    C#    Robot Framework
    FOR    ${tecnologia}    IN    @{tecnologias}
        Click Element    xpath=//android.widget.CheckBox[contains(@text, "${tecnologia}")]
    END
