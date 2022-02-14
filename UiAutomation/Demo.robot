*** Settings ***
Documentation     Login check test.
Library     SeleniumLibrary
Test Setup        Open browser session
Test Teardown     Close browser session
Resource          resource.robot

*** Variables ***
${loginButton}      css:.woocommerce-form-login__submit
${myAccountElement}      css:.woocommerce-MyAccount-content
${myAccountNavElement}      css:.woocommerce-MyAccount-navigation
${logoutButton}      css:.woocommerce-MyAccount-navigation-link--customer-logout
${alertElement}     css:.woocommerce-notices-wrapper.li
${errorElement}     css:.woocommerce-error

*** Test Cases ***
Valid Login
    Go to login page
    Fill the login form     ${username}     ${password}
    Then I'm on my dashboard

Ivalid Login
    Go to login page
    Fill the login form     ${badusername}     ${badpassword}
    Then I'm not able to login

Validate list
    Verify list are equal

*** Keywords ***

Fill the login form
    [arguments]     ${username}     ${password}
    input text      username        ${username}
    input password      password      ${password}
    click button        ${loginButton}

Then I'm on my dashboard
    wait until element is visible     ${myAccountElement}
    wait until element is visible     ${myAccountNavElement}
    element text should be   ${logoutButton}      Logout

Then I'm not able to login
    wait until element is visible       ${errorElement}
    #element text should be      ${alertElement}        ${errorMessage}


Verify list are equal
    @{expectedList} = Create List      Home       Products     Cart    Checkout    My account
    ${menuList} = get webelements     css:.menu-item
    for     ${menu}   in  ${menuList}
            log    ${menu.text}
    end