*** Settings ***
Documentation    first demo project to execute login scenario
Library    SeleniumLibrary    
Library    Collections
Library    ../customLibraries/Shop.py
Test Setup    Open browser to work on ecommerce site
Test Teardown    Close Browser Session
Resource    ../PO/resource.robot

*** Variables ***
${alert_msg}    css:.alert.alert-danger.col-md-12
@{listProducts}    iphone X    Nokia Edge

*** Test Cases ***
Browser successful Login
    Fill the login details and navigate to child window   ${username}    ${valid_password}
#    wait until it checks for the message
    verify you are in the shop page
    Hello World
    Add Item To Cart And Checkout    ${listProducts}
    Sleep    5s

    

*** Keywords ***
Fill the login details and navigate to child window
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Element    xpath://input[@value='user']
    Wait Until Element Is Visible    css:.modal-content
    Click Button    id:okayBtn
    Click Button    id:okayBtn
    Wait Until Element Is Not Visible    xpath://input[@value='user']
    Select From List By Value    css:select[class='form-control']    teach
    Click Button    id:signInBtn
    #Sleep    5s

verify you are in the shop page
    Element Should Be Visible    xpath://a[contains(normalize-space(),'Checkout')]




