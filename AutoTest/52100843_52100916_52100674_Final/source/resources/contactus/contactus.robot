*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../../resources/common.robot

*** Variables ***
${ContactUsFrm}    //*[@id="ContactUsFrm"]/div[2]/div[2]/button
${name_valid}     Cindy
${email_valid}    Cindy@gmail.com
${enquiry_valid}    noi dung phan anh
${name_input}     //*[@id="ContactUsFrm_first_name"]
${email_input}    //*[@id="ContactUsFrm_email"]
${enquiry_input}    //*[@id="ContactUsFrm_enquiry"]

*** Keywords ***
Contact site map and contact us footer
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[5]/a
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[6]/a
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div[1]

Check site map and verify
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[6]
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/h1/span[1]
    ${head1}=    Get Text    xpath=/html/body/div/div[2]/div/div/div/div/div/div/div[1]/ul/li[1]/a
    Click Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div/div[1]/ul/li[1]/a
    ${head1_value}=    Get Text    xpath=/html/body/div/div[1]/div[2]/section/ul/li[2]/a
    Should Be Equal As Strings    ${head1}    ${head1_value}
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[6]
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/h1/span[1]
    ${head1}=    Get Text    xpath=/html/body/div/div[2]/div/div/div/div/div/div/div[1]/ul/li[2]/a
    Click Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div/div[1]/ul/li[2]/a
    ${head1_value}=    Get Text    xpath=/html/body/div/div[1]/div[2]/section/ul/li[2]/a
    Should Be Equal As Strings    ${head1}    ${head1_value}

Verify contact us when empty input
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[5]/a
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    ${ContactUsFrm}
    Wait Until Element Is Enabled    ${ContactUsFrm}
    ${text1}=    Get Text    xpath=//*[@id="field_11"]/span/div[2]
    Should Be Equal As Strings    ${text1}    First name: is required field! Name must be between 3 and 32 characters!
    ${text2}=    Get Text    xpath=//*[@id="field_12"]/span/div[2]
    Should Be Equal As Strings    ${text2}    Email: is required field! E-Mail Address does not appear to be valid!
    ${text3}=    Get Text    xpath=//*[@id="field_13"]/span/div[2]
    Should Be Equal As Strings    ${text3}    Enquiry: is required field! Enquiry must be between 10 and 3000 characters!

Verify contact us when true input
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[5]/a
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    ${name_input}    ${name_valid}
    Input Text    ${email_input}    ${email_valid}
    Input Text    ${enquiry_input}    ${enquiry_valid}
    Click Element    ${ContactUsFrm}
    ${text1}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/section/p[2]
    Should Be Equal As Strings    ${text1}    Your enquiry has been successfully sent to the store owner!

Verify contact us when name input below 3 character and another true
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[5]/a
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    ${name_input}    Ci
    Input Text    ${email_input}    ${email_valid}
    Input Text    ${enquiry_input}    ${enquiry_valid}
    Click Element    ${ContactUsFrm}
    ${text1}=    Get Text    xpath=//*[@id="field_11"]/span/div[2]
    Should Be Equal As Strings    ${text1}    Name must be between 3 and 32 characters!

Verify contact us when name input than 32 character and another true
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[5]/a
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    ${name_input}    Verify name not too long 32 character and not has number and not has ! character
    Input Text    ${email_input}    ${email_valid}
    Input Text    ${enquiry_input}    ${enquiry_valid}
    Click Element    ${ContactUsFrm}
    ${text1}=    Get Text    xpath=//*[@id="field_11"]/span/div[2]
    Should Be Equal As Strings    ${text1}    Name must be between 3 and 32 characters!

Verify contact us when email input wrong format
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[5]/a
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    ${name_input}    ${name_valid}
    Input Text    ${email_input}    Cindy.gmail.com
    Input Text    ${enquiry_input}    ${enquiry_valid}
    Click Element    ${ContactUsFrm}
    ${text1}=    Get Text    xpath=//*[@id="field_12"]/span/div[2]
    Should Be Equal As Strings    ${text1}    E-Mail Address does not appear to be valid!

Verify contact us when enquiry input below 10 character and another true
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[5]/a
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    ${name_input}    ${name_valid}
    Input Text    ${email_input}    ${email_valid}
    Input Text    ${enquiry_input}    Test
    Click Element    ${ContactUsFrm}
    ${text1}=    Get Text    xpath=//*[@id="field_13"]/span/div[2]
    Should Be Equal As Strings    ${text1}    Enquiry must be between 10 and 3000 characters!

Generate Long Enquiry
    ${enquiry}=    Set Variable    ${EMPTY}
    FOR    ${i}    IN RANGE    3001
        ${enquiry}=    Set Variable    ${enquiry}${i}
    END
    [Return]    ${enquiry}

Verify contact us when enquiry input than 3000 character and another true
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=/html/body/div/div[4]/footer/section[2]/div/div[1]/div/ul/li[5]/a
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div/div/div[1]
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)
    Input Text    ${name_input}    ${name_valid}
    Input Text    ${email_input}    ${email_valid}
    ${long_enquiry}=    Generate Long Enquiry
    Input Text    ${enquiry_input}    ${long_enquiry}
    Click Element    ${ContactUsFrm}
    ${text1}=    Get Text    xpath=//*[@id="field_13"]/span/div[2]
    Should Be Equal As Strings    ${text1}    Enquiry must be between 10 and 3000 characters!


