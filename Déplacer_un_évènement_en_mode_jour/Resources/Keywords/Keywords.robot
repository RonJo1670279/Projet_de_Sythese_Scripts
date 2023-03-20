*** Settings ***

Library    Selenium2Library
Library    Screenshot
Variables  ../Locators/Locators.py

*** Variables ***
${TIMEOUT}        2
${vURL}           http://localhost:8087/share/page
${vBrowser}       chrome
${vUsername}      1670279
${vPassword}      12345678


*** Keywords ***
Open browser login and preconditions for nominal
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}
    Click Element    ${lnk_Accueil}
Créer un evenement et le deplacer par jour
    #Precondition
    #Keyword:Créer un evenement
    [Arguments]      ${vQuoi}    ${vOu}    ${vDescription}    ${vTimeDebut}    ${vTimeFin}    ${vtag}
      # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
     #On attends que cela soit visible
    Wait Until Element Is Visible    ${btn_sites}
   #On clique sur mes sites
    Click Element   ${btn_sites}
     # Definir la valeur de timeout pour le cas de test
    Wait Until Element Is Visible    ${lnk_SiteCreer}
      #clique sur le nom du site
    Click Element    ${lnk_SiteCreer}
    #cliquer sur la calendrier
    Click Element    ${lnk_Calendrier}
    #cliquer sur ajouter un evenement
    Click Element    ${lnk_Ajouter_un_Evenement}
    #On attends que le formulaire soit visible
    Wait Until Element Is Visible    ${txt_Quoi}
    #on ajoute les texts
    Input Text    ${txt_Quoi}    ${vQuoi}
    Input Text    ${txt_vOu}    ${vOu}
    Input Text    ${txt_vDescription}    ${vDescription}
    #On attend que les elements du temps soit visible
    Wait Until Element Is Visible    ${txt_vTimeDebut}
    #On ecrit les temps de debut
    Input Text    ${txt_vTimeDebut}    ${vTimeDebut}
    #On attend que les elements du temps soit visible
    Wait Until Element Is Visible    ${txt_vTimeFin}
     #On ecrit les temps de debut
    Input Text    ${txt_vTimeFin}    ${vTimeFin}
    #On attend que les elements du temps soit visible
    Wait Until Element Is Visible    ${txt_vtag}
    #On met les tags
    Input Text    ${txt_vtag}    ${vtag}
    #On attend que les elements du temps soit visible
    Wait Until Element Is Visible    ${btn_Ajouter}
    #On ajoute les evenements
    Click Element    ${btn_Ajouter}
    #On enregistre
    Click Element    ${btn_Enregistrer}
    #Deplacer en mode Semaine
    #On clique sur le bouton jour
    Click Element    ${btn_Jour}
    #On attend que l'element "Journe Entiere" Soit visible
    Wait Until Element Is Visible    ${txt_Journer_Entiere}
    #on drag and drop
    Drag And Drop    ${btn_afficher_evenment}    ${btn_afficher_evenment2} 
    #clique sur Agenda
    Click Element    ${btn_Agenda}
    #on fait mouse over
    Mouse Over    ${btn_option}
    #on sassure que le bouton supprimer s'affiche
    Wait Until Element Is Visible    ${btn_supprimer}
    #On clique sur supprimer
    Click Element    ${btn_supprimer}
    #on sassure que l alerte supprimer s'affiche
    Wait Until Element Is Visible    ${alrt_supprimer}
    #on confirme la suppression 
    Click Element    ${btn_confirmer_supprimer}


Login
    # vURL contient l'adresse URL de la page web
    # vBrowser contient l'identifiant du navigateur cible
    [Arguments]    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}    
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    # Ouvrir le navigateur en precisant l'URL et le navigateur
    Open Browser    ${vURL}    ${vBrowser}
    # Maximiser la fenetre du navigateur
    Maximize Browser Window
    # Saisie du login
    Input text    ${txt_UserName}    ${vUsername}
    # Saisie du mot de passe
    Input text    ${txt_Password}    ${vPassword}
    # Click sur le bouton Connexion
    Click Button    ${btn_Login}
    #on attend
    Wait Until Element Is Visible    ${link_HeaderUserMenu}

Logout
   #sleep    3s
    Wait Until Element Is Visible    ${link_HeaderUserMenu}
    Click Element    ${link_HeaderUserMenu}
    Wait Until Element Is Visible    ${link_HeaderDeconnexion}
    Click Element    ${link_HeaderDeconnexion}
    Close Browser