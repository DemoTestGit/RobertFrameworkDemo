*** Settings ***
Library  SeleniumLibrary
Resource   ../Resources/AddUser.robot
Library  DataDriver  ../TestData/Add/AddUser.xlsx
Variables  ../Constant/AddUser.py

Test Template  Flags

*** Test Cases ***
Adding User

*** Keywords ***

Flags
    [Arguments]  ${url}   ${Browser}  ${empName}  ${username}  ${PassWord}  ${Status}   ${LoginID}  ${LoginPassword}
    ${Login}=  RUN KEYWORD IF   '${Status}'=='Yes'  orangehrm  ${empName}  ${username}  ${PassWord}  ${url}   ${Browser}  ${LoginID}  ${LoginPassword}
     ...  ELSE IF  '${Status}'=='No'  Negative


orangehrm
    [Arguments]     ${empName}  ${username}  ${PassWord}  ${url}   ${Browser}  ${LoginID}  ${LoginPassword}
    Browser         ${url}  ${Browser}
    username        ${LoginID}
    password        ${LoginPassword}
    login button
    SelectAdmin
    AddingDetailes
    AdminName               ${empName}
    EmployeeName            ${username}
    Password Field          ${PassWord}
    Confirm Password Field  ${PassWord}
    SaveOption
    IfCondition

Negative
    log to console  All Required Felds Need To be Filled
