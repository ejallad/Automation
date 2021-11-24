*** Settings ***
Documentation     An example resource file
Library           SeleniumLibrary
Resource          ../../Common/Web/Resources.resource

*** Variables ***
${url}           https://sekal-director-dev.azureedge.net/


*** Keywords ***
Login
    [Arguments]    ${user}
    Wait Until Element Is Visible    class:MuiTouchRipple-root
    Run Keyword If    '${user}' == 'Sekal'    Click Element    xpath://span[text()='Sekal User']//parent::button    
    Run Keyword If    '${user}' == 'Customer'    Click Element    xpath://span[text()='Customer User']//parent::button