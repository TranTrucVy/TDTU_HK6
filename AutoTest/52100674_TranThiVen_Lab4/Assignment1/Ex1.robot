*** Settings ***
Documentation     Lab 04 - Assignment 01
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/form-fields/

*** Test Cases ***
TC: Open browser
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    [Teardown]    Close All Browsers
