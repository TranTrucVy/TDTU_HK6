*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Logged In Successfully
    Open Browser    https://practicetestautomation.com/practice-test-login/    Chrome
    Input Text    id=username    student
    Input Password    id=password    Password123
    Click Button    id=submit
    Sleep    10s
    Element Should Contain    xpath=//*[@id="loop-container"]/div/article/div[1]/h1    Logged In Successfully
