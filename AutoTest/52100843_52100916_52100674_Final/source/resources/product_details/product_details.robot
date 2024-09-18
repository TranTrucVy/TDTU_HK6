*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../../resources/common.robot
Resource          ../../variables/product_details.robot



*** Variables ***



*** Keywords ***
Click on a product name and Verify product details
    [Arguments]    ${xpath_product_card}

    # card should contain name, price, image 
    ${product_name}=    Get Text    xpath=${xpath_product_card}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']
    ${product_price}=    Get Text    xpath=${xpath_product_card}/div[@class='thumbnail']/div[@class='pricetag jumbotron']/div[@class='price']/div[@class='oneprice']

    Log To Console    ${product_name}, ${product_price}

    Click Element    ${xpath_product_card}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']
    Wait Until Location Contains    ${PRODUCT_DETAIL_PATH}

    Verify product details    ${product_name}    ${product_price}    True

Click on a product view btn and Verify product details
    [Arguments]    ${xpath_product_card}

    # card should contain name, price, image 
    ${product_name}=    Get Text    xpath=${xpath_product_card}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']
    ${product_price}=    Get Text    xpath=${xpath_product_card}/div[@class='thumbnail']/div[@class='pricetag jumbotron']/div[@class='price']/div[@class='oneprice']

    Log To Console    ${product_name}, ${product_price}

    Mouse Over    ${xpath_product_card}
    Click Element    //*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[1]/a[1]

    ${location}=    Get Location    
    Wait Until Location Contains    ${PRODUCT_DETAIL_PATH}

    Verify product details    ${product_name}    ${product_price}    True

Click on a product image and Verify product details
    [Arguments]    ${xpath_product_card}

    # card should contain name, price, image 
    ${product_name}=    Get Text    xpath=${xpath_product_card}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']
    ${product_price}=    Get Text    xpath=${xpath_product_card}/div[@class='thumbnail']/div[@class='pricetag jumbotron']/div[@class='price']/div[@class='oneprice']

    Log To Console    ${product_name}, ${product_price}

    Click Element    ${PRODUCT_CARD_IMG}

    ${location}=    Get Location    
    Wait Until Location Contains    ${PRODUCT_DETAIL_PATH}

    Verify product details    ${product_name}    ${product_price}    True

Access product details by valid url and Verify product details
    [Arguments]    ${url}
    Go To    ${url}
    Wait Until Location Is    ${url}

    Page Should Contain Element    ${PRODUCT_DETAIL_NAME}
    Page Should Contain Element    ${PRODUCT_DETAIL_PRICE}
    Page Should Contain Element    ${PRODUCT_DETAIL_IMG}
    Page Should Contain Element    ${PRODUCT_DETAIL_DESC}
    Page Should Contain Element    ${PRODUCT_DETAIL_LATEST_PRODUCT_LIST}
    Page Should Contain Element    ${PRODUCT_DETAIL_BREADCRUMB} 

Access product details by invalid url and Verify product details
    [Arguments]    ${url}
    Go To    ${url}
    Wait Until Location Is    ${url}

    Page Should Contain    Product not found
    Page Should Contain Element    //*[@id="maincontainer"]/div/div[2]/div/div/div/div/a
    Element Should Contain    //*[@id="maincontainer"]/div/div[2]/div/div/div/div/a    Continue

Click on an out of stock product name and Verify product details
    [Arguments]    ${xpath_product_card}

    # card should contain name, price, image 
    ${product_name}=    Get Text    xpath=${xpath_product_card}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']
    ${product_price}=    Get Text    xpath=${xpath_product_card}/div[@class='thumbnail']/div[@class='pricetag jumbotron']/div[@class='price']

    ${text_out_of_stock}=    Get Text    ${xpath_product_card}
    Should Contain    ${text_out_of_stock.lower()}    out of stock

    Log To Console    ${product_name}, ${product_price}

    Click Element    ${xpath_product_card}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']

    ${text_add_to_cart}=    Get Text    ${PRODUCT_ADD_TO_CART}
    Should Contain    ${text_add_to_cart.lower()}    out of stock

    ${location}=    Get Location    
    Wait Until Location Contains    ${PRODUCT_DETAIL_PATH}

    Verify product details    ${product_name}    ${product_price}    False

Click on a product on sales name and Verify product details
    [Arguments]    ${xpath_product_card}

    # card should contain name, price, image 
    ${product_name}=    Get Text    xpath=${xpath_product_card}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']
    ${product_new_price}=    Get Text    //*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/div[3]/div/div[@class="pricenew"]
    ${product_old_price}=    Get Text    //*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/div[3]/div/div[@class="priceold"]
    Page Should Contain Element    //*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/span[@class="sale"]

    Log To Console    ${product_name}, ${product_new_price}, ${product_old_price}

    Click Element    ${xpath_product_card}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']

    ${location}=    Get Location    
    Wait Until Location Contains    ${PRODUCT_DETAIL_PATH}
    Wait Until Element Contains    ${PRODUCT_DETAIL_TOTAL_PRICE}    $

    Verify product on sales    ${product_name}    ${product_new_price}    ${product_old_price}

Access product details and Verify product details with multiple choice in stock
    [Arguments]    ${url}    
    Go To    ${url}

    Page Should Contain Element    //*[@id="product"]/fieldset/div[1]/div/select

    Click Element    //*[@id="product"]/fieldset/div[1]/div/select
    Select From List By Index    //*[@id="product"]/fieldset/div[1]/div/select    2
    ${selected_option}=    Get Selected List Label    //*[@id="product"]/fieldset/div[1]/div/select[1]
    Log To Console    ${selected_option}

    ${selected_value}=    Get Selected List Label    //*[@id="product"]/fieldset/div[1]/div/select

    Log To Console    ${selected_value}

    Should Be Equal As Strings    ${selected_option.lower()}    ${selected_value.lower()}

Access product details and Verify product details with multiple choice out of stock
    [Arguments]    ${url}    
    Go To    ${url}

    Page Should Contain Element    //*[@id="product"]/fieldset/div[1]/div/select

    ${first_selected_option}=    Get Selected List Label    //*[@id="product"]/fieldset/div[1]/div/select
    Log To Console    ${first_selected_option}

    Click Element    //*[@id="product"]/fieldset/div[1]/div/select
    ${is_disabled}=    Get Element Attribute    //*[@id="product"]/fieldset/div[1]/div/select/option[1]    disabled
    
    Click Element    //*[@id="product"]/fieldset/div[1]/div/select/option[2]

    ${selected_value}=    Get Selected List Label    //*[@id="product"]/fieldset/div[1]/div/select

    Log To Console    ${selected_value}
    
    Should Be Equal As Strings    ${first_selected_option.lower()}    ${selected_value.lower()}

Access product details and Verify product details with related product
    [Arguments]    ${url}
    Go To    ${url}

    # get number of review 

    Page Should Contain Element    //*[@id="myTab"]/li[3]/a
    ${related_text}=    Get Text    //*[@id="myTab"]/li[3]
    ${related_num}=    Extract Number from Parentheses    ${related_text}
    
    Click Element    //*[@id="myTab"]/li[3]/a
    Element Should Be Visible    //*[@id="relatedproducts"]
    Scroll Element Into View    //*[@id="relatedproducts"]

    ${count_related}=    Get Element Count    //*[@id="relatedproducts"]/ul/li

    Log To Console    ${related_num}, ${count_related}

    Should Be Equal As Numbers    ${related_num}    ${count_related}




### Utility functions ###
Click on a product name and Verify product details with customer review
    [Arguments]    ${url}
    Go To    ${url}

    # get number of review 

    ${review_text}=    Get Text    //*[@id="myTab"]/li[2]
    # get number 2 from: Review (2)
    ${review_num}=    Extract Number from Parentheses    ${review_text}
 
    Log To Console    ${review_num}

    Click Element    //*[@id="myTab"]/li[2]/a
    Element Should Be Visible    //*[@id="review"]
    Scroll Element Into View    //*[@id="review"]
    
    ${count_review}=    Get Element Count    //*[@id="review"]/*[@id="current_reviews"]/div[@class="content"]

    Should Be Equal As Numbers    ${review_num}    ${count_review}

Extract Number from Parentheses
    [Arguments]    ${TEXT}
    # Review (20)
    # get (20)
    # split by space, get the last element
    # remove first and last character
    ${num}=    Split String    ${TEXT}    ${SPACE}
    ${num}=    Get From List    ${num}    -1
    ${num}=    Remove String    ${num}    (    )
    [Return]    ${num}

Verify product on sales 
    [Arguments]    ${product_name}    ${product_new_price}    ${product_old_price}
    ${pd_name}=    Get Text    ${PRODUCT_DETAIL_NAME}
    ${pd_new_price}=    Get Text    ${PRODUCT_DETAIL_NEW_PRICE}
    ${pd_old_price}=    Get Text    ${PRODUCT_DETAIL_OLD_PRICE}
    ${pd_breadcrum}=    Get Text    ${PRODUCT_DETAIL_BREADCRUMB}
    
    Should Be Equal As Strings        ${product_name.lower()}    ${pd_name.lower()}    
    Should Be Equal As Strings        ${product_new_price.lower()}    ${pd_new_price.lower()}
    Should Be Equal As Strings        ${product_old_price.lower()}    ${pd_old_price.lower()}

    ${pd_total}=    Get Text    ${PRODUCT_DETAIL_TOTAL_PRICE}
    Should Be Equal As Strings    ${product_new_price.lower()}    ${pd_total.lower()}  

    Page Should Contain Element    ${PRODUCT_DETAIL_DESC}
    Page Should Contain Element    ${PRODUCT_DETAIL_LATEST_PRODUCT_LIST}
    Element Should Contain    ${PRODUCT_DETAIL_LATEST_PRODUCT_LIST}    LATEST PRODUCTS
    Page Should Contain Element    ${PRODUCT_DETAIL_BREADCRUMB}
    Should Contain    ${pd_breadcrum.lower()}    ${product_name.lower()}

Verify product details 
    # enter page product detail 
    [Arguments]    ${product_name}    ${product_price}    ${is_in_stock}
    
    # verify product detail elements 
    ${pd_name}=    Get Text    ${PRODUCT_DETAIL_NAME}
    ${pd_price}=    Get Text    ${PRODUCT_DETAIL_PRICE}
    ${pd_breadcrum}=    Get Text    ${PRODUCT_DETAIL_BREADCRUMB}
    
    Should Be Equal As Strings        ${product_name.lower()}    ${pd_name.lower()}
    Should Be Equal As Strings        ${product_price.lower()}    ${pd_price.lower()}
    
    Page Should Contain Element    ${PRODUCT_DETAIL_DESC}
    Page Should Contain Element    ${PRODUCT_DETAIL_LATEST_PRODUCT_LIST}
    Element Should Contain    ${PRODUCT_DETAIL_LATEST_PRODUCT_LIST}    LATEST PRODUCTS
    Page Should Contain Element    ${PRODUCT_DETAIL_BREADCRUMB}
    Should Contain    ${pd_breadcrum.lower()}    ${product_name.lower()}

    IF    $is_in_stock == 'False'
        ${product_cart_text}=    Get Text    ${PRODUCT_ADD_TO_CART}
        Should Contain    ${product_cart_text.lower()}    out of stock
    ELSE    
        ${product_cart_text}=    Get Text    ${PRODUCT_ADD_TO_CART}
        Should Contain    ${product_cart_text.lower()}    add to cart
    END

Verify product detail from home
    [Arguments]    ${xpath_section}

    Scroll Element Into View    ${xpath_section}

    ${count_ele}=    Get Element Count    ${xpath_section}/div/div[@class='thumbnails list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12']

    Log To Console    count_ele: ${count_ele}

    FOR    ${index}    IN RANGE    1    ${count_ele}+1
        Log To Console    index: ${index}
        ${xpath_product_card}=    Set Variable    ${xpath_section}/div/div[@class='thumbnails list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12'][${index}]
        
        Click product card and Verify product details    ${xpath_product_card}
        
        Go Back
    END

Verify product detail from specials page
    ${count_ele}=    Get Element Count    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[@class='col-md-3 col-sm-6 col-xs-12']

    Log To Console    count_ele: ${count_ele}

    FOR    ${index}    IN RANGE    1    ${count_ele}+1
        Log To Console    index: ${index}
        ${xpath_product_card}=    Set Variable    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[@class='col-md-3 col-sm-6 col-xs-12'][${index}]
        
        Click product card and Verify product details    ${xpath_product_card}
        
        Go Back
    END

Click product card and Verify product details
    [Arguments]    ${xpath_section}
    Scroll Element Into View    ${xpath_section}

    # check card info 
    ${product_name}=    Get Text    ${xpath_section}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']

    ${has_sales}=    Run Keyword And Return Status    Page Should Contain Element    locator=${xpath_section}/div[@class='thumbnail']/span[@class='sale']
    Log To Console    has_sales: ${has_sales}

    IF    $has_sales
        ${product_new_price}=    Get Text    ${xpath_section}/div[@class='thumbnail']/div[@class='pricetag jumbotron']/div[@class='price']/div[@class='pricenew']
        ${product_old_price}=    Get Text    ${xpath_section}/div[@class='thumbnail']/div[@class='pricetag jumbotron']/div[@class='price']/div[@class='priceold']
    ELSE
        ${product_price}=    Get Text    ${xpath_section}/div[@class='thumbnail']/div[@class='pricetag jumbotron']/div[@class='price']/div[@class='oneprice']
    END

    ${is_in_stock}=    Run Keyword And Return Status    Page Should Not Contain Element    ${xpath_section}/div[@class='thumbnail']/div[@class='pricetag jumbotron']/span[@class='nostock']

    Click Element    ${xpath_section}/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']
    Wait Until Location Contains    ${PRODUCT_DETAIL_PATH}

    ${has_call_to_order}=    Run Keyword And Return Status    Page Should Contain    Call To Order
    Log To Console    has_call_to_order: ${has_call_to_order}

    IF    $has_call_to_order
        Page Should Not Contain Element    ${PRODUCT_DETAIL_TOTAL_PRICE}
    ELSE 
        Wait Until Keyword Succeeds    10s    2s    Element Should Contain    ${PRODUCT_DETAIL_TOTAL_PRICE}    $
    END

    # verify product detail elements 
    ${pd_name}=    Get Text    ${PRODUCT_DETAIL_NAME}
    ${pd_breadcrum}=    Get Text    ${PRODUCT_DETAIL_BREADCRUMB}
    
    Should Be Equal As Strings        ${product_name.lower()}    ${pd_name.lower()}
    
    Page Should Contain Element    ${PRODUCT_DETAIL_DESC}
    Page Should Contain Element    ${PRODUCT_DETAIL_LATEST_PRODUCT_LIST}
    Element Should Contain    ${PRODUCT_DETAIL_LATEST_PRODUCT_LIST}    LATEST PRODUCTS
    Page Should Contain Element    ${PRODUCT_DETAIL_BREADCRUMB}
    Should Contain    ${pd_breadcrum.lower()}    ${product_name.lower()}

    IF    $has_call_to_order
        ${product_cart_text}=    Get Text    ${PRODUCT_CALL_TO_ORDER}
        Should Contain    ${product_cart_text.lower()}    call to order
    ELSE IF    $is_in_stock
        ${product_cart_text}=    Get Text    ${PRODUCT_ADD_TO_CART}
        Should Contain    ${product_cart_text.lower()}    add to cart
    ELSE    
        ${product_cart_text}=    Get Text    ${PRODUCT_ADD_TO_CART}
        Should Contain    ${product_cart_text.lower()}    out of stock
    END

    IF    $has_sales
        ${pd_new_price}=    Get Text    ${PRODUCT_DETAIL_NEW_PRICE}
        ${pd_old_price}=    Get Text    ${PRODUCT_DETAIL_OLD_PRICE}
        Should Be Equal As Strings        ${product_new_price.lower()}    ${pd_new_price.lower()}
        Should Be Equal As Strings        ${product_old_price.lower()}    ${pd_old_price.lower()}
        IF    not $has_call_to_order
            ${pd_total}=    Get Text    ${PRODUCT_DETAIL_TOTAL_PRICE}
            Should Be Equal As Strings    ${product_new_price.lower()}    ${pd_total.lower()}
        END
    ELSE
        ${pd_price}=    Get Text    ${PRODUCT_DETAIL_PRICE}
        Should Be Equal As Strings        ${product_price.lower()}    ${pd_price.lower()}
    END

Verify product detail from home - brands
    Scroll Element Into View    //*[@id="block_frame_listing_block_1774"]

    # get number of brands
    ${count_brands}=    Get Element Count    //*[@id="brandcarousal"]/li
    Log To Console    count_brands: ${count_brands}

    FOR    ${index}    IN RANGE    1    ${count_brands}+1
        Log To Console    --brand index: ${index}
        ${xpath_brand}=    Set Variable    //*[@id="brandcarousal"]/li[${index}]
        
        Click Element    ${xpath_brand}
        Wait Until Location Contains    ${BRAND_PATH}

        ${count_ele}=    Get Element Count    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[@class='col-md-3 col-sm-6 col-xs-12']

        Log To Console    count_ele: ${count_ele}

        FOR    ${index}    IN RANGE    1    ${count_ele}+1
            Log To Console    index: ${index}
            ${xpath_product_card}=    Set Variable    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[@class='col-md-3 col-sm-6 col-xs-12'][${index}]
            
            Click product card and Verify product details    ${xpath_product_card}
            
            Go Back
        END

        Go Back
        Wait Until Location Contains    ${URL_HOME}

    END

Verify product detail from sub category
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

    FOR    ${index}    IN RANGE    1    ${count_sub_category}+1
        Log To Console    --sub category index: ${index}
        ${xpath_sub_category}=    Set Variable    ${xpath_section}/div[@class='subcategories']/ul[1]/li[${index}]
        
        Click Element    ${xpath_sub_category}
        Wait Until Location Contains    ${SUB_CATEGORY_PATH}

        ${count_ele}=    Get Element Count    //*[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='contentpanel']/div[@class='thumbnails grid row list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12']

        Log To Console    count_ele: ${count_ele}

        FOR    ${index}    IN RANGE    1    ${count_ele}+1
            Log To Console    index: ${index}
            ${xpath_product_card}=    Set Variable    //*[@id="maincontainer"]/div/div/div/div/div/div[@class='col-md-3 col-sm-6 col-xs-12'][${index}]
            
            Click product card and Verify product details    ${xpath_product_card}
            
            Go Back
        END

        Go Back
        Wait Until Location Contains    ${URL_HOME}
        Mouse Over    ${xpath_section}

    END

Verify product detail from search result
    ${count_ele}=    Get Element Count    //div[@id='maincontainer']/div[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='contentpanel']/div[@class='thumbnails grid row list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12']

    Log To Console    count_ele: ${count_ele}

    FOR    ${index}    IN RANGE    1    ${count_ele}+1
        Log To Console    index: ${index}
        ${xpath_product_card}=    Set Variable    //div[@id='maincontainer']/div[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='contentpanel']/div[@class='thumbnails grid row list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12'][${index}]
        
        Click product card and Verify product details    ${xpath_product_card}
        
        Go Back
    END
    
    





    