*** Settings ***
Documentation    shop page object will be defined in this file
Library    SeleniumLibrary


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
    #Select From List By Value    css:select[class='form-control']    teach
    Click Button    id:signInBtn
    #Sleep    5s

verify you are in the shop page
    Element Should Be Visible    xpath://a[contains(normalize-space(),'Checkout')]

