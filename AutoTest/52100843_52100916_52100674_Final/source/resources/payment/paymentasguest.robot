*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String

*** Variables ***
${valid_login_name_1}    annepattrick
${valid_login_password_1}    123456
${invalid_login_name}    invalidloginname
${invalid_login_password}    invalidpassword
${continue_btn}    //*[@id="accountFrm"]/fieldset/button
${regist_select}    xpath=/html/body/div[1]/div[2]/div/div/div/div/div[1]/div/form/fieldset/div[1]/label
${guest_select}    xpath=/html/body/div[1]/div[2]/div/div/div/div/div[1]/div/form/fieldset/div[2]/label
${login_btn}      xpath=/html/body/div[1]/div[2]/div/div/div/div/div[2]/div/form/fieldset/button
${name_input}     //*[@id="guestFrm_firstname"]
${lname_input}    //*[@id="guestFrm_lastname"]
${email_input}    //*[@id="guestFrm_email"]
${phone_input}    //*[@id="guestFrm_telephone"]
${fax_input}      //*[@id="guestFrm_fax"]
${company_input}    //*[@id="guestFrm_company"]
${address1_input}    //*[@id="guestFrm_address_1"]
${address2_input}    //*[@id="guestFrm_address_2"]
${city_input}     //*[@id="guestFrm_city"]
${region_input}    //*[@id="guestFrm_zone_id"]
${codepost_input}    //*[@id="guestFrm_postcode"]
${country_input}    //*[@id="guestFrm_country_id"]
${shipping_check}    //*[@id="guestFrm_shipping_indicator"]
${continue_checkguest}    //*[@id="guestFrm"]/div[4]/div/button
${nameguest_input}    //*[@id="guestFrm_shipping_firstname"]
${lnameguest_input}    //*[@id="guestFrm_shipping_lastname"]
${companyguest_input}    //*[@id="guestFrm_shipping_company"]
${address1guest_input}    //*[@id="guestFrm_shipping_address_1"]
${address2guest_input}    //*[@id="guestFrm_shipping_address_2"]
${cityguest_input}    //*[@id="guestFrm_shipping_city"]
${regionguest_input}    //*[@id="guestFrm_shipping_zone_id"]
${codepostguest_input}    //*[@id="guestFrm_shipping_postcode"]
${countryguest_input}    //*[@id="guestFrm_shipping_country_id"]
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
${cart_empty}    //*[@id="maincontainer"]/div/div
${payment_content}    //*[@id="maincontainer"]/div    
${name_valid}    Coso1
${lname_valid}    Coso1
${email_valid}    tdtu@gmail.com
${enquiry_valid}    noi dung phan anh
${invalidname_valid}    Ci
${phone_number}    0353472138
${address}    DaiHocTonDucThang
${city}    19 Nguyen Huu Tho
${code}    TDTU123
${nameguest}     Coso2
${lnameguest}     NTTDTU
${phoneguest_number}    0353472138
${addressguest}    DaiHocTonDucThang coso2
${cityguest}    Nha Trang
${codeguest}    TDTU123


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

Checkout when without adding products to the cart
    Click Element    ${checkouthome_btn}
    Page Should Contain Element    ${cart_empty}

Checkout when add products to the cart
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Page Should Contain Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[1]/a/i
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

Payment when choose guest select only
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}
Payment when choose guest select only and submit empty form
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Page Should Contain Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[1]/a/i
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price1}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price1}) - float(${price})
    ${item_price}    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[2]/div
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Click Element    ${checkouthome_btn}
    Page Should Contain Element    ${payment_content}
    Click Element    ${guest_select}
    Click Element    ${continue_btn}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
Payment when choose guest select only and submit name below 3 characters
    Input Text    ${name_input}    ${invalidname_valid}
    Input Text    ${lname_input}    ${invalidname_valid}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
Payment when choose guest select only and submit name than 32 characters
    ${long_enquiry}=    Generate Long Enquiry
    Input Text    ${name_input}    ${long_enquiry}
    Input Text    ${lname_input}    ${long_enquiry}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
Payment when choose guest select only and submit email invalid
    Input Text    ${email_input}    Cindy.gmail.com
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
Payment when choose guest select only and submit address than 128 characters
    ${long_enquiry}=    Generate Long Enquiry1
    Input Text    ${address1_input}    ${long_enquiry}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
Payment when choose guest select only and submit zipcode below 3 characters
    Input Text    ${codepost_input}    Ci
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
Payment when choose guest select only and submit zipcode than 10 characters
    ${long_enquiry}=    Generate Long Enquiry
    Input Text    ${codepost_input}    ${long_enquiry}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
Payment true only guest
    Input Text    ${name_input}    ${valid_login_name_1}
    Input Text    ${lname_input}    ${name_valid}
    Input Text    ${email_input}    ${email_valid}
    Input Text    ${phone_input}    ${phone_number}
    Input Text    ${address1_input}    ${address}
    Input Text    ${city_input}    ${city}
    Input Text    ${codepost_input}    ${code}
    Select From List By Value    //*[@id="guestFrm_country_id"]   230
    Sleep    2s
    Select From List By Value    //*[@id="guestFrm_zone_id"]    3780
    ${name_before}    Get Text    ${name_input}
    ${lname_before}    Get Text    ${lname_input}
    ${email_before}    Get Text    ${email_input}
    ${phone_before}    Get Text    ${phone_input}
    ${address_before}    Get Text    ${address1_input}
    ${city_before}    Get Text    ${city_input}
    ${country_before}    Get Text    //*[@id="guestFrm_country_id"]
    ${zone_before}    Get Text    //*[@id="guestFrm_zone_id"]
    ${total_before}    Get Text    //*[@id="maincontainer"]/div/div[2]/div[1]/table[2]/tbody/tr[2]/td[2]/span
    Click Element    ${continue_checkguest}
    Page Should Contain Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1]
    ${total_after}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[1]/td[2]/span
    Should Be Equal As Strings    ${total_before}    ${total_after}
    Click Element    ${confirm_order}
    
    Page Should Contain Element    //*[@id="maincontainer"]/div

Payment when choose guest select only and submit telephone empty
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Page Should Contain Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[1]/a/i
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
    Click Element    ${guest_select}
    Click Element    ${continue_btn}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Page Should Contain    Phone is require!

Payment when choose guest select only and submit telephone not a number 
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Page Should Contain Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[1]/a/i
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
    Click Element    ${guest_select}
    Click Element    ${continue_btn}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    ${long_enquiry}=    Generate Long Enquiry1
    Input Text    ${phone_input}    ${invalid_login_name}
    Click Element    ${continue_checkguest}
    Sleep    2s
    Page Should Contain    Phone is not a number
Payment when choose guest select 
    [Arguments]    ${access_method}
    Run Keyword    ${access_method}
Payment when choose guest select and submit empty form
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Page Should Contain Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[1]/a/i
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
    Click Element    ${guest_select}
    Click Element    ${continue_btn}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!

Payment when choose guest select and submit and click shipping
    Click Element    ${shipping_check}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    ${nameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${lnameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${addressguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${cityguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${regionguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${post_errguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[8]/span
    Should Be Equal As Strings    ${nameguest_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lnameguest_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${addressguest_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${cityguest_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${regionguest_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_errguest_err}    Zip/postal code must be between 3 and 10 characters!

Payment when choose guest select and submit name below 3 characters
    Input Text    ${name_input}    ${invalidname_valid}
    Input Text    ${lname_input}    ${invalidname_valid}
    Input Text    ${nameguest_input}    ${invalidname_valid}
    Input Text    ${lnameguest_input}    ${invalidname_valid}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    ${nameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${lnameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${addressguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${cityguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${regionguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${post_errguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[8]/span
    Should Be Equal As Strings    ${nameguest_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lnameguest_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${addressguest_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${cityguest_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${regionguest_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_errguest_err}    Zip/postal code must be between 3 and 10 characters!

Payment when choose guest select and submit name than 32 characters
    ${long_enquiry}=    Generate Long Enquiry
    Input Text    ${name_input}    ${long_enquiry}
    Input Text    ${lname_input}    ${long_enquiry}
    Input Text    ${nameguest_input}    ${long_enquiry}
    Input Text    ${lnameguest_input}    ${long_enquiry}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    ${nameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${lnameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${addressguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${cityguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${regionguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${post_errguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[8]/span
    Should Be Equal As Strings    ${nameguest_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lnameguest_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${addressguest_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${cityguest_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${regionguest_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_errguest_err}    Zip/postal code must be between 3 and 10 characters!
Payment when choose guest select and submit email invalid
    Input Text    ${email_input}    Cindy.gmail.com
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    ${nameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${lnameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${addressguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${cityguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${regionguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${post_errguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[8]/span
    Should Be Equal As Strings    ${nameguest_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lnameguest_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${addressguest_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${cityguest_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${regionguest_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_errguest_err}    Zip/postal code must be between 3 and 10 characters!

Payment when choose guest select and submit address than 128 characters
    ${long_enquiry}=    Generate Long Enquiry1
    Input Text    ${address1_input}    ${long_enquiry}
    Input Text    ${address1guest_input}    ${long_enquiry}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    ${nameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${lnameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${addressguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${cityguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${regionguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${post_errguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[8]/span
    Should Be Equal As Strings    ${nameguest_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lnameguest_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${addressguest_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${cityguest_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${regionguest_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_errguest_err}    Zip/postal code must be between 3 and 10 characters!

Payment when choose guest select and submit zipcode below 3 characters
    Input Text    ${codepost_input}    Ci
    Input Text    ${codepostguest_input}    Ci
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    ${nameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${lnameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${addressguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${cityguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${regionguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${post_errguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[8]/span
    Should Be Equal As Strings    ${nameguest_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lnameguest_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${addressguest_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${cityguest_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${regionguest_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_errguest_err}    Zip/postal code must be between 3 and 10 characters!

Payment when choose guest select and submit zipcode than 10 characters
    ${long_enquiry}=    Generate Long Enquiry
    Input Text    ${codepost_input}    ${long_enquiry}
    Input Text    ${codepostguest_input}    ${long_enquiry}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    ${nameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[1]/span
    ${lnameguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[2]/span
    ${addressguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[4]/span
    ${cityguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[6]/span
    ${regionguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[7]/span
    ${post_errguest_err}    Get Text    //*[@id="shipping_details"]/div/fieldset/div[8]/span
    Should Be Equal As Strings    ${nameguest_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lnameguest_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${addressguest_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${cityguest_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${regionguest_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_errguest_err}    Zip/postal code must be between 3 and 10 characters!

Payment true with shipping
    Input Text    ${name_input}    ${valid_login_name_1}
    Input Text    ${lname_input}    ${name_valid}
    Input Text    ${email_input}    ${email_valid}
    Input Text    ${phone_input}    ${phone_number}
    Input Text    ${address1_input}    ${address}
    Input Text    ${city_input}    ${city}
    Input Text    ${codepost_input}    ${code}
    Select From List By Value    //*[@id="guestFrm_country_id"]   230
    Sleep    2s
    Select From List By Value    //*[@id="guestFrm_zone_id"]    3780
    Input Text    ${nameguest_input}    ${nameguest}
    Input Text    ${lnameguest_input}    ${lnameguest}
    Input Text    ${address1guest_input}    ${addressguest}
    Input Text    ${cityguest_input}    ${cityguest}
    Input Text    ${codepostguest_input}    ${codeguest}
    Select From List By Value    ${countryguest_input}    230
    Sleep    2s
    Select From List By Value    //*[@id="guestFrm_shipping_zone_id"]    3780
    ${name_before}    Get Text    ${name_input}
    ${lname_before}    Get Text    ${lname_input}
    ${email_before}    Get Text    ${email_input}
    ${phone_before}    Get Text    ${phone_input}
    ${address_before}    Get Text    ${address1_input}
    ${city_before}    Get Text    ${city_input}
    ${country_before}    Get Text    //*[@id="guestFrm_country_id"]
    ${zone_before}    Get Text    //*[@id="guestFrm_zone_id"]
    ${total_before}    Get Text    //*[@id="maincontainer"]/div/div[2]/div[1]/table[2]/tbody/tr[2]/td[2]/span
    ${name_before1}    Get Text    ${name_input}
    ${lname_before1}    Get Text    ${lname_input}
    ${address_before1}    Get Text    ${address1_input}
    ${city_before1}    Get Text    ${city_input}
    ${country_before1}    Get Text    ${countryguest_input}    
    ${zone_before1}    Get Text    //*[@id="guestFrm_shipping_zone_id"]    
    ${result_name}=    Set Variable    ${name_before1} ${SPACE} ${lname_before1}
    Click Element    ${continue_checkguest}
    Page Should Contain Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1]
    Sleep    2s
    ${total_after}    Get Text    //*[@id="maincontainer"]/div/div[2]/div[1]/table[2]/tbody/tr[1]/td[2]/span
    Should Be Equal As Strings    ${total_before}    ${total_after}
    Click Element    //*[@id="checkout_btn"]
    Page Should Contain Element    //*[@id="maincontainer"]/div

Payment when choose guest select and submit telephone empty
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Page Should Contain Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[1]/a/i
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
    Click Element    ${guest_select}
    Click Element    ${continue_btn}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    Page Should Contain    Phone is require!

Payment when choose guest select and submit telephone not a number 
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Page Should Contain Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div[1]/a/i
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
    Click Element    ${guest_select}
    Click Element    ${continue_btn}
    Click Element    ${continue_checkguest}
    Sleep    2s
    ${name_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[1]/span
    ${lname_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[2]/span
    ${email_err}    Get Text    //*[@id="guestFrm"]/div[1]/fieldset/div[3]/span
    ${address_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[2]/span
    ${city_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[4]/span
    ${region_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[5]/span
    ${post_err}    Get Text    //*[@id="guestFrm"]/div[2]/fieldset/div[6]/span
    Should Be Equal As Strings    ${name_err}    First Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${lname_err}    Last Name must be greater than 3 and less than 32 characters!
    Should Be Equal As Strings    ${email_err}    E-Mail Address does not appear to be valid!
    Should Be Equal As Strings    ${address_err}    Address 1 must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${city_err}    City must be greater than 3 and less than 128 characters!
    Should Be Equal As Strings    ${region_err}    Please select a region / state!
    Should Be Equal As Strings    ${post_err}    Zip/postal code must be between 3 and 10 characters!
    ${long_enquiry}=    Generate Long Enquiry1
    Input Text    ${phone_input}    ${invalid_login_name}
    Click Element    ${continue_checkguest}
    Sleep    2s
    Page Should Contain    Phone is not a number








