
*** Settings ***
Documentation    Test nominal creer un evenement dans la liste
Library           Selenium2Library
Library           Screenshot
Library           DateTime
Resource           ../Resources/Keywords/Keywords.robot
Suite Setup       Open browser login and preconditions for nominal
Suite Teardown    Logout
Test Template    Créer un nouvel élement de liste d'événements invalides



*** Variables ***
${vURL}           http://localhost:8087/share/page
${vBrowser}       chrome
${vUsername}      1670279
${vPassword}      12345678
${TIMEOUT}        5s

*** Test Cases ***    ${vTitre}    ${vDescription}     ${vtitreSite}   ${v_Type}  
cas 1   ${EMPTY}	12323	bois-de-boulogne	Liste de tâches
cas 2    ${EMPTY}	quisais	bois-de-boulogne	Liste de contacts
cas 3    ${EMPTY}	Testnormale	bois-de-boulogne	Ordre du jours
cas 4    Test1	${EMPTY} 	bois-de-boulogne	${EMPTY}
cas 5    123456	${EMPTY} 	bois-de-boulogne	${EMPTY}
cas 6    EVENEEMT	12323	bois-de-boulogne	${EMPTY}
cas 7    ${EMPTY}	J.cole fan	bois-de-boulogne	Liste de tâches (avancées)
cas 8    123456	quisais	bois-de-boulogne	${EMPTY}
cas 9    Evenement	12323	bois-de-boulogne	${EMPTY}

cas 10    ${EMPTY}     123456    bois-de-boulogne	Liste de contacts