*** Settings ***
Resource    ../Config/resource.robot

*** Keywords ***
Buzz Suite Setup
    Open Page Login
    Enter Username And Password    ${valid_username}    ${valid_password}
    Click Login Button
    Wait Until Element Is Visible    ${header_dashboard}
    Scroll Element Into View    ${element_buzz_section}
    Click On Element    ${element_buzz_section}

Perform Create Post
    Enter Text    ${txt_post}    ${post_content}
    Click On Button    ${btn_post}
    Wait Until Element Is Visible    ${notice_save_success}

Verify Create Post Successfully
    Wait Until Element Is Enabled    ${body_text}
    Sleep    2
    ${post_body_text}=    Get Text    ${body_text}
    Should Be Equal As Strings    "${post_content}"    "${post_body_text}"

Buzz teardown
    Click On Element    ${menu_post}
    Click On Element    ${option_delete_post}
    Click On Button    ${btn_except_delete}
