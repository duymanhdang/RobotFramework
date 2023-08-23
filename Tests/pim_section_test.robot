*** Settings ***
Resource    ../Config/resource.robot
Suite Setup     Common Suite Setup
Suite Teardown    Close Browser

*** Test Cases ***
Verify Add New Employee Successfully
    Click Add Button
    Enter Employee Information And Save    ${firstname}    ${lastname}
    Verify Add Eployee Successfully
    [Teardown]    Common Teardown
    [Tags]    test add employee    pim section test

Verify Delete Empoyee Information Successfully
    [Setup]     Common Setup
    Perform Delete Employee
    Verify Delete Employee Successfully
    [Tags]    test delete employee    pim section test

Verify Edit Employee Information Successfully
    [Setup]    Common Setup
    Perform Edit Employee Lastname    ${new_lastname}
    Verify Edit Successfully
    [Teardown]    Common Teardown
    [Tags]    test edit employee    pim section test

Verify Search Employee Information Successfully
    [Setup]    Common Setup
    Enter ID And Search
    Verify Search Employee Id Successfully
    [Teardown]    Common Teardown
    [Tags]    test search employee    pim section test

Verify Sort Employee Id Ascending Successfully
    Perform Sort Employee Id Ascending
    Verify Sort Employee Id Ascending Successfully
    [Tags]    test sort id ascending    pim section test
