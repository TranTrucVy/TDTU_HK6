*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Verify that you navigated successfully
    Open Browser    https://practicetestautomation.com/practice-test-login/    Chrome
    Input Text    id=username    student
    Input Password    id=password    Password123
    Click Button    id=submit
    Click Element    xpath=//*[@id="menu-item-20"]/a    # Navigate to "PRACTICE"
    Click Element    xpath=//*[@id="loop-container"]/div/article/div[2]/div[2]/div[1]/p/a    # Navigate to "Test Exceptions"
    Sleep    5s
    Element Should Contain    //*[@id="food_list"]/h2    Test Exceptions    # Verify that you navigated successfully
    Sleep    5s
