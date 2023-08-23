*** Settings ***
Resource    ../Config/resource.robot

*** Keywords ***
Common Suite Setup
    Open Page Login And Go To Pim Section

Open Page Login And Go To Pim Section
    Open Browser    ${URL}      ${browser}
    Maximize Browser Window
    Enter Text        ${txt_username}   ${valid_username}
    Enter Text    ${txt_password}   ${valid_password}
    Click On Button    ${btn_login}
    Click On Element    ${pim_section}

Click Add Button
    Click On Button    ${btn_add_employee}

Enter Employee Information And Save
    [Arguments]    ${firstname}    ${lastname}
    Enter Text    ${txt_first_name}    ${firstname}
    Enter Text    ${txt_last_name}    ${lastname}
    ${id}=    Get Value    ${txt_id}
    Set Global Variable    ${global_ID}    ${id}
    Click On Button    ${btn_save}

Verify Add Eployee Successfully
    Click On Element    ${menu_item_employee_list}
    Find Employee From List

Find Employee From List
    ${condition}=   Run Keyword And Return Status    Wait Until Element Is Visible    ${page_number}
    IF    "${condition}"=="True"
        ${find_element_pagenum}=    Get Webelements    ${page_number}
        ${number_ofpage}=     Get Length     ${find_element_pagenum}
        FOR    ${index}    IN RANGE    ${number_ofpage}
            TRY
                Find Employee Id
            EXCEPT
                Click Button Next Previous
            END
        END
    ELSE
        Find Employee Id
    END

Find Employee Id
    ${element}=     Set Variable    //div[text()='${global_ID}']
    Wait Until Page Contains Element    ${element}    timeout=5s
    ${getEmployeeID_fromlist}=    Get Webelement    ${element}
    ${id}=    Get Text    ${getEmployeeID_fromlist}
    Should Be True    "${id}" == "${global_ID}"

Click Button Next Previous
    Wait Until Element Is Visible    ${btn_nextpage_right}
    Click On Element    ${btn_nextpage_right}

Common Setup
    Click On Element    ${menu_item_add_employee}
    Enter Employee Information And Save    ${firstname}     ${lastname}
    Click On Element    ${menu_item_employee_list}

Common Teardown
    ${btn_trash}=     Set Variable    //div[text()='${global_ID}']/../..//button/i[@class='oxd-icon bi-trash']
    Wait Until Element Is Enabled    ${btn_trash}
    Scroll Element Into View    ${btn_trash}
    Click On Element    ${btn_trash}
    Click On Button    ${btn_except_delete}

Perform Delete Employee
    ${btn_trash}=    Set Variable    //div[text()='${global_ID}']/../..//i[@class='oxd-icon bi-trash']
    Find Employee From List
    Click On Element    ${btn_trash}
    Click On Button    ${btn_except_delete}

Verify Delete Employee Successfully
    Click On Element    ${menu_item_employee_list}
    ${condition}=    Run Keyword And Return Status    Find Employee From List
    Should Not Be True    ${condition}

Perform Edit Employee Lastname
    [Arguments]    ${lastname}
    ${employee_edit}=     Set Variable    //div[text()='${global_ID}']
    Find Employee From List
    Mouse Over    ${employee_edit}
    Click On Element    ${employee_edit}
    Wait Until Element Is Visible    ${txt_last_name}
    Sleep    3
    Press Keys   ${txt_lastname}   CTRL+a   BACKSPACE
    Enter Text    ${txt_lastname}   ${new_lastname}
    Click On Element    ${btn_save_change}

Verify Edit Successfully
    ${value_txt_lastname_field}=    Get Value    ${txt_lastname}
    ${xpath_lastname_in_list}=    Set Variable    //div[text()='${global_ID}']/../following-sibling::div[2]/div
    Should Contain    ${new_lastname}   ${value_txt_lastname_field}
    Click On Element    ${menu_item_employee_list}
    Find Employee From List
    Scroll Element Into View    ${xpath_lastname_in_list}
    ${value_lastname_in_list}=    Get Text    ${xpath_lastname_in_list}
    Should Contain    ${new_lastname}   ${value_lastname_in_list}

Enter ID And Search
    Enter Text      ${txt_id_search}    ${global_ID}
    Click On Button    ${btn_search}

Verify Search Employee Id Successfully
    Sleep    3
    ${element}=    Get Webelement    ${xpath_employee_id_fromlist}
    ${id}=    Get Text    ${element}
    Should Be True    "${global_ID}" == "${id}"

Perform Sort Employee Id Ascending
    Click On Element    ${menu_item_employee_list}
    ${list_id_before_sort_ascending}=    Get All Employee Id From Employee List

    Set Global Variable    ${list_id_before_sort_ascending}     ${list_id_before_sort_ascending}
    Click On Element    ${menu_item_employee_list}
    Click On Element    ${dropdown_btn_sort}
    Click On Element    ${option_ascending}

Verify Sort Employee Id Ascending Successfully
    ${list_id_after_sort_ascending}=    Get All Employee Id From Employee List
    Sort List    ${list_id_before_sort_ascending}
    Lists Should Be Equal    ${list_id_before_sort_ascending}    ${list_id_after_sort_ascending}

Get All Employee Id From Employee List
    ${list_employee_id}=    Create List
    ${list}=    Create List
    ${condition}=   Run Keyword And Return Status    Wait Until Element Is Visible    ${page_number}
    IF    "${condition}"=="True"
        ${find_element_pagenum}=    Get Webelements    ${page_number}
        ${number_ofpage}=     Get Length     ${find_element_pagenum}
        FOR    ${index}    IN RANGE    ${number_ofpage}
            ${list}=    Get Employee Id    ${xpath_employee_id_fromlist}
            ${list_employee_id}=    Combine Lists    ${list_employee_id}    ${list}
            Run Keyword And Ignore Error    Click Button Next Previous
        END
    ELSE
        ${list_employee_id}=    Get Employee Id    ${xpath_employee_id_fromlist}
    END
    RETURN    ${list_employee_id}

Get Employee Id
    [Arguments]    ${locator}
    ${list_id}=     Create List
    Wait Until Page Contains Element    ${locator}
    ${list_xpath_id}=    Get Webelements    ${locator}
    ${len}=   Get Length    ${list_xpath_id}
    FOR    ${index}    IN RANGE    ${len}
        ${id}=    Get Text    ${list_xpath_id}[${index}]
        Append To List    ${list_id}    ${id}
    END
    RETURN    ${list_id}
