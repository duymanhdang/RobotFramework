*** Settings ***
Resource    ../Config/resource.robot

*** Keywords ***
Open Website OrangeHRM And Go To Admin Section
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window
    Enter Text    ${txt_username}    ${valid_username}
    Enter Text    ${txt_password}    ${valid_password}
    Click On Button    ${btn_login}
    Click On Element    ${element_admin_section}

Setup Test Add User
    Click On Element    ${pim_section}
    Common Setup
    Click On Element    ${element_admin_section}

Perform Add New User
    ${employeename}=    Set Variable    //span[normalize-space()='${employeename_adduser}']
    Click On Button    ${btn_add_user}
    Run Keyword    Wait Until Element Is Visible    ${header_adduser}
    Click On Element    ${dropdownlist_userrole_adduser}
    Click On Element    ${option_ESS_adduser}
    Click On Element    ${dropdownlist_status_adduser}
    Click On Element    ${option_Enable_adduser}
    Enter Text    ${txt_employeename_adduser}    ${employee_name_adduser}
    Click On Element    ${employeename}
    Enter Text    ${txt_username_adduser}    ${username_user}
    Enter Text    ${txt_password_adduser}    ${password_user}
    Enter Text    ${txt_confirm_password_adduser}    ${password_user}
    Check The Existence Of Username
    Click On Button    ${btn_save_adduser}

Check The Existence Of Username
    ${trash}=    Set Variable    //div[text()='${username_user}']/../..//i[@class='oxd-icon bi-trash']
    ${check}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${user_already_exists}    timeout=3s
    IF    "${check}" == "True"
        Click On Element    ${element_admin_section}
        Wait Until Element Is Visible    ${result_username_list}
        Verify The User Has Been Successfully Added
        Scroll Element Into View    ${trash}
        Click On Element    ${trash}
        Click On Button    ${btn_except_delete}
        Execute JavaScript    window.scrollTo(0, 0)
        Perform Add New User
    END

Verify The User Has Been Successfully Added
    ${condition}=   Run Keyword And Return Status    Wait Until Element Is Visible    ${page_number}
    IF    "${condition}" == "True"
        Wait Until Element Is Visible    ${result_username_list}
        ${find_element_pagenum}    Get Webelements    ${page_number}
        ${number_ofpage}=     Get Length     ${find_element_pagenum}
        FOR    ${index}    IN RANGE    ${number_ofpage}
            TRY
                Find User From List
            EXCEPT
                Click Button Next Previous
            END
        END
    ELSE
        Find User From List
    END

Find User From List
    ${locator_user}=     Set Variable    //div[text()='${username_user}']
    Wait Until Element Is Visible    ${result_username_list}
    ${getUsername_fromlist}=    Get Webelement    ${locator_user}
    ${username}=    Get Text    ${getUsername_fromlist}
    Should Be True    "${username}" == "${username_user}"

Perform Logout
    Click On Element    ${user_menu}
    Click On Element    ${option_logout}

Login With User Account
    Enter Text    ${txt_username}    ${username_user}
    Enter Text    ${txt_password}    ${password_user}
    Click On Button    ${btn_login}

Login With Admin Account
   Enter Text    ${txt_username}    ${valid_username}
   Enter Text    ${txt_password}    ${valid_password}
   Click On Button    ${btn_login}

Verify Role Assignment To User
    ${admin_role}=    Create List    Admin    PIM    Recruitment    Maintenance
    Run Keyword    Wait Until Element Is Visible    ${header_dashboard}
    ${menu_section}    Get Webelements    ${xpath_list_section}
    ${length}=    Get Length    ${menu_section}
    FOR    ${section}    IN RANGE    ${length}
        ${name_section}=    Get Text    ${menu_section}[${section}]
        Should Not Contain    ${admin_role}    "${name_section}"
    END

Common Teardown Admin Test
    ${trash}=    Set Variable    //div[text()='${global_ID}']/../..//button/i[@class='oxd-icon bi-trash']
    Perform Logout
    Login With Admin Account
    Click On Element    ${pim_section}
    Find Employee From List
    Scroll Element Into View    ${trash}
    Click On Element    ${trash}
    Click On Button    ${btn_except_delete}

Setup Test Delete User
    Setup Test Add User
    Perform Add New User

Perform Delete User
    ${locator_trashcan}=    Set Variable    //div[text()='${username_user}']/../..//i[@class='oxd-icon bi-trash']
    Verify The User Has Been Successfully Added
    Scroll Element Into View    ${locator_trashcan}
    Click On Element    ${locator_trashcan}
    Click On Button    ${btn_except_delete}

Verify Delete User Successfully
    Click On Element    ${element_admin_section}
    ${locator_user}=     Set Variable    //div[text()='${username_user}']
    ${condition}=   Run Keyword And Return Status    Wait Until Element Is Visible    ${page_number}
    IF    "${condition}" == "True"
        Wait Until Element Is Visible    ${result_username_list}    timeout=10s
        ${find_element_pagenum}    Get Webelements    ${page_number}
        ${number_ofpage}=     Get Length     ${find_element_pagenum}
        FOR    ${index}    IN RANGE    ${number_ofpage}
            TRY
                Wait Until Element Is Visible    ${result_username_list}
                ${findUsername_fromlist}=    Run Keyword And Return Status    Get Webelement    ${locator_user}
                Should Be True    "${findUsername_fromlist}" == "False"
            EXCEPT
                ${nextpage}=   Run Keyword And Return Status    Wait Until Element Is Visible    ${btn_nextpage_right}
                Run Keyword If    "${nextpage}"=="True"    Click On Element    ${btn_nextpage_right}
            END
        END
    ELSE
        Wait Until Element Is Visible    ${result_username_list}
        ${findUsername_fromlist}=    Run Keyword And Return Status    Get Webelement    ${locator_user}
        Should Be True    "${findUsername_fromlist}" == "False"
    END

Verify User Account Can Not Login
    Perform Logout
    Login With User Account
    ${check_login}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${notice_loginfail}
    Should Be True    "${check_login}" == "True"

Reset Test Delete User
    ${trash}=    Set Variable    //div[text()='${global_ID}']/../..//button/i[@class='oxd-icon bi-trash']
    Login With Admin Account
    Click On Element    ${pim_section}
    Find Employee From List
    Scroll Element Into View    ${trash}
    Click On Element    ${trash}
    Click On Button    ${btn_except_delete}

Setup Test Change User Password
    Setup Test Add User
    Perform Add New User
    Wait Until Element Is Visible    ${result_username_list}    timeout=10s
    Perform Logout
    Login With User Account

Perform Change User Password
    Wait Until Element Is Visible    ${header_dashboard}
    Click On Element    ${user_menu}
    Click On Element    ${option_change_password}
    Enter Text    ${txt_current_password}    ${password_user}
    Enter Text    ${txt_password_change}    ${password_change}
    Enter Text    ${txt_confirm_password_change}    ${password_change}
    Click On Button    ${btn_save}

Verify Change Password Successfully
    Wait Until Element Is Visible    ${notice_save_success}
    Perform Logout
    Login With New Password
    Wait Until Element Is Visible    ${header_dashboard}

Login With New Password
    Enter Text    ${txt_username}    ${username_user}
    Enter Text    ${txt_password}    ${password_change}
    Click On Button    ${btn_login}