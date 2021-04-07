# Design : Mythili P
#  Plan  :
#  Validation:

# Importing the Library File
*** Settings ***
Library  SeleniumLibrary

Resource   ../Resources/Delete.robot
Library  DataDriver  ../TestData/Delete/Delete.xlsx
Variables  ../Constant/Locators.py

# TO Call the Keywords
Test Template  Delete_TC1


*** Test Cases ***
Delete

# Creating a Keywords to call flow of TC
*** Keywords ***
Delete_TC1
    [Arguments]  ${LoginUrl}  ${BrowserType}  ${status}  ${Username}  ${Password}   ${delusername}
       ${delete}=  RUN KEYWORD IF   '${status}'=='N'  NoTCSelected
                  ...  ELSE IF  '${status}'=='Y'   D_TC00  ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}  ${delusername}

D_TC00

      [Arguments]  ${LoginUrl}  ${BrowserType}  ${Username}  ${Password}    ${delusername}
       LaunchBrowser  ${LoginUrl}  ${BrowserType}
       username  ${Username}
       password  ${Password}
       LoginButton
       sleep   2s
       Validation
       sleep   2s
       ClickAdmin
       EnterUsername   ${delusername}
       Click Search
       Click Checkbox
       sleep   2s
       Click Delete
       sleep   2s
       Click Confirm
       sleep   2s
       close browser



NoTCSelected
    log to console  "No TestCase Selected"

