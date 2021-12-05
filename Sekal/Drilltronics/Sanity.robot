*** Settings ***
Documentation      Smoke Test 
Resource          ../../Common/Web/common.resource
Resource          ../Library/drilltronics.resource
Library          ../Library/Utility.py
Suite Setup       Launch browser    ${url}
Suite Teardown    Cleanup   

*** Test Cases ***
Open Settings
    Click Header button    Settings
    Select Threshold type   Trip    Absolute  4
    Close Settings