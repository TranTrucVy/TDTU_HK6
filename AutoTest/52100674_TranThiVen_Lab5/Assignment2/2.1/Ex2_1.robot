*** Settings ***
Documentation     Lab 05 - Ex2
Library           SeleniumLibrary
Library           Collections
Library           BuiltIn
Library           String

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/tables/
${TABLE}          xpath=//table[@id='tablepress-1']
${PREV_BTN}        xpath=//a[@id='tablepress-1_previous']
${NEXT_BTN}       xpath=//a[@id='tablepress-1_next']
${MAX_ENTRIES}    25
${DEFAULT_ENTRIES}    10

*** Test Cases ***
TC: Test Table 1
    Open My Browser    ${URL}    ${BROWSER}

    #get the total number of rows in the table
    ${CountRow1}=    Get Element Count    xpath=//figure[@class='wp-block-table']/table/tbody/tr/td[1]
    ${CountRow2}=    Get Element Count    xpath=//figure[@class='wp-block-table']/table/tbody/tr/td[2]
    Should Be Equal As Numbers    ${CountRow1}    4
    Should Be Equal As Numbers    ${CountRow2}    4

    # get the total of column in the table
    Scroll Element Into View    xpath=//figure[@class='wp-block-table']/table/tbody/tr[1]
    ${table_row}=    Get Element Count    xpath=//figure[@class='wp-block-table']/table/tbody/tr
    FOR    ${i}    IN RANGE    1    ${table_row}+1
        ${count_col}=    Get Element Count    xpath=//figure[@class='wp-block-table']/table/tbody/tr[${i}]/td
        Should Be Equal As Numbers    ${count_col}    2
    END

    #verify header
    Table Cell Should Contain    xpath=//figure[@class='wp-block-table']/table    1    1    Item
    Table Cell Should Contain    xpath=//figure[@class='wp-block-table']/table    1    2    Price

    #verify cell data
    Table Cell Should Contain    xpath=//figure[@class='wp-block-table']/table    2    1    Oranges
    Table Cell Should Contain    xpath=//figure[@class='wp-block-table']/table    2    2    $3.99
    Table Cell Should Contain    xpath=//figure[@class='wp-block-table']/table    3    1    Laptop
    Table Cell Should Contain    xpath=//figure[@class='wp-block-table']/table    3    2    $1200.00
    Table Cell Should Contain    xpath=//figure[@class='wp-block-table']/table    4    1    Marbles
    Table Cell Should Contain    xpath=//figure[@class='wp-block-table']/table    4    2    $1.25
    
    Close All Browsers

TC1: Display 10 entries as default
    Open My Browser    ${URL}    ${BROWSER}

    Wait Until Element Is Visible    xpath=//div[@id='tablepress-1_length']/label/select    10
    Page Should Contain Element    xpath=//div[@id='tablepress-1_length']/label/select

    # get select value 
    ${Select}=    Get Selected List Value    xpath=//div[@id='tablepress-1_length']/label/select
    Should Be Equal As Strings    ${Select}    ${DEFAULT_ENTRIES}

    # total of rows in table
    ${Rows}=    get element count    xpath=//table[@id='tablepress-1']/tbody/tr
    Should Be Equal As Numbers    ${Rows}    ${DEFAULT_ENTRIES}

    # check button enabled/disabled
    Scroll Element Into View    ${NEXT_BTN}
    ${class_next}=    Get Element Attribute    ${NEXT_BTN}   class
    Should Not Contain    ${class_next}    disabled
    ${class_prev}=    Get Element Attribute    ${PREV_BTN}   class
    Should Contain    ${class_prev}    disabled

    # change entries from 10 to 20 
    Click Link    ${NEXT_BTN}
    ${class_next}=    Get Element Attribute    ${NEXT_BTN}   class
    Should Not Contain    ${class_next}    disabled
    ${class_prev}=    Get Element Attribute    ${PREV_BTN}   class
    Should Not Contain    ${class_prev}    disabled

    # change entries from 20 to 25 
    Click Link    ${NEXT_BTN}
    ${class_next}=    Get Element Attribute    ${NEXT_BTN}   class
    Should Contain    ${class_next}    disabled
    ${class_prev}=    Get Element Attribute    ${PREV_BTN}   class
    Should Not Contain    ${class_prev}    disabled

    # there must be 5 rows left
    ${Rows}=    get element count    xpath=//table[@id='tablepress-1']/tbody/tr
    Should Be Equal As Numbers    ${Rows}    5
    
    Close All Browsers

TC2: Display 25 entries
    Open My Browser    ${URL}    ${BROWSER}

    Wait Until Element Is Visible    xpath=//div[@id='tablepress-1_length']/label/select    10
    Page Should Contain Element    xpath=//div[@id='tablepress-1_length']/label/select

    Select From List By Value    xpath=//*[@id="tablepress-1_length"]/label/select    25
    ${Select}=    Get Selected List Value    xpath=//div[@id='tablepress-1_length']/label/select
    Should Be Equal As Strings    ${Select}    25

    # total of rows in table
    ${Rows}=    get element count    xpath=//table[@id='tablepress-1']/tbody/tr
    Should Be Equal As Numbers    ${Rows}    25

    # check button enabled/disabled
    Scroll Element Into View    ${NEXT_BTN}
    ${class_next}=    Get Element Attribute    ${NEXT_BTN}   class
    Should Contain    ${class_next}    disabled
    ${class_prev}=    Get Element Attribute    ${PREV_BTN}   class
    Should Contain    ${class_prev}    disabled
    
    Close All Browsers

TC3: Display 50 entries
    Open My Browser    ${URL}    ${BROWSER}

    Wait Until Element Is Visible    xpath=//div[@id='tablepress-1_length']/label/select    10
    Page Should Contain Element    xpath=//div[@id='tablepress-1_length']/label/select

    Select From List By Value    xpath=//*[@id="tablepress-1_length"]/label/select    50
    ${Select}=    Get Selected List Value    xpath=//div[@id='tablepress-1_length']/label/select
    Should Be Equal As Strings    ${Select}   50

    # total of rows in table
    ${Rows}=    get element count    xpath=//table[@id='tablepress-1']/tbody/tr
    Should Be Equal As Numbers    ${Rows}    25

    # check button enabled/disabled
    Scroll Element Into View    ${NEXT_BTN}
    ${class_next}=    Get Element Attribute    ${NEXT_BTN}   class
    Should Contain    ${class_next}    disabled
    ${class_prev}=    Get Element Attribute    ${PREV_BTN}   class
    Should Contain    ${class_prev}    disabled
    
    Close All Browsers

TC4: Display 100 entries
    Open My Browser    ${URL}    ${BROWSER}

    Wait Until Element Is Visible    xpath=//div[@id='tablepress-1_length']/label/select    10
    Page Should Contain Element    xpath=//div[@id='tablepress-1_length']/label/select

    Select From List By Value    xpath=//*[@id="tablepress-1_length"]/label/select    100
    ${Select}=    Get Selected List Value    xpath=//div[@id='tablepress-1_length']/label/select
    Should Be Equal As Strings    ${Select}    100

    # total of rows in table
    ${Rows}=    get element count    xpath=//table[@id='tablepress-1']/tbody/tr
    Should Be Equal As Numbers    ${Rows}    25

    # check button enabled/disabled
    Scroll Element Into View    ${NEXT_BTN}
    ${class_next}=    Get Element Attribute    ${NEXT_BTN}   class
    Should Contain    ${class_next}    disabled
    ${class_prev}=    Get Element Attribute    ${PREV_BTN}   class
    Should Contain    ${class_prev}    disabled
    
    Close All Browsers

TC5: String keyword = cell value
    Open My Browser    ${URL}    ${BROWSER}

    Page Should Contain Element    //div[@id='tablepress-1_filter']/label/input
    Scroll Element Into View    //div[@id='tablepress-1_filter']/label/input

    Clear search input

    Scroll Element Into View    //div[@id='tablepress-1_filter']/label/input
    Input Text        //div[@id='tablepress-1_filter']/label/input    India 
    Textfield Value Should Be    //div[@id='tablepress-1_filter']/label/input    India
    
    ${res}=    Verify Search Result    ${TABLE}    India
    Should Be True    ${res}
    Log To Console    Search result = ${res}
    
    Close All Browsers

TC6: String keyword = part of cell value
    Open My Browser    ${URL}    ${BROWSER}
    Clear search input

    Scroll Element Into View    //div[@id='tablepress-1_filter']/label/input
    Input Text        //div[@id='tablepress-1_filter']/label/input    ind 
    Textfield Value Should Be    //div[@id='tablepress-1_filter']/label/input    ind
    
    ${res}=    Verify Search Result    ${TABLE}    ind
    Should Be True    ${res}
    Log To Console    Search result = ${res}
    
    Close All Browsers

TC7: Number keyword = cell value
    Open My Browser    ${URL}    ${BROWSER}
    Clear search input

    Scroll Element Into View    //div[@id='tablepress-1_filter']/label/input
    Input Text        //div[@id='tablepress-1_filter']/label/input    340 
    Textfield Value Should Be    //div[@id='tablepress-1_filter']/label/input    340
    
    ${res}=    Verify Search Result    ${TABLE}    340
    Should Be True    ${res}
    Log To Console    Search result = ${res}
    
    Close All Browsers

TC8: Number keyword = part of cell value
    Open My Browser    ${URL}    ${BROWSER}
    Clear search input

    Scroll Element Into View    //div[@id='tablepress-1_filter']/label/input
    Input Text        //div[@id='tablepress-1_filter']/label/input    11 
    Textfield Value Should Be    //div[@id='tablepress-1_filter']/label/input    11
    
    ${res}=    Verify Search Result    ${TABLE}    11
    Should Be True    ${res}
    Log To Console    Search result = ${res}
    
    Close All Browsers

TC9: Keyword not compatible
    Open My Browser    ${URL}    ${BROWSER}
    Clear search input

    Scroll Element Into View    //div[@id='tablepress-1_filter']/label/input
    Input Text        //div[@id='tablepress-1_filter']/label/input    oh 
    Textfield Value Should Be    //div[@id='tablepress-1_filter']/label/input    oh
    
    ${res}=    Verify Search Result    ${TABLE}    oh
    Should Be True    ${res}
    Log To Console    Search result = ${res}
    
    Close All Browsers

TC10: Check sorted Column 1
    Open My Browser    ${URL}    ${BROWSER}

    Scroll Element Into View    ${TABLE}/thead/tr/th[1]

    # select display 10 entries
    Select From List By Value    xpath=//*[@id="tablepress-1_length"]/label/select    10
    ${Select}=    Get Selected List Value    xpath=//div[@id='tablepress-1_length']/label/select
    Should Be Equal As Strings    ${Select}    10

    Scroll Element Into View    locator=${TABLE}/thead/tr/th[1]

    # 1 click - must be sorted asc
    Click Element    xpath=//*[@id="tablepress-1"]/thead/tr/th[1]
    ${is_sorted}=    Check Column Sorted    1    asc    number
    Should Be True    ${is_sorted}
    Log To Console    Column sorted = ${is_sorted}

    # 2 click - must be sorted desc
    Click Element    xpath=//*[@id="tablepress-1"]/thead/tr/th[1]
    ${is_sorted}=    Check Column Sorted    1    desc    number
    Should Be True    ${is_sorted}
    Log To Console    Column sorted = ${is_sorted}

    # 3 click - must be sorted asc
    Click Element    xpath=//*[@id="tablepress-1"]/thead/tr/th[1]
    ${is_sorted}=    Check Column Sorted    1    asc    number
    Should Be True    ${is_sorted}
    Log To Console    Column sorted = ${is_sorted}
    
    Close All Browsers

TC11: Check sorted Column 2
    Open My Browser    ${URL}    ${BROWSER}
    Clear search input
    Scroll Element Into View    ${TABLE}/thead/tr/th[2]

    # 1 click - must be sorted asc
    Click Element    xpath=//*[@id="tablepress-1"]/thead/tr/th[2]
    ${is_sorted}=    Check Column Sorted    2    asc    string
    Should Be True    ${is_sorted}
    Log To Console    Column sorted = ${is_sorted}

    # 2 click - must be sorted desc
    Click Element    xpath=//*[@id="tablepress-1"]/thead/tr/th[2]
    ${is_sorted}=    Check Column Sorted    2    desc    string
    Should Be True    ${is_sorted}
    Log To Console    Column sorted = ${is_sorted}

    # 3 click - must be sorted asc
    Click Element    xpath=//*[@id="tablepress-1"]/thead/tr/th[2]
    ${is_sorted}=    Check Column Sorted    2    asc    string
    Should Be True    ${is_sorted}
    Log To Console    Column sorted = ${is_sorted}
    
    Close All Browsers

TC12: Check sorted Column 3
    Open My Browser    ${URL}    ${BROWSER}
    Clear search input
    Scroll Element Into View    ${TABLE}/thead/tr/th[3]

    # 1 click - must be sorted asc
    Click Element    xpath=//*[@id="tablepress-1"]/thead/tr/th[3]
    ${is_sorted}=    Check Column Sorted    3    asc    number
    Should Be True    ${is_sorted}
    Log To Console    Column sorted = ${is_sorted}

    # 2 click - must be sorted desc
    Click Element    xpath=//*[@id="tablepress-1"]/thead/tr/th[3]
    ${is_sorted}=    Check Column Sorted    3    desc    number
    Should Be True    ${is_sorted}
    Log To Console    Column sorted = ${is_sorted}

    # 3 click - must be sorted asc
    Click Element    xpath=//*[@id="tablepress-1"]/thead/tr/th[3]
    ${is_sorted}=    Check Column Sorted    3    asc    number
    Should Be True    ${is_sorted}
    Log To Console    Column sorted = ${is_sorted}

*** Keywords ***
Open My Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Open Browser 800x600
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    800    600

Clear search input
    Clear Element Text    locator=//div[@id='tablepress-1_filter']/label/Input
    ${input}=    Get Value    //div[@id='tablepress-1_filter']/label/input
    Should Be Empty    ${input}

Get Column Data
    [Arguments]    ${col}
    ${column_element}=   Get WebElements    ${TABLE}/tbody/tr/td[${col}]
    ${column_data}=    Create List
    ${no_rows}=   Get Length    ${column_element}
    FOR    ${i}    IN RANGE    ${no_rows} 
        ${data}=    Get Text    ${column_element}[${i}]
        Append To List    ${column_data}    ${data}
    END
    RETURN    ${column_data}

Check Column Sorted 
    [Arguments]    ${col}    ${order}    ${type}
    ${res}=    Set Variable    ${True}
    ${data}=    Get Column Data    ${col}
    Log To Console    _data: ${data}

    IF    '${type}' == 'number'
        ${data}=    Evaluate    [float(item.replace(',', '')) for item in ${data}]
    END

    ${sorted_data}=    Evaluate    sorted(${data}, reverse=${order.lower() == 'desc'})

    Log To Console    data: ${data}
    Log To Console    sorted_data: ${sorted_data}

    ${res}=    Run Keyword And Return Status    Lists Should Be Equal    ${data}    ${sorted_data}
    [Return]    ${res}

Check Keyword In Row
    [Arguments]    ${row_data}    ${keyword}
    ${row_text}=    Convert To String    ${row_data}
    ${lowercase_row}=    Convert To Lower Case    ${row_text}
    ${lowercase_keyword}=    Convert To Lower Case    ${keyword}
    Run Keyword If    '${lowercase_keyword}' in '${lowercase_row}'    Return From Keyword    ${TRUE}
    [Return]    ${FALSE}

Verify Search Result
    [Arguments]    ${table}    ${keyword}
    ${row_count}=    Get Element Count    ${table}/tbody/tr
    ${first_cell_value}=    Get Text    ${table}/tbody/tr[1]/td[1]
    ${res}=    Set Variable    ${True}

    Log To Console    row_count: ${row_count}

    # if first_cell_value != 'No matching records found'
    # loop through all rows, if rows should not contain keyword, return False

    IF    '${first_cell_value}' != 'No matching records found' 
        FOR    ${i}    IN RANGE   1    ${row_count}+1
            ${row_data}=    Get Text    ${table}/tbody/tr[${i}]
            ${res}=    Check Keyword In Row    ${row_data}    ${keyword}
            IF    '${res}' == ${FALSE}
                RETURN    ${FALSE}
            END
        END
    END

    RETURN    ${res}
