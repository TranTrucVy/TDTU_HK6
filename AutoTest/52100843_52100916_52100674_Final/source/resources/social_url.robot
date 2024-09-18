*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../resources/common.robot


*** Variables ***
${LOGIN_URL}       https://automationteststore.com/index.php?rt=account/login


*** Keywords ***
Click on social link and verify
    [Arguments]    ${locator}    ${expected_url}
    Click Element    ${locator}

    ${expected_url}=    Replace String    ${expected_url}    http://    ${EMPTY}
    ${expected_url}=    Replace String    ${expected_url}    https://    ${EMPTY}
    
    # if 2 tab, check if the second tab is ${expected_url}
    # if 1 tab, check if the current tab is ${expected_url}

    ${win_handles}=    Get Window Handles
    ${win_count}=    Get Length    ${win_handles}
    IF    ${win_count} == 2
        Run Keyword If    ${win_count} == 2    Switch Window    ${win_handles}[1]
        # switch to the second tab
        Switch Window    ${win_handles}[1]
        Location Should Contain    ${expected_url}
    ELSE
        Location Should Contain    ${expected_url}
    END
