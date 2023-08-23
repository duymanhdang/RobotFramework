*** Settings ***
Resource    ../Config/resource.robot
Suite Setup     Open Website OrangeHRM And Go To Admin Section
Suite Teardown    Close Browser

*** Test Cases ***
Verify Add New User Successfully
    [Setup]     Setup Test Add User
    Perform Add New User
    Verify The User Has Been Successfully Added
    Perform Logout
    Login With User Account
    Verify Role Assignment To User
    [Teardown]    Common Teardown Admin Test
    [Tags]    test add user   admin section test

Verify Delete User Successfully
    [Setup]    Setup Test Delete User
    Perform Delete User
    Verify Delete User Successfully
    Verify User Account Can Not Login
    [Teardown]    Reset Test Delete User
    [Tags]    test delete user   admin section test

Verify Change User Password Successfully
    [Setup]    Setup Test Change User Password
    Perform Change User Password
    Verify Change Password Successfully
    [Teardown]    Common Teardown Admin Test
    [Tags]    test change password    admin section test
