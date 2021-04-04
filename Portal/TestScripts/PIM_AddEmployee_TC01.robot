*** Settings ***
Library  SeleniumLibrary
Test Teardown  run keyword if test failed  Log  Screenshot
Resource  ../Resources/Login.robot
Resource  ../Resources/Orange_Demo_PIM.robot
Library  DataDriver  ../TestData/Login/Login.xlsx
Test Template   Toopenbrowser


*** Test Cases ***
Run







*** Keywords ***
Toopenbrowser
    #Login_TC1  ${LoginUrl}    ${BrowserType}  ${status}  ${Username}  ${Password}
     [Arguments]   ${LoginUrl}    ${BrowserType}  ${status}  ${Username}  ${Password}  ${firstname}  ${lastname}  ${username_employee}  ${password_employee}  ${confirmpassword}  ${status_emp}
     ${Add_employee}=  RUN KEYWORD IF   '${Status}'=='Y'  AddEmployee  ${LoginUrl}    ${BrowserType}  ${Username}  ${Password}   ${firstname}  ${lastname}  ${username_employee}  ${password_employee}  ${confirmpassword}  ${status_emp}
      ...  ELSE IF  '${Status}'=='N'  LoginTC2

AddEmployee
  [Arguments]  ${LoginUrl}    ${BrowserType}  ${Username}  ${Password}  ${firstname}  ${lastname}  ${username_employee}  ${password_employee}  ${confirmpassword}  ${status_emp}
  LaunchBrowser   ${LoginUrl}  ${BrowserType}
  username    ${Username}
  password    ${Password}
  LoginButton
  clickPIM Link
  click AddEmployee Link
  Enter fullname  ${firstname}
  Enter lastname  ${lastname}
  choose photograph
  select checkboxvalue
  Enter username  ${username_employee}
  Enter password   ${password_employee}
  Enter confirmpassword  ${confirmpassword}
  choose status   ${status_emp}
  click save button

LoginTC2
  log to console   No testcase Selected

