# Design : David S
#  Plan  :
#  Validation:
# Importing the Library File


*** Settings ***
Library  SeleniumLibrary
Resource   ../Resources/Login.robot
Library  DataDriver  ../TestData/Login/Login.xlsx
Variables  ../Constant/Locators.py

# To Close All Browser
Suite Teardown  CloseBrowser
# TO Call the Keywords
Test Template  Login_TC1

*** Test Cases ***
Login
# Creating a Keywords to call flow of TC

*** Keywords ***

Login_TC1
       [Arguments]  ${BrowserType}  ${LoginUrl}  ${Username}  ${Password}  ${status}  ${error}
       ${Login}=  RUN KEYWORD IF   '${status}'=='No'  NoTCSelected
        ...  ELSE IF  '${status}'=='Yes' and '${error}'=='InvalidCredentials'  InvalidLogin    ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}
        ...  ELSE IF  '${status}'=='Yes' and '${error}'=='Valid'  ValidLogin     ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}


ValidLogin
       [Arguments]  ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}
       log to console  Valid TestCase
       LaunchBrowser  ${LoginUrl}  ${BrowserType}
       username  ${Username}
       password  ${Password}
       sleep   2s
       LoginButton
       sleep   2s
       Validation
       close browser


InvalidLogin
       [Arguments]  ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}
       log to console   Invalid TestCase
       LaunchBrowser  ${LoginUrl}  ${BrowserType}
       username  ${Username}
       password  ${Password}
       sleep   2s
       LoginButton
       sleep   2s
       Message
       close browser

NoTCSelected
       log to console  "No TestCase Selected"



