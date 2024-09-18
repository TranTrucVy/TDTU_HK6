*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Library           XML

*** Variables ***
${login_form}     //*[@id="loginFrm_loginname"]
${loginpw_form}    //*[@id="loginFrm_password"]
${login_valid}    adminnn
${loginpw_valid}    adminnn
${checkouthome_btn}    //*[@id="main_menu_top"]/li[4]
${payment_content}    //*[@id="maincontainer"]/div
${login_btn}      xpath=/html/body/div[1]/div[2]/div/div/div/div/div[2]/div/form/fieldset/button
${ORDER_TEXT_XPATH}    //*[@id="maincontainer"]/div/div/div/div/section/p[2]

*** Keywords ***
Payment when without login and login
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
    ${item_price1}    Set Variable    ${item_price}[1:]
    ${item_price1}    Evaluate    float(${item_price1})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price1}
    Click Element    ${checkouthome_btn}
    Page Should Contain Element    ${payment_content}
    Input Text    ${login_form}    ${login_valid}
    Input Text    ${loginpw_form}    ${loginpw_valid}
    Click Element    ${login_btn}
    Page Should Contain Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1]
    ${priceafter}    Get Text    //*[@id="maincontainer"]/div/div[2]/div[1]/table[2]/tbody/tr[1]/td[2]/span
    Should Be Equal As Strings    ${item_price}    ${update_price}
    Click Element    //*[@id="checkout_btn"]
    Sleep    8s

Payment when login in web
    Click Element    //*[@id="customer_menu_top"]/li/a
    Input Text    ${login_form}    ${login_valid}
    Input Text    ${loginpw_form}    ${loginpw_valid}
    Click Element    ${login_btn}
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Select From List By Value    //*[@id="option318"]    652
    Input Text    xpath=//*[@id="product_quantity"]    5
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[2]/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div/div/h1/span[1][contains(text(),'Apparel & accessories')]
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[6]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    5
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[4]/label/span
    Click Element    xpath=//*[@id="product"]/fieldset/div[6]/ul/li/a
    Click Element    //*[@id="main_menu_top"]/li[3]/a
    Sleep    5s
    ${name1}    Get Text    //*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[2]/a
    ${name2}    Get Text    //*[@id="cart"]/div/div[1]/table/tbody/tr[3]/td[2]/a
    Click Element    //*[@id="cart_checkout1"]
    ${name1_after}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]/tbody/tr[1]/td[2]/a
    ${name2_after}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]/tbody/tr[2]/td[2]/a
    ${price3_after}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[2]/span
    Should Be Equal As Strings    ${name1}    ${name1_after}
    Should Be Equal As Strings    ${name2}    ${name2_after}
    Click Element    //*[@id="checkout_btn"]
    Wait Until Element Is Enabled    //*[@id="maincontainer"]/div/div/div/h1/span[1]
    Sleep    3s
    Click Element    //*[@id="maincontainer"]/div/div/div/div/section/p[3]/a
    ${name2_after1}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div/div[2]/div[1]/table/tbody/tr[2]/td[2]/a
    ${name2_after2}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div/div[2]/div[1]/table/tbody/tr[3]/td[2]/a
    Should Be Equal As Strings    ${name1_after}    ${name2_after1}
    Should Be Equal As Strings    ${name2_after}    ${name2_after2}

Payment when login in web with button checkout 2
    Click Element    //*[@id="customer_menu_top"]/li/a
    Input Text    ${login_form}    ${login_valid}
    Input Text    ${loginpw_form}    ${loginpw_valid}
    Click Element    ${login_btn}
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Select From List By Value    //*[@id="option318"]    652
    Input Text    xpath=//*[@id="product_quantity"]    5
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[2]/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div/div/h1/span[1][contains(text(),'Apparel & accessories')]
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[6]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    5
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[4]/label/span
    Click Element    xpath=//*[@id="product"]/fieldset/div[6]/ul/li/a
    Click Element    //*[@id="main_menu_top"]/li[3]/a
    Sleep    5s
    ${name1}    Get Text    //*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[2]/a
    ${name2}    Get Text    //*[@id="cart"]/div/div[1]/table/tbody/tr[3]/td[2]/a
    Click Element    //*[@id="cart_checkout2"]
    ${name1_after}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]/tbody/tr[1]/td[2]/a
    ${name2_after}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/table[3]/tbody/tr[2]/td[2]/a
    ${price3_after}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[2]/span
    Should Be Equal As Strings    ${name1}    ${name1_after}
    Should Be Equal As Strings    ${name2}    ${name2_after}
    Click Element    //*[@id="checkout_btn"]
    Wait Until Element Is Enabled    //*[@id="maincontainer"]/div/div/div/h1/span[1]
    Sleep    3s
    Click Element    //*[@id="maincontainer"]/div/div/div/div/section/p[3]/a
    ${name2_after1}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div/div[2]/div[1]/table/tbody/tr[2]/td[2]/a
    ${name2_after2}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div/div[2]/div[1]/table/tbody/tr[3]/td[2]/a
    Should Be Equal As Strings    ${name1_after}    ${name2_after1}
    Should Be Equal As Strings    ${name2_after}    ${name2_after2}
