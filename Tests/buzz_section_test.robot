*** Settings ***
Resource    ../Config/resource.robot

Suite Setup    Buzz Suite Setup
Suite Teardown    Close Browser

*** Test Cases ***
verify create post successfully
    Perform Create Post
    Verify Create Post Successfully
    [Teardown]    Buzz Teardown
    [Tags]    test create post    buzz section test
