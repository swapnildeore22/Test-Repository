*** Settings ***
Suite Setup       HomePage
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${baseurl}        https://opensource-demo.orangehrmlive.com/    # baseurl 
@{Cred}           Admin    admin123
&{Login}          Username=Admin    Password=admin123

*** Test Cases ***
Test1
    [Tags]    Test1
    Open Browser    https://robotframework.org/    chrome
    Maximize Browser Window
    Close Browser
    Log To Console    Completed Successfully

Test2
    [Tags]    Test1
    Open Browser    ${baseurl}    chrome
    Maximize Browser Window
    Input Text    id:txtUsername    ${Login.Username}
    Input Password    id=txtPassword    $Cred}[1]
    Click Button    id=btnLogin
    Close Browser
    Log To Console    %{username} ran the ${TEST NAME}

Test3
    [Tags]    Test3
    [Setup]    Log To Console    Test case 3 has been Started
    Open Browser    ${baseurl}    chrome
    Maximize Browser Window
    Login
    Close Browser
    [Teardown]    Log To Console    Test case 3 has been finished

Test4
    [Tags]    Test4
    [Setup]    Log To Console    Test case 4 has been Started
    Login
    Set Tags    Sanity
    [Teardown]    Log To Console    Test case 4 has been finished

*** Keywords ***
Login
    Input Text    id:txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin

HomePage
    Open Browser    ${baseurl}    chrome
    Maximize Browser Window
