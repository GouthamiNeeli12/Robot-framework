*** Settings ***
Documentation    Creating a script that automates filling login details for login page
Library    SeleniumLibrary

*** Variables ***
${userName}    standard_user
${password}     secret_sauce  

*** Keywords ***
Fill the login details
    Go To    https://www.saucedemo.com/
    Wait Until Element Is Visible    css:#user-name    10s
    Input Text    css:#user-name    ${userName}    
    Input Password    id:password    ${password}
    Click Button    id:login-button
    Sleep    3s
