*** Settings ***
Documentation     Module - account/login 
Library           SeleniumLibrary
Resource          ../../resources/common.robot
Resource          ../../resources/account/login.robot
Test Setup        Opening my browser
Test Teardown     Closing my browser

*** Variables ***
# Registered account 
# Anne Pattrick, annepattrick@gmail.com, 123 Main Street, Ho Chi Minh, Ho Chi Minh City, Viet Nam, annepattrick, 123456
${valid_login_name_1}=    annepattrick
${valid_login_password_1}=    123456

${invalid_login_name}=    invalidloginname
${invalid_login_password}=    invalidpassword

*** Test Cases ***
TC1 - Login with valid credentials
    [Documentation]    Login with valid credentials
    [Tags]    login
    Login sucessfully 

TC2 - Login fail (invalid login name)
    [Documentation]    Login fail (invalid login name)
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${invalid_login_name}    ${valid_login_password_1}
    
TC3 - Login fail (invalid password)
    [Documentation]    Login fail (invalid password)
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${valid_login_name_1}    ${invalid_login_password}

TC4 - Login fail (invalid login name and password)
    [Documentation]    Login fail (invalid login name and password)
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${invalid_login_name}    ${invalid_login_password}

TC5 - Login fail (empty login name)
    [Documentation]    Login fail (empty login name)
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${EMPTY}    ${valid_login_password_1}

TC6 - Login fail (empty password)
    [Documentation]    Login fail (empty password)
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${valid_login_name_1}    ${EMPTY}

TC7 - Login fail (empty login name and password)
    [Documentation]    Login fail (empty login name and password)
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${EMPTY}    ${EMPTY}

TC8 - Login fail (invalid login name and empty password)
    [Documentation]    Login fail (invalid login name and empty password)
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${invalid_login_name}    ${EMPTY}

TC9 - Login fail (empty login name and invalid password)
    [Documentation]    Login fail (empty login name and invalid password)
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${EMPTY}    ${invalid_login_password}

TC10 - Login fail (invalid login name) then login successfully
    [Documentation]    Login fail then login successfully
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${invalid_login_name}    ${valid_login_password_1}

    Login successfully with registered account    ${valid_login_name_1}    ${valid_login_password_1}

TC11 - Login fail (invalid password) then login successfully
    [Documentation]    Login fail then login successfully
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${valid_login_name_1}    ${invalid_login_password}

    Login successfully with registered account    ${valid_login_name_1}    ${valid_login_password_1}

TC12 - Login fail (invalid login name and password) then login successfully
    [Documentation]    Login fail then login successfully
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${invalid_login_name}    ${invalid_login_password}

    Login successfully with registered account    ${valid_login_name_1}    ${valid_login_password_1}

TC13 - Login fail (empty login name) then login successfully
    [Documentation]    Login fail then login successfully
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${EMPTY}    ${valid_login_password_1}

    Login successfully with registered account    ${valid_login_name_1}    ${valid_login_password_1}

TC14 - Login fail (empty password) then login successfully
    [Documentation]    Login fail then login successfully
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${valid_login_name_1}    ${EMPTY}

    Login successfully with registered account    ${valid_login_name_1}    ${valid_login_password_1}

TC15 - Login fail (empty login name and password) then login successfully
    [Documentation]    Login fail then login successfully
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login fail with invalid credentials    ${EMPTY}    ${EMPTY}

    Login successfully with registered account    ${valid_login_name_1}    ${valid_login_password_1}

TC16 - Try login after login successfully
    [Documentation]    Try login after login successfully
    [Tags]    login
    Login sucessfully
    Go To    ${REGISTER_LOGIN_PAGE}
    Wait Until Keyword Succeeds    10s    1s    Location Should Be    ${LOGIN_SUCCESS_URL} 

TC17 - Logout after login successfully
    [Documentation]    Logout after login successfully
    [Tags]    login
    Login sucessfully
    Logout successfully

TC18 - Logout fail (not login yet)
    [Documentation]    Logout fail (not login yet)
    [Tags]    login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Page Should Not Contain Element    ${dropdown_menu}
    Page Should Not Contain Element    ${btn_logout}
    

*** Keywords ***
Login sucessfully
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login successfully with registered account    ${valid_login_name_1}    ${valid_login_password_1}

