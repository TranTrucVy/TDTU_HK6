*** Variables ***
### Register Login page ###
${REGISTER_LOGIN_PAGE}    https://automationteststore.com/index.php?rt=account/login

${LOGIN_SUCCESS_URL}    https://automationteststore.com/index.php?rt=account/account

${LOGOUT_SUCCESS_URL}    https://automationteststore.com/index.php?rt=account/logout

${input_login_name}    //*[@id="loginFrm_loginname"]
${input_password}    //*[@id="loginFrm_password"]
${btn_submit_login}    //*[@id="loginFrm"]/fieldset/button

# navbar 
# dropdown menu
${nav_user_name}    //*[@id="customer_menu_top"]/li
${btn_logout}    //*[@id="customer_menu_top"]/li/ul/li[10]
${dropdown_menu}    //*[@id="customer_menu_top"]/li/ul


# login error msg 
${login_error_msg}    //*[@id="maincontainer"]/div[@class='container-fluid']/div[@class='col-md-12 col-xs-12 mt20']/div/div[@class='alert alert-error alert-danger']