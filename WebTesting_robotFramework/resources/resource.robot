*** Settings ***
Documentation    This is pre-requisite file that automates logging into the selected browser
Library    SeleniumLibrary

*** Keywords ***
Open The Browser
    [Arguments]    ${BROWSER_NAME}
    IF    "${BROWSER_NAME}" == "chrome"
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys,selenium.webdriver
        Call Method    ${options}    add_argument    --start-maximized
        Call Method    ${options}    add_argument    --incognito
        #${driver_path}=    Evaluate    __import__('webdriver_manager.chrome').chrome.ChromeDriverManager().install()
        Create Webdriver    Chrome    options=${options}
        Sleep    3s
    ELSE IF    "${BROWSER_NAME}" == "edge"
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys,selenium.webdriver
        Call Method    ${options}    add_argument    --start-maximized
        Call Method    ${options}    add_argument    --incognito
        #${driver_path}=    Evaluate    __import__('webdriver_manager.microsoft').EdgeChromiumDriverManager().install()
        Create Webdriver    Edge    options=${options}
        Sleep    3s
    ELSE IF    "${BROWSER_NAME}" == "firefox"
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()    sys,selenium.webdriver
        Call Method    ${options}    add_argument    --start-maximized
        Call Method    ${options}    add_argument    --incognito
        Create Webdriver    Firefox    options=${options}
    ELSE
        Log To Console    fail
    END