*** Settings ***
Documentation     An example resource file
Library           SeleniumLibrary
Library           String
Library          ../../Common/Utility.py
Library          ./Utility.py
Resource          ../../Common/Web/common.resource

*** Variables ***
${url}              https://adv.dev.cloudplatform.sekal.com/
${userEmail}        7PDevTest1@apphuset.com
${userPass}         Y6Us!Q2oWq

#Main
${headerNodge}      xpath://section/header
${main.btn.signIn}      xpath://span[@class='MuiButton-label' and text()='Sign In']

#Header
${emulateData}      id=emulate-toggle

#Safe Guards Widgest


*** Keywords ***
Launch Drilltronics
    Launch browser    ${url}
    Wait Until Element Is Visible   ${main.btn.signIn} 
    Click   ${main.btn.signIn}
    ${present}=  If Element Visible  xpath://input[@type='email']
    Run Keyword If    ${present}    Sign In
    Wait Homepage Load
    

Sign In
    Input Text  xpath://input[@type='email']    ${userEmail}
    Click   xpath://input[@type='submit']
    Input Text  xpath://input[@type='password']    ${userPass}
    Click   xpath://input[@type='submit']
    Click   xpath://input[@type='submit']
    Wait Homepage Load

Wait Homepage Load
    Wait Until Element Is Visible    xpath://h6[contains(text(),'Trip Speed')]  25
    Sleep   5    

Expand Header
    Wait Homepage Load
    Wait Until Element Is Visible    ${headerNodge}
    Mouse Over  ${headerNodge}

Click Header button
    [Arguments]    ${item}
    Expand Header
    ${item}=    Convert To Upper Case    ${item}
    ${headerButtons}    Get WebElements     xpath://section/header//button 
    Run Keyword If    '${item}' == 'SETTINGS'    Click Element    ${headerButtons}[2]

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