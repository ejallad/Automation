*** Settings ***
Library          SeleniumLibrary
Library          BuiltIn
Library          OperatingSystem
Library          ./WebUtil.py


*** Variables ***
${Browser}    Chrome
${chromeProfile}    C:/Users/ehabj/AppData/Local/Google/Chrome/User Data/Default


## Waits  ##
${miniWait}     5s
${shortWait}    15s
${medWait}      30s
${longWait}     60s
## Waits  END  ##

*** Keywords ***

Launch browser
    [Arguments]    ${url}
    Run Keyword If    '${chromeProfile}'!= '' and '${Browser}'=='Chrome'   Open Browser    ${url}    ${Browser}    options= add_argument("test-type"); add_argument("--js-flags=--expose-gc"); add_argument("--enable-precise-memory-info"); add_argument("--disable-popup-blocking"); add_argument("--disable-default-apps"); add_argument("--enable-automation"); add_argument("disable-extensions"); add_argument("user-data-dir=${chromeProfile}") 
    Run Keyword If    '${chromeProfile}'== '' and '${Browser}'=='Chrome'   Open Browser    ${url}    ${Browser}    options= add_argument("test-type"); add_argument("--js-flags=--expose-gc"); add_argument("--enable-precise-memory-info"); add_argument("--disable-popup-blocking"); add_argument("--disable-default-apps"); add_argument("--enable-automation"); add_argument("disable-extensions");
    Maximize Browser Window

Click
  [Arguments]    ${selector}    ${wait}=${shortWait}    ${error}=Could not find the element ${selector}
  Wait Until Element Is Visible    ${selector}    ${wait}    ${error}
  Click Element    ${selector}
  Sleep  3

If Element Visible
    [Arguments]    ${selector}    ${wait}=${shortWait}    ${error}=Could not find the element ${selector}
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   ${selector}
    [Return]    ${present}

Cleanup
    Capture Page Screenshot    ${PREV TEST NAME}.png
    Close Browser