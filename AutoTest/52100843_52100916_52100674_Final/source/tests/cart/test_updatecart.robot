*** Settings ***
Documentation     Cart
Test Setup        Opening my browser
Test Teardown     Closing my browser
Library           SeleniumLibrary
Resource          ../../resources/common.robot
Resource          ../../resources/cart/updatecart.robot

*** Test Cases ***
Update add valid quantity by input text
    Update add valid quantity by input text

Update remove valid quantity by input text 
    Update remove valid quantity by input text 

Update zero quantity by input text
    Update zero quantity by input text

Update not a number quantity by input text
    Update not a number quantity by input text

Update negative number by input text
    Update negative number by input text

Update exceed in stock quantity by input text
    Update exceed in stock quantity by input text

Update remove item by delete button
    Update remove item by delete button

Update no change quantity 
    Update no change quantity 
