*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Library    RPA.PDF
Resource          ../../resources/common.robot
Resource          ../../variables/product_details.robot

*** Keywords ***
Add to cart from homepage featured
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

Add to cart from homepage latest products
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_latest_1770"]/div/div[3]/div[2]/div[3]/a/i
    Page Should Contain Element    xpath=//*[@id="block_frame_latest_1770"]/div/div[3]/div[2]/div[3]/a/i
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${item_price}    Get Text    xpath=//*[@id="block_frame_latest_1770"]/div/div[3]/div[2]/div[3]/div/div
    
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Add to cart from homepage bestsellers   
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_bestsellers_1771"]/div/div[4]/div[2]/div[3]/a/i
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/section[4]/div/div/div/div[4]/div[2]/div[3]/div[1]/a/i
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${item_price}    Get Text    xpath=//*[@id="block_frame_bestsellers_1771"]/div/div[4]/div[2]/div[3]/div[2]/div[1]
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Add to cart from homepage specials
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    xpath=//*[@id="block_frame_bestsellers_1771"]/div/div[3]/div[2]/div[3]/a
    Page Should Contain Element    xpath=//*[@id="block_frame_bestsellers_1771"]/div/div[3]/div[2]/div[3]/a
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    ${item_price}    Get Text    xpath=//*[@id="block_frame_bestsellers_1771"]/div/div[3]/div[2]/div[3]/div/div
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Add to cart from homepage featured has minimum
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price[1:].replace(",", "")}
    Click Element    //*[@id="block_frame_featured_1769"]/div/div[3]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    1
    Sleep    1s
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    Wait Until Page Contains Element    xpath=//*[@id="maincontainer"]/div/div/div/div/strong[contains(text(),"Allowed product's quantity is below minimum required. Quantity was set to minimum amount.")]
    ${item_price}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[6]
    ${item_price}    Set Variable    ${item_price[1:].replace(",", "")}
    ${item_price}    Evaluate    float(${item_price})
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price[1:].replace(",", "")}
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    2
    Should Be Equal As Numbers    ${distance_price}    ${item_price}

Add to cart from homepage specials product with 2 product
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="block_frame_special_1772"]/div/div[1]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    2
    Wait Until Element Is Enabled    xpath=//*[@id="product"]/fieldset/div[2]/label/span
    Sleep    1s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[2]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price1}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price1}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    2
    Should Be Equal As Numbers    ${distance_price}    ${item_price}
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody
    ${total_cart}    Get Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[2]/td[6]
    Should Be Equal As Strings    ${total_cart}    ${update_price}

Add to cart from homepage specials product with quanlity 0
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="block_frame_special_1772"]/div/div[1]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    0
    Sleep    1s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[2]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    0
    Should Be Equal As Numbers    ${distance_price}    0
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div

Add to cart from homepage specials product with not a number
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="block_frame_special_1772"]/div/div[1]/div[1]/div/a
    Input Text    xpath=//*[@id="product_quantity"]    abcde
    Sleep    1s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[2]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    0
    Should Be Equal As Numbers    ${distance_price}    0
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div

Add to cart from homepage specials product with a negative number
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="block_frame_special_1772"]/div/div[1]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    -5
    Sleep    1s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[2]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    0
    Should Be Equal As Numbers    ${distance_price}    0
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/div

Add to cart from homepage bestsellers product choose options
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="block_frame_bestsellers_1771"]/div/div[2]/div[2]/a/img
    ${color}    Get Text    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    ${color}    Evaluate    '${color}'.replace(' ', '')
    Click Element    xpath=//*[@id="product"]/fieldset/div[1]/div/label[3]
    Sleep    1s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price1}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price1}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    1
    Should Be Equal As Numbers    ${distance_price}    ${update_price1}
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody
    ${total_cart}    Get Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[2]/td[6]
    Should Be Equal As Strings    ${total_cart}    ${update_price}
    ${colour_text}    Get Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[2]/td[2]/div/small
    ${colour_value}    Evaluate    '${colour_text}'.replace('Colour ', '').replace(' ', '')
    Should Be Equal As Strings    ${color}    ${colour_value}

Add to cart from homepage specials product select dropdown
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="block_frame_featured_1769"]/div/div[4]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    2
    Select From List By Value    //*[@id="option318"]    652
    ${colour}    Get Text    xpath=/html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div/div/div[2]/form/fieldset/div[1]/div/select/option[2]
    ${colour}    Evaluate    '${colour}'.replace(' ', '')
    Sleep    1s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price1}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price1}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    2
    Should Be Equal As Numbers    ${distance_price}    ${update_price1}
    Page Should Contain Element    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody
    ${total_cart}    Get Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[2]/td[6]
    Should Be Equal As Strings    ${total_cart}    ${update_price}
    ${colour_text}    Get Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[2]/td[2]/div/small
    ${colour_value}    Evaluate    '${colour_text}'.replace('Color ', '').replace(' ', '')
    Should Be Equal As Strings    ${colour}    ${colour_value}

Add to cart from homepage bestsellers product out of stock
    ${quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${price}    Set Variable    ${price}[1:]
    Click Element    //*[@id="block_frame_bestsellers_1771"]/div/div[1]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    2
    Sleep    1s
    ${item_price}    Get Text    xpath=//*[@id="product"]/fieldset/div[3]/label/span
    ${item_price}    Set Variable    ${item_price}[1:]
    ${item_price}    Evaluate    float(${item_price})
    Click Element    xpath=//*[@id="product"]/fieldset/div[6]/ul/li/a
    Wait Until Page Contains Element    //*[@id="maincontainer"]/div/div[1]/div/h1/span[1][contains(text(),' Shopping Cart')]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price1}    Set Variable    ${update_price}[1:]
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${quantity})
    ${distance_price}    Evaluate    float(${update_price1}) - float(${price})
    Should Be Equal As Numbers    ${distance_quantity}    2
    Should Be Equal As Numbers    ${distance_price}    ${update_price1}

Check out of stock
    Wait Until Page Contains Element    //html/body/div/header/div[1]/div/div[1]/a/img
    ${out_of_stock}    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[2]/div[2]/div[3]/span
    Should Be Equal As Strings    ${out_of_stock}    OUT OF STOCK
    Click Element    xpath=/html/body/div/div[2]/div/div/section[2]/div/div/div/div[2]/div[2]/a/img
    ${out_of_stock1}    Get Text    xpath=/html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div/div/div[2]/form/fieldset/div[4]/ul/li/span
    Should Be Equal As Strings    ${out_of_stock1}    Out of Stock

# category: apparel & accessories, makeup, skincare, fragrance, men, hair care, book

Add to cart from sub category
    [Arguments]    ${category}
    # category: apparel & accessories, makeup, skincare, fragrance, men, hair care, book

    IF    $category == 'apparel & accessories'
        ${category_id}=    Set Variable    2
    ELSE IF    $category == 'makeup'
        ${category_id}=    Set Variable    3
    ELSE IF    $category == 'skincare'
        ${category_id}=    Set Variable    4
    ELSE IF    $category == 'fragrance'
        ${category_id}=    Set Variable    5
    ELSE IF    $category == 'men'
        ${category_id}=    Set Variable    6
    ELSE IF    $category == 'hair care'
        ${category_id}=    Set Variable    7
    ELSE IF    $category == 'book'
        ${category_id}=    Set Variable    8
    END

    ${xpath_section}=    Set Variable    //*[@class='container-fluid'][1]/div[@class='col-md-12'][1]/section[@id='categorymenu']/nav[@class='subnav']/ul[@class='nav-pills categorymenu']/li[${category_id}]
    Log To Console    message: ${xpath_section}

    Mouse Over    ${xpath_section}

    Element Should Be Visible    ${xpath_section}/div[@class='subcategories']

    ${count_sub_category}=    Get Element Count    ${xpath_section}/div[@class='subcategories']/ul[1]/li

    Log To Console    count_sub_category: ${count_sub_category}

    ${product_list_sub_total}=    Set Variable    0

    FOR    ${index}    IN RANGE    1    ${count_sub_category}+1
        Log To Console    --sub category index: ${index}
        ${xpath_sub_category}=    Set Variable    ${xpath_section}/div[@class='subcategories']/ul[1]/li[${index}]
        
        Click Element    ${xpath_sub_category}
        Wait Until Location Contains    https://automationteststore.com/index.php?rt=product/category

        ${count_ele}=    Get Element Count    //*[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='contentpanel']/div[@class='thumbnails grid row list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12']

        Log To Console    count_ele: ${count_ele}

        FOR    ${index}    IN RANGE    1    ${count_ele}+1
            Log To Console    index: ${index}
            ${xpath_product_card}=    Set Variable    //*[@id="maincontainer"]/div/div/div/div/div/div[@class='col-md-3 col-sm-6 col-xs-12'][${index}]/div/div/a[@class="prdocutname"]
            
            ${product_price}=    Add 1 product to cart from sub category    ${xpath_product_card}
            ${product_list_sub_total}=    Evaluate    ${product_list_sub_total} + ${product_price}
            Log To Console    current product_list_sub_total: ${product_list_sub_total}

            Go Back
            Wait Until Location Contains    https://automationteststore.com/index.php?rt=product/category
        END

        Go Back
        Wait Until Location Contains    ${URL_HOME}
        Mouse Over    ${xpath_section}

    END

    ${cart_total}=    Get Text    //html/body/div[1]/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${cart_total}=    Remove String    ${cart_total}    $
    ${cart_total}=    Replace String    ${cart_total}    ,    ${EMPTY}
    ${cart_total}=    Convert To Number    ${cart_total}
    

    Log To Console    cart_total: ${cart_total}, product_list_sub_total: ${product_list_sub_total}
    Should Be Equal As Numbers    ${cart_total}    ${product_list_sub_total}


Add 1 product to cart from sub category
    [Arguments]    ${product_card}
    Click Element    ${product_card}
    Wait Until Location Contains    https://automationteststore.com/index.php?rt=product/product

    ${has_sales}=    Run Keyword And Return Status    Page Should Contain Element    ${PRODUCT_DETAIL_NEW_PRICE}

    ${product_price}=    Set Variable    0

    ${is_in_stock}=    Run Keyword And Return Status    Page Should Contain    Add to Cart

    IF    $is_in_stock
        Wait Until Page Contains Element    ${PRODUCT_DETAIL_TOTAL_PRICE}
        Wait Until Element Contains    ${PRODUCT_DETAIL_TOTAL_PRICE}    $
        ${product_total}=    Get Text    ${PRODUCT_DETAIL_TOTAL_PRICE}
        ${product_total}=    Remove String    ${product_total}    $
        ${product_total}=    Replace String    ${product_total}    ,    ${EMPTY}
        ${product_total}=    Convert To Number    ${product_total}

        ${product_name}=    Get Text    ${PRODUCT_DETAIL_NAME}
        # get input value
        ${product_quantity}=    Get Value    //*[@id="product_quantity"]
        ${product_quantity}=    Convert To Number    ${product_quantity}

        Scroll Element Into View    ${PRODUCT_ADD_TO_CART}

        ${has_choose_size}=    Run Keyword And Return Status    Page Should Contain    UK size
        IF    $has_choose_size
            # loop through list, if disabled = disabled, keep going
            # if not, click then break
            ${size_list}=    Get WebElements    //*[@id="product"]/fieldset/div[1]/div/label
            FOR    ${size}    IN    @{size_list}
                ${is_disabled}=    Run Keyword And Return Status    Element Should Be Disabled    ${size}

                IF    not $is_disabled
                    Click Element    ${size}
                    BREAK
                END
            END
        END

        ${has_choose_option}=    Run Keyword And Return Status    Page Should Contain    Fragrance Type
        IF    $has_choose_option
            Click Element    //*[@id="product"]/fieldset/div[1]/div/label[1]
            Sleep    2s
            Wait Until Page Contains Element    ${PRODUCT_DETAIL_TOTAL_PRICE}
            Wait Until Element Contains    ${PRODUCT_DETAIL_TOTAL_PRICE}    $
            ${product_total}=    Get Text    ${PRODUCT_DETAIL_TOTAL_PRICE}
            ${product_total}=    Remove String    ${product_total}    $
            ${product_total}=    Convert To Number    ${product_total}
        END

        


        Click Element    ${PRODUCT_ADD_TO_CART}
        Wait Until Location Is    https://automationteststore.com/index.php?rt=checkout/cart

        ${pd_cart_name}=    Get Text    //*[@id="cart"]/div/div[1]/table/tbody/tr[last()]/td[2]
        
        ${pd_cart_total}=    Get Text    //*[@id="cart"]/div/div[1]/table/tbody/tr[last()]/td[6]
        ${pd_cart_total}=    Remove String    ${pd_cart_total}    $
        ${pd_cart_total}=    Replace String    ${pd_cart_total}    ,    ${EMPTY}

        Should Contain    ${pd_cart_name}    ${product_name}

        Should Be Equal As Numbers    ${pd_cart_total}    ${product_total}

        Go Back
        Wait Until Location Contains    https://automationteststore.com/index.php?rt=product/product
        
        RETURN    ${product_total}

    END

    RETURN    0



