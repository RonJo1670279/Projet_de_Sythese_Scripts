*** Settings ***
Documentation    Test nominal de deplacement d'un evenement en mode Semaine
Library           Selenium2Library
Library           Screenshot
Library           DateTime
Resource           ../Ressources/Keywords/Keywords.robot
Suite Setup       Open browser login and preconditions for nominal
Suite Teardown    Logout
Test Template     Créer un evenement et le deplacer par mois



*** Variables ***
${vURL}           http://localhost:8087/share/page
${vBrowser}       chrome
${vUsername}      1670279
${vPassword}      12345678
${TIMEOUT}        5s


*** Test Cases ***       Quoi    Ou   Description    TimeDebut    TimeFin    tag
Cas 1                 Testdevenement	ChezPop    Test#3    1530    2233    123

Cas 2                 Testdevenement    ChezPop    Test#2    1200    1230    afe

cas3                     Test2    AUlit    Test#3       1520	    2233	abc123

cas4                     Testdevenement    Travail    Test#2    1530    2134    adad

cas5                    Test2    AUlit    Test1    1500    2233    adad