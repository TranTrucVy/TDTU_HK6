*** Settings ***
Documentation     Module - account/register
Library           SeleniumLibrary
Resource          ../../resources/common.robot
Resource          ../../resources/account/register.robot
Test Setup        Opening my browser
Test Teardown     Closing my browser

*** Variables ***
### Login ###
${ABNORMAL_LOGIN_NAME}    shopper3@
${SHOR_LOGIN_NAME}    shop
${LONG_LOGIN_NAME}    shopper_longloginname123456789012345678901234567890123456789012345678901234567890
${INVALID_LONG_NAME}    123456789012345678901234567890123

${new_email}    tommy_shopper_100@gmail.com

### Password ### 
${SHORT_PASSWORD}    123
${LONG_PASSWORD}    123456789012345678901

*** Test Cases ***
TC1 - Register successfully - full information
    [Documentation]    Register successfully 
    [Tags]    Register
    Register successfully

TC2 - Register successfully - required information only 
    [Documentation]    Register successfully 
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register successfully - required information only

TC3 - Register invalid (empty information)
    [Documentation]    Register with empty information 
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with empty information

# First Name must be between 1 and 32 characters!
# Last Name must be between 1 and 32 characters!
TC4 - Register invalid (first name more than 32 characters)
    [Documentation]    Register with first name more than 32 characters
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with invalid first name    ${INVALID_LONG_NAME}

TC5 - Register invalid (last name more than 32 characters)
    [Documentation]    Register with last name more than 32 characters
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with invalid last name    ${INVALID_LONG_NAME}

TC6 - Register invalid (invalid email format)
    [Documentation]    Register with invalid email
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with invalid email format

# Login name must be alphanumeric only and between 5 and 64 characters!
TC7 - Register invalid (invalid login name contain a special character)
    [Documentation]    Register with invalid login name
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with invalid login name    ${ABNORMAL_LOGIN_NAME}

TC8 - Register invalid (invalid login name less than 5 characters)
    [Documentation]    Register with invalid login name
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with invalid login name    ${SHOR_LOGIN_NAME}

TC9 - Register invalid (invalid login name more than 64 characters)
    [Documentation]    Register with invalid login name
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with invalid login name    ${LONG_LOGIN_NAME}

TC10 - Register invalid (password less than 4 characters)
    [Documentation]    Register with invalid password
    ...    Password must be between 4 and 20 characters!
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with invalid password    ${SHORT_PASSWORD}

TC11 - Register invalid (password more than 20 characters)
    [Documentation]    Register with invalid password
    ...    Password must be between 4 and 20 characters!
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with invalid password    ${LONG_PASSWORD}

TC12 - Register invalid (confirm password not match)
    [Documentation]    Register with invalid confirm password
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with invalid confirm password

TC13 - Register invalid (not fill required first name)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    first name

TC14 - Register invalid (not fill required last name)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    last name

TC15 - Register invalid (not fill required email)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    email  

TC16 - Register invalid (not fill required address1)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    address1

TC17 - Register invalid (not fill required city)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    city

TC18 - Register invalid (not fill required region)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    region

TC19 - Register invalid (not fill required zip code)

    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    postcode

TC20 - Register invalid (not fill required country)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    country

TC21 - Register invalid (not fill required login name)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    login name

TC22 - Register invalid (not fill required password)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    password

TC23 - Register invalid (not fill required confirm password)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information    confirm password

TC24 - Register invalid (not fill required agree)
    [Documentation]    Register with not fill required information
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with not fill required information - policy

TC25 - Register invalid (existed email)
    [Documentation]    Register with existed email
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with existed email    shopper3@gmail.com    tommy_shopper111
    # E-Mail Address is already registered!
    # shopper3@gmail.com

TC26 - Register invalid (existed login name)
    [Documentation]    Register with existed login name
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with existed login name    tommy_shopper112@gmail.com    shopper3
    # Login name is already in use!
    # shopper3

TC27 - Register invalid (existed email and login name)
    [Documentation]    Register with existed email and login name
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with existed email and login name    shopper3@gmail.com    shopper3

TC28 - Register fail then sucess (existed email)
    [Documentation]    Register with existed email
    [Tags]    Register
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register with existed email    shopper3@gmail.com    tommy_shopper113
    Fix email then register successfully    ${new_email}
    # E-Mail Address is already registered!

*** Keywords ***
Register successfully 
    Enter page    ${REGISTER_LOGIN_PAGE}
    Choose register option & enter form
    Register success - full information





    