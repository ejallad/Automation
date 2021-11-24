*** Settings ***
Documentation        Sanity Suite
Resource             ../../Common/Mobile/common.resource
Resource             ../Library/util.resource
Suite Setup          Initiate App
Test Setup           Menu Bar    Home
Test Teardown        Cleanup
Suite Teardown       Close App 

*** Test Cases ***
# Singin Button is Present
#     Scroll Until Visible    Down    ${main.frame}    ${home.signin}

Now Showing Title is Present
    Verify Element Text    id=com.sevenpeaks.major.dev:id/tvTitle    home.showingTitle    en
    