*** Settings ***
Documentation    Creating a script that automates adding items to cart
Library    SeleniumLibrary

*** Variables ***
${itemName}    Sauce Labs Fleece Jacket

*** Keywords ***
Verify you are in the shop page
    ${is_visible}=    Run Keyword And Return    Element Should Be Visible    id:shopping_cart_container
    Run Keyword If    ${is_visible}    Log To Console    You are in the shop page
    IF    ${is_visible}
        Add items to the cart
    END

Add items to the cart
    @{list_of_items}=    Get Webelements    css:.inventory_item_name
#    FOR    ${item}    IN    @{list_of_items}
#        ${name}=    Get Text    ${item}
#        ${req_item}=    Set Variable    Sauce Labs Fleece Jacket
#        IF    ${name} == ${req_item}
#            
    ${len}=    Get Length    ${list_of_items}
    FOR    ${index}    IN RANGE    1    ${len}+1
        ${text}=    SeleniumLibrary.Get Text    xpath://div[@class='inventory_item'][${index}]/div/div/a/div
        IF    '${text}' == '${itemName}'
            Click Element    xpath://div[@class='inventory_item'][${index}]/div/div[2]/button
            BREAK
        END
    END
    Log To Console    ${index}
    Sleep    2s

Click on the checkout options and navigate to checkout page
    Click Element    id:shopping_cart_container
    Click Element    id:checkout

