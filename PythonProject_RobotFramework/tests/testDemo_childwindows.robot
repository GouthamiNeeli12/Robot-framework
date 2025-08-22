*** Settings ***
Documentation    first demo project to execute login scenario
Library    SeleniumLibrary    
Library    Collections
Library    String
Test Setup    Open browser to work on ecommerce site
Test Teardown    Close Browser Session
Resource    ../PO/resource.robot

#*** Variables ***
#${alert_msg}    css:.alert.alert-danger.col-md-12

*** Test Cases ***
Browser successfull Login
    Click on the link provided in login page
    Handle child window and extract text from it
    Switch to main window and give the mail id

*** Keywords ***
Click on the link provided in login page
    Click Element    xpath://a[contains(text(),'Free Access')]
    Sleep    5s

Handle child window and extract text from it
    ${window_list}=    Get Window Handles
    Switch Window    ${window_list}[1]
    ${text_toExtract}=    Get Text    css:.im-para.red
    ${list_val}=    Split String         ${text_toExtract}
    FOR    ${val}    IN    @{list_val}
        IF    '@' in $val
            ${to_enter}=    Set Variable    ${val}
            Set Global Variable    ${to_enter}
            BREAK
        END
    END
Switch to main window and give the mail id
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    css:#username    ${to_enter}







