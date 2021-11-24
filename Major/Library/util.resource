*** Settings ***
Documentation     An example resource file
Library           String
Library           ../../Common/Utility.py
Resource          ../../Common/Mobile/common.resource
Resource          ../../Common/Utility.resource

*** Variables ***

##    Misc        ##
${start.noUpdate}            id=com.sevenpeaks.major.dev:id/btnNegative           
${main.frame}                id=android:id/content
${start.logo}                class=android.widget.ImageView
${spinner}                   class=android.widget.ProgressBar  
##    Misc End    ##

##    Home        ##
${home.signin}                 id=com.sevenpeaks.major.dev:id/tvLoginSignUp
##    Home        ##

##    Menu        ##
${menu.home}                 accessibility_id=Home       
${menu.movies}               accessibility_id=Movies
${menu.cinemas}              accessibility_id=Cinemas
${menu.promo}                accessibility_id=Promotions
${menu.more}                 accessibility_id=More
##    Menu End    ##

*** Keywords ***
Initiate App
    Start App
    Click        ${start.noUpdate}
    Wait logo
    Click        ${main.frame}
    Menu Bar      Cinemas
    Click        ${android.location.allow}
    Menu Bar      Home

Menu Bar
    [Arguments]    ${item}
    ${item}=    Convert To Upper Case    ${item}
    Run Keyword If    '${item}' == 'HOME'    Click    ${menu.home}   
    Run Keyword If    '${item}' == 'MOVIES'    Click    ${menu.movies}   
    Run Keyword If    '${item}' == 'CINEMAS'    Click    ${menu.cinemas}   
    Run Keyword If    '${item}' == 'PROMO'    Click    ${menu.promo}   
    Run Keyword If    '${item}' == 'MORE'    Click    ${menu.more}

Wait logo
    AL.Wait Until Page Does Not Contain Element    ${start.logo}    ${medWait}    The loading Image took longer than ${medWait}

MClick
    [Arguments]    ${locator}    ${wait}=${shortWait}    ${error}=Could not find the element ${locator}
    AL.Wait Until Page Does Not Contain Element    ${spinner}    ${medWait}
    Click    ${locator}    ${wait}    ${error}