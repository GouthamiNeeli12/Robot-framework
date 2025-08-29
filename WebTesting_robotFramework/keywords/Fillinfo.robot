*** Settings ***
Documentation    Creating a script that automates Filling the personal information
Library    SeleniumLibrary

*** Variables ***
${First_name}    Gouthami
${Last_name}    Neeli
${pin}    504109


*** Keywords ***
Fill personal information
    Input Text    id:first-name    ${First_name}   
    Input Text    id:last-name    ${Last_name}    
    Input Text    id:postal-code    ${pin}
    Click Element    id:continue
