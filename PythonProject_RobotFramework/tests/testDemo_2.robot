*** Settings ***
Documentation    first demo project to execute login scenario
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${alert_msg}    css:.alert.alert-danger.col-md-12

*** Test Cases ***
Browser unsuccessfull Login
    Open browser to work on ecommerce site
    Fill the login details
    wait until it checks for the message
    verify error message is correct


*** Keywords ***
wait until it checks for the message
    Wait Until Element Is Visible    ${alert_msg}

verify error message is correct
    ${text}=    Get Text    ${alert_msg}
    Log To Console    The text is:${text}
    Should Be Equal As Strings    ${text}    Incorrect username/password.




