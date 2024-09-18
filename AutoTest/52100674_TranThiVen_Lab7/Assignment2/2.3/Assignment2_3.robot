*** Settings ***
Documentation     Lab 07 - Assignment2_3
Library           SeleniumLibrary
Library           BuiltIn
Library           DateTime

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/
${CALENDAR_BTN}    //*[@id="post-36"]/div/div[2]/div/div[2]/div[2]/div/a
${CALENDAR_URL}    https://practice-automation.com/calendars/
${DATE_INPUT}     //*[@id="g1065-selectorenteradate"]
${DATE_PICKER}    //*[@id="ui-datepicker-div"]
${SUBMIT_BTN}     //*[@id="contact-form-1065"]/form/p[1]/button
${RANDOM_BLANK_AREA}    //*[@id="top-wrap"]/section/div/h1
${RES_TEXT}       //*[@id="contact-form-success-header"]
${RES_INPUT}      //*[@id="contact-form-1065"]/div/div[2]
${TARGET_DATE}    2024-04-16

*** Test Cases ***
TC1: Verify calendar - Input date from picker
    Open The Browser
    Enter page    ${CALENDAR_BTN}    ${CALENDAR_URL}
    # Input date from picker
    Click Element    xpath=${DATE_INPUT}
    Wait Until Element Is Visible    ${DATE_PICKER}
    # select 2024-04-20
    Click Element    xpath=//*[@id="ui-datepicker-div"]//a[@data-date='20']
    # click outside the input field
    Click Element    xpath=${RANDOM_BLANK_AREA}
    Click Element    xpath=${SUBMIT_BTN}
    # Verify date is inputted
    Wait Until Element Is Visible    ${RES_TEXT}
    Page Should Contain Element    ${RES_TEXT}
    Page Should Contain Element    ${RES_INPUT}
    ${text}=    Get Text    ${RES_TEXT}
    ${input}=    Get Text    ${RES_INPUT}
    Should Be Equal    ${text}    Your message has been sent
    Should Be Equal    ${input}    2024-04-20
    Close Browser

TC2: Verify calendar - Check next btn of date picker
    Open The Browser
    Enter page    ${CALENDAR_BTN}    ${CALENDAR_URL}
    ${result}=    Get the current date
    # current date: 2024-04-14
    ${current_month}=    Set Variable    ${result}[1]
    ${current_year}=    Set Variable    ${result}[0]
    # Input date from picker
    Click Element    xpath=${DATE_INPUT}
    Wait Until Element Is Visible    ${DATE_PICKER}
    # select 2024-04-20
    Click Element    xpath=//*[@id="ui-datepicker-div"]//a[@data-date='20']
    # click outside the input field
    Click Element    xpath=${RANDOM_BLANK_AREA}
    # click next btn
    Click Element    //*[@id="ui-datepicker-div"]/div/a[2]
    # select 2024-05-20
    Click Element    xpath=//*[@id="ui-datepicker-div"]//a[@data-date='20']
    # click outside the input field
    Click Element    xpath=${RANDOM_BLANK_AREA}
    Click Element    xpath=${SUBMIT_BTN}
    # Verify date is inputted
    Wait Until Element Is Visible    ${RES_TEXT}
    Page Should Contain Element    ${RES_TEXT}
    Page Should Contain Element    ${RES_INPUT}
    ${text}=    Get Text    ${RES_TEXT}
    ${input}=    Get Text    ${RES_INPUT}
    Should Be Equal    ${text}    Your message has been sent
    ${month}=    Convert To Integer    ${current_month}
    ${month}=    Evaluate    ${month} + 1
    ${month}=    Evaluate    str($month).zfill(2)
    ${date}=    Evaluate    '${current_year}-${month}-20'
    Log To Console    date: ${date}
    Should Be Equal    ${input}    ${date}
    Close Browser

TC3: Verify calendar - Check previous btn of date picker
    Open The Browser
    Enter page    ${CALENDAR_BTN}    ${CALENDAR_URL}
    ${result}=    Get the current date
    # current date: 2024-04-14
    ${current_month}=    Set Variable    ${result}[1]
    ${current_year}=    Set Variable    ${result}[0]
    # Input date from picker
    Click Element    xpath=${DATE_INPUT}
    Wait Until Element Is Visible    ${DATE_PICKER}
    # select 2024-04-20
    Click Element    xpath=//*[@id="ui-datepicker-div"]//a[@data-date='20']
    # click outside the input field
    Click Element    xpath=${RANDOM_BLANK_AREA}
    # click next btn
    Click Element    //*[@id="ui-datepicker-div"]/div/a[1]
    # select 2024-03-20
    Click Element    xpath=//*[@id="ui-datepicker-div"]//a[@data-date='20']
    # click outside the input field
    Click Element    xpath=${RANDOM_BLANK_AREA}
    Click Element    xpath=${SUBMIT_BTN}
    # Verify date is inputted
    Wait Until Element Is Visible    ${RES_TEXT}
    Page Should Contain Element    ${RES_TEXT}
    Page Should Contain Element    ${RES_INPUT}
    ${text}=    Get Text    ${RES_TEXT}
    ${input}=    Get Text    ${RES_INPUT}
    Should Be Equal    ${text}    Your message has been sent
    ${month}=    Convert To Integer    ${current_month}
    ${month}=    Evaluate    ${month} - 1
    ${month}=    Evaluate    str($month).zfill(2)
    ${date}=    Evaluate    '${current_year}-${month}-20'
    Log To Console    date: ${date}
    Should Be Equal    ${input}    ${date}
    Close Browser

TC4: Verify calendar - No input date
    Open The Browser
    Enter page    ${CALENDAR_BTN}    ${CALENDAR_URL}
    # submit
    Click Element    xpath=${SUBMIT_BTN}
    # Verify date is inputted
    Wait Until Element Is Visible    ${RES_TEXT}
    Page Should Contain Element    ${RES_TEXT}
    Page Should Contain Element    ${RES_INPUT}
    ${text}=    Get Text    ${RES_TEXT}
    ${input}=    Get Text    ${RES_INPUT}
    Should Be Equal    ${text}    Your message has been sent
    Should Be Equal    ${input}    ${EMPTY}
    Close Browser

TC5: Verify calendar - Input date from input field
    Open The Browser
    Enter page    ${CALENDAR_BTN}    ${CALENDAR_URL}
    # Input date from picker
    Click Element    xpath=${DATE_INPUT}
    Wait Until Element Is Visible    ${DATE_PICKER}
    # select 2024-04-20
    Input Text    xpath=${DATE_INPUT}    2024-04-20
    # click outside the input field
    Click Element    xpath=${RANDOM_BLANK_AREA}
    # submit
    Click Element    xpath=${SUBMIT_BTN}
    # Verify date is inputted
    Wait Until Element Is Visible    ${RES_TEXT}
    Page Should Contain Element    ${RES_TEXT}
    Page Should Contain Element    ${RES_INPUT}
    ${text}=    Get Text    ${RES_TEXT}
    ${input}=    Get Text    ${RES_INPUT}
    Should Be Equal    ${text}    Your message has been sent
    Should Be Equal    ${input}    2024-04-20
    Close Browser

*** Keywords ***
Open The Browser
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window

Enter page
    [Arguments]    ${xpath}    ${url}
    ${btn}=    Get Webelement    xpath=${xpath}
    Page Should Contain Element    ${btn}
    Scroll Element Into View    ${btn}
    Click Element    ${btn}
    Wait Until Keyword Succeeds    10s    2s    Location Should Be    url=${url}

Get the current date
    ${date}=    Get Current Date
    Log To Console    ${date}
    ${parsed_date}=    Evaluate    datetime.datetime.strptime($date, '%Y-%m-%d %H:%M:%S.%f')
    ${year}=    Evaluate    $parsed_date.year
    ${month}=    Evaluate    str($parsed_date.month).zfill(2)
    ${day}=    Evaluate    str($parsed_date.day).zfill(2)
    Log To Console    Year: ${year}, Month: ${month}, Day: ${day}
    ${res}=    Create List    ${year}    ${month}    ${day}
    RETURN    ${res}
