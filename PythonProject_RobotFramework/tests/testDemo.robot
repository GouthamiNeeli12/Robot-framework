*** Settings ***
Documentation    first demo project to execute login scenario
Library    SeleniumLibrary    
Library    Collections
Test Setup    Open browser to work on ecommerce site
Test Teardown    Close Browser Session
Resource    ../PO/resource.robot

*** Variables ***
${alert_msg}    css:.alert.alert-danger.col-md-12

*** Test Cases ***
Browser successfull Login
    Fill the login details and navigate to child window   ${username}    ${valid_password}
#    wait until it checks for the message
    verify you are in the shop page
    Get the list of items present in the page
    Click on the checkout option
    Handle dynamic dropdown of countries
    Accept the terms and conditions
    Purchase and Verify the status of the order


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

#wait until it checks for the message
#    Wait Until Element Is Visible    ${alert_msg}
#    
#verify error message is correct
#    ${text}=    Get Text    ${alert_msg}
#    Log To Console    The text is:${text}
#    Should Be Equal As Strings    ${text}    Incorrect username/password.
verify you are in the shop page
    Element Should Be Visible    xpath://a[contains(normalize-space(),'Checkout')]

Get the list of items present in the page
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    xpath://div[@class='card-body']/h4    5s
    ${List_created}=    Get Webelements    xpath://div[@class='card-body']/h4
    ${new_list}=    Create List    
    FOR    ${item}    IN    @{List_created}
        #Log To Console    ${item.text}
        #Append To List    ${new_list}    ${item.text}
        ${text}=    Get Text    ${item}
        IF    $text == "Blackberry"
            ${button}=    Get WebElement    //div[@class='card-body']/h4[normalize-space()='${text}']/parent::div/parent::div/div/button
            Click Element    ${button}
            Sleep    3s
            Execute JavaScript    window.scrollTo(0, document.body.scrollTop)
            BREAK
        END
    END


    #Lists Should Be Equal    ${new_list}    ${Phones}
    #Log To Console    @{new_list}
Click on the checkout option
    Click Element    xpath://a[contains(normalize-space(),'Checkout')]
    Click Element    css:.btn.btn-success


Handle dynamic dropdown of countries
    Input Text    css:#country    ind
    Wait Until Element Is Visible    css:.suggestions    5s
    ${list_countries}=    Get Webelements    xpath://div[@class='suggestions']/ul/li
    FOR    ${country}    IN    @{list_countries}
        ${text_1}=    Get Text    ${country}
        IF    $text_1 == "India"
            Click Element    ${country}
            #Log To Console    ${text_1}
            sleep    2s
            BREAK
        END
    END

Accept the terms and conditions
    #Wait Until Element Is Enabled    xpath://input[@id='checkbox2']    5s
    Scroll Element Into View    xpath://label[@for='checkbox2']
    Click Element    xpath://label[@for='checkbox2']

Purchase and Verify the status of the order
    Click Element    xpath://input[@type='submit']
    ${success_msg}=    Set Variable    Success!
    Wait Until Element Is Visible    css:.alert.alert-success.alert-dismissible    3s
    ${text_msg}=    Get Text    css:.alert.alert-success.alert-dismissible
    Log To Console    ${text_msg}



