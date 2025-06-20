*** Settings ***
Resource            ../resources/collabim.robot
Resource            ../resources/create_account.robot

# Selenium settings
Suite Setup         common.Selenium Setup
Suite Teardown      common.End Web Test
Test Setup          common.Begin Web Test
Test Teardown       common.End Web Test


*** Test Cases ***
Valid Collabim Page Test
    [Documentation]    Valid collabim load page test
    [Tags]    id001    smoke    collabim
    collabim.Load collabim homepage
    collabim.Validate homepage

Try For Free Click Test
    [Documentation]    clicking on create_account link
    [Tags]    id002    smoke    collabim    create_account
    collabim.Redirect To Create account
    create_account.Validate Create_account Page

Empty registration Error Test
    [Documentation]    Clink on create account button with empty form
    [Tags]    id003    smoke    create_account
    create_account.Load Create_account Page
    create_account.Click Create Account Btn
    create_account.Empty Form Error

NoName registration Error Test
    [Documentation]    Clink on create account button without input username
    [Tags]    id004    smoke    create_account    form_fill
    create_account.Load Create_account Page
    create_account.NoName Form Fill
    create_account.Click Create Account Btn
    create_account.NoName Error Visible
