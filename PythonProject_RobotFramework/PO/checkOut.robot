*** Settings ***
Documentation    checkout will be defined in this file
Library    SeleniumLibrary


*** Keywords ***
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

