*** Settings ***
Documentation      Smoke Test 
Resource          ../../Common/Web/common.resource
Resource          ../Library/Cloud.resource
Suite Setup       Launch browser    ${url}
Suite Teardown    Cleanup   

*** Test Cases ***
Title
    Title Should Be    Sekal Director