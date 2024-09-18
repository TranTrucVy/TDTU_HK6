*** Variables ***
${PRODUCT_DETAIL_PATH}    https://automationteststore.com/index.php?rt=product/product


### Product Card
${PRODUCT_CARD_NAME}    //*[@id="block_frame_featured_1769"]/div[@class='thumbnails list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12']/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']

${PRODUCT_CARD_IMG}    //*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/a/img

${PRODUCT_CARD_NO_STOCK}    //*[@id="block_frame_featured_1769"]/div/div[2]/div[2]/div[3]/span[@class='nostock']

### Product Detail Page
${PRODUCT_DETAIL_BREADCRUMB}    //ul[@class="breadcrumb"]

${PRODUCT_DETAIL_NAME}    //*[@id="product_details"]/div/div[2]/div/div/h1[@class='productname']/span[@class='bgnone']
${PRODUCT_DETAIL_PRICE}    //*[@id="product_details"]/div/div[2]/div/div/div[@class='productprice']/div[@class='productpageprice jumbotron']/div[@class='productfilneprice']
${PRODUCT_DETAIL_IMG}    //*[@id="product_details"]/div/div[1]/div[1]/a/img

# product on sales 
${PRODUCT_DETAIL_NEW_PRICE}    //*[@id="product_details"]/div/div[2]/div/div/div[1]/div/div[@class="productfilneprice"]
${PRODUCT_DETAIL_OLD_PRICE}    //*[@id="product_details"]/div/div[2]/div/div/div[1]/div/span[@class="productpageoldprice"]

${PRODUCT_DETAIL_INPUT_QUANTITY}    //*[@id="product_quantity"]
${PRODUCT_DETAIL_TOTAL_PRICE}    //span[@class='total-price']

${PRODUCT_DETAIL_DESC}    //*[@id="description"]

${PRODUCT_DETAIL_LATEST_PRODUCT_LIST}    //*[@id="maincontainer"]/div/div[1]

${PRODUCT_ADD_TO_CART}    //*[@id="product"]/fieldset/div/ul[@class="productpagecart"]

# call to order 
${PRODUCT_CALL_TO_ORDER}    //*[@id="product"]/fieldset/div[3]/ul/li/a

# brands 
${BRAND_PATH}    https://automationteststore.com/index.php?rt=product/manufacturer

# category
${SUB_CATEGORY_PATH}    https://automationteststore.com/index.php?rt=product/category
