*** Settings ***
Documentation    first demo project to execute login scenario
Library    SeleniumLibrary    
Library    Collections
Test Setup    Open browser to work on ecommerce site    ${BROWSER}
Test Teardown    Close Browser Session
Resource    ../PO/resource.robot
Resource    ../PO/shopPage.robot
Resource    ../PO/addTocart.robot
Resource    ../PO/checkOut.robot
Resource    ../PO/unsuccessfulLogin.robot


*** Test Cases ***
Browser successful Login
    [Tags]    SMOKE
#    Set Window Size    1000    800
#    Set Window Position    0    0
    shopPage.Fill the login details and navigate to child window   ${username}    ${valid_password}
#    wait until it checks for the message
    shopPage.verify you are in the shop page
    addTocart.Get the list of items present in the page
    addTocart.Click on the checkout option
    checkOut.Handle dynamic dropdown of countries
    checkOut.Accept the terms and conditions
    checkOut.Purchase and Verify the status of the order

Browser unsuccessful Login
#    Set Window Size    1000    800
#    Set Window Position    820    0
    shopPage.Fill the login details and navigate to child window   ${username}    ${invalid_password}
    unsuccessfulLogin.wait until it checks for the message
    unsuccessfulLogin.verify error message is correct





