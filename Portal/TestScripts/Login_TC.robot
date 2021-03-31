# Design : David S
#  Plan  :
#  Validation:

# Importing the Library File
*** Settings ***
Library  SeleniumLibrary
Resource   ../Resources/Login.robot
Library  DataDriver  ../TestData/Login/Login.xlsx
Variables  ../Constant/Locators.py

# TO Call the Keywords
Test Template  Login_TC1


*** Test Cases ***
Login

# Creating a Keywords to call flow of TC
*** Keywords ***
Login_TC1

       [Arguments]  ${LoginUrl}  ${BrowserType}  ${status}  ${Username}  ${Password}
       ${Login}=  RUN KEYWORD IF   '${status}'=='N'  NoTCSelected
                  ...  ELSE IF  '${status}'=='Y'   TC00  ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}

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




