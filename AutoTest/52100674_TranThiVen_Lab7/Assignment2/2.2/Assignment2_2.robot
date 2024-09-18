*** Settings ***
Documentation     Lab 07 - Ex2 - TC2
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${BROWSER}         Chrome
${URL}             https://practice-automation.com/

${POPUP_BTN}       //*[@id="post-36"]/div/div[2]/div/div[3]/div[1]/div/a
${POPUP_URL}       https://practice-automation.com/popups/
${MODAL_BTN}       //*[@id="post-36"]/div/div[2]/div/div[3]/div[2]/div
${MODAL_URL}       https://practice-automation.com/modals/
${CALENDAR_BTN}    //*[@id="post-36"]/div/div[2]/div/div[3]/div[2]/div/a
${CALENDAR_URL}    https://practice-automation.com/calendars/

# Verify modal
${SIMPLE_MODAL_BTN}    //*[@id="simpleModal"]
${SIMPLE_MODAL}        //*[@id="popmake-1318"]

${FORM_MODAL_BTN}      //*[@id="formModal"]
${FORM_MODAL}          //*[@id="popmake-674"]  

*** Test Cases *** 
TC1: Verify modal - Check simple modal show
    Open The Browser
    Enter page    ${MODAL_BTN}    ${MODAL_URL}
    
    ${simplemodal}=    Get Webelement    ${SIMPLE_MODAL}
    ${overlay}=    Get WebElement    //*[@id="pum-1318"]

    Page Should Contain Element   ${SIMPLE_MODAL_BTN}
    Click Button    ${SIMPLE_MODAL_BTN}
    Sleep    2s
    # check if simple modal is visible
    Page Should Contain Element    ${SIMPLE_MODAL}
    # should contain display: block 
    ${display}=    Call Method    ${simplemodal}    value_of_css_property    display
    Should Be Equal    ${display}    block
    ${bg}=    Call Method    ${overlay}    value_of_css_property    display
    Should Be Equal    ${bg}    block
    # check modal title 
    ${modal_title}=    Get Text    //*[@id="pum_popup_title_1318"]
    Should Be Equal As Strings    ${modal_title}    Simple Modal

    Close Browser

TC2: Verify modal - Check simple modal hide
    Open The Browser
    Enter page    ${MODAL_BTN}    ${MODAL_URL}
    
    ${closebtn}=    Get WebElement    //*[@id="popmake-1318"]/button
    ${simplemodal}=    Get Webelement    ${SIMPLE_MODAL}
    ${overlay}=    Get WebElement    //*[@id="pum-1318"]

    # open modal 
    Page Should Contain Element   ${SIMPLE_MODAL_BTN}
    Click Button    ${SIMPLE_MODAL_BTN}
    Sleep  2s
    
    # check if simple modal is visible
    Page Should Contain Element    ${SIMPLE_MODAL}
    # should contain display: block 
    ${display}=    Call Method    ${simplemodal}    value_of_css_property    display
    Should Be Equal    ${display}    block
    ${bg}=    Call Method    ${overlay}    value_of_css_property    display
    Should Be Equal    ${bg}    block
    # check modal title 
    ${modal_title}=    Get Text    //*[@id="pum_popup_title_1318"]
    Should Be Equal As Strings    ${modal_title}    Simple Modal

    # close modal 
    Click Button    ${closebtn}
    Sleep    2s
    # check if simple modal is hidden
    ${display}=    Call Method    ${simplemodal}    value_of_css_property    display
    Should Be Equal    ${display}    none
    ${bg}=    Call Method    ${overlay}    value_of_css_property    display
    Should Be Equal    ${bg}    none
    
    Close Browser

TC3: Verify modal - Form modal show
    Open The Browser
    Enter page    ${MODAL_BTN}    ${MODAL_URL}
    
    ${formmodal}=    Get Webelement    ${FORM_MODAL_BTN}

    # open modal
    Page Should Contain Element   ${FORM_MODAL_BTN}
    Click Button    ${FORM_MODAL_BTN}
    Sleep    2s
    
    Check form modal

    Close Browser

TC4: Verify modal - Form modal hide
    Open The Browser
    Enter page    ${MODAL_BTN}    ${MODAL_URL}
    
    ${formmodal}=    Get Webelement    ${FORM_MODAL}

    # open modal
    Page Should Contain Element   ${FORM_MODAL_BTN}
    Click Button    ${FORM_MODAL_BTN}
    Sleep    2s
    
    Check form modal

    # close modal
    Click Button    //*[@id="popmake-674"]/button
    Sleep    2s
    ${overlay}=    Get WebElement    //*[@id="pum-674"]

    # check if form modal is hidden
    ${display}=    Call Method    ${formmodal}    value_of_css_property    display
    Should Be Equal    ${display}    none
    ${bg}=    Call Method    ${overlay}    value_of_css_property    display
    Should Be Equal    ${bg}    none

    Close Browser

TC5: Verify modal - Form modal submit - no input
    Open The Browser
    Enter page    ${MODAL_BTN}    ${MODAL_URL}
    
    ${formmodal}=    Get Webelement    ${FORM_MODAL_BTN}
    ${submitbtn}=    Get WebElement    //*[@id="contact-form-1051"]/form/p[1]/button

    # open modal
    Page Should Contain Element   ${FORM_MODAL_BTN}
    Click Button    ${FORM_MODAL_BTN}
    Sleep    2s
    
    Check form modal

    # submit form 
    Scroll Element Into View    ${submitbtn}
    # button should be disabled
    Element Should Not Be Clickable    ${submitbtn}   # Loại bỏ việc click element ở đây

    Close Browser

TC6: Verify modal - Form modal submit - no required input
    Open The Browser
    Enter page    ${MODAL_BTN}    ${MODAL_URL}
    
    ${formmodal}=    Get Webelement    ${FORM_MODAL_BTN}
    ${submitbtn}=    Get WebElement    //*[@id="contact-form-1051"]/form/p[1]/button

    # open modal
    Page Should Contain Element   ${FORM_MODAL_BTN}
    Click Button    ${FORM_MODAL_BTN}
    Sleep    2s
    
    Check form modal

    # check form content
    # input email
    Input Text    //*[@id="g1051-email"]    admin@gmail.com
    ${email}=    Get Value    //*[@id="g1051-email"]
    Should Be Equal As Strings    ${email}    admin@gmail.com   

    # input message
    Input Text    //*[@id="contact-form-comment-g1051-message"]    This is a test message
    ${message}=    Get Value    //*[@id="contact-form-comment-g1051-message"]
    Should Be Equal As Strings    ${message}    This is a test message

    # submit form 
    Scroll Element Into View    ${submitbtn}
    # button should be disabled
    Element Should Not Be Clickable    ${submitbtn}   # Loại bỏ việc click element ở đây

    Close Browser

TC7: Verify modal - Form modal submit - full input
    Open The Browser
    Enter page    ${MODAL_BTN}    ${MODAL_URL}
    
    ${formmodal}=    Get Webelement    ${FORM_MODAL_BTN}
    ${submitbtn}=    Get WebElement    //*[@id="contact-form-1051"]/form/p[1]/button

    # open modal
    Page Should Contain Element   ${FORM_MODAL_BTN}
    Click Button    ${FORM_MODAL_BTN}
    Sleep    2s
    
    Check form modal

    # check form content
    # input name
    Input Text    //*[@id="g1051-name"]    John Doe
    ${name}=    Get Value    //*[@id="g1051-name"]
    Should Be Equal As Strings    ${name}    John Doe

    # input email
    Input Text    //*[@id="g1051-email"]    admin@gmail.com
    ${email}=    Get Value    //*[@id="g1051-email"]
    Should Be Equal As Strings    ${email}    admin@gmail.com   

    # input message
    Input Text    //*[@id="contact-form-comment-g1051-message"]    This is a test message
    ${message}=    Get Value    //*[@id="contact-form-comment-g1051-message"]
    Should Be Equal As Strings    ${message}    This is a test message

    # submit form 
    Scroll Element Into View    ${submitbtn}
    Click Button    ${submitbtn}

    # page reload 
    # check if form modal is hidden
    ${overlay}=    Get WebElement    //*[@id="pum-674"]
    ${bg}=    Call Method    ${overlay}    value_of_css_property    display
    Should Be Equal    ${bg}    none

    # recheck form inputs
    Click Button    ${FORM_MODAL_BTN}
    Check form modal

    Close Browser

*** Keywords ***
Open The Browser
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window

Enter page 
    [Arguments]    ${xpath}    ${url}
    ${btn}=    Get Webelement    xpath=${xpath}
    Page Should Contain Element    ${btn}
    Scroll Element Into View    ${btn}
    Click Element    ${btn}
    Wait Until Keyword Succeeds    10s    2s    Location Should Be    url=${url}

Check form modal 
    ${overlay}=    Get WebElement    //*[@id="pum-674"]
    
    # check if form modal is visible
    Page Should Contain Element    ${FORM_MODAL}
    # should contain display: block
    ${bg}=    Call Method    ${overlay}    value_of_css_property    display
    Should Be Equal    ${bg}    block
    # check modal title
    ${modal_title}=    Get Text    //*[@id="pum_popup_title_674"]
    Should Be Equal As Strings    ${modal_title}    Modal Containing A Form

    # all input should be empty
    ${name}=    Get Value    //*[@id="g1051-name"]
    Should Be Equal As Strings    ${name}    ${EMPTY}
    ${email}=    Get Value    //*[@id="g1051-email"]
    Should Be Equal As Strings    ${email}    ${EMPTY}
    ${message}=    Get Value    //*[@id="contact-form-comment-g1051-message"]
    Should Be Equal As Strings    ${message}    ${EMPTY}

Element Should Not Be Clickable
    [Arguments]   ${element}
    ${status}=    Run Keyword And Return Status    Click Element    ${element}
    Log To Console    ${status}
    Run Keyword If    'True'=='${status}'    Fail    "Element should not be clickable"