*** Settings ***
Library  SeleniumLibrary
Library  DataDriver  ../TestData/Add/AddUser.xlsx
Variables  ../Constant/AddUser.py

*** Variables ***
${url}
${Browser}

*** Keywords ***
Browser
    [Arguments]  ${url}     ${Browser}
    open browser    ${url}  ${Browser}
    maximize browser window
username
    [Arguments]  ${LoginID}
    input text  ${UserId}   ${LoginID}
password
    [Arguments]  ${LoginPassword}
    input text  ${PwdId}   ${LoginPassword}
login button
    click button  ${LoginBtn}
    sleep  2s
SelectAdmin
    click element  ${Admin}
    click button  ${Add}
AddingDetailes
    select from list by label  systemUser[userType]     ESS
AdminName
    [Arguments]  ${empName}
    input text  ${Text1}  ${empName}
EmployeeName
    [Arguments]  ${username}
    input text  ${Text2}  ${username}
    select from list by index  systemUser[status]   0
Password Field
    [Arguments]   ${PassWord}
    input text    ${password1}    ${PassWord}
Confirm Password Field
    [Arguments]   ${PassWord}
    input text  ${cpassword1}   ${PassWord}

IfCondition
    ${Required}=  get element count  xpath://span[text()='Required']
    run keyword if  ${Required} > 0  Invalid
    ...     ELSE  ValidData
SaveOption
    click button  ${Save}
    capture page screenshot
Invalid
    log to console  Invalid Data
    close browser
ValidData
    log to console  Succesfull
    #capture page screenshot
    sleep  2s
    close browser