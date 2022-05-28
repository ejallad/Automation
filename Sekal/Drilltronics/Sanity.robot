*** Settings ***
Documentation      Drilltronics Sanity suite 
Resource          ../../Common/Web/common.resource
Resource          ../Library/drilltronics.resource
Suite Setup       Launch Drilltronics
Test Setup        Wait Homepage Load
#Suite Teardown    Cleanup   

*** Test Cases ***
Change Threshold Settings
    Click Header button    Settings
    Select Threshold type   Trip    Absolute  4
    Close Settings