*** Settings ***
Resource    ../Config/resource.robot

*** Keywords ***
Enter Text
    [Arguments]    ${locator}   ${value}
    Wait Until Element Is Visible    ${locator}
    Input Text    ${locator}    ${value}

Click On Button
    [Arguments]    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Button    ${locator}

Click On Element
    [Arguments]    ${locator}
    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}
