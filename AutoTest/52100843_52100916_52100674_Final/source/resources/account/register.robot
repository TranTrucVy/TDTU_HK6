*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../../resources/common.robot
Resource         ../../variables/register_page.robot

*** Variables ***
# Default address :  123 Main Street, 345 Second Street, 230, 3780, Ho Chi Minh, Viet Nam, SW1A 1AA
# Default name : Beth Doe
# Default email : bethdoe_shopper + number + @gmail.com
# Default login name : bethdoe_shopper + number
# Default password : password123

*** Keywords ***
Choose register option & enter form
    Page Should Contain Element    ${REGISTER_BTN} 
    Click Button    ${REGISTER_BTN}

    Wait Until Keyword Succeeds    10s    2s    Location Should Be    ${REGISTER_URL}
    
Register success - full information 
    # data list 
    ${data}=    Create List    Beth    Doe    bethdoe_shopper1@gmail.com    1234567890    1234567890    ABC Company    123 Main Street    345 Second Street    230    3780    Ho Chi Minh    SW1A 1AA    bethdoe_shopper1    password123    password123
    Fill input to register form    ${data}

    Scroll Element Into View    ${checkbox_newsletter_yes}
    Click Button    ${checkbox_newsletter_no}
    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit 
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    Wait Until Keyword Succeeds    10s    2s    Location Should Be    ${REGISTER_SUCCESS_URL}

    Page Should Contain     Your Account Has Been Created!

Register with empty information
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}

Register with invalid email format
    # data list 
    ${data}=    Create List    Beth    Doe    bethdoe_shopper2    1234567890    1234567890    ABC Company    123 Main Street    345 Second Street    230    3780    Ho Chi Minh    SW1A 1AA    bethdoe_shopper2    password123    password123
    Fill input to register form    ${data}

    Scroll Element Into View    ${checkbox_newsletter_yes}
    Click Button    ${checkbox_newsletter_no}
    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit 
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}
    
    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}
    # lowercase
    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    email address does not appear to be valid

    Should Contain    ${error_message_text}    ${msg}

Register with invalid confirm password
    # data list 
    ${data}=    Create List    Beth    Doe    bethdoe_shopper3@gmail.com    1234567890    1234567890    ABC Company    123 Main Street    345 Second Street    230    3780    Ho Chi Minh    SW1A 1AA    bethdoe_shopper3    password123    password1234

    Fill input to register form    ${data}
    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    Sleep    5s
    ${error_message_text}=    Get Text    ${error_message}
    # lowercase
    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    Password confirmation does not match password!

    Should Contain    ${error_message_text}    ${msg}
    # Should Contain    ${error_message_text}    Password confirmation does not match password!

Register successfully - required information only
    # data list 
    ${data}=    Create List    Beth    Doe    bethdoe_shopper4@gmail.com    ${EMPTY}    ${EMPTY}    ABC Company    123 Main Street    ${EMPTY}    230    3780    Ho Chi Minh    SW1A 1AA    bethdoe_shopper4    password123    password123
    
    Fill input to register form    ${data}

    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    Wait Until Keyword Succeeds    10s    2s    Location Should Be    ${REGISTER_SUCCESS_URL}

    Page Should Contain     Your Account Has Been Created!
    
Register with invalid password
    [Arguments]    ${password}
    # data list
    ${data}=    Create List    Beth    Doe    bethdoe_shopper5@gmail.com    1234567890    1234567890    ABC Company    123 Main Street    345 Second Street    230    3780    Ho Chi Minh    SW1A 1AA    bethdoe_shopper5    ${password}    ${password}

    Fill input to register form    ${data}

    Scroll Element Into View    ${checkbox_newsletter_yes}
    Click Button    ${checkbox_newsletter_no}
    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}
    # Should Contain    ${error_message_text}    Password must be between 4 and 20 characters!

    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    Password must be between 4 and 20 characters!

    Should Contain    ${error_message_text}    ${msg}

Register with invalid first name
    [Arguments]    ${first_name}
    # data list
    ${data}=    Create List    ${first_name}    Doe    bethdoe_shopper6@gmail.com    ${EMPTY}    ${EMPTY}    ABC Company    123 Main Street    ${EMPTY}    230    3780    Ho Chi Minh    SW1A 1AA    bethdoe_shopper6    password123    password123

    Fill input to register form    ${data}
    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}
    # Should Contain    ${error_message_text}    First Name must be between 1 and 32 characters!

    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    First Name must be between 1 and 32 characters!

    Should Contain    ${error_message_text}    ${msg}

Register with invalid last name
    [Arguments]    ${last_name}
    # data list
    ${data}=    Create List    Beth    ${last_name}    bethdoe_shopper7@gmail.com    ${EMPTY}    ${EMPTY}    ABC Company    123 Main Street    ${EMPTY}    230    3780    Ho Chi Minh    SW1A 1AA    bethdoe_shopper7    password123    password123

    Fill input to register form    ${data}
    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}
    # Should Contain    ${error_message_text}    Last Name must be between 1 and 32 characters!  

    # lowercase
    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    Last Name must be between 1 and 32 characters!

    Should Contain    ${error_message_text}    ${msg}


# Login name must be alphanumeric only and between 5 and 64 characters!
Register with invalid login name
    [Arguments]    ${login_name}
    # data list
    ${data}=    Create List    Beth    Doe    bethdoe_shopper8@gmail.com    1234567890    1234567890    ABC Company    123 Main Street    345 Second Street    230    3780    Ho Chi Minh    SW1A 1AA    ${login_name}    password123    password123    
     
    Fill input to register form    ${data}
    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}
    # lowercase 
    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    Login name must be alphanumeric only and between 5 and 64 characters!

    Should Contain    ${error_message_text}    ${msg}

Register with not fill required information
    [Arguments]    ${field_name}
    
    # Require fields: 
    # First Name, Last Name, Email, Address 1, City, Postcode, Country, Region, Login Name, Password, Confirm Password

    # fill all data except ${field_name}
    ${data_format}=    Create List    first name    last name    email    phone    fax    company    address1    address2    country    region    city    postcode    login name    password    confirm password

    ${data}=    Create List    Beth    Doe    bethdoe_shopper9@gmail.com    1234567890    1234567890    ABC Company    123 Main Street    345 Second Street    230    3780    Ho Chi Minh    SW1A 1AA    bethdoe_shopper9    password123    password123

    # remove ${field_name} from data list
    ${field_name}=    Convert To Lower Case    ${field_name}
    ${index}=    Get Index From List    ${data_format}    ${field_name}
    Log To Console    index: ${index}
    # set value to empty
    Set List Value    ${data}    ${index}   ${EMPTY}
    Log To Console    data: ${data}

    Fill input to register form    ${data}
    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}
    # lowercase
    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    Log To Console    error message: ${error_message_text}

    # Login name must be alphanumeric only and between 5 and 64 characters!
    # First Name must be between 1 and 32 characters!
    # Last Name must be between 1 and 32 characters!
    # Email Address does not appear to be valid!
    # Address 1 must be between 3 and 128 characters!
    # City must be between 3 and 128 characters!
    # Zip/postal code must be between 3 and 10 characters!
    # Please select a region / state!
    # Password must be between 4 and 20 characters!

    IF    $field_name == "first name"
        ${msg}=    Convert To Lower Case    First Name must be between 1 and 32 characters!
    ELSE IF    $field_name == "last name"
        ${msg}=    Convert To Lower Case    Last Name must be between 1 and 32 characters!
    ELSE IF    $field_name == "email"
        ${msg}=    Convert To Lower Case    Email Address does not appear to be valid!
    ELSE IF    $field_name == "address1"
        ${msg}=    Convert To Lower Case    Address 1 must be between 3 and 128 characters!
    ELSE IF    $field_name == "city"
        ${msg}=    Convert To Lower Case    City must be between 3 and 128 characters!
    ELSE IF    $field_name == "postcode"
        ${msg}=    Convert To Lower Case    Zip/postal code must be between 3 and 10 characters!
    ELSE IF    $field_name == "country"
        ${msg}=    Convert To Lower Case    Please select a country!
    ELSE IF    $field_name == "region"
        ${msg}=    Convert To Lower Case    Please select a region / state!
    ELSE IF    $field_name == "login name"
        ${msg}=    Convert To Lower Case    Login name must be alphanumeric only and between 5 and 64 characters!
    ELSE IF    $field_name == "password"
        ${msg}=    Convert To Lower Case    Password must be between 4 and 20 characters!
    ELSE IF    $field_name == "confirm password"
        ${msg}=    Convert To Lower Case    Password confirmation does not match password!
    END 
    Should Contain    ${error_message_text}    ${msg}

Register with not fill required information - policy
    # data list 
    ${data}=    Create List    Beth    Doe    bethdoe_shopper10@gmail.com    ${EMPTY}    ${EMPTY}    ABC Company    123 Main Street    ${EMPTY}    230    3780    Ho Chi Minh    SW1A 1AA    bethdoe_shopper10    password123    password123
    
    Fill input to register form    ${data}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}
    # lowercase
    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    You must agree to the Privacy Policy!

Register with existed email
    [Arguments]    ${email}    ${login_name}
    # data list 
    ${data}=    Create List    Beth    Doe    ${email}    1234567890    1234567890    ABC Company    123 Main Street    345 Second Street    230    3780    Ho Chi Minh    SW1A 1AA    ${login_name}    password123    password123

    Fill input to register form    ${data}

    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}
    # lowercase
    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    e-mail address is already registered

    Should Contain    ${error_message_text}    ${msg}

Register with existed login name
    [Arguments]    ${email}    ${login_name}
    # data list 
    ${data}=    Create List    Beth    Doe    ${email}    1234567890    1234567890    ABC Company    123 Main Street    345 Second Street    230    3780    Ho Chi Minh    SW1A 1AA    ${login_name}    password123    password123

    Fill input to register form    ${data}

    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}
    # lowercase
    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    This login name is not available. Try different login name!

    Should Contain    ${error_message_text}    ${msg}

Register with existed email and login name
    [Arguments]    ${email}    ${login_name}
    # data list 
    ${data}=    Create List    Beth    Doe    ${email}    1234567890    1234567890    ABC Company    123 Main Street    345 Second Street    230    3780    Ho Chi Minh    SW1A 1AA    ${login_name}    password123    password123

    Fill input to register form    ${data}

    Scroll Element Into View    ${checkbox_agree_policy}
    Click Button    ${checkbox_agree_policy}

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    # check error message
    Wait Until Element Is Visible    ${error_message}
    Page Should Contain Element    ${error_message}
    ${error_message_text}=    Get Text    ${error_message}

    # lowercase
    ${error_message_text}=    Convert To Lower Case    ${error_message_text}
    ${msg}=    Convert To Lower Case    E-Mail Address is already registered!

    Should Contain    ${error_message_text}    ${msg}

Fix email then register successfully
    [Arguments]    ${email}
    # input password and confirm password must empty 

    ${pw_value}=    Get Text    ${input_password}
    ${cpw_value}=    Get Text    ${input_confirm_password}
    Should Be Empty    ${pw_value}
    Should Be Empty    ${cpw_value}

    # change email 
    Scroll Element Into View    ${input_email}
    Input Text    ${input_email}    ${email}
    # fill password and confirm password
    Scroll Element Into View    ${input_password}
    Input Text    ${input_password}    password123
    Scroll Element Into View    ${input_confirm_password}
    Input Text    ${input_confirm_password}    password123

    # submit
    Scroll Element Into View    ${btn_register_submit}
    Click Button    ${btn_register_submit}

    Wait Until Keyword Succeeds    10s    2s    Location Should Be    ${REGISTER_SUCCESS_URL}

    Page Should Contain     Your Account Has Been Created!



    

### Handle function ###
Fill input to register form 
    [Arguments]    ${data_list}
    [Documentation]    Fill the register form with the data list

    ${first_name}=    Get From List    ${data_list}    0
    ${last_name}=    Get From List    ${data_list}    1
    ${email}=    Get From List    ${data_list}    2
    ${phone}=    Get From List    ${data_list}    3
    ${fax}=    Get From List    ${data_list}    4
    ${company}=    Get From List    ${data_list}    5
    ${address1}=    Get From List    ${data_list}    6
    ${address2}=    Get From List    ${data_list}    7
    ${country}=    Get From List    ${data_list}    8
    ${region}=    Get From List    ${data_list}    9
    ${city}=    Get From List    ${data_list}    10
    ${postcode}=    Get From List    ${data_list}    11
    ${login_name}=    Get From List    ${data_list}    12
    ${password}=    Get From List    ${data_list}    13
    ${confirm_password}=    Get From List    ${data_list}    14

    # conver country, region to number 
    ${is_empty_region}=    Check if data empty    ${region}
    ${is_empty_country}=    Check if data empty    ${country}

    IF    $is_empty_country == "True"
        Log To Console    country is empty
        ${country}=    Set Variable    FALSE
    ELSE
        ${country}=    Convert To Integer    ${country}
    END

    IF    $is_empty_region == "True"
        Log To Console    region is empty
        ${region}=    Set Variable    FALSE
    ELSE
        ${region}=    Convert To Integer    ${region}
    END

    Log To Console    region: ${region}
    Log To Console    country: ${country}

    Scroll Element Into View    ${input_first_name}
    Input Text    ${input_first_name}    ${first_name}
    Scroll Element Into View    ${input_last_name}
    Input Text    ${input_last_name}    ${last_name}
    Scroll Element Into View    ${input_email}
    Input Text    ${input_email}    ${email}
    Scroll Element Into View    ${input_telephone}
    Input Text    ${input_telephone}    ${phone}
    Scroll Element Into View    ${input_fax}
    Input Text    ${input_fax}    ${fax}

    Scroll Element Into View    ${input_company}
    Input Text    ${input_company}    ${company}
    Scroll Element Into View    ${input_address_1}
    Input Text    ${input_address_1}    ${address1}
    Scroll Element Into View    ${input_address_2}
    Input Text    ${input_address_2}    ${address2}
    Scroll Element Into View    ${input_city}
    Input Text    ${input_city}    ${city}
    Scroll Element Into View    ${input_zip_code}
    Input Text    ${input_zip_code}    ${postcode}
    Scroll Element Into View    ${select_country}
    Select From List By Value    ${select_country}    ${country}
    # wait for region to load
    Scroll Element Into View    ${select_region}
    Wait Until Element Is Visible    ${select_region}
    Wait Until Element Is Enabled    ${select_region}

    IF    $is_empty_country == "False"
        Wait Until Keyword Succeeds    10s    2s    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]/option[@value='3780']

        Select From List By Value    ${select_region}    ${region}
    END

    Scroll Element Into View    ${input_login_name}
    Input Text    ${input_login_name}    ${login_name}
    Scroll Element Into View    ${input_password}
    Input Text    ${input_password}    ${password}
    Scroll Element Into View    ${input_confirm_password}
    Input Text    ${input_confirm_password}    ${confirm_password}

Check if data empty 
    [Arguments]    ${data}
    ${res}=    Set Variable    False

    IF    $data == ''
        ${res}=    Set Variable    True
    ELSE IF    $data == ""
        ${res}=    Set Variable    True
    END
    Log To Console    res: ${res}

    RETURN    ${res}



    