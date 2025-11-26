*** Settings ***
Library    Browser
Suite Setup    New Browser    headless=False
Suite Teardown    Close Browser    
Test Setup    New Context
Test Teardown    Close Context
*** Variables ***
${BASE_WEBURL}    https://practicesoftwaretesting.com/

# admin login sprint1
${USERNAME}    admin@practicesoftwaretesting.com
${PASSWORD}    welcome01

*** Test Cases ***
Login to the application with valid credentials
    Login With Valid Credentials    ${BASE_WEBURL}    ${USERNAME}    ${PASSWORD}
    


*** Keywords ***
Login With Valid Credentials
    [Arguments]    ${BASE_WEBURL}    ${username}    ${password}
    New Page    ${BASE_WEBURL}
    Wait For Elements State    text="Sign in"   visible
    Click    text="Sign in"
    Wait For Elements State    css=input[value="Login"]
    Fill Text    id=email    ${username}
    Fill Text    id=password    ${password}    # $obotFramework05
    Click    css=input[value="Login"]
    Wait For Elements State    a:has-text("Home")    visible