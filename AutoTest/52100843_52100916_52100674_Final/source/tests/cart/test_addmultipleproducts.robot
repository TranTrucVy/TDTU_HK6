*** Settings ***
Documentation     Cart
Test Setup        Opening my browser
Test Teardown     Closing my browser
Library           SeleniumLibrary
Resource          ../../resources/common.robot
Resource          ../../resources/cart/addmultipro.robot

*** Test Cases ***
Add two valid item
    Add two valid item

Add first item valid and second item invalid
    Add first item valid and second item invalid

Add first item invalid and second item valid
    Add first item invalid and second item valid

Add two item invalid
    Add two item invalid

Add first item quantity and exceed second item
    Add first item quantity and exceed second item

Add item first item quantity and not enough valid
    Add item first item quantity and not enough valid

Add two item valid with another product
    Add two item valid with another product

Add two item valid with another product with select
    Add two item valid with another product with select

