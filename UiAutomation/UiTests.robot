*** Settings ***
Documentation     Login check test.

Library           SeleniumLibrary
Test Setup        create webdriver  Chrome   executable_path=/Users/samquartey/Documents/PythonProject/Drivers/chromedriver
Test Teardown     Close Browser

*** Variables ***
${BaseUrl}     https://onesolutionsoftwares.com/demo/my-account-2/

*** Test Cases ***
Valid Login
    Go to login page
    Fill the login form

*** Keywords ***
Go to login page
    maximize browser window
    go to  ${BaseUrl}

Fill the login form
    input text      username      sam.a.quartey@outlook.com
    input password      password      Nanaadum1981?
    click button    css:.woocommerce-form-login__submit
    wait until element is visible     css:.woocommerce-MyAccount-content
    wait until element is visible     css:.woocommerce-MyAccount-navigation
    element text should be      css:.woocommerce-MyAccount-navigation-link--customer-logout     Logout