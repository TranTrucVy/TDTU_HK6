*** Settings ***
Documentation     Module1 - Shop page
Test Setup        Opening my browser
Test Teardown     Closing my browser
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource          ../resources/currencyConvert/currencyConvert.robot

*** Test Cases ***
Change usd to pound to euro to usd
    Change usd to pound to euro to usd

Change usd to euro to pound to usd
    Change usd to euro to pound to usd
