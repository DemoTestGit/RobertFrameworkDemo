*** Settings ***
Library  SeleniumLibrary
Variables  ../Constant/Locators.py

*** Variables ***
${LoginUrl}
${BrowserType}
${Username}
${Password}
${status}


*** Keywords ***

LaunchBrowser
   [Arguments]  ${LoginUrl}    ${BrowserType}
   open browser  ${LoginUrl}  ${BrowserType}
   maximize browser window
username
   [Arguments]     ${Username}
    input text      ${UserId}     ${Username}
password
    [Arguments]     ${Password}
    input password  ${PwdId}     ${Password}

LoginButton
    click button  ${LoginBtn}


LoginTC1
 log to console   Failed
LoginTC2

  log to console   Failed

LoginTC2

  close all browsers