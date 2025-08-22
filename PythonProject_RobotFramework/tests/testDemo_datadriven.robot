*** Settings ***
Documentation    first demo project to execute login scenario
Library    SeleniumLibrary
Library    String
#Test Setup    Open browser to work on ecommerce site
Test Teardown    Close Browser
#Resource    resource.robot

*** Variables ***
${alert_msg}    css:.alert.alert-danger.col-md-12


*** Test Cases ***
#creating a data driven test cases, where each pair of arguments will be passed to the keywords to perform the operation each time.
Login Validation
    @{credentials}=    Create List
    ...    rahus|learning
    ...    rahulshettyacademy|1234
    ...    @12#|learning

    FOR    ${cred}    IN    @{credentials}
        ${username}    ${password}=    Split String    ${cred}    |
        Browser unsuccessful Login    ${username}    ${password}
    END

*** Keywords ***
Browser unsuccessful Login
    [Arguments]    ${username}    ${password}
    Open browser to work on ecommerce site
    Fill the login details    ${username}    ${password}
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




