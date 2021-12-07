*** Settings ***
Documentation        Sanity Suite
Resource             ../../Common/Mobile/common.resource
Resource             ../Library/util.resource
Suite Setup          Initiate App
Test Setup           Menu Bar    Home
Test Teardown        Cleanup
Suite Teardown       Close App 

*** Test Cases ***

Now Showing Title is Present
    Scroll Until Visible    Down    ${main.frame}    ${home.signin}
    Verify Element Text    ${home.nowShowing}   home.showingTitle    en
    