*** Settings ***
Library          SeleniumLibrary
Library          BuiltIn
Library          OperatingSystem
Library          ./WebUtil.py


*** Variables ***
${Browser}    Chrome
${chromeProfile}    C:/Users/ehabj/AppData/Local/Google/Chrome/User Data/Default

*** Keywords ***

Launch browser
    [Arguments]    ${url}
    Run Keyword If    '${chromeProfile}'!= '' and '${Browser}'=='Chrome'   Open Browser    ${url}    ${Browser}    options= add_argument("test-type"); add_argument("--js-flags=--expose-gc"); add_argument("--enable-precise-memory-info"); add_argument("--disable-popup-blocking"); add_argument("--disable-default-apps"); add_argument("--enable-automation"); add_argument("disable-extensions"); add_argument("user-data-dir=${chromeProfile}") 
    Run Keyword If    '${chromeProfile}'== '' and '${Browser}'=='Chrome'   Open Browser    ${url}    ${Browser}    options= add_argument("test-type"); add_argument("--js-flags=--expose-gc"); add_argument("--enable-precise-memory-info"); add_argument("--disable-popup-blocking"); add_argument("--disable-default-apps"); add_argument("--enable-automation"); add_argument("disable-extensions");

Cleanup
    Close Browser