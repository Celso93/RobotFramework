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
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Check e Radio
    Check Em Todas As Tecnologias Que Utilizam Appium

Abrir o menu lateral e verifica o click em radio
    [Documentation]    Teste para abrir o menu lateral e verificar check e radio
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Check e Radio
    Selecionando A Linguagem Preferida No Formato Radio Button

Login Invalido No App
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Formulários
    Acessando o Login
    Enviando o dados de acesso    teste@mail.com    123456
    Espero encontrar a mensagem    Oops! Credenciais incorretas.

Login Com Sucesso No App 
    Skip    Credenciais nao estao funcionando no momento
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Formulários
    Acessando o Login
    Enviando o dados de acesso     yoda@qax.cc    jedi
    Espero encontrar a mensagem    Boas vindas, logado você está.

Verificando o Spinner No App
    [Documentation]    Teste para cadastrar um usuario novo no app
    ...                Intuito e testar o componente SPINNER do android
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Formulários
    Valido O Spinner No App

Verificando o Swipe No App
    [Documentation]    Teste para verificar o swipe no app
    ...                Intuito e testar o componente SWIPE do android
    Acessando A Tela Principal
    Acessando O Menu E Clicando Em    Star Wars
    Acesso A Lista De Personagens E Deleto O     darthvader
