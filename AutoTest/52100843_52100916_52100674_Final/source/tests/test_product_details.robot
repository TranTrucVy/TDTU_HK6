*** Settings ***
Documentation     Test cases for product details page
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource           ../resources/product_details/product_details.robot
Resource           ../resources/account/login.robot
Resource           ../resources/search/search.robot
Test Teardown     Closing my browser
Test Setup        Opening my browser

*** Variables ***
${valid_login_name_1}=    annepattrick
${valid_login_password_1}=    123456

${random_product_card}    //*[@id="block_frame_featured_1769"]/div/div[1]
${valid_product_url}    https://automationteststore.com/index.php?rt=product/product&product_id=50
${invalid_product_url}    https://automationteststore.com/index.php?rt=product/product&product_id=4564

${product_card_out_of_stock}    //*[@id="maincontainer"]/div/div/div/div/div[2]/div[3]
${product_card_sales}    //*[@id="block_frame_latest_1770"]/div/div[2]

${product_with_review}    https://automationteststore.com/index.php?rt=product/product&product_id=55

${product_with_multiple_choice_in_stock}    https://automationteststore.com/index.php?rt=product/product&product_id=55

${product_with_multiple_choice_out_of_stock}    https://automationteststore.com/index.php?rt=product/product&product_id=123

${product_with_related_product}    https://automationteststore.com/index.php?rt=product/product&product_id=118

# Verify product details in home 
${home_featured}    //*[@id="featured"]/div[@class='container-fluid']
${home_latest_product}    //*[@id="latest"]/div[@class='container-fluid']
${home_bestsellers}    //*[@id='bestseller']/div[@class='container-fluid']
${home_specials}    //*[@id="special"]/div[@class='container-fluid']

${page_specials}    https://automationteststore.com/index.php?rt=product/special

*** Test Cases ***
TC1 - View product detail when click on product name 
    [Documentation]    Test case to verify product details page when click on product name
    Enter page    ${URL_HOME}
    Click on a product name and Verify product details    ${random_product_card}

TC2 - View product detail when click on view btn 
    [Documentation]    Test case to verify product details page when click on view btn
    Enter page    ${URL_HOME}
    Click on a product view btn and Verify product details    ${random_product_card}

TC3 - View product detail when click on product image 
    [Documentation]    Test case to verify product details page when click on product image
    Enter page    ${URL_HOME}
    Click on a product image and Verify product details    ${random_product_card}

TC4 - View product detail when directly access valid product url 
    [Documentation]    Test case to verify product details page when directly access product url
    Access product details by valid url and Verify product details    ${valid_product_url}

TC5 - View product detail when directly access invalid product url 
    [Documentation]    Test case to verify product details page when directly access invalid product url
    Access product details by invalid url and Verify product details    ${invalid_product_url}

TC6 - Verify product details page when product is out of stock
    [Documentation]    Test case to verify product details page when product is out of stock
    Enter page    https://automationteststore.com/index.php?rt=product/category&path=68
    Click on an out of stock product name and Verify product details    ${product_card_out_of_stock}

TC7 - Verify product details page when product is on sales
    [Documentation]    Test case to verify product details page when product is on sales
    Enter page    ${URL_HOME}
    Click on a product on sales name and Verify product details    ${product_card_sales}

TC8 - Verify product details with customer review
    [Documentation]    Test case to verify product details with customer review
    Click on a product name and Verify product details with customer review    ${product_with_review}

TC9 - View product detail when user login successfully
    [Documentation]    Test case to verify product details page when user not login
    Enter page    ${REGISTER_LOGIN_PAGE}
    Login successfully with registered account    ${valid_login_name_1}    ${valid_login_password_1}
    Enter page    ${URL_HOME}
    Click on a product name and Verify product details    ${random_product_card}

TC10 - Verify product details with multiple choice (in stock)
    [Documentation]    Test case to verify product details with multiple choice
    Access product details and Verify product details with multiple choice in stock   ${product_with_multiple_choice_in_stock}

TC11 - Verify product details with multiple choice (out of stock)
    [Documentation]    Test case to verify product details with multiple choice
    Access product details and Verify product details with multiple choice out of stock   ${product_with_multiple_choice_out_of_stock}

TC12 - Verify product details with related product
    [Documentation]    Test case to verify product details with related product
    Access product details and Verify product details with related product   ${product_with_related_product}

TC13 - Verify product details in home - featured
    [Documentation]    Test case to verify product details in home - featured
    Enter page    ${URL_HOME}
    Verify product detail from home   ${home_featured}

TC14 - Verify product details in home - latest product
    [Documentation]    Test case to verify product details in home - latest product
    Enter page    ${URL_HOME}
    Verify product detail from home   ${home_latest_product}

TC15 - Verify product details in home - bestsellers
    [Documentation]    Test case to verify product details in home - bestsellers
    Enter page    ${URL_HOME}
    Verify product detail from home   ${home_bestsellers}

TC16 - Verify product details in home - specials
    [Documentation]    Test case to verify product details in home - specials
    Enter page    ${URL_HOME}
    Verify product detail from home   ${home_specials}

TC17 - Verify product details in specials page
    [Documentation]    Test case to verify product details in specials page
    Enter page    ${page_specials}
    Verify product detail from specials page

TC18 - Verify product details in home - brands 
    [Documentation]    Test case to verify product details in home - brands
    Enter page    ${URL_HOME}
    Verify product detail from home - brands

# category: apparel & accessories, makeup, skincare, fragrance, men, hair care, book
TC19 - Verify product details sub category (apparel)
    [Documentation]    Test case to verify product details sub category (apparel)
    Enter page    ${URL_HOME}
    Verify product detail from sub category   apparel & accessories

TC20 - Verify product details sub category (makeup)
    [Documentation]    Test case to verify product details sub category (makeup)
    Enter page    ${URL_HOME}
    Verify product detail from sub category   makeup

TC21 - Verify product details sub category (skincare)
    [Documentation]    Test case to verify product details sub category (skincare)
    Enter page    ${URL_HOME}
    Verify product detail from sub category   skincare

TC22 - Verify product details sub category (fragrance)
    [Documentation]    Test case to verify product details sub category (fragrance)
    Enter page    ${URL_HOME}
    Verify product detail from sub category   fragrance

TC23 - Verify product details sub category (men)
    [Documentation]    Test case to verify product details sub category
    Enter page    ${URL_HOME}
    Verify product detail from sub category    men

TC24 - Verify product details sub category (hair care)
    [Documentation]    Test case to verify product details sub category (hair care)
    Enter page    ${URL_HOME}
    Verify product detail from sub category   hair care

TC25 - Verify product details sub category (book)
    [Documentation]    Test case to verify product details sub category (book)
    Enter page    ${URL_HOME}
    Verify product detail from sub category   book

TC26 - Verify product details from search result (all categories)
    [Documentation]    Test case to verify product details from search result (all categories)
    Search by product name    polo shirt    all categories
    Verify product detail from search result

TC27 - Verify product details from search result (apparel & accessories)
    [Documentation]    Test case to verify product details from search result (apparel & accessories)
    Search by product name    polo shirt    apparel & accessories
    Verify product detail from search result