*** Settings ***
Resource    ../Config/resource.robot

*** Keywords ***
Open Page Login
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window

Enter Username And Password
    [Arguments]     ${username}     ${password}
    Enter Text    ${txt_username}    ${username}
    Enter Text    ${txt_password}    ${password}

Click Login Button
    Click On Button    ${btn_login}

Logout
    Click On Element    ${user_menu}
    Click On Element    ${option_logout}

Verify Login Successfully
    Wait Until Element Is Visible    ${header_dashboard}