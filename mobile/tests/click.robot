*** Settings ***
Documentation    Este arquivo sera refatorado para utilizar recursos
...              O arquivo home.depreceated.robot sera descontinuado
Resource         ../resources/base.resource
Test Setup      Inicializando O App
Test Teardown   Close Application

*** Test Cases ***
Abrir o menu lateral e verificar o clique simples
    [Documentation]    Teste para abrir o menu lateral e verificar o clique simples
    ...                Codigo usado para estudo no curso introdutorio de appium
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Clique em Botões
    Validar O Botao    Clique Simples

Abrir o menu lateral e verificar o clique Longo
    [Documentation]    Teste para abrir o menu lateral e verificar o clique longo
    ...                Esse cenario esta bugado no APP o botao de clicar desaparece no momento do TAP
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Clique em Botões
    Validar O Botao    Clique Longo

Abrir o menu lateral e verificar check e raddio
    [Documentation]    Teste para abrir o menu lateral e verificar check e radio
    [Tags]    wip
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Check e Radio
    Check Em Todas As Tecnologias Que Utilizam Appium
