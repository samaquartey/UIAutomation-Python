*** Settings ***
Documentation     test suite resources.
...               to manage data etc.

*** Variables ***
${BaseUrl}     https://onesolutionsoftwares.com/demo/my-account-2/
${username}     sam.a.quartey@outlook.com
${password}     Nanaadum1981?
${badusername}     quartey112233@outlook.com
${badpassword}     ??????
${errorMessage}    Unknown username. Check again or try your email address.

*** Keywords ***
Open browser
    create webdriver  Chrome   executable_path=/Users/samquartey/Documents/PythonProject/Drivers/chromedriver

Close browser session
    close browser

Go to login page
    maximize browser window
    go to  ${BaseUrl}