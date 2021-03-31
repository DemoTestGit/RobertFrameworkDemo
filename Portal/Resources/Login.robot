*** Settings ***
Library  SeleniumLibrary
Variables  ../Constant/Locators.py

*** Variables ***
${LoginUrl}
${BrowserType}
${Username}
${Password}
${status}
${errorMsg1}


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
   ${message} =  get element count  xpath://*[@id="spanMessage"]
      run keyword if  ${message} > 0  Test Keyword2  ELSE  Test Keyword1

Test Keyword1

    log to console  Valid Credentials
    capture page screenshot


Test Keyword2
    log to console  Incorrect Credentials
    capture page screenshot
    close browser