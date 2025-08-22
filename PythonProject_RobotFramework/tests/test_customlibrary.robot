*** Settings ***
Documentation    creating a test suite where it accepts data from a csv file  
Library    SeleniumLibrary
Library    ../customLibraries/Shop.py    
Test Teardown    Close Browser
Resource    resource.robot

*** Variables ***
${alert_msg}    css:.alert.alert-danger.col-md-12

*** Test Cases ***
Browser unsuccessful Login
    #here we are providing default username and password for the framework , incase it will not be able to pick from csv.
    Open browser to work on ecommerce site
    Fill the login details    ${username}    ${invalid_password}
    wait until it checks for the message
    verify error message is correct


*** Keywords ***
Open browser to work on ecommerce site
    Create Webdriver    Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window
    Title Should Be    LoginPage Practise | Rahul Shetty Academy

Fill the login details
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

wait until it checks for the message
    Wait Until Element Is Visible    ${alert_msg}

verify error message is correct
    ${text}=    Get Text    ${alert_msg}
    Log To Console    The text is:${text}
    Should Be Equal As Strings    ${text}    Incorrect username/password.
    Hello World
    




