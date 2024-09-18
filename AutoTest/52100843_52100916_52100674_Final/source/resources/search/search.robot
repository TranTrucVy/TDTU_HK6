*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../../resources/common.robot
Resource          ../../variables/search.robot


*** Variables ***
${LOGIN_URL}       https://automationteststore.com/index.php?rt=account/login


*** Keywords ***
Seach product no keyword
    Page Should Contain Element    ${SEARCH_INPUT}
    Page Should Contain Element    ${SEARCH_BTN}

    Click Element    ${SEARCH_BTN}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${SEARCH_PAGE_TITLE}
    # get location 
    ${location}    Get Location    
    Should Contain    ${location}    ${SEARCH_PATH}
    Page Should Contain    There is no product that matches the search criteria.

Search with no key word & Press Enter
    Page Should Contain Element    ${SEARCH_INPUT}
    Page Should Contain Element    ${SEARCH_BTN}

    Press Keys    ${SEARCH_BTN}    ENTER
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${SEARCH_PAGE_TITLE}
    # get location 
    ${location}    Get Location    
    Should Contain    ${location}    ${SEARCH_PATH}
    Page Should Contain    There is no product that matches the search criteria.

Verify search result keyword not found
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${SEARCH_PAGE_TITLE}
    # get location 
    ${location}    Get Location    
    Should Contain    ${location}    ${SEARCH_PATH}
    Page Should Contain    There is no product that matches the search criteria.

Search with no key word & Click search btn
    Page Should Contain Element    ${SEARCH_INPUT}
    Page Should Contain Element    ${SEARCH_BTN}

    Click Element    ${SEARCH_BTN}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${SEARCH_PAGE_TITLE}
    # get location 
    ${location}    Get Location    
    Should Contain    ${location}    ${SEARCH_PATH}
    Page Should Contain    There is no product that matches the search criteria.

Search with key word & Press Enter
    [Arguments]    ${key_product}
    Page Should Contain Element    ${SEARCH_INPUT}
    Page Should Contain Element    ${SEARCH_BTN}

    Input Text    ${SEARCH_INPUT}    ${key_product}
    Press Keys    ${SEARCH_BTN}    ENTER

Search with key word & Click search btn
    [Arguments]    ${key_product}
    Page Should Contain Element    ${SEARCH_INPUT}
    Page Should Contain Element    ${SEARCH_BTN}

    Input Text    ${SEARCH_INPUT}    ${key_product}
    Click Element    ${SEARCH_BTN}

Search by product name
    [Arguments]    ${keyword}    ${category}
    Page Should Contain Element    ${SEARCH_INPUT}
    Page Should Contain Element    ${SEARCH_BTN}
    Input Text    ${SEARCH_INPUT}    ${keyword}

    # select category
    Click Element    ${SEARCH_INPUT}
    Element Should Be Visible    ${SEARCH_DROPDOWN}

    IF    $category == 'apparel & accessories'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][2]
    ELSE IF    $category == 'makeup'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][3]
    ELSE IF    $category == 'skincare'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][4]
    ELSE IF    $category == 'fragrance'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][5]
    ELSE IF    $category == 'men'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][6]
    ELSE IF    $category == 'hair care'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][7]
    ELSE IF    $category == 'books'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][8]
    END

    Click Element    ${SEARCH_BTN}

Search by description    
    [Arguments]    ${keyword}    ${category}
    Click Element    ${SEARCH_BTN}
    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${SEARCH_PAGE_TITLE}
    # get location
    ${location}    Get Location
    Should Contain    ${location}    ${SEARCH_PATH}
    Page Should Contain    There is no product that matches the search criteria.

    Input Text    ${SEARCH_PAGE_INPUT}    ${keyword}
    Click Element    ${SEARCH_PAGE_SELECT_DESC}
    Click Element    ${SEARCH_PAGE_BTN}


Verify search result with keyword product name 
    [Arguments]    ${name}
    ${count_item}    Get Element Count    ${SEARCH_RESULT_ITEM}
    Log To Console    ${count_item}

    ${name}=    Convert To Lower Case    ${name}
    ${is_match3}=    Set Variable    False

    IF    ${count_item} == 0
        ${product_detail_name}=    Get Text    //*[@id="product_details"]/div/div[2]/div/div/h1
        ${product_detail_name}=    Convert To Lower Case    ${product_detail_name}

        ${is_match1}=    Run Keyword And Return Status    Should Contain    ${PRODUCT_DETAIL_NAME}    ${name}
    
        # if is_match1 is true, exit keyword
        Run Keyword If    ${is_match1}    Pass Execution    message: Product is matched
        ${is_match2}=    Run Keyword And Return Status    Should Contain    ${PRODUCT_DETAIL_DESC}    ${name}
        # if is_match2 is true, exit keyword
        Run Keyword If    ${is_match2}    Pass Execution    message: Product is matched

        # if tags exist, check tags
        ${is_exist}=    Run Keyword And Return Status    Page Should Contain Element    ${SWITCH_TAB_TAGS}

        IF    ${is_exist}
            Click Element    ${SWITCH_TAB_TAGS}
            ${product_tags_text}=    Get Text    ${PRODUCT_DETAIL_TAGS}
            ${product_tags_text}=    Convert To Lower Case    ${product_tags_text}
            ${is_match3}=    Run Keyword And Return Status    Should Contain    ${product_tags_text}    ${name}
            Log To Console    __tags: ${product_tags_text}
            Run Keyword If    ${is_match3}    Pass Execution    message: Product is matched
        END

        # if one of the element is matched, then the product is matched
        # else fail 

        Run Keyword If    ${is_match1} or ${is_match2} or ${is_match3}    Log To Console    Product is matched
        Run Keyword If    not ${is_match1} and not ${is_match2} and not ${is_match3}    Fail    Product is not matched

    ELSE
        # get product result card 
        ${product_item_names}=    Get WebElements    ${SEARCH_RESULT_NAME}

        ${len}=    Get Length    ${product_item_names}
        ${is_match}=    Set Variable    False

        FOR    ${i}    IN RANGE    0    ${len}
            ${idx}=    Evaluate    ${i} + 1
            ${idx}=    Convert To String    ${idx}
            Log To Console    idx: ${idx}

            # click product card 
            ${xpath}=    Set Variable    //*[@id="maincontainer"]/div[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='contentpanel']/div[@class='thumbnails grid row list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12'][${idx}]/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']
            Page Should Contain Element    ${xpath}
            Scroll Element Into View    ${xpath}
            ${link}=    Get WebElement    ${xpath}
            Click Element    ${link}

            ${location}=    Get Location
            Wait Until Keyword Succeeds    10s    2s    Should Contain    ${location}    https://automationteststore.com/index.php?rt=product/product
            
            ${product_detail_title}=    Get Text    ${PRODUCT_DETAIL_NAME}
            ${product_detail_title}=    Convert To Lower Case    ${product_detail_title}
            ${is_match}=    Run Keyword And Return Status    Should Contain    ${product_detail_title}    ${name}
            Log To Console    __name: ${product_detail_title}, ${is_match}, ${name}
            Run Keyword If    ${is_match}    Exit For Loop

            # if tags exist, check tags
            ${is_exist}=    Run Keyword And Return Status    Page Should Contain Element    ${SWITCH_TAB_TAGS}

            IF    ${is_exist}
                Click Element    ${SWITCH_TAB_TAGS}
                ${is_match}=    Run Keyword And Return Status    Element Should Contain    ${PRODUCT_DETAIL_TAGS}    ${name}
                ${xx}=    Get Text    ${PRODUCT_DETAIL_TAGS}
                Log To Console    __tags: ${xx}
                Run Keyword If    ${is_match}    Exit For Loop
            END

            Go Back   # go back to search result page
            Location Should Contain    ${SEARCH_PATH}
        END
        
        Should Be True    ${is_match}

    END

Verify search result with keyword product description
    [Arguments]    ${description}
    ${count_item}    Get Element Count    ${SEARCH_RESULT_ITEM}
    Log To Console    ${count_item}

    ${description}=    Convert To Lower Case    ${description}
    
    IF    ${count_item} == 0
        ${product_detail_description}=    Get Text    //*[@id="description"]
        ${product_detail_description}=    Convert To Lower Case    ${product_detail_description}
        Should Contain    ${product_detail_description}    ${description}
    ELSE
        Click Element    ${SWITCH_VIEW_LIST}

        # get product descriptions
        ${product_item_descriptions}=    Get WebElements    ${SEARCH_RESULT_DESC}
        
        ${len}=    Get Length    ${product_item_descriptions}
        # Log To Console    len: ${len}

        FOR    ${element}    IN    @{product_item_descriptions}
            ${text}=    Get Text    ${element}
            # lower case for compare
            ${text}=    Convert To Lower Case    ${text}
            ${description}=    Convert To Lower Case    ${description}
            
            ${is_match}=    Run Keyword And Return Status    Should Contain    ${text}    ${description}
            Run Keyword If    ${is_match}    Exit For Loop

        END
        
        Should Be True    ${is_match}

    END

Search by product model & description 
    [Arguments]    ${keyword}    ${category}
    Click Element    ${SEARCH_BTN}
    Wait Until Keyword Succeeds    10s    2s    Page Should Contain Element    ${SEARCH_PAGE_TITLE}
    # get location
    ${location}    Get Location
    Should Contain    ${location}    ${SEARCH_PATH}
    Page Should Contain    There is no product that matches the search criteria.

    Input Text    ${SEARCH_PAGE_INPUT}    ${keyword}
    Click Element    ${SEARCH_PAGE_SELECT_DESC}
    Click Element    ${SEARCH_PAGE_SELECT_PRODUCT}
    Click Element    ${SEARCH_PAGE_BTN}

Verify search result with keyword product model & description
    [Arguments]    ${name}

    ${count_item}    Get Element Count    ${SEARCH_RESULT_ITEM}
    Log To Console    ${count_item}

    ${name}=    Convert To Lower Case    ${name}

    IF    ${count_item} == 0
        ${product_detail_name}=    Get Text    //*[@id="product_details"]/div/div[2]/div/div/h1
        ${product_detail_name}=    Convert To Lower Case    ${product_detail_name}

        ${is_match1}=    Run Keyword And Return Status    Element Should Contain    ${PRODUCT_DETAIL_NAME}    ${name}
        
        ${is_match2}=    Run Keyword And Return Status    Element Should Contain    ${PRODUCT_DETAIL_DESC}    ${name}

        Click Element    ${SWITCH_TAB_TAGS}
        ${is_match3}=    Run Keyword And Return Status    Element Should Contain    ${PRODUCT_DETAIL_TAGS}    ${name}

        # if one of the element is matched, then the product is matched
        # else fail 
        Run Keyword If    ${is_match1} or ${is_match2} or ${is_match3}    Log To Console    Product is matched    
        Run Keyword If    not ${is_match1} and not ${is_match2} and not ${is_match3}    Fail    Product is not matched

    ELSE
        # get product result card 
        ${product_item_names}=    Get WebElements    ${SEARCH_RESULT_NAME}

        ${len}=    Get Length    ${product_item_names}

        FOR    ${i}    IN RANGE    0    ${len}
            ${idx}=    Evaluate    ${i} + 1
            ${idx}=    Convert To String    ${idx}
            Log To Console    idx: ${idx}

            # click product card 
            ${xpath}=    Set Variable    //*[@id="maincontainer"]/div[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='contentpanel']/div[@class='thumbnails grid row list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12'][${idx}]/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']
            Page Should Contain Element    ${xpath}
            Scroll Element Into View    ${xpath}
            ${link}=    Get WebElement    ${xpath}
            Click Element    ${link}

            ${location}=    Get Location
            Wait Until Keyword Succeeds    10s    2s    Should Contain    ${location}    https://automationteststore.com/index.php?rt=product/product
            
            ${product_detail_title}=    Get Text    ${PRODUCT_DETAIL_NAME}
            ${product_detail_title}=    Convert To Lower Case    ${product_detail_title}
            ${is_match}=    Run Keyword And Return Status    Should Contain    ${product_detail_title}    ${name}
            ${xx}=    Get Text    ${PRODUCT_DETAIL_NAME}
            # Log To Console    __name: ${xx}, ${is_match}, ${product_detail_title}
            Run Keyword If    ${is_match}    Exit For Loop

            ${is_math}=    Run Keyword And Return Status    Element Should Contain    ${PRODUCT_DETAIL_DESC}    ${name} 
            ${xx}=    Get Text    ${PRODUCT_DETAIL_DESC}
            Log To Console    __desc: ${xx}   
            Run Keyword If    ${is_match}    Exit For Loop
            
            # if tags exist, check tags
            ${is_exist}=    Run Keyword And Return Status    Page Should Contain Element    ${SWITCH_TAB_TAGS}

            IF    ${is_exist}
                Click Element    ${SWITCH_TAB_TAGS}
                ${is_match}=    Run Keyword And Return Status    Element Should Contain    ${PRODUCT_DETAIL_TAGS}    ${name}
                ${xx}=    Get Text    ${PRODUCT_DETAIL_TAGS}
                Log To Console    __tags: ${xx}
                Run Keyword If    ${is_match}    Exit For Loop
            END

            Go Back   # go back to search result page
            ${current_location}=    Get Location
            Should Contain    ${current_location}    ${SEARCH_PATH}
        END
    END

Switch from product model to description
    [Arguments]    ${keyword}    ${category}
    # check if select category is ${category}
    ${ele_cate}=    Get WebElement    ${SEARCH_PAGE_CATEGORY}/option[@selected="selected"]
    ${selected_option}=    Get Text    ${ele_cate}
    Log To Console    ${selected_option}
    # Checkbox Should Be Selected    ${SEARCH_PAGE_SELECT_PRODUCT}

    Click Element    ${SEARCH_PAGE_SELECT_DESC}

    Click Element    ${SEARCH_PAGE_BTN}

Add search with description
    [Arguments]    ${keyword}    ${category}
    # check if select category is ${category}
    ${ele_cate}=    Get WebElement    ${SEARCH_PAGE_CATEGORY}/option[@selected="selected"]
    ${selected_option}=    Get Text    ${ele_cate}
    ${selected_option}=    Convert To Lower Case    ${selected_option}
    ${category}=    Convert To Lower Case    ${category}
    Should Contain    ${selected_option}    ${category}

    Click Element    ${SEARCH_PAGE_SELECT_DESC}
    Click Element    ${SEARCH_PAGE_SELECT_PRODUCT}

    Click Element    ${SEARCH_PAGE_BTN}

Switch from product description to model
    [Arguments]    ${keyword}    ${category}
    # check if select category is ${category}
    ${ele_cate}=    Get WebElement    ${SEARCH_PAGE_CATEGORY}/option[@selected="selected"]
    ${selected_option}=    Get Text    ${ele_cate}
    ${selected_option}=    Convert To Lower Case    ${selected_option}
    ${category}=    Convert To Lower Case    ${category}
    Should Contain    ${selected_option}    ${category}

    # select desc must be selected
    Checkbox Should Be Selected    ${SEARCH_PAGE_SELECT_DESC}

    Click Element    ${SEARCH_PAGE_SELECT_DESC}
    Click Element    ${SEARCH_PAGE_SELECT_PRODUCT}
    Click Element    ${SEARCH_PAGE_BTN}


### Sub category ###
Search by product name sub category
    [Arguments]    ${keyword}    ${category}    ${sub_category}
    Page Should Contain Element    ${SEARCH_INPUT}
    Page Should Contain Element    ${SEARCH_BTN}

    # select category
    Click Element    ${SEARCH_INPUT}
    Element Should Be Visible    ${SEARCH_DROPDOWN}

    IF    $category == 'apparel & accessories'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][2]
    ELSE IF    $category == 'makeup'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][3]
    ELSE IF    $category == 'skincare'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][4]
    ELSE IF    $category == 'fragrance'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][5]
    ELSE IF    $category == 'men'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][6]
    ELSE IF    $category == 'hair care'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][7]
    ELSE IF    $category == 'books'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][8]
    END

    Click Element    ${SEARCH_BTN}
    # get location
    ${location}    Get Location
    Wait Until Keyword Succeeds    10s    2s    Page Should Contain    There is no product that matches the search criteria.

    Input Text    ${SEARCH_PAGE_INPUT}    ${keyword}
    ${value}=    Get Option Value By Category Name    ${category}    ${sub_category}
    Log To Console    value: ${value}
    Select From List By Value    ${SEARCH_PAGE_CATEGORY}    ${value}

    Click Element    ${SEARCH_PAGE_BTN}

    Sleep    3s
    ${location}=    Get Location
    Log To Console    ${location}

### continue here ### 
# test search bar at result page input, recheck 
# continue search 

Get Option Value By Category Name
    [Arguments]    ${category_name}    ${sub_category}

    ${category_name}=    Convert To Lower Case    ${category_name}
    ${sub_category}=    Convert To Lower Case    ${sub_category}

    ${options}=    Get WebElements    xpath=//select[@id='category_id']/option
    ${flag}=    Set Variable    False
    FOR    ${option}    IN    @{options}
        ${text}=    Get Text    ${option}
        ${text}=    Evaluate    '${text}'.strip()
        ${text}=    Convert To Lower Case    ${text}
        
        IF    $text == $category_name
            ${flag}=    Set Variable    True
        END

        ${is_contain}=    Run Keyword And Return Status    Should Contain    ${text}    ${sub_category}

        IF    ${is_contain} and ${flag}
            ${value}=    Get Element Attribute    ${option}    value
            RETURN    ${value}
        END
    END

    RETURN    ${EMPTY}

Search with product model number
    [Arguments]    ${keyword}    ${category}
    Page Should Contain Element    ${SEARCH_INPUT}
    Page Should Contain Element    ${SEARCH_BTN}
    Input Text    ${SEARCH_INPUT}    ${keyword}

    # select category
    Click Element    ${SEARCH_INPUT}
    Element Should Be Visible    ${SEARCH_DROPDOWN}

    IF    $category == 'apparel & accessories'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][2]
    ELSE IF    $category == 'makeup'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][3]
    ELSE IF    $category == 'skincare'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][4]
    ELSE IF    $category == 'fragrance'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][5]
    ELSE IF    $category == 'men'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][6]
    ELSE IF    $category == 'hair care'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][7]
    ELSE IF    $category == 'books'
        Click Element    //*[@id="search-category"]/li[@class="search-category"][8]
    END

    Click Element    ${SEARCH_BTN}

    Wait Until Keyword Succeeds    10s    1s    Page Should Contain Element    ${SEARCH_PAGE_TITLE}
    # get location
    ${location}    Get Location
    Should Contain    ${location}    ${SEARCH_PATH}
    Page Should Contain    There is no product that matches the search criteria.

    Input Text    ${SEARCH_PAGE_INPUT}    ${keyword}
    Click Element    ${SEARCH_PAGE_SELECT_PRODUCT}
    Click Element    ${SEARCH_PAGE_BTN}

Verify search result with product model number 
    [Arguments]    ${model_number}
    Page Should Contain Element    ${PRODUCT_DETAIL_DESC}
    ${desc}=    Get Text    ${PRODUCT_DETAIL_DESC}
    ${desc}=    Convert To Lower Case    ${desc}

    Should Contain    ${desc}    model
    Should Contain    ${desc}    ${model_number}
