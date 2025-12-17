*** Settings ***
Resource         ../resources/baseMark.resource
Test Setup      Inicializando O App
Test Teardown   Close Application


*** Test Cases ***
Abrir o menu lateral e verificar o clique simples
    [Documentation]    Teste para abrir o menu lateral e verificar o clique simples
    ...                Codigo usado para estudo no curso introdutorio de appium
    Sleep     10
