*** Settings ***
Documentation     Sitemap Footer Contact us
Test Setup        Opening my browser
Test Teardown     Closing my browser
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource          ../resources/contactus/contactus.robot

*** Test Cases ***
Contact site map and contact us footer
    Contact site map and contact us footer

Check site map and verify
    Check site map and verify

Verify contact us when empty input
    Verify contact us when empty input

Verify contact us when true input
    Verify contact us when true input

Verify contact us when name input below 3 character and another true
    Verify contact us when name input below 3 character and another true

Verify contact us when name input than 32 character and another true
    Verify contact us when name input than 32 character and another true

Verify contact us when email input wrong format
    Verify contact us when email input wrong format

Verify contact us when enquiry input below 10 character and another true
    Verify contact us when enquiry input below 10 character and another true

Verify contact us when enquiry input than 3000 character and another true
    Verify contact us when enquiry input than 3000 character and another true
