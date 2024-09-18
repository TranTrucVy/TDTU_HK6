*** Settings ***
Documentation     Lab 05 - Ex1
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/tables/

*** Test Cases ***
TC: Open Browser
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window

    Close All Browsers

