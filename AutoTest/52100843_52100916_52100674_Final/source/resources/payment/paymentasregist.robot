*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Library           XML
Library           Telnet

*** Variables ***
${continue_btn}    //*[@id="accountFrm"]/fieldset/button
${regist_select}    xpath=/html/body/div[1]/div[2]/div/div/div/div/div[1]/div/form/fieldset/div[1]/label
${guest_select}    xpath=/html/body/div[1]/div[2]/div/div/div/div/div[1]/div/form/fieldset/div[2]/label
${login_btn}      xpath=/html/body/div[1]/div[2]/div/div/div/div/div[2]/div/form/fieldset/button
${name_input}     //*[@id="AccountFrm_firstname"]
${lname_input}    //*[@id="AccountFrm_lastname"]
${email_input}    //*[@id="AccountFrm_email"]
${phone_input}    //*[@id="AccountFrm_telephone"]
${fax_input}      //*[@id="AccountFrm_fax"]
${company_input}    //*[@id="AccountFrm_company"]
${address1_input}    //*[@id="AccountFrm_address_1"]
${address2_input}    //*[@id="AccountFrm_address_2"]
${city_input}     //*[@id="AccountFrm_city"]
${region_input}    //*[@id="AccountFrm_zone_id"]
${codepost_input}    //*[@id="AccountFrm_postcode"]
${country_input}    //*[@id="AccountFrm_country_id"]
${loginname}      //*[@id="AccountFrm_loginname"]
${loginpass}      //*[@id="AccountFrm_password"]
${loginpasscf}    //*[@id="AccountFrm_confirm"]
${loginname_valid}    admincu
${loginpass_valid}    admincu
${loginpasscf_valid}    admincu
${agree_button}    //*[@id="AccountFrm_agree"]
${edit_ship}      //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[1]/tbody/tr/td[4]/a
${edit_payment}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[1]
${edit_coupon}    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[2]/tbody/tr/td[4]/a[2]
${edit_cart}      //*[@id="maincontainer"]/div/div[1]/div/div[2]/h4[3]/a
${confirm_order}    //*[@id="checkout_btn"]
${back_btn}       //*[@id="back"]
${total_item}     //*[@id="maincontainer"]/div/div[2]/div[1]/table[2]/tbody/tr[1]/td[2]/span
${totalprice}     //*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[2]/span
${totalprice1}    //*[@id="maincontainer"]/div/div[2]/div[1]/table[2]/tbody/tr[3]/td[2]/span
${message_order_success}    //*[@id="maincontainer"]/div/div/div/div
${order_success}    /html/body/div[1]/div[1]/div[2]/section
${invoice}        //*[@id="maincontainer"]/div/div/div/div/section/p[3]/a
${store_owner}    //*[@id="maincontainer"]/div/div/div/div/section/p[4]/a
${continue_afterorder}    //*[@id="maincontainer"]/div/div/div/div/section/a
${details}        //*[@id="maincontainer"]/div/div/div/h1
${order_history}    //*[@id="maincontainer"]/div/div/div/div/div[3]
${id_order}       //*[@id="maincontainer"]/div/div/div/div/div[1]/table/tbody/tr/td[1]/br[1]
${day_order}      //*[@id="maincontainer"]/div/div/div/div/div[3]/table/tbody/tr[2]/td[1]
${checkouthome_btn}    //*[@id="main_menu_top"]/li[4]
${cart_empty}     //*[@id="maincontainer"]/div/div
${payment_content}    //*[@id="maincontainer"]/div
${name_valid}     Coso1
${email_valid}    tdtu123@gmail.com
${enquiry_valid}    noi dung phan anh
${invalidname_valid}    Ci
${phone_number}    0353472138
${address}        DaiHocTonDucThang
${city}           19 Nguyen Huu Tho
${code}           TDTU123
${nameguest}      Coso2
${phoneguest_number}    0353472138
${addressguest}    DaiHocTonDucThang coso2
${cityguest}      Nha Trang
${codeguest}      TDTU123

*** Keywords ***
Generate Long Enquiry
    ${enquiry}=    Set Variable    ${EMPTY}
    FOR    ${i}    IN RANGE    33
        ${enquiry}=    Set Variable    ${enquiry}${i}
    END
    [Return]    ${enquiry}

Generate Long Enquiry1
    ${enquiry}=    Set Variable    ${EMPTY}
    FOR    ${i}    IN RANGE    130
        ${enquiry}=    Set Variable    ${enquiry}${i}
    END
    [Return]    ${enquiry}

Payment when choose regist account
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}

Payment regist and submit empty
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${item_price}    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[2]/div
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Click Element    ${checkouthome_btn}
    Page Should Contain Element    ${payment_content}
    Click Element    ${regist_select}
    Click Element    ${continue_btn}
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Payment regist and submit name than 32 characters
    ${long_enquiry}=    Generate Long Enquiry
    Input Text    ${name_input}    ${long_enquiry}
    Input Text    ${lname_input}    ${long_enquiry}
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Payment regist and submit email invalid
    Input Text    ${email_input}    Cindy.gmail.com
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Payment regist and submit address below 3 characters
    Input Text    ${address1_input}    Ci
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Payment regist and submit address than 128 characters
    ${long_enquiry}=    Generate Long Enquiry1
    Input Text    ${address1_input}    ${long_enquiry}
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Payment regist and submit zipcode below 3 characters
    Input Text    ${codepost_input}    Ci
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Payment regist and submit login name below 5 characters
    Input Text    ${loginname}    TDTU
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Payment regist and submit login name than 64 characters
    ${long_enquiry}=    Generate Long Enquiry1
    Input Text    ${loginname}    ${long_enquiry}
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Payment regist and submit password below 4 characters
    Input Text    ${loginpass}    TDT
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Success regist account
    Input Text    ${name_input}    ${name_valid}
    Input Text    ${lname_input}    ${nameguest}
    Input Text    ${email_input}    ${email_valid}
    Input Text    ${phone_input}    ${phone_number}
    Input Text    ${address1_input}    ${address}
    Input Text    ${city_input}    ${city}
    Input Text    ${codepost_input}    ${code}
    Select From List By Value    ${country_input}    230
    Sleep    2s
    Select From List By Value    ${region_input}    3780
    Input Text    ${loginname}    ${loginname_valid}
    Input Text    ${loginpass}    ${loginpass_valid}
    Input Text    ${loginpasscf}    ${loginpasscf_valid}
    Click Element    ${agree_button}
    ${name_before}    Get Text    ${name_input}
    ${lname_before}    Get Text    ${lname_input}
    ${email_before}    Get Text    ${email_input}
    ${phone_before}    Get Text    ${phone_input}
    ${address_before}    Get Text    ${address1_input}
    ${city_before}    Get Text    ${city_input}
    ${country_before}    Get Text    ${country_input}
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    10s
    Page Should Contain Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1]
    Sleep    10s
    Click Element    //*[@id="checkout_btn"]
    Page Should Contain Element    //*[@id="maincontainer"]/div

Payment regist and submit zipcode than 10 characters
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${item_price}    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[2]/div
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Click Element    ${checkouthome_btn}
    Page Should Contain Element    ${payment_content}
    Click Element    ${regist_select}
    Click Element    ${continue_btn}
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    ${long_enquiry}=    Generate Long Enquiry
    Input Text    ${codepost_input}    ${long_enquiry}
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!

Payment regist and submit password than 20 characters
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${item_price}    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[2]/div
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Click Element    ${checkouthome_btn}
    Page Should Contain Element    ${payment_content}
    Click Element    ${regist_select}
    Click Element    ${continue_btn}
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    ${long_enquiry}=    Generate Long Enquiry
    Input Text    ${loginpass}    ${long_enquiry}
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    ${name_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${namelogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${passlogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    ${passcflogin_err}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    Should Be Equal As Strings    ${name_err}    First Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be between 1 and 32 characters!
    Should Be Equal As Strings    ${email_err}    Email Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be between 3 and 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be between 3 and 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal As Strings    ${namelogin_err}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal As Strings    ${passlogin_err}    Password must be between 4 and 20 characters!
