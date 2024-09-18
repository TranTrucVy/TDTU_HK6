*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../../resources/common.robot

*** Keywords ***
Add two valid item
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Select From List By Value    //*[@id="option318"]    652
    Input Text    xpath=//*[@id="product_quantity"]    5
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    5
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[2]/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div/div/h1/span[1][contains(text(),'Apparel & accessories')]
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[6]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    5
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[4]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[6]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    5
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Add first item valid and second item invalid
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Select From List By Value    //*[@id="option318"]    652
    Input Text    xpath=//*[@id="product_quantity"]    5
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    5
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[6]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Click Element    //*[@id="option319"]/option[1]   
    Input Text    xpath=//*[@id="product_quantity"]    0
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    0
    Should Be Equal As Numbers    ${distance_price}    0
    Page Should Contain Element    //*[@id="cart"]/div/div[1]

Add first item invalid and second item valid
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[4]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    0
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[2]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    0
    Should Be Equal As Numbers    ${distance_price}    0
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Select From List By Value    //*[@id="option318"]    652
    Input Text    xpath=//*[@id="product_quantity"]    5
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    5
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Add two item invalid
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[5]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Select From List By Value    //*[@id="option330"]    691
    Input Text    xpath=//*[@id="product_quantity"]    0
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    0
    Should Be Equal As Numbers    ${distance_price}    0
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[5]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[8]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Select From List By Value    //*[@id="option323"]    670   
    Input Text    xpath=//*[@id="product_quantity"]    abcde
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    0
    Should Be Equal As Numbers    ${distance_price}    0
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div

Add first item quantity and exceed second item
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[6]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Select From List By Value    //*[@id="option320"]    661
    Input Text    xpath=//*[@id="product_quantity"]    150
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    150
    ${error_message}    Get Text    //*[@id="maincontainer"]/div/div/div/div/strong
    Should Be Equal As Strings    ${error_message}    Products marked with *** are not available in the desired quantity or out of stock!
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[6]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[3]/div[2]/div[3]/a
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[3]/div[2]/div[3]/div[2]/div
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(${item_price})
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
Add item first item quantity and not enough valid
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[8]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[1]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Input Text    xpath=//*[@id="product_quantity"]    10
    Sleep    2s
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[6]
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(${item_price})
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    1000000
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Page Should Contain Element    //*[@id="maincontainer"]/div/div/div/div[2]/strong
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[8]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]/div[3]/a/i
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[4]/div[2]/div[3]/div[2]/div
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(${item_price})
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Click Element    //*[@id="main_menu_top"]/li[3]/a
    Page Should Contain Element    //*[@id="cart"]/div/div[1]/table/tbody
Add two item valid with another product
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[7]/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div/div/h1/span[1][contains(text(),'Hair Care')]
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/div[3]/a/i
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/div[3]/div[2]/div
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(${item_price})
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[7]/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div/div/h1/span[1][contains(text(),'Hair Care')]
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[3]/div[3]/div[2]/div[3]/a/i
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[3]/div[2]/div[3]/div[2]/div
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(${item_price})
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Add two item valid with another product with select
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[2]/a
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/ul/li[1]/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[3]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[1]/div
    Select From List By Value    //*[@id="option342"]    743
    Input Text    xpath=//*[@id="product_quantity"]    5
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    //*[@id="product"]/fieldset/div[5]/ul/li
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    5
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[2]/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div/div/h1/span[1][contains(text(),'Apparel & accessories')]
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/ul/li[1]/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div/div/h1/span[1][contains(text(),'Shoes')]
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/a/img
    Click Element    //*[@id="option344749"]
    Input Text    xpath=//*[@id="product_quantity"]    5
    Sleep    2s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[4]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[6]/ul/li/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    5
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
