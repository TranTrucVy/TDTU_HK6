*** Settings ***
Documentation     Lab 08 - Ex1
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/

# File Upload
${WO_BTN}        //*[@id="post-36"]/div/div[2]/div/div[2]/div[3]/div/a
${WO_URL}        https://practice-automation.com/window-operations/

*** Test Cases ***
Verify Open New Tab
    Open The Browser
    Enter page    ${WO_BTN}    ${WO_URL}

    # Lưu lại ID của cửa sổ trước khi nhấp vào liên kết
    ${original_window}=    Get Window Handles
    
    # click url 
    Click Element    //*[@id="post-1147"]/div/p[2]/button

    # Lưu lại ID của cửa sổ sau khi nhấp vào liên kết
    ${current_windows}=    Get Window Handles
    Run Keyword If    ${current_windows} != ${original_window}    Log To Console    A new tab is opened    ELSE    Fail    No new tab is opened

Verify Replace Current Location 
    Open The Browser
    Enter page    ${WO_BTN}    ${WO_URL}

    # Get current URL before clicking the link
    ${current_url_before}=    Get Location
    
    Click Element    //*[@id="post-1147"]/div/p[4]/button

    # Get current URL after clicking the link
    ${current_url_after}=    Get Location
    Should Not Be Equal    ${current_url_before}    ${current_url_after}    Message=URL is not replaced

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Test Click to Open New Browser Window
    Open The Browser
    Enter page    ${WO_BTN}    ${WO_URL}

    # Lưu lại danh sách cửa sổ trước khi nhấp vào liên kết
    @{original_windows}=    Get Window Handles
    
    Click Element    //*[@id="post-1147"]/div/p[6]/button

    # Lưu lại danh sách cửa sổ sau khi nhấp vào liên kết
    @{current_windows}=    Get Window Handles
    ${is_new_window_opened}=    Run Keyword And Return Status    Evaluate    len(set(${original_windows}) & set(${current_windows})) == 1       
    
    Log To Console    original: ${original_windows}
    Log To Console    current: ${current_windows}
    Log To Console    set(${original_windows}) & set(${current_windows})

    Run Keyword If    ${is_new_window_opened}    Log To Console    New browser window is opened    ELSE    Fail    No new browser window is opened

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
