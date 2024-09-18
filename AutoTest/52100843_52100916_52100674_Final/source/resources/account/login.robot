*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../../resources/common.robot
Resource         ../../variables/login_page.robot

*** Variables ***


*** Keywords ***
Login successfully with registered account
    [Arguments]    ${username}    ${password}
    Input Text    ${input_login_name}    ${username}
    Input Text    ${input_password}    ${password}
    Click Element    ${btn_submit_login}
    Wait Until Keyword Succeeds    10s    1s    Location Should Be    ${LOGIN_SUCCESS_URL}

    Element Should Contain    ${nav_user_name}    Welcome back

Login fail with invalid credentials
    [Arguments]    ${username}    ${password}
    Input Text    ${input_login_name}    ${username}
    Input Text    ${input_password}    ${password}
    Click Element    ${btn_submit_login}
    
    Location Should Be    ${REGISTER_LOGIN_PAGE}
    
    Page Should Contain Element    ${login_error_msg}
    Element Should Contain    ${login_error_msg}    Error: Incorrect login or password provided.

Logout successfully
    Mouse Over    ${nav_user_name}
    Page Should Contain Element    ${dropdown_menu}
    # check ${nav_user_name} contain class name open 
    ${class_name} =    Get Element Attribute    ${nav_user_name}    class
    Log To Console    ${class_name}
    Should Contain    ${class_name}    open
    Click Element    ${btn_logout}

    Wait Until Keyword Succeeds    10s    1s    Location Should Be    ${LOGOUT_SUCCESS_URL}
    Page Should Contain    Account Logout




