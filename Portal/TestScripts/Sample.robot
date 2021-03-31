*** Settings ***
Library  SeleniumLibrary
Resource   ../Resources/Login.robot
*** Variables ***
${count1}   Yes

*** Test Cases ***
Login to verify the velue

  TC1

*** Keywords ***
TC1

     RUN KEYWORD IF   '${count1}' == 'Yes'  LoginTC1   ELSE   LoginTC2



