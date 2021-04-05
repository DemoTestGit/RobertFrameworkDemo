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
    [Arguments]  ${TestCase_Discription}
    #page should contain button  //*[@id="Subscriber_link"]
    #page should contain element  //*[@id="menu_dashboard_index"]/b
    #Screenshot ${TestCase_Discription}
    page should contain element  //b[text()='Dashboard']
    Screenshot  ${TestCase_Discription}

Message
  page should contain  Invalid credentials

CloseBrowser
    close all browsers

Get DateTime1
  ${now}    Evaluate  '{dt:%A}, {dt:%B}, {dt.day}, {dt.year}, {dt:%H}, {dt:%M}, {dt:%S}'.format(dt=datetime.datetime.now())    modules=datetime
  log to console  ${now}
  [Return]   ${now}

Screenshot
  [Arguments]  ${TestCase_Discription}
  Set Global Variable  ${Path}  .//Portal//Snapshot/
  Set Screenshot Directory  ${Path}
  ${datetime}=  Get DateTime1
  capture page screenshot  ${TestCase_Discription}${datetime}.png
  Log To Console  ${\n}Screenshot