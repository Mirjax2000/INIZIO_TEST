*** Settings ***
Resource    ./common.robot


*** Variables ***
# --- page objects ---
${collabim_homepage_url}    https://www.collabim.cz/
${collabim_homepage}        collabim.cz/
${homepage_header}          Nejpoužívanější SEO nástroj v ČR
${header_class}             banner__title
${try_for_free_link}        https://static.oncollabim.com/accounts/new?localeCode=cs_CZ


*** Keywords ***
Redirect To Create account
    Load collabim homepage
    Validate homepage
    Click Try For Free Link

Click Try For Free Link
    Wait Until Element Is Visible    xpath=//a[@href="${try_for_free_link}"]
    Click Link    xpath=//a[@href="${try_for_free_link}"]
    Log    Clicked link ${try_for_free_link}

Validate homepage
    Wait Until Location Contains    ${collabim_homepage}
    Wait Until Page Contains Element    xpath=//h1[contains(., "${homepage_header}")]
    Wait Until Page Contains Element    xpath=//h1[contains(@class, "${header_class}")]
    Wait Until Page Contains Element    xpath=//a[@href="${try_for_free_link}"]
    Log To Console    Collabim homepage is valid

Load collabim homepage
    Go To    ${collabim_homepage_url}
    Log To Console    IndexPage loaded
