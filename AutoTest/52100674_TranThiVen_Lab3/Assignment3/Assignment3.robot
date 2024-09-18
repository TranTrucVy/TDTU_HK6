*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Navigation, Add Row, and Save and Remove
    Open Browser    https://practicetestautomation.com/practice-test-login/    Chrome
    Input Text    id=username    student
    Input Password    id=password    Password123
    Click Button    id=submit
    Click Element    xpath=//*[@id="menu-item-20"]/a    # Navigate to "PRACTICE"
    Click Element    xpath=//*[@id="loop-container"]/div/article/div[2]/div[2]/div[1]/p/a    # Navigate to "Test Exceptions"
    Element Should Contain    //*[@id="food_list"]/h2    Test Exceptions    # Verify navigation to "Test Exceptions" page
    Click Button    id=add_btn    # Add new row
    Sleep    10s
    Element Should Contain    //*[@id="confirmation"]    Row 2 was added    # Verify that a new row is added successfully
    Input Text    //*[@id="row2"]/input    TranThiVen    # Enter text into the input element of the new row
    ${save_button_xpath}    Set Variable    //*[@id="row2"]//button[@id="save_btn"]
    Click Element    ${save_button_xpath}
    Element Should Contain    //*[@id="confirmation"]    Row 2 was saved    # Verify that a new row is saved successfully
    Sleep    10s
    Click Element    id=remove_btn    # Remove row
    Element Should Contain    //*[@id="confirmation"]    Row 2 was removed    # Verify that a new row is removed successfully
    Sleep    10s
