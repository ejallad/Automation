*** Settings ***
Library           ./Utility.py

*** Keywords ***

Get Dictionary Text
    [Arguments]    ${key}    ${lang}
    ${translation}    Get Dictionary    ${key}    ${lang}
    [Return]    ${translation}

Verify Element Text
    [Arguments]    ${element}    ${key}    ${lang}
    ${text}    Get Dictionary Text    ${key}    ${lang}
    Element Should Contain Text    ${element}    ${text}