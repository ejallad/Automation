*** Settings ***
Documentation      Drilltronics Sanity suite 
Resource          ../../Common/Web/common.resource
Resource          ../Library/drilltronics.resource
Suite Setup       Launch browser    ${url}
Test Setup        Wait Homepage Load
#Suite Teardown    Cleanup   

*** Test Cases ***
Change Threshold Settings
    Emulate Data    True
    Click Header button    Settings
    Select Threshold type   Trip    Absolute  4
    Close Settings