*** Settings ***
Resource    ../Config/resource.robot

Suite Setup    Open Page Login
Suite Teardown    Close Browser

*** Test Cases ***
Verify Login Successfully
    Enter Username And Password    ${valid_username}    ${valid_password}
    Click Login Button
    Verify Login Successfully
    [Teardown]    Logout
    [Tags]    test login    login test