*** Settings ***
Resource    ./common.robot


*** Variables ***
${create_account_url}           https://static.oncollabim.com/accounts/new?localeCode=cs_CZ
# --- page objects
${create_account_header}        Vytvořit účet
${create_account_paragraph}     Rozhodli jste se vyzkoušet tarif LITE.
${create_account_button_id}     frm-registrationForm-submit
# --- create account form
${form_name_id}                 frm-registrationForm-signature
${form_password_1_id}           frm-registrationForm-password
${form_password_2_id}           frm-registrationForm-passwordCheck
${form_email_id}                frm-registrationForm-email
${form_accept_id}               frm-registrationForm-approvedTerms
# --- from errors
${form_name_error}              Zadejte své celé jméno.
${form_email_error}             Zadejte svůj e-mail.
${form_password_1_error}        Zadejte své heslo.
${form_password_2_error}        Prosím zadejte své heslo znovu.
${form_accept_error}            Potvrďte prosím svůj souhlas s licenčními podmínkami.


*** Keywords ***
Validate Create_account Page
    Wait Until Page Contains Element    xpath=//h1[contains(., "${create_account_header}")]
    Wait Until Page Contains Element    xpath=//p[contains(., "${create_account_paragraph}")]
    Wait Until Page Contains Element    xpath=//button[@id="${create_account_button_id}"]
    Log To Console    Create account page is valid

Click Create Account Btn
    Log    clicking - Create account button
    Click Button    ${create_account_button_id}
    Log    cliked - Create account button

Load Create_account Page
    Go To    ${create_account_url}
    Log To Console    Create_account page loaded
    Validate Create_account Page

Empty Form Error
    # --- name error
    NoName Error Visible
    # --- email error
    NoEmail Error Visible
    # --- first password error
    NoFirstPassword Error Visible
    # --- second password error
    NoSecondPassword Error Visible
    # --- accept error message
    NoAccept Error Visible

NoName Error Visible
    Wait Until Element Is Visible
    ...    xpath=//*[@id="frm-registrationForm"]/div[contains(text(), "${form_name_error}")]
    log    name error messages displayed

NoEmail Error Visible
    Wait Until Element Is Visible
    ...    xpath=//*[@id="frm-registrationForm"]/div[contains(text(), "${form_email_error}")]
    log    email error messages displayed

NoFirstPassword Error Visible
    Wait Until Element Is Visible
    ...    xpath=//*[@id="frm-registrationForm"]/div[contains(text(), "${form_password_1_error}")]
    log    first password error messages displayed

NoSecondPassword Error Visible
    Wait Until Element Is Visible
    ...    xpath=//*[@id="frm-registrationForm"]/div[contains(text(), "${form_password_2_error}")]
    log    second password error messages displayed

NoAccept Error Visible
    Wait Until Element Is Visible
    ...    xpath=//*[@id="frm-registrationForm"]/div[contains(text(), "${form_accept_error}")]
    log    accept error messages displayed
    Log To Console    All errors messages displayed

Full Form Fill
    Input name
    Input Email
    Input Password_1
    Input Password_2
    Checkbox Accept Terms

NoName Form Fill
    Input Email
    Input Password_1
    Input Password_2
    Checkbox Accept Terms

Input name
    Log    entering user name into form text input
    Input Text    ${form_name_id}    ${USER}

Input Email
    Log    entering email into form text input
    Input Text    ${form_email_id}    ${USER_EMAIL}

Input Password_1
    Log    entering password into form text input
    Input Text    ${form_password_1_id}    ${PASSWORD}

Input Password_2
    Log    entering password into form text input
    Input Text    ${form_password_2_id}    ${PASSWORD}

Checkbox Accept Terms
    Log    Checking Accept in form checkbox
    Click Element    ${form_accept_id}
