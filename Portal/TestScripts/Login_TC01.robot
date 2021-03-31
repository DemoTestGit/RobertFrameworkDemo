*** Settings ***
Library  SeleniumLibrary

Resource   ../Resources/Login.robot
Library  DataDriver  ../TestData/Login/Login.xlsx
Variables  ../Constant/Locators.py


Test Template  Login_TC1
*** Variables ***
${LoginUrl}
${BrowserType}
${Username}
${Password}
${status}



*** Test Cases ***
Login


*** Keywords ***

Login_TC1

       [Arguments]    ${LoginUrl}    ${BrowserType}  ${status}  ${Username}  ${Password}
        RUN KEYWORD IF   '${status}'=='Y'  LoginTC3
                         ...  ElSE   log to console  No testcase Selected


LoginTC3
       [Arguments]    ${LoginUrl}    ${BrowserType}  ${Username}  ${Password}
        LaunchBrowser   ${LoginUrl}  ${BrowserType}
                           username    ${Username}
                           password    ${Password}
                           LoginButton
