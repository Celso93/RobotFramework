*** Settings ***

Library    AppiumLibrary

*** Test Cases ***

Abrir a tela principal
    Open Application    http://127.0.0.1:4723
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 automationName=UIAutomator2
    ...                 app=${EXECDIR}/yodapp.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    Wait Until Page Contains    Yodapp            timeout=10
    Wait Until Page Contains    Mobile Training   timeout=10

    Close Application
