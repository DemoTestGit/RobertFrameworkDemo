*** Settings ***
Library  SeleniumLibrary
Variables  ../Constant/Locators.py

*** Variables ***
${LoginUrl}
${BrowserType}
${Username}
${Password}
${status}
${errorMsg}

*** Keywords ***

LaunchBrowser
   [Arguments]  ${LoginUrl}  ${BrowserType}
   open browser  ${LoginUrl}  ${BrowserType}
   maximize browser window
username
   [Arguments]  ${Username}
    element should be visible  id:txtUsername
    element should be enabled  id:txtUsername
    input text      ${UserId}  ${Username}
password
    [Arguments]  ${Password}
     element should be visible  id:txtPassword
     element should be enabled  id:txtPassword
    input password  ${PwdId}  ${Password}

LoginButton
    click button  ${LoginBtn}

Validation
  page should contain button  //*[@id="Subscriber_link"]

Message
  page should contain  //*[@id="spanMessage"]

