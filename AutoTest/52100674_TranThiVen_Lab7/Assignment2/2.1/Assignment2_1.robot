*** Settings ***
Documentation     Lab 07 - Assignment2_1
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/
${POPUP_BTN}      //*[@id="post-36"]/div/div[2]/div/div[3]/div[1]/div/a
${POPUP_URL}      https://practice-automation.com/popups/
${MODAL_BTN}      //*[@id="post-36"]/div/div[2]/div/div[3]/div[2]/div
${MODAL_URL}      https://practice-automation.com/modals/
# Verify popup
# alert
${ALERT_BTN}      //*[@id="alert"]
# confirm
${CONFIRM_BTN}    //*[@id="confirm"]
${CONFIRM_TEXT}    //*[@id="confirmResult"]
# prompt
${PROMPT_BTN}     //*[@id="prompt"]
${PROMPT_TEXT}    //*[@id="promptResult"]
# tooltip
${TOOLTIP_BTN}    //*[@id="post-1055"]/div/div[5]
${TOOLTIP_TEXT}    //*[@id="myTooltip"]

*** Test Cases ***
TC1: Verify popup - Check alert popup
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click alert button
    Page Should Contain Element    ${ALERT_BTN}
    Click Button    ${ALERT_BTN}
    Wait Until Keyword Succeeds    10s    2s    Alert Should Be Present    Hi there, pal!    accept
    # check if alert is closed
    Alert Should Not Be Present
    Close Browser

TC2: Verify popup - Check confirm OK
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click confirm button
    Page Should Contain Element    ${CONFIRM_BTN}
    Click Button    ${CONFIRM_BTN}
    Wait Until Keyword Succeeds    10s    2s    Alert Should Be Present    OK or Cancel, which will it be?
    # check if alert is closed
    ${text}=    Get Text    ${CONFIRM_TEXT}
    Should Be Equal    ${text}    OK it is!
    Alert Should Not Be Present
    Close Browser

TC3: Verify popup - Check confirm Cancel
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click confirm button
    Page Should Contain Element    ${CONFIRM_BTN}
    Click Button    ${CONFIRM_BTN}
    Wait Until Keyword Succeeds    10s    2s    Alert Should Be Present    OK or Cancel, which will it be?    DISMISS
    # check if alert is closed
    ${text}=    Get Text    ${CONFIRM_TEXT}
    Should Be Equal    ${text}    Cancel it is!
    Alert Should Not Be Present
    Close Browser

TC4: Verify popup - Check confirm OK & Cancel
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click confirm button
    Page Should Contain Element    ${CONFIRM_BTN}
    Click Button    ${CONFIRM_BTN}
    Wait Until Keyword Succeeds    10s    2s    Alert Should Be Present    OK or Cancel, which will it be?
    # check if alert is closed
    ${text}=    Get Text    ${CONFIRM_TEXT}
    Should Be Equal    ${text}    OK it is!
    Alert Should Not Be Present
    # click confirm button
    Page Should Contain Element    ${CONFIRM_BTN}
    Click Button    ${CONFIRM_BTN}
    Wait Until Keyword Succeeds    10s    2s    Alert Should Be Present    OK or Cancel, which will it be?    DISMISS
    # check if alert is closed
    ${text}=    Get Text    ${CONFIRM_TEXT}
    Should Be Equal    ${text}    Cancel it is!
    Alert Should Not Be Present
    Close Browser

TC5: Verify popup - Check prompt with input text & OK
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click prompt button
    Page Should Contain Element    ${PROMPT_BTN}
    Click Button    ${PROMPT_BTN}
    Input Text Into Alert    abc    accept
    # check if alert is closed
    Alert Should Not Be Present
    ${text}=    Get Text    ${PROMPT_TEXT}
    Should Be Equal    ${text}    Nice to meet you, abc!
    Close Browser

TC6: Verify popup - Check prompt with no input & OK
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click prompt button
    Page Should Contain Element    ${PROMPT_BTN}
    Click Button    ${PROMPT_BTN}
    Wait Until Keyword Succeeds    10s    2s    Input Text Into Alert    ${EMPTY}    accept
    # check if alert is closed
    Alert Should Not Be Present
    ${text}=    Get Text    ${PROMPT_TEXT}
    Should Be Equal    ${text}    Fine, be that way...
    Close Browser

TC7: Verify popup - Check prompt with input text & Cancel
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click prompt button
    Page Should Contain Element    ${PROMPT_BTN}
    Click Button    ${PROMPT_BTN}
    Input Text Into Alert    abc    dismiss
    # check if alert is closed
    Alert Should Not Be Present
    ${text}=    Get Text    ${PROMPT_TEXT}
    Should Be Equal    ${text}    Fine, be that way...
    Close Browser

TC8: Verify popup - Check prompt with no input & Cancel
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click prompt button
    Page Should Contain Element    ${PROMPT_BTN}
    Click Button    ${PROMPT_BTN}
    Input Text Into Alert    ${EMPTY}    dismiss
    # check if alert is closed
    Alert Should Not Be Present
    ${text}=    Get Text    ${PROMPT_TEXT}
    Should Be Equal    ${text}    Fine, be that way...
    Close Browser

TC9: Verify popup - Check tooltip show
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click tooltip button
    Page Should Contain Element    ${TOOLTIP_BTN}
    # tooltip must not be visible
    ${class}=    Get Element Attribute    ${TOOLTIP_TEXT}    class
    Should Not Contain    ${class}    show
    # click tooltip button
    Click Element    ${TOOLTIP_BTN}
    # tooltip should contain class show and text Cool text
    ${class}=    Get Element Attribute    ${TOOLTIP_TEXT}    class
    Should Contain    ${class}    show
    ${text}=    Get Text    ${TOOLTIP_TEXT}
    Should Be Equal    ${text}    Cool text
    Close Browser

TC10: Verify popup - Check tooltip hide
    Open The Browser
    Enter page    ${POPUP_BTN}    ${POPUP_URL}
    # click tooltip button
    Page Should Contain Element    ${TOOLTIP_BTN}
    # tooltip must not be visible
    ${class}=    Get Element Attribute    ${TOOLTIP_TEXT}    class
    Should Not Contain    ${class}    show
    # click tooltip button
    Click Element    ${TOOLTIP_BTN}
    # tooltip should contain class show and text Cool text
    ${class}=    Get Element Attribute    ${TOOLTIP_TEXT}    class
    Should Contain    ${class}    show
    ${text}=    Get Text    ${TOOLTIP_TEXT}
    Should Be Equal    ${text}    Cool text
    # click tooltip button
    Click Element    ${TOOLTIP_BTN}
    # tooltip must not be visible
    ${class}=    Get Element Attribute    ${TOOLTIP_TEXT}    class
    Should Not Contain    ${class}    show
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
