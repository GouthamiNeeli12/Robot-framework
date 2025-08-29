*** Settings ***
Documentation    Creating a script that automates test for login page
Test Setup    Open The Browser    ${BROWSER_NAME}
Test Teardown    Close Browser
Library    SeleniumLibrary
Library    String
Resource    ../resources/resource.robot
Resource    ../keywords/loginPage.robot
Resource    ../keywords/shopPage.robot
Resource    ../keywords/Fillinfo.robot
Resource    ../keywords/placeorder.robot
Suite Setup    Set Screenshot Directory    ../Screenshots/


*** Test Cases ***
Verify successful login with the given details
    loginPage.Fill the login details
    shopPage.Verify you are in the shop page
    shopPage.Add items to the cart
    shopPage.Click on the checkout options and navigate to checkout page
    Fillinfo.Fill personal information
    placeorder.verify total price and print it to console
    placeorder.Place the order and verify order confirmation message






        


        

