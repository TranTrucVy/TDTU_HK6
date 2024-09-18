*** Settings ***
Library           assignment3.py

*** Test Cases ***
TC1 - No Real Roots
    [Documentation]    Test when there are no real roots
    ${result}    Solve Equationroots    1    2    3
    Log    Result: ${result}
    Should Be Equal    ${result}    No real roots

TC2 - One Real Root
    [Documentation]    Test when there is one real root
    ${result}    Solve Equationroots    1    -2    1
    Log    Result: ${result}
    Should Be Equal As Numbers    ${result}    1

TC3 - Two Real Roots
    [Documentation]    Test when there are two real roots
    ${result}    Solve Equationroots    1    -3    2
    Log    Result: ${result}
    Should Be Equal As Numbers    ${result[0]}    2
    Should Be Equal As Numbers    ${result[1]}    1
