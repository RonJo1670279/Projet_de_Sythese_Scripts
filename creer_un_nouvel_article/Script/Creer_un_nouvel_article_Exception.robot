*** Settings ***
Documentation    Test nominal de deplacement d'un evenement en mode Semaine
Library           Selenium2Library
Library           Screenshot
Library           DateTime
Resource           ../Ressources/Keywords/Keywords.robot
Suite Setup       Open browser login and preconditions for nominal
Suite Teardown    Logout
Test Template     Créer un article dans un blog Exception



*** Variables ***
${vURL}           http://localhost:8087/share/page
${vBrowser}       chrome
${vUsername}      1670279
${vPassword}      12345678
${TIMEOUT}        5s

*** Test Cases ***    titre    Text    tags
Test cases 1    ${Empty}	12345789	More

Test cases 2    ${Empty}	Ceci est @ la maison ce soir	Quick

Test cases 3    ${Empty}	Un test    	Slow

Test cases 4    ${Empty}	${Empty}	More

Test cases 5    ${Empty}	${Empty}    ${Empty}

