*** Settings ***
Library           BuiltIn

*** Keywords ***
CompareNumber
    [Arguments]    ${arg1}    ${arg2}
    Run Keyword If    '${arg1}' == '${arg2}'    DisplayComparisonMsg    Numbers are equal
    ...    ELSE IF    '${arg1}' < '${arg2}'    DisplayComparisonMsg    ${arg1} is less than ${arg2}
    ...    ELSE IF    '${arg1}' > '${arg2}'    DisplayComparisonMsg    ${arg1} is greater than ${arg2}

DisplayComparisonMsg
    [Arguments]    ${comparison_result}
    Log    ${comparison_result}

*** Test Cases ***
Assignment2
    [Documentation]    Test CompareNumber and DisplayComparisonMsg
    Log    Starting Assignment 2 Test Case
    CompareNumber    10    10
    CompareNumber    5    8
    CompareNumber    8    5
    CompareNumber    10    5
    Log    Ending Assignment 2 Test Case
