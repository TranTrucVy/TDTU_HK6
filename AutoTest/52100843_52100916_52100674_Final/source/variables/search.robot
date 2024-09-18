*** Variables ***
${SEARCH_PATH}    https://automationteststore.com/index.php?rt=product/search

${SEARCH_BAR}    //*[@id="search_form"]/div
${SEARCH_INPUT}    //*[@id="filter_keyword"]
${SEARCH_BTN}    //*[@id="search_form"]/div/div
${SEARCH_DROPDOWN}    //*[@id="search-category"]
${SEARCH_DROPDOWN_OPTION}    //*[@id="search-category"]/li

# search page 
${SEARCH_PAGE_TITLE}    //*[@id="maincontainer"]/div/div/div/h1
${SEARCH_CRITERIA_CONTAINER}    //*[@id="maincontainer"]/div/div/div/div/div[1]
${SEARCH_PAGE_INPUT}    //*[@id="keyword"]

${SEARCH_PAGE_CATEGORY}    //*[@id="category_id"]
${SEARCH_PAGE_SELECT_PRODUCT}    //*[@id="model"]
${SEARCH_PAGE_SELECT_DESC}    //*[@id="description"]
${SEARCH_PAGE_BTN}    //*[@id="search_button"]

${SEARCH_RESULT_SORT}    //*[@id="maincontainer"]/div[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='contentpanel']/div[@class='sorting well'][1]

${SEARCH_RESULT_LIST}    //*[@id="maincontainer"]/div[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='contentpanel']/div[@class='thumbnails grid row list-inline']

${SEARCH_RESULT_ITEM}    //*[@id="maincontainer"]/div/div/div/div/div[3]/div
${SEARCH_RESULT_NAME}    //*[@id="maincontainer"]/div[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='contentpanel']/div[@class='thumbnails grid row list-inline']/div[@class='col-md-3 col-sm-6 col-xs-12']/div[@class='fixed_wrapper']/div[@class='fixed']/a[@class='prdocutname']

${SEARCH_RESULT_DESC}    //*[@id="maincontainer"]/div/div/div/div/div[4]/div/div/div/div[2]/div[1]

${SWITCH_VIEW_GRID}    //*[@id="grid"]
${SWITCH_VIEW_LIST}    //*[@id="list"]

# Product detail page 
${PRODUCT_DETAIL_NAME}    //*[@id="product_details"]/div/div[2]/div/div/h1
${PRODUCT_DETAIL_DESC}    //*[@id="description"]

${SWITCH_TAB_TAGS}    //*[@id="myTab"]/li[3]/a

${PRODUCT_DETAIL_TAGS}    //*[@id="producttag"]/ul
