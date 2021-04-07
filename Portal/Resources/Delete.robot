*** Settings ***
Library  SeleniumLibrary
Variables  ../Constant/Locators.py

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

ClickAdmin
    click Element    ${ClickAdmin}

EnterUsername
    [Arguments]     ${delusername}
    input text      ${username_Delete}  ${delusername}

Click Search
    click button      ${search_Delete}

Click Checkbox
    #${msg} =  get text  xpath://table[@id='resultTable']/tbody/tr/td
    #${val}=  RUN KEYWORD IF   '${msg}'=='No Records Found'  Close Window
    #...Else
    click Element      ${checkbox_delete}

Click Delete
    click button      ${deleteButton}

Click Confirm
    sleep   2s
    click button        ${confirmButton}
    sleep   2s
    log to console  Successfully deleted


