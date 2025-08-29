*** Settings ***
Documentation    Creating a script that tests placing order and confirmation msg
Library    SeleniumLibrary
Library    String


*** Keywords ***
verify total price and print it to console
    ${total_price_text}=    Get Text    css:.summary_total_labe
    @{list_price_details}=    Split String    ${total_price_text}    $
    Log To Console    ${list_price_details}[1]


Place the order and verify order confirmation message
    Click Button    id:finish
    ${text}=    Get Text    xpath://h2[text()='Thank you for your order!']
    IF    '${text}' == 'Thank you for your order!'
        Log To Console    Success:)
    END


