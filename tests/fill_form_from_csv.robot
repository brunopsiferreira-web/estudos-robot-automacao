*** Settings ***
Documentation       Simula cadastro de candidatos lidos de um CSV

Library             SeleniumLibrary
Resource            ../resources/csv_reader.robot


*** Variables ***
${CSV_PATH}     ${CURDIR}/../dados/candidatos.csv
${FORM_URL}     http://localhost:5000


*** Test Cases ***
Cadastrar Candidatos do CSV
    # ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Call Method    ${options}    add_argument    --headless

    Open Browser    ${FORM_URL}    Chrome    usr/local/bin/chromedriver
    Set Selenium Speed    0.3s

    ${candidatos}=    Ler Candidatos do CSV    ${CSV_PATH}
    Log Many    @{candidatos}

    FOR    ${cand}    IN    @{candidatos}
        Preencher Formulário    ${cand}[nome]    ${cand}[email]    ${cand}[cargo]
    END

    Close Browser


*** Keywords ***
Preencher Formulário
    [Arguments]    ${nome}    ${email}    ${cargo}
    Input Text    name=nome    ${nome}
    Input Text    name=email    ${email}
    Input Text    name=cargo    ${cargo}
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    cadastrado com sucesso    timeout=5s
