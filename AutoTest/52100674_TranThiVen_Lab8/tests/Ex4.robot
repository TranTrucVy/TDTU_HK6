*** Settings ***
Documentation     Lab 08 - Ex1
Library           SeleniumLibrary
Library           BuiltIn
Library           RequestsLibrary
Library           JSONLibrary
Library    Collections
Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}        Chrome
${URL}            https://dummy.restapiexample.com/


*** Test Cases ***
Do a GET request and Verify
    ${header}=    Create Dictionary    user-agent    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36
    Create Session    mysession   ${URL}
    ${response}=    GET On Session    mysession    /api/v1/employees    headers=${header}
    Status Should Be    200    ${response}

    ${data}=    Get Value From Json    ${response.json()}    data

    ${total}=    Get Length    ${data}
    Should Not Be Equal    ${total}    0

    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    employee_name
    Log To Console    body: ${body}

Do a POST request and Verify
    ${header}=    Create Dictionary    user-agent    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36
    Create Session    mysession   ${URL}
    ${body}=    Create Dictionary    name=test    salary=1200    age=21
    
    # Verify that the response code is ‘200’.
    ${response}=    POST On Session    mysession    /api/v1/create    data=${body}    headers=${header}
    Status Should Be    200    ${response}

    ${status}=    Get Value From Json    ${response.json()}    status
    ${statusFromList}=    Get From List    ${status}    0
    Should Be Equal As Strings    success    ${statusFromList}
    ${data}=    Get Value From Json    ${response.json()}    data
    
    # check the value of the header Content-Type
    ${getHeaderValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${getHeaderValue}    application/json

    # Verify that the value of the response as expected.
    ${dataFromList}=    Get From List    ${data}    0
    Log To Console    data from list: ${dataFromList}

    ${name}=    Get From Dictionary    ${dataFromList}    name
    Should Be Equal As Strings    test    ${name}
    ${salary}=    Get From Dictionary    ${dataFromList}    salary
    Should Be Equal As Strings    1200    ${salary}
    ${age}=    Get From Dictionary    ${dataFromList}    age
    Should Be Equal As Strings    21    ${age}

Verify GET method on a single item
    ${header}=    Create Dictionary    user-agent    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/
    Create Session    mysession   ${URL}

    ${response}=    GET On Session    mysession    /api/v1/employee/1    headers=${header}
    Status Should Be    200    ${response}

    ${data}=    Get Value From Json    ${response.json()}    data
    Log To Console    data: ${data}
    ${data}=    Set Variable    ${data}[0]

    ${id}=    Get From Dictionary    ${data}    id
    Should Be Equal As Strings    1    ${id}
    ${employee_name}=    Get From Dictionary    ${data}    employee_name
    Should Be Equal As Strings    Tiger Nixon    ${employee_name}
    ${employee_salary}=    Get From Dictionary    ${data}    employee_salary
    Should Be Equal As Strings    320800    ${employee_salary}
    ${employee_age}=    Get From Dictionary    ${data}    employee_age
    Should Be Equal As Strings    61    ${employee_age}
    ${profile_image}=    Get From Dictionary    ${data}    profile_image
    Should Be Empty    ${profile_image}
    
Verify PUT method
    ${header}=    Create Dictionary    user-agent    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/
    Create Session    mysession   ${URL}
    ${body}=    Create Dictionary    name=test    salary=1200    age=21

    ${response}=    PUT On Session    mysession    /api/v1/update/21    data=${body}    headers=${header}
    
    Status Should Be    200    ${response}
    ${status}=    Get Value From Json    ${response.json()}    status
    ${statusFromList}=    Get From List    ${status}    0
    Should Be Equal As Strings    success    ${statusFromList}

    ${data}=    Get Value From Json    ${response.json()}    data
    ${dataFromList}=    Get From List    ${data}    0
    Log To Console    data from list: ${dataFromList}

    ${name}=    Get From Dictionary    ${dataFromList}    name
    Should Be Equal As Strings    test    ${name}
    ${salary}=    Get From Dictionary    ${dataFromList}    salary
    Should Be Equal As Strings    1200    ${salary}
    ${age}=    Get From Dictionary    ${dataFromList}    age
    Should Be Equal As Strings    21    ${age}

Verify DELETE method
    ${header}=    Create Dictionary    user-agent    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/
    Create Session    mysession   ${URL}

    ${response}=    DELETE On Session    mysession    /api/v1/delete/2    headers=${header}
    Status Should Be    200    ${response}

    ${status}=    Get Value From Json    ${response.json()}    status
    ${statusFromList}=    Get From List    ${status}    0
    Should Be Equal As Strings    success    ${statusFromList}

    ${data}=    Get Value From Json    ${response.json()}    data
    ${dataFromList}=    Get From List    ${data}    0
    Should Be Equal As Strings    2    ${dataFromList}

    ${message}=    Get Value From Json    ${response.json()}    message
    ${messageFromList}=    Get From List    ${message}    0
    Should Be Equal As Strings    Successfully! Record has been deleted    ${messageFromList}
    
*** Keywords ***
Open The Browser
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window