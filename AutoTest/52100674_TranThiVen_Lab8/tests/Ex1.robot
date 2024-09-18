*** Settings ***
Documentation     Lab 08 - Ex1
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/

*** Test Cases ***
TC: Open Browser
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window

    Close All Browsers

