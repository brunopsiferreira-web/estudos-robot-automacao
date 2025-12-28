*** Settings ***
Library     Collections
Library     OperatingSystem
Library     String


*** Keywords ***
Ler Candidatos do CSV
    [Arguments]    ${caminho_csv}
    ${conteudo}=    Get File    ${caminho_csv}    encoding=utf-8
    @{linhas}=    Split To Lines    ${conteudo}

    # Primeira linha = cabeçalho
    ${cabecalho}=    Split String    ${linhas}[0]    ,
    ${resultados}=    Create List

    # Linhas seguintes = dados
    FOR    ${linha}    IN    @{linhas}[1:]
        ${campos}=    Split String    ${linha}    ,
        ${dict}=    Create Dictionary
        ${tamanho}=    Get Length    ${cabecalho}
        FOR    ${i}    IN RANGE    ${tamanho}
            ${chave}=    Set Variable    ${cabecalho}[${i}]
            ${valor}=    Set Variable    ${campos}[${i}]
            Set To Dictionary    ${dict}    ${chave}    ${valor}
        END
        Append To List    ${resultados}    ${dict}
    END
    RETURN    ${resultados}
