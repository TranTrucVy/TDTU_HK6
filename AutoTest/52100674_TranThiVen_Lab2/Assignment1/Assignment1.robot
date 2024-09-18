*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Assignment1
    Open Browser    https://www.tdtu.edu.vn    Chrome
    Sleep    3s    # Pause for observation
    Maximize Browser Window
    Sleep    5s    # Pause for observation
    Close Browser
