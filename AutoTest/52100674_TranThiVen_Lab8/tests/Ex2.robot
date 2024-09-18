*** Settings ***
Documentation     Lab 08 - Ex1
Library           SeleniumLibrary
Library           BuiltIn
Library           OperatingSystem
Suite Teardown    Close All Browsers

*** Variables ***
${BROWSER}        Chrome
${URL}            https://practice-automation.com/

# File Upload
${FILE_UPLOAD_BTN}    //*[@id="post-36"]/div/div[2]/div/div[3]/div[5]/div/a
${FILE_UPLOAD_URL}    https://practice-automation.com/file-upload/

${UPLOAD_BTN}    //*[@id="upload-btn"]

# File Download 
${FILE_DOWNLOAD_BTN}    //*[@id="post-36"]/div/div[2]/div/div[3]/div[4]/div/a
${FILE_DOWNLOAD_URL}    https://practice-automation.com/file-download/
${wrong_password}    auce
${right_password}    automateNow

${TRY_AGAIN_BTN}    //*[@id="msg_921"]/div

*** Test Cases ***
TC1: File Upload - No File
    Open The Browser    
    Enter page    ${FILE_UPLOAD_BTN}    ${FILE_UPLOAD_URL}
    
    Click Element    ${UPLOAD_BTN}
    
    # wait until upload msg is visible
    Wait Until Element Is Visible    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]

    # check input msg 
    Page Should Contain Element    //*[@id="wpcf7-f13587-p1037-o1"]/form/p[1]/span[1]/span
    ${input_msg}=    Get Text    //*[@id="wpcf7-f13587-p1037-o1"]/form/p[1]/span[1]/span
    Should Be Equal As Strings    ${input_msg}    Please fill out this field.

    # check upload msg 
    Page Should Contain Element    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]
    ${upload_msg}=    Get Text    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]
    Should Be Equal    ${upload_msg}    One or more fields have an error. Please check and try again.

TC2: File Upload - File size too large
    [Documentation]    File size is larger than 1MB

    Open The Browser    
    Enter page    ${FILE_UPLOAD_BTN}    ${FILE_UPLOAD_URL}
    
    ${file_path}=  Join Path  ${CURDIR}/../src  big_file.pdf
    File Should Exist  ${CURDIR}/../src/big_file.pdf
    Choose File    //*[@id="file-upload"]    ${file_path}    
    Click Element    ${UPLOAD_BTN}

    # wait until upload msg is visible
    Wait Until Element Is Visible    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]

    # check input msg
    Page Should Contain Element    //*[@id="wpcf7-f13587-p1037-o1"]/form/p[1]/span[1]/span
    ${input_msg}=    Get Text    //*[@id="wpcf7-f13587-p1037-o1"]/form/p[1]/span[1]/span
    Should Be Equal As Strings    ${input_msg}    Uploaded file is too big.

    # check upload msg
    Page Should Contain Element    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]
    ${upload_msg}=    Get Text    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]
    Should Be Equal    ${upload_msg}    One or more fields have an error. Please check and try again.

TC3: File Upload - File type is not allowed
    [Documentation]    File type is not included (txt, docx, pdf, jpeg, png, jpg, gif)

    Open The Browser    
    Enter page    ${FILE_UPLOAD_BTN}    ${FILE_UPLOAD_URL}
    
    ${file_path}=  Join Path  ${CURDIR}/../src  wrong_type_file.svg
    File Should Exist  ${CURDIR}/../src/wrong_type_file.svg
    Choose File    //*[@id="file-upload"]    ${file_path}    
    Click Element    ${UPLOAD_BTN}

    # wait until upload msg is visible
    Wait Until Element Is Visible    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]

    # check input msg
    Page Should Contain Element    //*[@id="wpcf7-f13587-p1037-o1"]/form/p[1]/span[1]/span
    ${input_msg}=    Get Text    //*[@id="wpcf7-f13587-p1037-o1"]/form/p[1]/span[1]/span
    Should Be Equal As Strings    ${input_msg}    You are not allowed to upload files of this type.

    # check upload msg
    Page Should Contain Element    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]
    ${upload_msg}=    Get Text    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]
    Should Be Equal    ${upload_msg}    One or more fields have an error. Please check and try again.

TC4: File Upload - File uploaded successfully
    [Documentation]    File uploaded successfully

    Open The Browser    
    Enter page    ${FILE_UPLOAD_BTN}    ${FILE_UPLOAD_URL}
    
    ${file_path}=  Join Path  ${CURDIR}/../src  right_file.pdf
    File Should Exist  ${CURDIR}/../src/right_file.pdf
    Choose File    //*[@id="file-upload"]    ${file_path}    
    Click Element    ${UPLOAD_BTN}

    # wait until upload msg is visible
    Wait Until Element Is Visible    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]

    # check upload msg
    Page Should Contain Element    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]
    ${upload_msg}=    Get Text    //*[@id="wpcf7-f13587-p1037-o1"]/form/div[2]
    Should Be Equal    ${upload_msg}    There was an error trying to send your message. Please try again later.

TC5: File Download - Normal 
    ${download_path}=    Join Path    ${CURDIR}/../downloads  
    Log To Console    download_path: ${download_path}
    
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}    Create Dictionary
    ...    download.default_directory=${download_path}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    ${FILE_DOWNLOAD_URL}

    # delete old file if exists
    Delete File With Name    test.pdf
    Wait Until Keyword Succeeds    10s    2s    File Should Not Exist    path=${download_path}/test.pdf

    Page Should Contain Element    //*[@id="post-1042"]/div/div[1]/div/div/div/div[3]/a
    Click Element    //*[@id="post-1042"]/div/div[1]/div/div/div/div[3]/a
    
    Wait Until Keyword Succeeds    10s    2s    File Should Exist    path=${download_path}/test.pdf

TC6: File Download - Password protected FAIL with Wrong password
    ${download_path}=    Join Path    ${CURDIR}/../downloads  

    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}    Create Dictionary
    ...    download.default_directory=${download_path}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    options=${chrome_options}
    Goto    ${FILE_DOWNLOAD_URL}

    # delete old file if exists
    Delete File With Name    test.docx
    Wait Until Keyword Succeeds    10s    2s    File Should Not Exist    path=${download_path}/test.docx

    # Start download
    Page Should Contain Element    //*[@id="post-1042"]/div/div[3]/div/div/div/div[3]/a
    Click Element    //*[@id="post-1042"]/div/div[3]/div/div/div/div[3]/a

    # check modal iframe is visible 
    Wait Until Keyword Succeeds    10s    2s    Page Should Contain Element    //*[@id="wpdm-lock-frame"]
   
    Select Frame    //*[@id="wpdm-lock-frame"]
    Wait Until Element Is Visible    //input[@name="password"]
    Input Text    //input[@name="password"]    ${wrong_password}
    Wait Until Element Is Visible    //input[@type="submit"]
    Click Element    //input[@type="submit"]
    Unselect Frame

    Sleep    5s
    # check error msg
    Select Frame    //*[@id="wpdm-lock-frame"]
    Page Should Contain    Enter Correct Password to Download
    Select Frame    //*[@id="wpdm-lock-frame"]
    Element Should Be Visible    //*[@id="msg_921"]/div
    ${error_msg}=    Get Text    //*[@id="msg_921"]/div
    Should Contain    ${error_msg}    Wrong Password!
    Should Contain    ${error_msg}    Try Again
    Unselect Frame

    Wait Until Keyword Succeeds    10s    2s    File Should Not Exist    path=${download_path}/test.docx

TC7: File Download - Password protected FAIL with No password
    ${download_path}=    Join Path    ${CURDIR}/../downloads  

    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}    Create Dictionary
    ...    download.default_directory=${download_path}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    options=${chrome_options}
    Goto    ${FILE_DOWNLOAD_URL}

    # delete old file if exists
    Delete File With Name    test.docx
    Wait Until Keyword Succeeds    10s    2s    File Should Not Exist    path=${download_path}/test.docx

    # Start download
    Page Should Contain Element    //*[@id="post-1042"]/div/div[3]/div/div/div/div[3]/a
    Click Element    //*[@id="post-1042"]/div/div[3]/div/div/div/div[3]/a

    # check modal iframe is visible 
    Wait Until Keyword Succeeds    10s    2s    Page Should Contain Element    //*[@id="wpdm-lock-frame"]
   
    Select Frame    //*[@id="wpdm-lock-frame"]
    Wait Until Element Is Visible    //input[@name="password"]
    Input Text    //input[@name="password"]    ${EMPTY}
    Wait Until Element Is Visible    //input[@type="submit"]
    Click Element    //input[@type="submit"]
    Unselect Frame

    Sleep    5s
    # check error msg
    Select Frame    //*[@id="wpdm-lock-frame"]
    Page Should Contain    Enter Correct Password to Download
    Select Frame    //*[@id="wpdm-lock-frame"]
    Element Should Be Visible    //*[@id="msg_921"]/div
    ${error_msg}=    Get Text    //*[@id="msg_921"]/div
    Should Contain    ${error_msg}    undefined
    Unselect Frame

    Wait Until Keyword Succeeds    10s    2s    File Should Not Exist    path=${download_path}/test.docx

TC8: File Download - Password protected SUCCESS with Correct password
    ${download_path}=    Join Path    ${CURDIR}/../downloads  

    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}    Create Dictionary
    ...    download.default_directory=${download_path}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    options=${chrome_options}
    Goto    ${FILE_DOWNLOAD_URL}

    # delete old file if exists
    Delete File With Name    test.docx
    Wait Until Keyword Succeeds    10s    2s    File Should Not Exist    path=${download_path}/test.docx

    # Start download
    Page Should Contain Element    //*[@id="post-1042"]/div/div[3]/div/div/div/div[3]/a
    Click Element    //*[@id="post-1042"]/div/div[3]/div/div/div/div[3]/a

    # check modal iframe is visible 
    Wait Until Keyword Succeeds    10s    2s    Page Should Contain Element    //*[@id="wpdm-lock-frame"]
   
    Select Frame    //*[@id="wpdm-lock-frame"]
    Wait Until Element Is Visible    //input[@name="password"]
    Input Text    //input[@name="password"]    ${right_password}
    Wait Until Element Is Visible    //input[@type="submit"]
    Click Element    //input[@type="submit"]

    # check error msg
    Sleep    5s

    Wait Until Keyword Succeeds    10s    2s    File Should Exist    path=D:\\CURRENT_SEMESTER\\Auto Testing\\lab08\\downloads\\test.docx

TC9: File Download - Password protected: FAIL then SUCCESS
    ${download_path}=    Join Path    ${CURDIR}/../downloads  

    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs}    Create Dictionary
    ...    download.default_directory=${download_path}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    options=${chrome_options}
    Goto    ${FILE_DOWNLOAD_URL}

    # delete old file if exists
    Delete File With Name    test.docx
    Wait Until Keyword Succeeds    10s    2s    File Should Not Exist    path=${download_path}/test.docx

    # Start download with wrong password
    Page Should Contain Element    //*[@id="post-1042"]/div/div[3]/div/div/div/div[3]/a
    Click Element    //*[@id="post-1042"]/div/div[3]/div/div/div/div[3]/a

    # check modal iframe is visible 
    Wait Until Keyword Succeeds    10s    2s    Page Should Contain Element    //*[@id="wpdm-lock-frame"]
    Select Frame    //*[@id="wpdm-lock-frame"]
    Wait Until Element Is Visible    //input[@name="password"]
    Input Text    //input[@name="password"]    ${wrong_password}
    Wait Until Element Is Visible    //input[@type="submit"]
    Click Element    //input[@type="submit"]
    Unselect Frame

    Sleep    5s
    # check error msg
    Select Frame    //*[@id="wpdm-lock-frame"]
    Page Should Contain    Enter Correct Password to Download
    Select Frame    //*[@id="wpdm-lock-frame"]
    Element Should Be Visible    ${TRY_AGAIN_BTN}
    ${error_msg}=    Get Text    ${TRY_AGAIN_BTN}
    Should Contain    ${error_msg}    Wrong Password!
    Should Contain    ${error_msg}    Try Again
    Unselect Frame

    Wait Until Keyword Succeeds    10s    2s    File Should Not Exist    path=${download_path}/test.docx

    # Start download with correct password
    Select Frame    //*[@id="wpdm-lock-frame"]
    Click Element    ${TRY_AGAIN_BTN}

    Wait Until Element Is Visible    //input[@name="password"]
    Input Text    //input[@name="password"]    ${right_password}
    Wait Until Element Is Visible    //input[@type="submit"]
    Click Element    //input[@type="submit"]

    Sleep    5s

    Wait Until Keyword Succeeds    10s    2s    File Should Exist    path=${download_path}/test.docx

*** Keywords ***
Open The Browser
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window

Enter page 
    [Arguments]    ${xpath}    ${url}
    ${btn}=    Get Webelement    xpath=${xpath}
    Page Should Contain Element    ${btn}
    Scroll Element Into View    ${btn}
    Click Element    ${btn}
    Wait Until Keyword Succeeds    10s    2s    Location Should Be    url=${url}

# Get User Home
#     ${user_home}=    Get Environment Variable    UserProfile
#     RETURN    ${user_home}\\Downloads

Delete File With Name 
    [Arguments]    ${file_name}
    ${folder_path}=    Join Path    ${CURDIR}/../downloads
    ${file_path}=    Join Path    ${folder_path}    ${file_name}
    
    # check if file exists
    Run Keyword And Ignore Error    Remove File    ${file_path}
