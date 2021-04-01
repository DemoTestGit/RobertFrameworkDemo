# Design : David S
#  Plan  : Login TC
#  Validation: Valid and Invalid TC

# Importing the Library File
*** Settings ***
Library  SeleniumLibrary
Resource   ../Resources/Login.robot
Library  DataDriver  ../TestData/Login/Book1.xlsx
Variables  ../Constant/Locators.py

# TO Call the Keywords
Test Template  Login_TC1


*** Test Cases ***
Login

# Creating a Keywords to call flow of TC
*** Keywords ***
Login_TC1

       [Arguments]  ${LoginUrl}  ${BrowserType}  ${status}  ${Username}  ${Password}  ${errorMsg}

       ${Login} =  RUN KEYWORD IF   '${status}'=='N'  NoTCSelected
                  ...  ELSE IF  '${status}'=='Y' and '${errorMsg}'==''  TC00  ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}
                  ...  ElSE IF  '${status}'=='Yes' and '${errorMsg}'=='Invalid'  InvalidLogin  ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}


TC00
      [Arguments]  ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}
       LaunchBrowser  ${LoginUrl}  ${BrowserType}
       username  ${Username}
       password  ${Password}
       sleep   2s
       LoginButton
       sleep   2s
       Validation
       close browser

NoTCSelected
    log to console  "No TestCase Selected"

InvalidLogin
     [Arguments]  ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}
       log to console   "dsfds"
       LaunchBrowser  ${LoginUrl}  ${BrowserType}
       username  ${Username}
       password  ${Password}
       sleep   2s
       LoginButton
       sleep   2s
       Message
       close browser


