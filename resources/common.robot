*** Settings ***
Library     SeleniumLibrary
Resource    ./variables.robot


*** Keywords ***
Begin Web Test
    Log    Starting test
    Open Browser    about:blank    ${BROWSER}

End Web Test
    Close Browser
    Log    Test ends

Selenium Setup
    Set Selenium Speed    .3s
    Set Selenium Timeout    5s
