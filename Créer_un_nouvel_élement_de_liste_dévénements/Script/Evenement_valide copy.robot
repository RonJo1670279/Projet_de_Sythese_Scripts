
*** Settings ***
Documentation    Test nominal creer un evenement dans la liste
Library           Selenium2Library
Library           Screenshot
Library           DateTime
Resource           ../Resources/Keywords/Keywords.robot
Suite Setup       Open browser login and preconditions for nominal
Suite Teardown    Logout
Test Template    Créer un nouvel élement de liste d'événements



*** Variables ***
${vURL}           http://localhost:8087/share/page
${vBrowser}       chrome
${vUsername}      1670279
${vPassword}      12345678
${TIMEOUT}        5s

*** Test Cases ***    ${vTitre}    ${vDescription}     ${vtitreSite}   ${v_Type}  
cas 1   Test1	Testnormale	    bois-de-boulogne	Agenda d'événement
cas 2    Test1	quisais	bois-de-boulogne	 Carnet d'adresses
cas 3    ment	quisais	bois-de-boulogne	Liste de contacts
cas 4    Evenement	${EMPTY} 	bois-de-boulogne	Liste de tâches (simples)
cas 5    Evenement	Testnormale	bois-de-boulogne	Liste d'événements
cas 6    123456	J.cole fan	bois-de-boulogne	Ordre du jour
cas 7    123456	Testnormale	bois-de-boulogne	Agenda d'événement
cas 8    123456	where im I	bois-de-boulogne	Agenda d'événement
cas 9    @$%$#%#$	Testnormale	bois-de-boulogne	Ordre du jour

cas 10    123456	${EMPTY} 	bois-de-boulogne	Liste de contacts