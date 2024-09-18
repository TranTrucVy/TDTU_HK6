*** Settings ***
Documentation     Lab 04 - Assignment 02
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/form-fields/
${TEXT_INPUT_XPATH}    xpath=//input[@type='text']
${TEXTAREA_XPATH}    xpath=//textarea

*** Test Cases ***
TC 1: Not fill any input
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Location Should Be    ${URL}

    # submit 
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Page Should Contain Element    xpath=//button[@id='submit-btn']
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Click Element    xpath=//button[@id='submit-btn']

    # check all inputs empty
    ${all_empty} =  Check All Inputs Empty
    Should Be True  ${all_empty}

TC 2: Fill input name only
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Location Should Be    ${URL}

    # fill input name & check input value
    Scroll Element Into View    id:name
    Input Text    id:name    John
    Textfield Value Should Be    id:name    John

    # submit 
    Page Should Contain Element    xpath=//button[@id='submit-btn']
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Click Element    xpath=//button[@id='submit-btn']
    Alert Should Be Present    Message received!
    
    # check all inputs empty
    ${all_empty} =  Check All Inputs Empty
    Should Be True  ${all_empty}

TC 3: Fill all (except name)
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Location Should Be    ${URL}

    # fill all inputs except name
    Click Element    xpath=//input[@id='drink1']
    Click Element    xpath=//input[@id='color1']
    Select From List By Value    id:siblings    yes
    Input Text    id:email      admin@gmail.com
    Input Text    id:message   Lorem ipsum dolor sit amet

    # check inputs value 
    Checkbox Should Be Selected    xpath=//input[@id='drink1']
    Radio Button Should Be Set To    fav_color      Red
    List Selection Should Be    id:siblings    yes
    Textfield Value Should Be    id:email       admin@gmail.com
    Textarea Value Should Be    id:message   Lorem ipsum dolor sit amet

    # check input name Empty
    Textfield Value Should Be    id:name    ${EMPTY}

    # submit
    Page Should Contain Element    xpath=//button[@id='submit-btn']
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Click Element    xpath=//button[@id='submit-btn']
    Alert Should Not Be Present    Message received!

    Close Browser

TC 4: Fill all (except checkbox drink) 
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Location Should Be    ${URL}

    # fill all inputs except checkbox drink
    Input Text    id:name    John
    Click Element    xpath=//input[@id='color1']
    Select From List By Value    id:siblings    yes
    Input Text    id:email      admin@gmail.com
    Input Text    id:message   Lorem ipsum dolor sit amet

    # check inputs value
    Textfield Value Should Be    id:name    John
    Radio Button Should Be Set To    fav_color      Red
    List Selection Should Be    id:siblings    yes
    Textfield Value Should Be    id:email       admin@gmail.com
    Textarea Value Should Be    id:message   Lorem ipsum dolor sit amet

    # check checkbox drink unselected
    ${all_unselected} =  Check All Unselected  xpath=//input[@type='checkbox']
    Should Be True  ${all_unselected}

    # submit
    Page Should Contain Element    xpath=//button[@id='submit-btn']
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Click Element    xpath=//button[@id='submit-btn']
    Alert Should Be Present    Message received!

    # check all inputs empty
    ${all_empty} =  Check All Inputs Empty
    Should Be True  ${all_empty}

    Close Browser

TC 5: Fill all (except radio color)
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Location Should Be    ${URL}

    # fill all inputs except radio color
    Input Text    id:name    John
    Click Element    xpath=//input[@id='drink1']
    Select From List By Value    id:siblings    yes
    Input Text    id:email      admin@gmail.com
    Input Text    id:message   Lorem ipsum dolor sit amet

    # check inputs value
    Textfield Value Should Be    id:name    John
    Checkbox Should Be Selected    xpath=//input[@id='drink1']
    List Selection Should Be    id:siblings    yes
    Textfield Value Should Be    id:email       admin@gmail.com
    Textarea Value Should Be    id:message   Lorem ipsum dolor sit amet

    # check radio color all unselected
    Scroll Element Into View    xpath=//input[@type='radio']
    ${all_unselected} =  Check All Unselected  xpath=//input[@type='radio']
    Should Be True  ${all_unselected}

    # submit
    Page Should Contain Element    xpath=//button[@id='submit-btn']
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Click Element    xpath=//button[@id='submit-btn']
    Alert Should Be Present    Message received!

    # check all inputs empty
    ${all_empty} =  Check All Inputs Empty
    Should Be True  ${all_empty}

    Close Browser

TC 6: Fill all (except dropdown siblings)
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Location Should Be    ${URL}

    # fill all inputs except dropdown siblings
    Input Text    id:name    John
    Click Element    xpath=//input[@id='drink1']
    Click Element    xpath=//input[@id='color1']
    Input Text    id:email      admin@gmail.com
    Input Text    id:message   Lorem ipsum dolor sit amet

    # check inputs value
    Textfield Value Should Be    id:name    John
    Checkbox Should Be Selected    xpath=//input[@id='drink1']
    Radio Button Should Be Set To    fav_color      Red
    Textfield Value Should Be    id:email       admin@gmail.com 
    Textarea Value Should Be    id:message   Lorem ipsum dolor sit amet

    # check dropdown siblings Unselected
    ${selected_value}    Get Selected List Value    id=siblings
    Should Be Equal    ${selected_value}    default

    # submit
    Page Should Contain Element    xpath=//button[@id='submit-btn']
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Click Element    xpath=//button[@id='submit-btn']
    Alert Should Be Present    Message received!

    # check all inputs empty
    ${all_empty} =  Check All Inputs Empty
    Should Be True  ${all_empty}    

    Close Browser

TC 7: Fill all (except email)
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Location Should Be    ${URL}

    # fill all inputs except email
    Input Text    id:name    John
    Click Element    xpath=//input[@id='drink1']
    Click Element    xpath=//input[@id='color1']
    Select From List By Value    id:siblings    yes
    Input Text    id:message   Lorem ipsum dolor sit amet

    # check inputs value
    Textfield Value Should Be    id:name    John
    Checkbox Should Be Selected    xpath=//input[@id='drink1']
    Radio Button Should Be Set To    fav_color      Red
    List Selection Should Be    id=siblings    yes
    Textarea Value Should Be    id:message   Lorem ipsum dolor sit amet

    # check input email Empty
    Textfield Value Should Be    id:email    ${EMPTY}

    # submit
    Page Should Contain Element    xpath=//button[@id='submit-btn']
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Click Element    xpath=//button[@id='submit-btn']
    Alert Should Be Present    Message received!

    Close Browser

TC 8: Fill all (except textarea message)
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Location Should Be    ${URL}

    # fill all inputs except textarea message
    Input Text    id:name    John
    Click Element    xpath=//input[@id='drink1']
    Click Element    xpath=//input[@id='color1']
    Select From List By Value    id:siblings    yes
    Input Text    id:email      admin@gmail.com

    # check inputs value
    Textfield Value Should Be    id:name    John
    Checkbox Should Be Selected    xpath=//input[@id='drink1']
    Radio Button Should Be Set To    fav_color      Red
    List Selection Should Be    id=siblings    yes
    Textfield Value Should Be    id:email       admin@gmail.com

    # check textarea message Empty
    Textarea Value Should Be    id:message    ${EMPTY}

    # submit
    Page Should Contain Element    xpath=//button[@id='submit-btn']
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Click Element    xpath=//button[@id='submit-btn']
    Alert Should Be Present    Message received!

    Close Browser

TC 9: Fill all inputs
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Location Should Be    ${URL}

    # fill input name & check input value
    Scroll Element Into View    id:name
    Input Text    id:name    John
    Textfield Value Should Be    id:name    John

    # choose the first drink checkbox & check if it is selected
    Click Element    xpath=//input[@id='drink1']
    Checkbox Should Be Selected    xpath=//input[@id='drink1']

    # choose the first color radio button & check if it is selected
    Click Element    xpath=//input[@id='color1']
    Radio Button Should Be Set To    fav_color  Red

    # select Yes option from the dropdown & check if it is selected
    Select From List By Value    id:siblings    yes
    List Selection Should Be    id:siblings    yes

    # fill input email & check input value
    Input Text    id:email      admin@gmail.com 
    Textfield Value Should Be    id:email       admin@gmail.com 

    # fill text area & check text area value
    Input Text    id:message   Lorem ipsum dolor sit amet
    Textarea Value Should Be    id:message   Lorem ipsum dolor sit amet

    # submit 
    Page Should Contain Element    xpath=//button[@id='submit-btn']
    Scroll Element Into View    xpath=//button[@id='submit-btn']
    Click Element    xpath=//button[@id='submit-btn']
    Alert Should Be Present    Message received!
    
    # check all inputs empty 
    ${all_empty} =  Check All Inputs Empty
    Should Be True  ${all_empty}

    Close Browser

*** Keywords ***
Check All Unselected
    [Arguments]  ${locator}
    ${checkboxes} =  Get WebElements  ${locator}
    ${all_unselected} =  Set Variable  ${TRUE}
    FOR  ${checkbox}  IN  @{checkboxes}
        ${selected} =  Call Method  ${checkbox}  is_selected
        Run Keyword If  ${selected}  Set Variable  ${all_unselected}  ${FALSE}
    END
    RETURN  ${all_unselected}

Check All Inputs Empty 
    ${text_inputs} =  Get WebElements  ${TEXT_INPUT_XPATH}
    ${textareas} =  Get WebElements  ${TEXTAREA_XPATH}
    ${checkboxes} =  Get WebElements  xpath=//input[@type='checkbox']
    ${radios} =  Get WebElements  xpath=//input[@type='radio']
    ${dropdown} =  Get WebElements  id=siblings

    ${all_empty} =  Set Variable  ${TRUE}
    FOR  ${input_field}  IN  @{text_inputs}
        ${value} =  Get Value  ${input_field}
        Run Keyword If  '${value}' != ''  Set Variable  ${all_empty}  ${FALSE}
    END

    FOR  ${textarea}  IN  @{textareas}
        ${value} =  Get Value  ${textarea}
        Run Keyword If  '${value}' != ''  Set Variable  ${all_empty}  ${FALSE}
    END

    FOR  ${checkbox}  IN  @{checkboxes}
        ${selected} =  Call Method  ${checkbox}  is_selected
        Run Keyword If  ${selected}  Set Variable  ${all_empty}  ${FALSE}
    END

    FOR  ${radio}  IN  @{radios}
        ${selected} =  Call Method  ${radio}  is_selected
        Run Keyword If  ${selected}  Set Variable  ${all_empty}  ${FALSE}
    END

    ${selected} =  Call Method  ${dropdown[0]}  is_selected
    Run Keyword If  ${selected}  Set Variable  ${all_empty}  ${FALSE}

    RETURN  ${all_empty}