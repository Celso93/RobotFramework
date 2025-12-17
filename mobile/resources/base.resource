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
    ...                 app=${EXECDIR}/apk/yodapp.apk
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

Selecionando A Linguagem Preferida No Formato Radio Button
    Wait Until Page Contains    Check e Radio    timeout=10
    Click Text       Botões de radio
    Click Element    xpath=//android.widget.RadioButton[@resource-id="com.qaxperience.yodapp:id/radioButton" and @text="Javascript "]

Acessando o Login
    Click Text    Login
    Wait Until Page Contains    vamos testar o login?

Enviando o dados de acesso
    [Arguments]    ${usuario}    ${senha}
    Input Text     com.qaxperience.yodapp:id/etEmail       ${usuario}
    Input Text     com.qaxperience.yodapp:id/etPassword    ${senha}
    Click Text     ENTRAR

Espero encontrar a mensagem
    [Arguments]    ${mensagem}
    Wait Until Page Contains    ${mensagem}    timeout=10

Valido O Spinner No App
    Click Text    Cadastro
    Click Element    xpath=//android.widget.TextView[@resource-id="android:id/text1"]
    Wait Until Element is Visible    class=android.widget.ListView    timeout=10
    Click Text    Jedi

Acesso A Lista De Personagens E Deleto O
    [Arguments]    ${personagem}
    Click Text    Lista

    ${element}    Get Element Location    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/textAbout" and @text="@${personagem}"]/../../../(//android.widget.FrameLayout[@resource-id="com.qaxperience.yodapp:id/indicator"])[2]
    ${new_x}      Evaluate    ${element}[x] - 600

    Swipe     start_x=${element}[x]
    ...       start_y=${element}[y]
    ...       end_x=${new_x}
    ...       end_y=${element}[y]
    ...       duration=2s

    Click Element    id=com.qaxperience.yodapp:id/btnRemove
    Wait Until Page Does Not Contain    ${personagem}
