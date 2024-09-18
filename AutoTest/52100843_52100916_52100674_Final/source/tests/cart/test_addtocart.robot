*** Settings ***
Documentation     Cart
Test Setup        Opening my browser
Test Teardown     Closing my browser
Library           SeleniumLibrary
Resource          ../../resources/common.robot
Resource          ../../resources/cart/addtocart.robot

*** Test Cases ***
Add to cart from homepage featured
    Add to cart from homepage featured

Add to cart from homepage latest products
    Add to cart from homepage latest products

Add to cart from homepage bestsellers
    Add to cart from homepage bestsellers

Add to cart from homepage specials
    Add to cart from homepage specials

Add to cart from homepage featured has minimum
    Add to cart from homepage featured has minimum

Add to cart from homepage specials product with 2 product
    Add to cart from homepage specials product with 2 product

Add to cart from homepage specials product with quanlity 0
    Add to cart from homepage specials product with quanlity 0
   
Add to cart from homepage specials product with not a number
    Add to cart from homepage specials product with not a number
   
Add to cart from homepage specials product with a negative number
    Add to cart from homepage specials product with a negative number

Add to cart from homepage bestsellers product choose options
    Add to cart from homepage bestsellers product choose options
      
Add to cart from homepage specials product select dropdown
    Add to cart from homepage specials product select dropdown

Add to cart from homepage bestsellers product out of stock
    Add to cart from homepage bestsellers product out of stock

Check out of stock
    Check out of stock



Add to cart from sub category (apparel)
    Add to cart from sub category    apparel & accessories

Add to cart from sub category (makeup)
    Add to cart from sub category    makeup

Add to cart from sub category (skincare)
    Add to cart from sub category    skincare

Add to cart from sub category (fragrance)
    Add to cart from sub category    fragrance

Add to cart from sub category (men)
    Add to cart from sub category    men

Add to cart from sub category (hair care)
    Add to cart from sub category    hair care

Add to cart from sub category (book)
    Add to cart from sub category    book
