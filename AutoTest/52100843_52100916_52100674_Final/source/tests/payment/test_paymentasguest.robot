*** Settings ***
Documentation     This test suite is to verify search functionality
Library           SeleniumLibrary
Resource          ../../resources/common.robot
Resource          ../../resources/payment/paymentasguest.robot
Test Teardown     Closing my browser
Test Setup        Opening my browser

*** Test Cases ***
Checkout when without adding products to the cart
    Checkout when without adding products to the cart

Checkout when add products to the cart
    Checkout when add products to the cart

Payment when choose guest select only
    Payment when choose guest select only    Payment when choose guest select only and submit empty form
    Payment when choose guest select only    Payment when choose guest select only and submit name below 3 characters
    Payment when choose guest select only    Payment when choose guest select only and submit name than 32 characters
    Payment when choose guest select only    Payment when choose guest select only and submit email invalid
    Payment when choose guest select only    Payment when choose guest select only and submit address than 128 characters
    Payment when choose guest select only    Payment when choose guest select only and submit zipcode below 3 characters
    Payment when choose guest select only    Payment when choose guest select only and submit zipcode than 10 characters
    Payment when choose guest select only    Payment true only guest
Payment when choose guest select only and submit telephone empty
    Payment when choose guest select only and submit telephone empty

Payment when choose guest select only and submit telephone not a number
    Payment when choose guest select only and submit telephone not a number

Payment when choose guest select 
    Payment when choose guest select    Payment when choose guest select and submit empty form      
    Payment when choose guest select    Payment when choose guest select and submit and click shipping
    Payment when choose guest select    Payment when choose guest select and submit name below 3 characters
    Payment when choose guest select    Payment when choose guest select and submit name than 32 characters
    Payment when choose guest select    Payment when choose guest select and submit email invalid
    Payment when choose guest select    Payment when choose guest select and submit address than 128 characters
    Payment when choose guest select    Payment when choose guest select and submit zipcode below 3 characters
    Payment when choose guest select    Payment when choose guest select and submit zipcode than 10 characters
    Payment when choose guest select    Payment true with shipping

Payment when choose guest select and submit telephone empty
    Payment when choose guest select and submit telephone empty

Payment when choose guest select and submit telephone not a number 
    Payment when choose guest select and submit telephone not a number 

