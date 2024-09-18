*** Settings ***
Documentation     Functions for the test cases
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Library           Collections
Library           String

*** Variables ***
${currency_dropdown_xpath}    xpath=/html/body/div/header/div[2]/div/div[2]
${euro_option_xpath}    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
${pound_option_xpath}    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
${usd_option_xpath}    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[3]/a
${currency_symbol_euro}    €
${currency_symbol_usd}    $
${currency_symbol_pound}    £
${item_change}    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
${item_change1}    xpath=/html/body/div/div[2]/div/div/section[2]/div/div/div/div[4]/div[2]/div[3]/div/div

*** Keywords ***
Change usd to pound to euro to usd
    ${text_now}    Get Text    ${item_change}
    Should Be Equal As Strings    ${currency_symbol_usd}    ${text_now}
    ${item_usd}    Get Text    ${item_change1}
    ${item_usd}    Set Variable    ${item_usd.replace("$", "").replace(",", "")}
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]
    Click Element    ${pound_option_xpath}
    ${text_change}    Get Text    ${item_change}
    Should Be Equal As Strings    ${text_change}    ${currency_symbol_pound}
    ${item_pound}    Get Text    ${item_change1}
    ${item_pound}    Set Variable    ${item_pound.replace("£", "").replace(",", "")}
    ${item_usd_check}    Evaluate    float(${item_pound}) * float(${item_usd}) / float(${item_pound})
    Should Be Equal As Numbers    ${item_usd}    ${item_usd_check}
    Click Element    xpath=/html/body/div/div[2]/div/div/section[2]/div/div/div/div[4]/div[2]/a/img
    ${item_pound1}    Get Text    xpath=/html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div/div/div[1]/div/div
    ${item_pound1}    Set Variable    ${item_pound1.replace("£", "").replace(",", "")}
    ${text_now}    Get Text    ${item_change}
    Should Be Equal As Strings    ${currency_symbol_pound}    ${text_now}
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]
    Click Element    ${euro_option_xpath}
    ${text_now}    Get Text    ${item_change}
    Should Be Equal As Strings    ${currency_symbol_euro}    ${text_now}
    ${item_euro1}    Get Text    xpath=/html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div/div/div[1]/div/div
    ${item_euro1}    Set Variable    ${item_euro1}
    ${currency_symbol}    Evaluate    '''${item_euro1}'''[-1]
    Should Be Equal As Strings    ${currency_symbol}    ${currency_symbol_euro}
    ${text_now}    Get Text    ${item_change}
    Should Be Equal As Strings    ${currency_symbol_euro}    ${text_now}
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]
    Click Element    ${usd_option_xpath}
    ${text_now}    Get Text    ${item_change}
    Should Be Equal As Strings    ${currency_symbol_usd}    ${text_now}
    ${item_usd}    Get Text    xpath=/html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div/div/div[1]/div/div
    ${item_usd}    Set Variable    ${item_usd}
    ${currency_symbol}    Evaluate    '''${item_usd}'''[0]
    Should Be Equal As Strings    ${currency_symbol}    ${currency_symbol_usd}

Change usd to euro to pound to usd
    ${text_now}    Get Text    ${item_change}
    Should Be Equal As Strings    ${currency_symbol_usd}    ${text_now}
    ${item_usd}    Get Text    ${item_change1}
    ${item_usd}    Set Variable    ${item_usd.replace("$", "").replace(",", "")}
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]
    Click Element    ${euro_option_xpath}
    ${text_change}    Get Text    ${item_change}
    Should Be Equal As Strings    ${text_change}    ${currency_symbol_euro}
    ${item_euro}    Get Text    ${item_change1}
    ${item_euro}    Set Variable    ${item_euro.replace("€", "").replace(",", "")}
    ${item_usd_check}    Evaluate    float(${item_euro}) * float(${item_usd}) / float(${item_euro})
    Should Be Equal As Numbers    ${item_usd_check}    ${item_usd}
    Click Element    xpath=/html/body/div/div[2]/div/div/section[2]/div/div/div/div[4]/div[2]/a/img
    ${item_euro1}    Get Text    xpath=/html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div/div/div[1]/div/div
    ${item_euro1}    Set Variable    ${item_euro1.replace("€", "").replace(",", "")}
    Should Be Equal As Numbers    ${item_euro}    ${item_euro1}
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]
    Click Element    ${pound_option_xpath}
    ${text_change}    Get Text    ${item_change}
    Should Be Equal As Strings    ${text_change}    ${currency_symbol_pound}
    ${item_pound}    Get Text    xpath=/html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div/div/div[1]/div/div
    ${item_pound}    Set Variable    ${item_pound}
    ${currency_symbol}    Evaluate    '''${item_pound}'''[0]
    Should Be Equal As Strings    ${currency_symbol}    ${currency_symbol_pound}
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]
    Click Element    ${usd_option_xpath}
    ${text_now}    Get Text    ${item_change}
    Should Be Equal As Strings    ${currency_symbol_usd}    ${text_now}
    ${item_usd}    Get Text    xpath=/html/body/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div/div/div[1]/div/div
    ${item_usd}    Set Variable    ${item_usd}
    ${currency_symbol}    Evaluate    '''${item_usd}'''[0]
    Should Be Equal As Strings    ${currency_symbol}    ${currency_symbol_usd}


