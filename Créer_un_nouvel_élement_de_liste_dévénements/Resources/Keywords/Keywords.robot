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
    #on clique sur accueil
    Click Element    ${btn_acceuil}

Logout
   #sleep    3s
    Wait Until Element Is Visible    ${link_HeaderUserMenu}
    Click Element    ${link_HeaderUserMenu}
    Wait Until Element Is Visible    ${link_HeaderDeconnexion}
    Click Element    ${link_HeaderDeconnexion}
    Close Browser


Open browser login and preconditions for nominal
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}

Créer un nouvel élement de liste d'événements
      [Arguments]   ${vTitre}    ${vDescription}     ${vtitreSite}   ${v_Type} 
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer le bouton sites
    Click Element    ${btn_sites}
    #on attend
    Sleep    ${TIMEOUT} 
    #cliquer sur mes sites
    Click Element    ${lnk_site}
    # on attend que lelement soit visible
    Wait Until Element Is Visible    ${lblutilisateur}
    #on s'assure que l'element est la
    Element Should Contain    ${lblutilisateur}    Listes des sites de l'utilisateur
    #on attend
    Sleep    ${TIMEOUT} 
    #Cliquer sur le lien
    Click Element    ${lnk_SiteCreer_1}${vtitreSite}${lnk_SiteCreer_2}
    #on attend
    Sleep    ${TIMEOUT} 
    #on attend que Listes de données s'affiche
    Wait Until Element Is Visible     ${btn_listesdonne}
     #on s'assure que l'element est la
    Element Should Contain       ${btn_listesdonne}    Listes de données
   #On clique sur le bouton liste de donner
    Click Element    ${btn_listesdonne}
     #on attend
    Wait Until Element Is Visible    ${btn_nouvellelistes}
    #On clique l'element poour creer la liste
     Click Element    ${btn_nouvellelistes}
     #on attend
    Wait Until Element Is Visible    ${opt_listevenement}
    #On selectionne le type de liste
    Click Element    ${btn_type_liste_part_1}${v_Type}${btn_type_liste_part_2}    
    #Le titre s'affiche
    Input Text    ${txt_titre}    ${vTitre}
    #La description s'affiche
    Input Text    ${txt_description}    ${vDescription} 
    #on click sur le bouton enregistrer
    Click Button    ${btn_Enregister}
    Sleep    ${TIMEOUT}
    Run Keyword And Ignore Error    Fermer la liste
    Sleep    ${TIMEOUT}
    #on fait un mouse over
    Mouse Over    ${lnk_evenement_1}${vTitre}${lnk_evenement_2}
    #on attend que le bouton de supprime saffiche
    Wait Until Element Is Visible    ${btn_supprimer}
    #on clique sur supprimer
    Click Element    ${btn_supprimer}
    #on attend que le bouton de supprime saffiche
    Wait Until Element Is Visible    ${btn_supprimer_2}
    #on clique sur supprimer
    Click Element    ${btn_supprimer_2}
    #on attend
    Wait Until Element Is Not Visible    ${lnk_evenement_1}${vTitre}${lnk_evenement_2}


Créer un nouvel élement de liste d'événements invalides
       [Arguments]   ${vTitre}    ${vDescription}     ${vtitreSite}   ${v_Type} 
    # Definir la valeur de timeout pour le cas de test
    Set Selenium Timeout    ${TIMEOUT}
    #cliquer le bouton sites
    Click Element    ${btn_sites}
    #on attend
    Sleep    ${TIMEOUT} 
    #cliquer sur mes sites
    Click Element    ${lnk_site}
    # on attend que lelement soit visible
    Wait Until Element Is Visible    ${lblutilisateur}
    #on s'assure que l'element est la
    Element Should Contain    ${lblutilisateur}    Listes des sites de l'utilisateur
    #on attend
    Sleep    ${TIMEOUT} 
    #Cliquer sur le lien
    Click Element    ${lnk_SiteCreer_1}${vtitreSite}${lnk_SiteCreer_2}
    #on attend
    Sleep    ${TIMEOUT} 
    #on attend que Listes de données s'affiche
    Wait Until Element Is Visible     ${btn_listesdonne}
     #on s'assure que l'element est la
    Element Should Contain       ${btn_listesdonne}    Listes de données
   #On clique sur le bouton liste de donner
    Click Element    ${btn_listesdonne}
     #on attend
    Wait Until Element Is Visible    ${btn_nouvellelistes}
    #On clique l'element poour creer la liste
     Click Element    ${btn_nouvellelistes}
     #on attend
    Wait Until Element Is Visible    ${opt_listevenement}
    #On selectionne le type de liste
    Click Element    ${btn_type_liste_part_1}${v_Type}${btn_type_liste_part_2}    
    #Le titre s'affiche
    Input Text    ${txt_titre}    ${vTitre}
    #La description s'affiche
    Input Text    ${txt_description}    ${vDescription} 
    #on click sur le bouton enregistrer
    Click Button    ${btn_Enregister}
    #on ferme la fenetre
    Click Element    ${btn_fermer_liste}
	

Fermer la liste
    Click Element    ${btn_fermer_liste}
    
	