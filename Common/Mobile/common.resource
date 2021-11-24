*** Settings ***
Library          SeleniumLibrary    WITH NAME    SL
Library          AppiumLibrary    run_on_failure=AL.Capture Page Screenshot    WITH NAME    AL
Library          String 
Library          BuiltIn
Library          OperatingSystem


*** Variables ***

## Appium    ##
${DEVICE_UDID}                04VAX0NV5N
${HOST}                       http://localhost:4723/wd/hub
${OS}                         Android

${AUTOMATION_NAME}    UIAutomator2
${APP}                C:\\Users\\SevenPeaks\\Desktop\\Automation\\Automation\\Common\\Mobile\\APKs\\major-0.0.1-b1379.apk
${PLATFORM_NAME}      Android
${PLATFORM_VERSION}   %{PLATFORM_VERSION=12}
${APP_PACKAGE}        com.sevenpeaks.major.dev
${APP_ACTIVITY}       com.sevenpeaks.major.ui.MainActivity
${NEW_INSTALL}        N
## Appium  END  ##

## Test  ##
${miniWait}     5s
${shortWait}    15s
${medWait}      30s
${longWait}     60s

${android.location.allow}    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
## Test  END  ##


## Helpers  ##    
  
## Helpers  ##

*** Keywords ***
## Appium    ##
Start App         
  Run Keyword If    '${NEW_INSTALL}' == 'Y'    AL.open application  ${HOST}  automationName=${AUTOMATION_NAME}
  ...  app=${APP}  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}
  ...  appPackage=${APP_PACKAGE}  appActivity=${APP_ACTIVITY}    udid=${DEVICE_UDID}
  ...  locationServicesEnabled=True    locationServicesAuthorized=True
  
  Run Keyword If    '${NEW_INSTALL}' == 'N'    AL.open application  ${HOST}  automationName=${AUTOMATION_NAME}
  ...  platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}
  ...  appPackage=${APP_PACKAGE}  appActivity=${APP_ACTIVITY}    udid=${DEVICE_UDID}
  ...  locationServicesEnabled=True    locationServicesAuthorized=True

  AL.Set Location    13.736717    100.523186

Close App
  AL.Close Application

Cleanup
    AL.Capture Page Screenshot    ${TEST NAME}.png
## Appium  END  ##

## Test ##
Click
  [Arguments]    ${locator}    ${wait}=${shortWait}    ${error}=Could not find the element ${locator}
  AL.Wait Until Element Is Visible    ${locator}    ${wait}    ${error}
  AL.Click Element    ${locator}
  Sleep  3  

Allow Location
  Click    ${android.location.allow}    ${shortWait}    None


Scroll Until Visible
    [Arguments]    ${direction}    ${areaToSwipe}    ${elementToFind}
    Set Local Variable    ${elementFound}    False
    FOR    ${i}    IN RANGE    10
           ${direction}=    Convert To Upper Case    ${direction}
           Run Keyword If    '${direction}' == 'DOWN'    Scroll Down    ${areaToSwipe}
           Run Keyword If    '${direction}' == 'UP'    Scroll Up    ${areaToSwipe}
           Run Keyword If    '${direction}' == 'RIGHT'    Scroll Right    ${areaToSwipe}
           Run Keyword If    '${direction}' == 'LEFT'    Scroll Left    ${areaToSwipe}
           ${elementFound}=    Run Keyword And Return Status    AL.Element Should Be Visible   ${elementToFind}
           Remove File    ./appium-screenshot-${i+1}.png
           Exit For Loop If    ${elementFound} ==True
    END 
    Run Keyword If    ${elementFound} ==False    Fail    Scrolled ${direction} and Could not find element ${elementToFind}

Scroll Down
  [Arguments]    ${locator}
  ${element_size}=    AL.Get Element Size    ${locator}
  ${element_location}=    AL.Get Element Location    ${locator}
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.6)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
  Sleep  1

Scroll Up
  [Arguments]    ${locator}
  ${element_size}=    Get Element Size    ${locator}
  ${element_location}=    Get Element Location    ${locator}
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.6)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
  Sleep  1  

Scroll Left
  [Arguments]       ${locator}
  wait until element is Visible     ${locator}
  ${element_size}=    Get Element Size    ${locator}
  ${element_location}=    Get Element Location    ${locator}
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  1500
  Sleep  1

Scroll Right
  [Arguments]       ${locator}
  wait until element is Visible     ${locator}
  ${element_size}=    Get Element Size    ${locator}
  ${element_location}=    Get Element Location    ${locator}
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  1500
  Sleep  1

## Test  END  ##