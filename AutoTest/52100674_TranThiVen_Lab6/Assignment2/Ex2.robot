*** Settings ***
Documentation     Lab 06 - Ex2
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${BROWSER}    Chrome
${URL}        https://practice-automation.com/

${HOVER_BTN}    //*[@id="post-36"]/div/div[2]/div/div[3]/div[3]/div/a
${HOVER_URL}    https://practice-automation.com/hover/

${CLICK_BTN}    //*[@id="post-36"]/div/div[2]/div/div[1]/div[5]/div/a
${CLICK_URL}    https://practice-automation.com/click-events/

${GESTURE_BTN}    //*[@id="post-36"]/div/div[2]/div/div[2]/div[4]/div/a
${GESTURE_URL}    https://practice-automation.com/gestures/

*** Test Cases ***
TC1: Verify hover
    Open The Browser
    Enter page    ${HOVER_BTN}    ${HOVER_URL}

    # default
    ${element}=    Get Webelement    //*[@id="mouse_over"]
    ${text}=    Get Text    ${element}
    Should Be Equal As Strings    ${text}    Mouse over me

    # only apply inline css style
    # ${element_att}=    Get Element Attribute    ${element}    style 
    # Should Contain    ${element_att}    color: green;
    
    # mouse hover
    Mouse Over    ${element}
    ${color}=    Call Method    ${element}    value_of_css_property    color
    Should Be Equal As Strings    ${color}    rgba(0, 128, 0, 1)
    ${text}=    Get Text    ${element}
    Should Be Equal As Strings    ${text}    You did it!

    # mouse out 
    Mouse Out    ${element}
    # check css color is green
    ${color}=    Call Method    ${element}    value_of_css_property    color
    Should Be Equal As Strings    ${color}    rgba(0, 0, 0, 1)
    ${text}=    Get Text    ${element}
    Should Be Equal As Strings    ${text}    Mouse over me

    Close Browser

TC2: Verify click - click 4 button 
    Open The Browser
    Enter page    ${CLICK_BTN}    ${CLICK_URL}

    #  default msg is empty
    ${msg}=    Get WebElement    //*[@id="demo"]
    ${text}=    Get Text    ${msg}
    Should Be Empty    ${text}

    # check color button on hover 
    ${cat_btn}=    Get Webelement    //*[@id="post-3145"]/div/div[3]/div/div/div/div[1]/button
    ${dog_btn}=    Get Webelement    //*[@id="post-3145"]/div/div[3]/div/div/div/div[2]/button
    ${pig_btn}=    Get Webelement    //*[@id="post-3145"]/div/div[5]/div[1]/button
    ${cow_btn}=    Get Webelement    //*[@id="post-3145"]/div/div[5]/div[2]/button

    # default button color is white
    ${color}=   Call Method    ${cat_btn}    value_of_css_property    color
    Should Be Equal As Strings    ${color}    rgba(255, 255, 255, 1)
    # color should be black 
    Mouse Over    ${cat_btn}
    ${color}=   Call Method    ${cat_btn}    value_of_css_property    color
    Should Be Equal As Strings    ${color}    rgba(0, 0, 0, 1)

    # click button cat
    Click Element    ${cat_btn}
    ${text}=    Get Text    ${msg}
    Should Be Equal As Strings    ${text}    Meow!

    # click button dog
    Click Element    ${dog_btn}
    ${text}=    Get Text    ${msg}
    Should Be Equal As Strings    ${text}    Woof!

    # click button pig
    Click Element    ${pig_btn}
    ${text}=    Get Text    ${msg}
    Should Be Equal As Strings    ${text}    Oink!

    # click button cow
    Click Element    ${cow_btn}
    ${text}=    Get Text    ${msg}
    Should Be Equal As Strings    ${text}    Moo!

    Close Browser
    
TC3: Verfiy click - double click cat btn 
    Open The Browser
    Enter page    ${CLICK_BTN}    ${CLICK_URL}

    #  default msg is empty
    ${msg}=    Get WebElement    //*[@id="demo"]
    ${text}=    Get Text    ${msg}
    Should Be Empty    ${text}

    # check color button on hover 
    ${cat_btn}=    Get Webelement    //*[@id="post-3145"]/div/div[3]/div/div/div/div[1]/button

    # default button color is white
    ${color}=   Call Method    ${cat_btn}    value_of_css_property    color
    Should Be Equal As Strings    ${color}    rgba(255, 255, 255, 1)
    # color should be black 
    Mouse Over    ${cat_btn}
    ${color}=   Call Method    ${cat_btn}    value_of_css_property    color
    Should Be Equal As Strings    ${color}    rgba(0, 0, 0, 1)

    # double click button cat
    Double Click Element    ${cat_btn}
    ${text}=    Get Text    ${msg}
    Should Be Equal As Strings    ${text}    Meow!

    Close Browser

TC4: Verify gestures - click drag item 
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    ${box}=    Get Webelement    //*[@id="moveMe"]
    ${drag_element}=    Get Webelement    //*[@id="moveMeHeader"]

    # get default position
    ${original_x}=    Get Horizontal Position    ${box}
    ${original_y}=    Get Vertical Position    ${box}
    Log To Console    ${original_x}, ${original_y}

    Click Element    ${drag_element}
    ${x_new}=    Get Horizontal Position    ${box}
    ${y_new}=    Get Vertical Position    ${box}
    Log To Console    ${x_new}, ${y_new}

    Should Be Equal As Numbers    ${x_new}    ${original_x}
    Should Be Equal As Numbers    ${y_new}    ${original_y}

    Close Browser

# window width = 1552
# parent width = 1400
# padding left, right = 60px
TC5: Verify gestures - no drag (left = 0, top = 0)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Check position changed    0    0

    Close Browser

TC6: Verify gestures - drag left within parent (0 < left < parent, top = 0)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Check position changed    100    0

    Close Browser

TC7: Verfiy gestures - drag top within parent (left = 0, 0 < top < parent)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Check position changed    0    100

    Close Browser

TC8: Verify gestures - drag left & top within parent (0 < left < parent, 0 < top < parent)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Check position changed    100    100

    Close Browser

TC9: Verify gestures - drag outside parent to the left (left < 0, top = 0)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Check position changed    -30    0

    Close Browser

TC10: Verify gestures - drag outside parent to the right (right > parent, top = 0)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    # parent width = 1400, padding left: 60px
    Check position changed    1300    0

    Close Browser

TC11: Verify gestures - drag outside window to the left (left < 0, top = 0)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Check position changed    -100    0

    Close Browser

TC12: Verify gestures - drag outside parent top (left = 0, top < 0)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Check position changed    0    -30

    Close Browser

TC13: Verify gestures - drag outside parent top, left (left < 0, top < 0)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Check position changed    -30    -30

    Close Browser

TC14: Verify gestures - drag outside parent top, left (left > parent, top > parent)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    # parent width = 1400, padding left: 60px
    Check position changed    1300    30

    Close Browser

TC15: Verify gesture - drag image into container 1 and 2
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Page Should Contain Element    //*[@id="dragMe"]
    Scroll Element Into View    //*[@id="dragMe"]

    ${image}=    Get Webelement    //*[@id="dragMe"]
    ${container1}=   Get Webelement    //*[@id="div1"]
    ${container2}=   Get Webelement    //*[@id="div2"]

    Drag And Drop    ${image}    ${container2}
    # container 2 should contain image
    Page Should Contain Element    //*[@id="div2"]/img

    Drag And Drop    ${image}    ${container1}
    # container 1 should contain image
    Page Should Contain Element    //*[@id="div1"]/img

    Close Browser

TC16: Verfiy gesture - drag image outside containers (positive value)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Page Should Contain Element    //*[@id="dragMe"]
    Scroll Element Into View    //*[@id="dragMe"]

    ${image}=    Get Webelement    //*[@id="dragMe"]
    ${container1}=   Get Webelement    //*[@id="div1"]
    ${container2}=   Get Webelement    //*[@id="div2"]

    Drag And Drop By Offset    ${image}    300    20

    # container 2 should not contain image
    Page Should Not Contain Element    //*[@id="div2"]/img

    Close Browser

TC17: Verify gesture - drag image outside containers (negative value)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Page Should Contain Element    //*[@id="dragMe"]
    Scroll Element Into View    //*[@id="dragMe"]

    ${image}=    Get Webelement    //*[@id="dragMe"]
    ${container1}=   Get Webelement    //*[@id="div1"]
    ${container2}=   Get Webelement    //*[@id="div2"]

    Drag And Drop By Offset    ${image}    -30    0

    # container 1 should not contain image
    Page Should Not Contain Element    //*[@id="div2"]/img

    Close Browser

TC18: Verify gesture - drag image outside containers (negative value)
    Open The Browser
    Enter page    ${GESTURE_BTN}    ${GESTURE_URL}

    Page Should Contain Element    //*[@id="dragMe"]
    Scroll Element Into View    //*[@id="dragMe"]

    ${image}=    Get Webelement    //*[@id="dragMe"]
    ${container1}=   Get Webelement    //*[@id="div1"]
    ${container2}=   Get Webelement    //*[@id="div2"]

    Drag And Drop By Offset    ${image}    -30    -100

    # container 1 should not contain image
    Page Should Not Contain Element    //*[@id="div2"]/img

    Close Browser

*** Keywords ***
Open The Browser 
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Keyword Succeeds    10s    2s    Location Should Be    url=${URL}
    Maximize Browser Window

Enter page 
    [Arguments]    ${xpath}    ${url}
    ${btn}=    Get Webelement    xpath=${xpath}
    Page Should Contain Element    ${btn}
    Scroll Element Into View    ${btn}
    Click Element    ${btn}
    Wait Until Keyword Succeeds    10s    2s    Location Should Be    url=${url}
    
Check position changed 
    [Arguments]    ${x}    ${y}

    ${box}=    Get Webelement    //*[@id="moveMe"]
    ${drag_element}=    Get Webelement    //*[@id="moveMeHeader"]

    # get default position
    ${original_x}=    Get Horizontal Position    ${box}
    ${original_y}=    Get Vertical Position    ${box}
    Log To Console    ${original_x}, ${original_y}

    Drag And Drop By Offset    ${drag_element}    ${x}    ${y}

    ${x_new}=    Get Horizontal Position    ${box}
    ${y_new}=    Get Vertical Position    ${box}
    Log To Console    ${x_new}, ${y_new}

    ${original_x}=    Convert To Number    item=${original_x}
    ${original_x}=    Evaluate    ${original_x} + ${x}
      
    ${original_y}=    Convert To Number    item=${original_y}
    ${original_y}=    Evaluate    ${original_y} + ${y} + 1
    Log To Console    added, ${original_x}, ${original_y}

    Should Be Equal As Numbers    ${x_new}    ${original_x}
    Should Be Equal As Numbers    ${y_new}    ${original_y}