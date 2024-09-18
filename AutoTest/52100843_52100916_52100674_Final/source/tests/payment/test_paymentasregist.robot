*** Settings ***
Documentation     This test suite is to verify search functionality
Library           SeleniumLibrary
Resource          ../../resources/common.robot
Resource          ../../resources/payment/paymentasregist.robot
Test Teardown     Closing my browser
Test Setup        Opening my browser

*** Test Cases ***
Payment when choose regist account
    Payment when choose regist account    Payment regist and submit empty
    Payment when choose regist account    Payment regist and submit name than 32 characters
    Payment when choose regist account    Payment regist and submit email invalid
    Payment when choose regist account    Payment regist and submit address below 3 characters
    Payment when choose regist account    Payment regist and submit address than 128 characters
    Payment when choose regist account    Payment regist and submit zipcode below 3 characters
    Payment when choose regist account    Payment regist and submit login name below 5 characters
    Payment when choose regist account    Payment regist and submit login name than 64 characters
    Payment when choose regist account    Payment regist and submit password below 4 characters
    Payment when choose regist account    Success regist account

Payment regist and submit zipcode than 10 characters
    Payment regist and submit zipcode than 10 characters

Payment regist and submit password than 20 characters
    Payment regist and submit password than 20 characters
