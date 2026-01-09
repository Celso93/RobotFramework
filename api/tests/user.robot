*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    FakerLibrary

*** Variables ***
${API_URL}    http://localhost:3000

*** Test Cases ***
Scenario: Creating an user successfully
    ${email}   FakerLibrary.Email
    ${response}    Create User    status=201    email=${email}

    Should Be Equal        ${response.json()['message']}    Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()['_id']}
    Clear User By Id       ${response.json()['_id']}

Scenario: Creating an user with existing email
    ${response_new_user}    Create User    status=201
    ${response_same_user}   Create User    status=400

    Should Be Equal     ${response_same_user.json()['message']}    Este email já está sendo usado
    Clear User By Id    ${response_new_user.json()['_id']}

*** Keywords ***
Create User
    [Arguments]   ${status}
    ...           ${email}=teste1234432423@mail.com

    ${nome}    FakerLibrary.Name
    ${user}    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    password=Teste@12345
    ...    administrador=false

    ${new_user}    POST
    ...            url=${API_URL}/usuarios
    ...            json=${user}
    ...            expected_status=${status}
    Return From Keyword    ${new_user}

Clear User By Id
    [Arguments]    ${user_id}
    DELETE    ${API_URL}/usuarios/${user_id}        
    ...       expected_status=200
    Log To Console    User with id ${user_id} deleted
