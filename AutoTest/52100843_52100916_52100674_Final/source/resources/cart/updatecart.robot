*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../../resources/common.robot

*** Variables ***
${item1}    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i

*** Keywords ***
Update add valid quantity by input text
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    Input Text    //*[@id="cart_quantity50"]    10
    Click Element    xpath=//*[@id="cart_update"]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${update_quantity_distance}    Get Element Attribute    //*[@id="cart_quantity50"]    value
    ${update_quantity_distance}    Evaluate    int(${update_quantity_distance}) - int(${quantity})
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(float(${item_price}) * int(${update_quantity_distance}))
    Should Be Equal As Numbers    ${distance_quantity}    ${update_quantity_distance}
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Update remove valid quantity by input text 
    FOR    ${i}    IN RANGE    5
        Click Element    ${item1}
    END
    Click Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    Input Text    //*[@id="cart_quantity50"]    2
    Click Element    xpath=//*[@id="cart_update"]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${update_quantity_distance}    Get Element Attribute    //*[@id="cart_quantity50"]    value
    ${update_quantity_distance}    Evaluate    int(${update_quantity_distance}) - int(${quantity})
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(float(${item_price}) * int(${update_quantity_distance}))
    Should Be Equal As Numbers    ${distance_quantity}    ${update_quantity_distance}
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Update zero quantity by input text
    FOR    ${i}    IN RANGE    5
      Click Element    ${item1}
    END  
    Click Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    Input Text    //*[@id="cart_quantity50"]    0
    Click Element    xpath=//*[@id="cart_update"]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${update_quantity_distance}    Set Variable    0
    ${update_quantity_distance}    Evaluate    int(${update_quantity_distance}) - int(${quantity})
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(float(${item_price}) * int(${update_quantity_distance}))
    Should Be Equal As Numbers    ${distance_quantity}    ${update_quantity_distance}
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Update not a number quantity by input text
    FOR    ${i}    IN RANGE    5
      Click Element    ${item1}
    END
    Click Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    Input Text    //*[@id="cart_quantity50"]    abcde
    Click Element    xpath=//*[@id="cart_update"]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${update_quantity_distance}    Set Variable    0
    ${update_quantity_distance}    Evaluate    int(${update_quantity_distance}) - int(${quantity})
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(float(${item_price}) * int(${update_quantity_distance}))
    Should Be Equal As Numbers    ${distance_quantity}    ${update_quantity_distance}
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div

Update negative number by input text
    FOR    ${i}    IN RANGE    5
      Click Element    ${item1}
    END
    Click Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    Input Text    //*[@id="cart_quantity50"]    -5
    Click Element    xpath=//*[@id="cart_update"]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${update_quantity_distance}    Set Variable    0
    ${update_quantity_distance}    Evaluate    int(${update_quantity_distance}) - int(${quantity})
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(float(${item_price}) * int(${update_quantity_distance}))
    Should Be Equal As Numbers    ${distance_quantity}    ${update_quantity_distance}
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div

Update exceed in stock quantity by input text
    Click Element   //*[@id="categorymenu"]/nav/ul/li[6]/a
    Click Element    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/a/img
    Click Element    //*[@id="product"]/fieldset/div[5]/ul/li/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    Input Text    //*[@id="cart_quantity7808d50be7efed8dd74bfcc27df4d70570"]    200
    Click Element    xpath=//*[@id="cart_update"]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${update_quantity_distance}    Get Element Attribute    //*[@id="cart_quantity7808d50be7efed8dd74bfcc27df4d70570"]    value
    ${update_quantity_distance}    Evaluate    int(${update_quantity_distance}) - int(${quantity})
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(float(${item_price}) * int(${update_quantity_distance}))
    Should Be Equal As Numbers    ${distance_quantity}    ${update_quantity_distance}
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    ${error_message}    Get Text    //*[@id="maincontainer"]/div/div/div/div/strong
    Should Be Equal As Strings    ${error_message}    Products marked with *** are not available in the desired quantity or out of stock!

Update remove item by delete button
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[6]/a
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/a/img
    Input Text    //*[@id="product_quantity"]    10
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    Click Element    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[7]/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${update_quantity_distance}    Set Variable    0
    ${update_quantity_distance}    Evaluate    int(${update_quantity_distance}) - int(${quantity})
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(float(${item_price}) * int(${update_quantity_distance}))
    Should Be Equal As Numbers    ${distance_quantity}    ${update_quantity_distance}
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div

Update no change quantity 
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[6]/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div/div/h1/span[1][contains(text(),'Men')]
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/a/img
    Wait Until Page Contains Element    //*[@id="product_details"]/div/div[2]/div/div/h1/span[contains(text(),'ck IN2U Eau De Toilette Spray for Him')]
    Input Text    //*[@id="product_quantity"]    5
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    Page Should Contain Element    //*[@id="cart"]/div/div[1]/table/tbody
    Click Element    xpath=//*[@id="cart_update"]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${update_quantity_distance}    Get Element Attribute    //*[@id="cart_quantity7808d50be7efed8dd74bfcc27df4d70570"]    value
    ${update_quantity_distance}    Evaluate    int(${update_quantity_distance}) - int(${quantity})
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(float(${item_price}) * int(${update_quantity_distance}))
    Should Be Equal As Numbers    ${distance_quantity}    ${update_quantity_distance}
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Page Should Contain Element    //*[@id="cart"]/div/div[1]/table/tbody
