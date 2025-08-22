*** Settings ***
Documentation    add items to cart will be defined in this file
Library    SeleniumLibrary


*** Keywords ***
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

Click on the checkout option
    Click Element    xpath://a[contains(normalize-space(),'Checkout')]
    Click Element    css:.btn.btn-success



