*** Settings ***
Documentation    Test nominal de deplacement d'un evenement en mode Semaine
Library           Selenium2Library
Library           Screenshot
Library           DateTime
Resource           ../Ressources/Keywords/Keywords.robot
Suite Setup       Open browser login and preconditions for nominal
Suite Teardown    Logout
Test Template     Créer un article dans un blog



*** Variables ***
${vURL}           http://localhost:8087/share/page
${vBrowser}       chrome
${vUsername}      1670279
${vPassword}      12345678
${TIMEOUT}        5s

*** Test Cases ***    titre    Text    tags

Test Case 1    ACRUSDA	12345789	Quick

Test Case 2    ACRUSDA    Un test    More

Test Case 3     Texte1    Un test    Quick

Test Case 4     Texte1    Un test    ${Empty}

Test Case 5     @#$%^    12345789    @#$%^

Test Case 6    Texte1	${Empty}	${Empty}

Test Case 7     Texte1	${Empty}	More
