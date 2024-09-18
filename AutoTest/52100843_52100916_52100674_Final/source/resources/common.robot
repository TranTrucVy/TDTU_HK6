*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String

*** Variables ***
${BROWSER}        Chrome
${URL_HOME}       https://automationteststore.com/

*** Keywords ***
Opening my browser 
    Open Browser    ${URL_HOME}    ${BROWSER}
    Location Should Be    ${URL_HOME}
    Maximize Browser Window

Closing my browser
    Close Browser

Enter page 
    [Arguments]    ${url}
    Go To    ${url}
    Location Should Be    ${url}

Read CSV file
    [Arguments]    ${file}
    ${data}=    Get File    ${file}
    ${data}=    Split To Lines    ${data}
    ${res}=    Create List
    FOR    ${line}    IN    @{data}
        ${data}=    Split String    ${line}    separator=,
        Append To List    ${res}    ${data}
    END
    RETURN ${res}


