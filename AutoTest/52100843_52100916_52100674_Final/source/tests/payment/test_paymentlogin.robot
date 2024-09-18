*** Settings ***
Documentation     This test suite is to verify search functionality
Test Setup        Opening my browser
Test Teardown     Closing my browser
Library           SeleniumLibrary
Resource          ../../resources/common.robot
Resource          ../../resources/payment/paymentlogin.robot

*** Test Cases ***
Payment when without login and login
    Payment when without login and login

Payment when login in web
    Payment when login in web

Payment when login in web with button checkout 2
    Payment when login in web with button checkout 2
