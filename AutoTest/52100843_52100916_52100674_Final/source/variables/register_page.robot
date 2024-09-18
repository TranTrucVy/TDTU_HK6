*** Variables ***
### Register Login page ###
${REGISTER_LOGIN_PAGE}    https://automationteststore.com/index.php?rt=account/login

${REGISTER_URL}    https://automationteststore.com/index.php?rt=account/create
${REGISTER_SUCCESS_URL}    https://automationteststore.com/index.php?rt=account/success

${REGISTER_BTN}    //*[@id="accountFrm"]/fieldset/button


### Register form locators ###
# personal details
${input_first_name}    //*[@id="AccountFrm_firstname"]
${input_last_name}    //*[@id="AccountFrm_lastname"]
${input_email}    //*[@id="AccountFrm_email"]
${input_telephone}    //*[@id="AccountFrm_telephone"]
${input_fax}    //*[@id="AccountFrm_fax"]
# your address 
${input_company}    //*[@id="AccountFrm_company"]
${input_address_1}    //*[@id="AccountFrm_address_1"]
${input_address_2}    //*[@id="AccountFrm_address_2"]
${input_city}    //*[@id="AccountFrm_city"]
${select_region}    //*[@id="AccountFrm_zone_id"]
${input_zip_code}    //*[@id="AccountFrm_postcode"]
${select_country}    //*[@id="AccountFrm_country_id"]
# login details
${input_login_name}    //*[@id="AccountFrm_loginname"]
${input_password}    //*[@id="AccountFrm_password"]
${input_confirm_password}    //*[@id="AccountFrm_confirm"]
# newsletter
${checkbox_newsletter_yes}    //*[@id="AccountFrm_newsletter1"]
${checkbox_newsletter_no}    //*[@id="AccountFrm_newsletter0"]

# agree policy 
${checkbox_agree_policy}    //*[@id="AccountFrm_agree"]

# submit button
${btn_register_submit}    //*[@id="AccountFrm"]/div[5]/div/div/button

# error message 
${error_message}    //div[@id='maincontainer']/div[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='alert alert-error alert-danger']
