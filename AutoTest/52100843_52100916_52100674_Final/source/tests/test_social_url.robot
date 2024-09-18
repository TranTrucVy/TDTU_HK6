*** Settings ***
Documentation     This test suite is to verify search functionality
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource          ../resources/social_url.robot
Test Teardown     Closing my browser
Test Setup        Opening my browser

*** Variables ***
${head_fb}    //div[@class='container-fixed']/header/div[@class='container-fluid']/div[@class='col-md-12 headerdetails']/div[@class='block_8']/div[@class='header_block']/div[@class='social_icons']/a[@class='facebook']
${head_tw}    //div[@class='container-fixed']/header/div[@class='container-fluid']/div[@class='col-md-12 headerdetails']/div[@class='block_8']/div[@class='header_block']/div[@class='social_icons']/a[@class='twitter']
${head_in}    //div[@class='container-fixed']/header/div[@class='container-fluid']/div[@class='col-md-12 headerdetails']/div[@class='block_8']/div[@class='header_block']/div[@class='social_icons']/a[@class='linkedin']

${footer_fb}    //div[@class='container-fixed']/div[@id='footer']/footer/section[@class='footerlinks']/div[@class='container-fluid']/div[@class='pull-right']/div[@class='footer_block']/div[@class='social_icons']/a[@class='facebook']
${footer_tw}    //div[@class='container-fixed']/div[@id='footer']/footer/section[@class='footerlinks']/div[@class='container-fluid']/div[@class='pull-right']/div[@class='footer_block']/div[@class='social_icons']/a[@class='twitter']
${footer_in}    //div[@class='container-fixed']/div[@id='footer']/footer/section[@class='footerlinks']/div[@class='container-fluid']/div[@class='pull-right']/div[@class='footer_block']/div[@class='social_icons']/a[@class='linkedin']

*** Test Cases ***
TC - Verify header link - Facebook
    # get attribute href
    Scroll Element Into View    locator=${head_fb}
    ${fb_link}=    Get Element Attribute    ${head_fb}    href
    Log To Console    fb link: ${fb_link}
    # open the link
    Click on social link and verify   ${head_fb}    ${fb_link}

TC - Verify header link - Twitter
    # get attribute href
    Scroll Element Into View    locator=${head_tw}
    ${tw_link}=    Get Element Attribute    ${head_tw}    href
    Log To Console    tw link: ${tw_link}
    # open the link
    Click on social link and verify   ${head_tw}    ${tw_link}

TC - Verify header link - LinkedIn
    # get attribute href
    Scroll Element Into View    locator=${head_in}
    ${in_link}=    Get Element Attribute    ${head_in}    href
    Log To Console    in link: ${in_link}
    # open the link
    Click on social link and verify   ${head_in}    ${in_link}

TC - Verify footer link - Facebook
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
    # get attribute href
    ${fb_link}=    Get Element Attribute    ${footer_fb}    href
    Log To Console    fb link: ${fb_link}
    # open the link
    Click on social link and verify   ${footer_fb}    ${fb_link}

TC - Verify footer link - Twitter
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
    # get attribute href
    ${tw_link}=    Get Element Attribute    ${footer_tw}    href
    Log To Console    tw link: ${tw_link}
    # open the link
    Click on social link and verify   ${footer_tw}    ${tw_link}

TC - Verify footer link - LinkedIn
    # get attribute href
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);

    ${in_link}=    Get Element Attribute    ${footer_in}    href
    Log To Console    in link: ${in_link}
    # open the link
    Click on social link and verify   ${footer_in}    ${in_link}

