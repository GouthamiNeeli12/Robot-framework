*** Settings ***
Documentation    We can declare reusable keywords and
...     here
Library    BuiltIn
Library    SeleniumLibrary


*** Variables ***
${username}    rahulshettyacademy
${valid_password}    learning
${invalid_password}    learn
${url}    https://rahulshettyacademy.com/loginpagePractise/
@{Phones}    iphone X    Samsung Note 8    Nokia Edge    Blackberry
${new_list}    Create List


*** Keywords ***
#this does not work in IDE
#set browser name
#    ${browser}=    Get Value From User    Enter the browser name (Chrome/Firefox):    Chrome
#    Set Suite Variable    ${browser_name}    ${browser}
    
Open browser to work on ecommerce site
    [Arguments]    ${browser_name}
    IF    '${browser_name}' == "Chrome"
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
        Call Method    ${options}    add_argument    --incognito
        Call Method    ${options}    add_argument    --start-maximized
        Create Webdriver    Chrome    options=${options}
    ELSE IF    '${browser_name}' == "Firefox"
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys, selenium.webdriver
        Call Method    ${options}    add_argument    --incognito
        Call Method    ${options}    add_argument    --start-maximized
        Create Webdriver    Firefox    options=${options}
    ELSE
        Log To Console    unsupported
    END
    Go To    ${url}
    Set Selenium Implicit Wait    10s
    #Maximize Browser Window
    Title Should Be    LoginPage Practise | Rahul Shetty Academy

Close Browser Session
    Close Browser
