*** Settings ***
Documentation     An example resource file
Library           SeleniumLibrary
Library           String
Library          ../../Common/Utility.py
Library          ./Utility.py
Resource          ../../Common/Web/common.resource

*** Variables ***
${url}              https://sekal-dev-frontend.azurewebsites.net/

#Main
${headerNodge}      xpath://section/header

#Header
${emulateData}      id=emulate-toggle

#Safe Guards Widgest


*** Keywords ***

Wait Homepage Load
    Wait Until Element Is Visible    xpath://h6[contains(text(),'Trip Speed')]

Expand Header
    Wait Homepage Load
    Wait Until Element Is Visible    ${headerNodge}
    Mouse Over  ${headerNodge}

Emulate Data
    [Arguments]    ${turnOn}
    Expand Header
    ${isOn}=    Get Element Attribute   ${emulateData}  checked
    Run Keyword If    '${isOn}' != 'true' and '${turnOn}' == 'True'    Click Element    ${emulateData}
    Run Keyword If    '${isOn}' == 'true' and '${turnOn}' == 'False'    Click Element    ${emulateData}
    ${isOn}=    Get Element Attribute   ${emulateData}  checked

Click Header button
    [Arguments]    ${item}
    Expand Header
    ${item}=    Convert To Upper Case    ${item}
    ${headerButtons}    Get WebElements     xpath://section/header//button 
    Run Keyword If    '${item}' == 'SETTINGS'    Click Element    ${headerButtons}[1]

Select Threshold type
    [Arguments]    ${section}   ${type}     ${amount}
    ${section}=    Convert To Upper Case    ${section}
    ${selector}=     Combine Strings     xpath://div[contains(text(),'   ${section}  ')]//parent::div//following-sibling::div//p[text()='    ${type}']
    ${button}=  Combine Strings     ${selector}     //ancestor::button
    ${isClicked}=    Get Element Attribute   ${button}  aria-pressed
    Run Keyword If    '${isClicked}' == 'false'     Click Element    ${selector}
    ${amountField}=     Combine Strings     xpath://div[contains(text(),'   ${section}  ')]//parent::div//following-sibling::div//input[@type='number']
    Press Keys  ${amountField}  BACKSPACE
    Press Keys  ${amountField}  BACKSPACE
    Press Keys  ${amountField}  BACKSPACE
    Press Keys  ${amountField}  DELETE
    Press Keys  ${amountField}  DELETE
    Press Keys  ${amountField}  DELETE
    Input Text  ${amountField}  ${amount}

Close Settings
    Click Element    xpath://body
    Press Keys  xpath://body  ESCAPE