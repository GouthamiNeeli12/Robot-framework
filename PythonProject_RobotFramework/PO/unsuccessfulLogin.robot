*** Settings ***
Documentation    first demo project to execute login scenario
Library    SeleniumLibrary

*** Variables ***
${alert_msg}    css:.alert.alert-danger.col-md-12


*** Keywords ***
wait until it checks for the message
    Wait Until Element Is Visible    ${alert_msg}

verify error message is correct
    ${text}=    Get Text    ${alert_msg}
    Log To Console    The text is:${text}
    Should Be Equal As Strings    ${text}    Incorrect username/password.




