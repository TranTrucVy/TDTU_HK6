*** Settings ***
Documentation     This test suite is to verify search functionality
Library           SeleniumLibrary
Resource          ../resources/common.robot
Resource           ../resources/search/search.robot
Resource          ../variables/search.robot
Test Teardown     Closing my browser
Test Setup        Opening my browser

*** Variables ***
### Test data: search ###
${key_product}    GUCCI GUILTY
${key_desc}    Bergamot
${key_invalid}    123456
${key_too_long}    lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec odio vitae
${key_product_apparel}    JERSEY COTTON STRIPED POLO SHIRT
${key_product_makeup}    TROPIQUES MINERALE LOOSE BRONZER
${key_product_skincare}    TOTAL MOISTURE FACIAL CREAM
${key_product_fragrance}    GUCCI GUILTY
${key_product_men}    DOVE MEN +CARE BODY WASH
${key_product_haircare}    SEAWEED CONDITIONER
${key_product_book}    ALLEGIANT BY VERONICA ROTH

${key_relative_product}    guc
${key_relative_apparel}    jer 
${key_relative_makeup}    mineral
${key_relative_skincare}    facial
${key_relative_fragrance}    guc
${key_relative_men}    dov
${key_relative_haircare}    seaw
${key_relative_book}    allegian

${key_desc_apparel}    Manmade
${key_desc_makeup}    Aloe Vera
${key_desc_skincare}    night cream
${key_desc_fragrance}    Calvin Klein
${key_desc_men}    skin
${key_desc_haircare}    Shampoo
${key_desc_book}    John Green

${key_model_desc1}    hom    
${key_model_desc2}    polo shirt

# test sub category 
${key_product_apparel_tshirts}    polo shirt 
${key_product_apparel_shoes}    FIORELLA PURPLE PEEP TOES

${key_product_makeup_cheeks}    Benefit Bella Bamba
${key_product_makeup_eyes}    WATERPROOF PROTECTIVE UNDEREYE CONCEALER
${key_product_makeup_face}    PRODUCT WITH STOCK LOCATIONS
${key_product_makeup_lips}    Viva Glam Lipstick
${key_product_makeup_nails}    Nail Lacquer
${key_product_makeup_value_sets}    LANCOME HYPNOSE DOLL

${key_product_skincare_eyes}    EYE REJUVENATING SERUM
${key_product_skincare_face}    Body Cream by Bulgari
${key_product_skincare_gift}    Skin Minerals For Men Cleansing Cream
${key_product_skincare_hand_nail}    Absolute Anti-Age
${key_product_skincare_sun}    Flash Bronzer Body Gel

${key_product_fragrance_men}    Armani Code Sport
${key_product_fragrance_women}    Bvlgari Aqua

${key_product_men_body_shower}    Dove Men +Care Body Wash
${key_product_men_fragrance}    Obsession Night Perfume
${key_product_men_shaving}    Shaving cream
${key_product_men_skincare}    Clean Shower Tool

${key_product_haircare_conditioner}    Brunette expressions Conditioner
${key_product_haircare_shampoo}    Curls to straight Shampoo

${key_product_book_audiocd}    New French With Ease
${key_product_book_paperback}    Allegiant by Veronica Roth

### product model number 
${key_model_number1}    463686
${key_model_number_invalide}    12312356

*** Test Cases ***
TC1 - Verify search - no input 
    [Documentation]    Verify search - no input 
    [Tags]    search
    Seach product no keyword

TC2 - Check search submit action - no input 
    [Documentation]    Check search submit action - no input 
    [Tags]    search
    Search with no key word & Press Enter
    Search with no key word & Click search btn

TC3 - Check search submit action - with input & Enter
    [Documentation]    Check search submit action - with input & Enter
    [Tags]    search
    Search with key word & Press Enter    ${key_product}
    Verify search result with keyword product name    ${key_product}

TC4 - Check search submit action - with input & Click
    [Documentation]    Check search submit action - with input & Click
    [Tags]    search
    Search with key word & Click search btn    ${key_product}
    Verify search result with keyword product name    ${key_product}

TC5 - Search with input not found (all categories)
    [Documentation]    Search with input not found (all categories)
    [Tags]    search
    Search by product name    ${key_invalid}    all categories
    Verify search result keyword not found

TC6 - Search with input too long (all categories)
    [Documentation]    Search with input too long (all categories)
    [Tags]    search
    Search by product name    ${key_too_long}    all categories
    Verify search result keyword not found

TC7 - Search with input not found (category - apparel)
    [Documentation]    Search with input not found (apparel)
    [Tags]    search
    Search by product name    ${key_invalid}    apparel & accessories
    Verify search result keyword not found

TC8 - Search with input not found sub_category (apparel - t-shirts)
    [Documentation]    Search with input not found (apparel - t-shirts)
    [Tags]    search
    Search by product name sub category    ${key_invalid}    apparel & accessories    t-shirts
    Verify search result keyword not found

# Test search by product name
TC9 - Verify search absolute - with input exist (product name, all categories)
    [Documentation]    Verify search absolute - with input exist (product name)
    [Tags]    search
    Search by product name    ${key_product}    all categories
    Verify search result with keyword product name    ${key_product}

TC10 - Verify search absolute - with input exist (product name, apparel)
    [Documentation]    Verify search absolute - with input exist (product name, apparel)
    [Tags]    search    
    Search by product name    ${key_product_apparel}    apparel & accessories
    Verify search result with keyword product name    ${key_product_apparel}

TC11 - Verify search absolute - with input exist (product name, makeup)
    [Documentation]    Verify search absolute - with input exist (product name, makeup)
    [Tags]    search
    Search by product name    ${key_product_makeup}    makeup
    Verify search result with keyword product name    ${key_product_makeup}

TC12 - Verify search absolute - with input exist (product name, skincare)
    [Documentation]    Verify search absolute - with input exist (product name, skincare)
    [Tags]    search
    Search by product name    ${key_product_skincare}    skincare
    Verify search result with keyword product name    ${key_product_skincare}

TC13 - Verify search absolute - with input exist (product name, fragrance)
    [Documentation]    Verify search absolute - with input exist (product name, fragrance)
    [Tags]    search
    Search by product name    ${key_product_fragrance}    fragrance
    Verify search result with keyword product name    ${key_product_fragrance}

TC14 - Verify search absolute - with input exist (product name, men)
    [Documentation]    Verify search absolute - with input exist ( product name, men)
    [Tags]    search
    Search by product name    ${key_product_men}    men
    Verify search result with keyword product name    ${key_product_men}

TC15 - Verify search absolute - with input exist (product name, haircare)
    [Documentation]    Verify search absolute - with input exist (product name, haircare)
    [Tags]    search
    Search by product name    ${key_product_haircare}    haircare
    Verify search result with keyword product name    ${key_product_haircare}

TC16 - Verify search absolute - with input exist (product name, book)
    [Documentation]    Verify search absolute - with input exist (product name, book)
    [Tags]    search
    Search by product name    ${key_product_book}    book
    Verify search result with keyword product name    ${key_product_book}

TC17 - Verify search absolute - with keyword category (makeup, all categories)
    [Documentation]    Verify search absolute - with input exist (key category)
    [Tags]    search
    Search by product name    makeup    all categories
    Verify search result with keyword product name    makeup

TC18 - Verify search absolute - with keyword category (skincare, all categories)
    [Documentation]    Verify search absolute - with input exist (key category)
    [Tags]    search
    Search by product name    skincare    all categories
    Verify search result with keyword product name    skincare

# Test search relative by product name
TC19 - Verify search relative - with input exist (product name, all categories)
    [Documentation]    Verify search relative - with input exist (product name)
    [Tags]    search
    Search by product name    ${key_relative_product}    all categories
    Verify search result with keyword product name    ${key_relative_product}

TC20 - Verify search relative - with input exist (product name, apparel)
    [Documentation]    Verify search relative - with input exist (product name, apparel)
    [Tags]    search    
    Search by product name    ${key_relative_apparel}    apparel & accessories
    Verify search result with keyword product name    ${key_relative_apparel}

TC21 - Verify search relative - with input exist (product name, makeup)
    [Documentation]    Verify search relative - with input exist (product name, makeup)
    [Tags]    search
    Search by product name    ${key_relative_makeup}    makeup
    Verify search result with keyword product name    ${key_relative_makeup}

TC22 - Verify search relative - with input exist (product name, skincare)
    [Documentation]    Verify search relative - with input exist (product name, skincare)
    [Tags]    search
    Search by product name    ${key_relative_skincare}    skincare
    Verify search result with keyword product name    ${key_relative_skincare}

TC23 - Verify search relative - with input exist (product name, fragrance)
    [Documentation]    Verify search relative - with input exist (product name, fragrance)
    [Tags]    search
    Search by product name    ${key_relative_fragrance}    fragrance
    Verify search result with keyword product name    ${key_relative_fragrance}

TC24 - Verify search relative - with input exist (product name, men)
    [Documentation]    Verify search relative - with input exist ( product name, men)
    [Tags]    search
    Search by product name    ${key_relative_men}    men
    Verify search result with keyword product name    ${key_relative_men}

TC25 - Verify search relative - with input exist (product name, haircare)
    [Documentation]    Verify search relative - with input exist (product name, haircare)
    [Tags]    search
    Search by product name    ${key_relative_haircare}    haircare
    Verify search result with keyword product name    ${key_relative_haircare}

TC26 - Verify search relative - with input exist (product name, book)
    [Documentation]    Verify search relative - with input exist (product name, book)
    [Tags]    search
    Search by product name    ${key_relative_book}    book
    Verify search result with keyword product name    ${key_relative_book}

# Test search by description
TC27 - Verify search - with input exist (description, all categories)
    [Documentation]    Verify search - with input exist (description)
    [Tags]    search
    Search by description    ${key_desc}    fragrance
    Verify search result with keyword product description    ${key_desc}

TC28 - Verify search - with input exist (description, apparel)
    [Documentation]    Verify search - with input exist (description, apparel)
    [Tags]    search
    Search by description    ${key_desc_apparel}    apparel & accessories
    Verify search result with keyword product description    ${key_desc_apparel}

TC29 - Verify search - with input exist (description, makeup)
    [Documentation]    Verify search - with input exist (description, makeup)
    [Tags]    search
    Search by description    ${key_desc_makeup}    makeup
    Verify search result with keyword product description    ${key_desc_makeup}

TC30 - Verify search - with input exist (description, skincare)
    [Documentation]    Verify search - with input exist (description, skincare)
    [Tags]    search
    Search by description    ${key_desc_skincare}    skincare
    Verify search result with keyword product description    ${key_desc_skincare}

TC31 - Verify search - with input exist (description, fragrance)
    [Documentation]    Verify search - with input exist (description, fragrance)
    [Tags]    search
    Search by description    ${key_desc_fragrance}    fragrance
    Verify search result with keyword product description    ${key_desc_fragrance}

TC32 - Verify search - with input exist (description, men)
    [Documentation]    Verify search - with input exist ( description, men)
    [Tags]    search
    Search by description    ${key_desc_men}    men
    Verify search result with keyword product description    ${key_desc_men}

TC33 - Verify search - with input exist (description, haircare)
    [Documentation]    Verify search - with input exist (description, haircare)
    [Tags]    search
    Search by description    ${key_desc_haircare}    haircare
    Verify search result with keyword product description    ${key_desc_haircare}

TC34 - Verify search - with input exist (description, book)
    [Documentation]    Verify search - with input exist (description, book)
    [Tags]    search
    Search by description    ${key_desc_book}    book
    Verify search result with keyword product description    ${key_desc_book}

# Test search product model & descript 
TC35 - Verify search absolute - with input exist (product model, all categories)
    [Documentation]    Verify search absolute - with input exist (product model)
    [Tags]    search
    Search by product model & description     ${key_model_desc1}    all categories
    Verify search result with keyword product model & description    ${key_model_desc1}

TC36 - Verify search with product model then change to description 
    [Documentation]    Verify search with product model then description
    [Tags]    search
    Search by product name    ${key_model_desc2}    all categories
    Verify search result with keyword product name    ${key_model_desc2}
    Go Back
    Switch from product model to description    ${key_model_desc2}    all categories
    Verify search result with keyword product description    ${key_model_desc2}

TC37 - Verify search with product model only then with description 
    [Documentation]    Verify search with product model only then with description
    [Tags]    search
    Search by product name    ${key_model_desc2}    all categories
    Verify search result with keyword product name    ${key_model_desc2}
    Go Back
    Add search with description    ${key_model_desc2}    all categories
    Verify search result with keyword product description    ${key_model_desc2}

TC38 - Verify search switch from desciption to product model
    [Documentation]    Verify search switch from desciption to product model
    [Tags]    search
    Search by description    ${key_model_desc2}    all categories
    Verify search result with keyword product description    ${key_model_desc2}
    Go Back
    Switch from product description to model    ${key_model_desc2}    all categories
    Verify search result with keyword product name    ${key_model_desc2} 

### Test search by sub category    

TC39 - Verify search absolute - with input exist(sub category apparel - t-shirts)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_apparel}    apparel & accessories    t-shirts
    Verify search result with keyword product name    ${key_product_apparel}

TC40 - Verify search absolute - with input exist(sub category apparel - shoes)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_apparel_shoes}    apparel & accessories    shoes
    Verify search result with keyword product name    ${key_product_apparel_shoes}

TC41 - Verify search absolute - with input exist(sub category makeup - cheeks)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_makeup_cheeks}    makeup    cheeks
    Verify search result with keyword product name    ${key_product_makeup_cheeks}

TC42 - Verify search absolute - with input exist(sub category makeup - eyes)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_makeup_eyes}    makeup    eyes
    Verify search result with keyword product name    ${key_product_makeup_eyes}

TC43 - Verify search absolute - with input exist(sub category makeup - face)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_makeup_face}    makeup    face
    Verify search result with keyword product name    ${key_product_makeup_face}

TC44 - Verify search absolute - with input exist(sub category makeup - lips)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_makeup_lips}    makeup    lips
    Verify search result with keyword product name    ${key_product_makeup_lips}

TC45 - Verify search absolute - with input exist(sub category makeup - nails)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_makeup_nails}    makeup    nails
    Verify search result with keyword product name    ${key_product_makeup_nails}

TC46 - Verify search absolute - with input exist(sub category makeup - value sets)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_makeup_value_sets}    makeup    value sets
    Verify search result with keyword product name    ${key_product_makeup_value_sets}

TC47 - Verify search absolute - with input exist(sub category skincare - eyes)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_skincare_eyes}    skincare    eyes
    Verify search result with keyword product name    ${key_product_skincare_eyes}

TC48 - Verify search absolute - with input exist(sub category skincare - face)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_skincare_face}    skincare    face
    Verify search result with keyword product name    ${key_product_skincare_face}

TC49 - Verify search absolute - with input exist(sub category skincare - gift)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_skincare_gift}    skincare    gift ideas & sets
    Verify search result with keyword product name    ${key_product_skincare_gift}

TC50 - Verify search absolute - with input exist(sub category skincare - hand & nail)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_skincare_hand_nail}    skincare    hands & nails
    Verify search result with keyword product name    ${key_product_skincare_hand_nail}

TC51 - Verify search absolute - with input exist(sub category skincare - sun)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_skincare_sun}    skincare    sun
    Verify search result with keyword product name    ${key_product_skincare_sun}

TC52 - Verify search absolute - with input exist(sub category fragrance - men)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_fragrance_men}    fragrance    men
    Verify search result with keyword product name    ${key_product_fragrance_men}

TC53 - Verify search absolute - with input exist(sub category fragrance - women)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_fragrance_women}    fragrance    women
    Verify search result with keyword product name    ${key_product_fragrance_women}


TC54 - Verify search absolute - with input exist(sub category men - body & shower)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_men_body_shower}    men    body & shower
    Verify search result with keyword product name    ${key_product_men_body_shower}

TC55 - Verify search absolute - with input exist(sub category men - fragrance)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_men_fragrance}    men    fragrance sets
    Verify search result with keyword product name    ${key_product_men_fragrance}

TC56 - Verify search absolute - with input exist(sub category men - shaving)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_men_shaving}    men    pre-shave & shaving
    Verify search result with keyword product name    ${key_product_men_shaving}

TC57 - Verify search absolute - with input exist(sub category men - skincare)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub Category    ${key_product_men_skincare}    men    skincare
    Verify search result with keyword product name    ${key_product_men_skincare}

TC58 - Verify search absolute - with input exist(sub category haircare - conditioner)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_haircare_conditioner}    hair care    conditioner
    Verify search result with keyword product name    ${key_product_haircare_conditioner}

TC59 - Verify search absolute - with input exist(sub category haircare - shampoo)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_haircare_shampoo}    hair care    shampoo
    Verify search result with keyword product name    ${key_product_haircare_shampoo}

TC60 - Verify search absolute - with input exist(sub category book - audiocd)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_book_audiocd}    books    audio cd
    Verify search result with keyword product name    ${key_product_book_audiocd}

TC61 - Verify search absolute - with input exist(sub category book - paperback)
    [Documentation]    Verify search absolute - with input exist(sub category)
    [Tags]    search
    Search by product name sub category    ${key_product_book_paperback}    books    paperback
    Verify search result with keyword product name    ${key_product_book_paperback}


# Test search with product model number 
TC62 - Verify search absolute - with input exist (product model number, all categories)
    [Documentation]    Verify search absolute - with input exist (product model number)
    [Tags]    search
    Search with product model number    ${key_model_number1}    all categories
    Verify search result with product model number    ${key_model_number1}

TC63 - Verify search absolute - with input exist (product model number, haircare)
    [Documentation]    Verify search absolute - with input exist (product model number, haircare)
    [Tags]    search
    Search with product model number    ${key_model_number1}    hair care
    Verify search result keyword not found

TC64 - Verify search absolute - with input exist (product model number, skincare)
    [Documentation]    Verify search absolute - with input exist (product model number, skincare)
    [Tags]    search
    Search with product model number    ${key_model_number1}    skincare
    Verify search result with product model number    ${key_model_number1}

TC65 - Verify search absolute - with input exist (product model number, invalid)
    [Documentation]    Verify search absolute - with input exist (product model number, invalid)
    [Tags]    search
    Search with product model number    ${key_model_number_invalide}    all categories
    Verify search result keyword not found