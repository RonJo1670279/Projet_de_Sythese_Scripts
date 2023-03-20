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

Open browser login and preconditions for nominal
    Login    ${vURL}    ${vBrowser}    ${vUsername}    ${vPassword}

Logout
    Wait Until Element Is Visible    ${link_HeaderUserMenu}
    Click Element    ${link_HeaderUserMenu}
    Wait Until Element Is Visible    ${link_HeaderDeconnexion}
    Click Element    ${link_HeaderDeconnexion}
    Close Browser


Créer un article dans un blog
    [Arguments]       ${vTitre}    ${vContenu}    ${vTags}
    # nomSite est le nom du site(deja cree)
	# vTitre contient le titre du blog
    # vContenu contient le contenu du blog
    # vTags contient le tag relie au blog

    #cliquer sur le lien sites
    Click Element    ${link_Id_site}
	Wait Until Element Is Visible    ${link_site_nom_p1}
	
    #Cliquer sur le site sur lequel on souhaite acceder
    Click Element    ${link_site_nom_p1}    #${nom_site}${link_site_nom_p2}

   
    #Cliquer sur blog present dans le menu a cote de tableau de bord
    #si l'onglet blog n'est pas visible il faut l'ajouter depuis l'option personnaliser le site
	Click Element    ${lnk_blog}

    #cliquer sur le bouton nouveau article pour creer l'article
    Click Element    ${btn_nveauArticle}

    #mettre le titre de l'article dans le champs
    Input text    ${txt_titre}    ${vTitre}

    #mettre le contenu de l'article dans le champs
    Select Frame    id:template_x002e_postedit_x002e_blog-postedit_x0023_default-content_ifr
    Click Element    id:tinymce
    Clear Element Text    id:tinymce
    Input Text    id:tinymce    ${vContenu}

    #Sortir du frame
    Unselect Frame

    #mettre le nom du tag qu'on veut lier a l'article
    Input text    ${text_tag}    ${vTags}

    #cliquer sur publier pour creer l'article
    Click Button    ${btn_publier_blog}

    #Valider que l'article a ete bien cree
    Wait Until Page Contains    ${vTitre}

    #cliquer le bouton blog
    Click Element    ${lnk_blog}

    #Valider la visibiliter de lelement
    Wait Until Element Is Visible    ${btn_supprimer}
    
    #on click lelemnt 
    Click Element    ${btn_supprimer}

    #On sassure que l'alerte saffiche
    Wait Until Element Is Visible    ${alrt_supprimer}
    
    #On clique sur supprimer
    Click Element    ${btn_supprimer_2}

    #On sassure que lelement de Post condition saffiche
     Wait Until Element Is Visible    ${txt_confimer}

Créer un article dans un blog Exception
    [Arguments]       ${vTitre}    ${vContenu}    ${vTags}
    # nomSite est le nom du site(deja cree)
	# vTitre contient le titre du blog
    # vContenu contient le contenu du blog
    # vTags contient le tag relie au blog

    #cliquer sur le lien sites
    Click Element    ${link_Id_site}
	Wait Until Element Is Visible    ${link_site_nom_p1}
	
    #Cliquer sur le site sur lequel on souhaite acceder
    Click Element    ${link_site_nom_p1}    #${nom_site}${link_site_nom_p2}

   
    #Cliquer sur blog present dans le menu a cote de tableau de bord
    #si l'onglet blog n'est pas visible il faut l'ajouter depuis l'option personnaliser le site
	Click Element    ${lnk_blog}

    #cliquer sur le bouton nouveau article pour creer l'article
    Click Element    ${btn_nveauArticle}

    #mettre le titre de l'article dans le champs
    Input text    ${txt_titre}    ${vTitre}

    #mettre le contenu de l'article dans le champs
    Select Frame    id:template_x002e_postedit_x002e_blog-postedit_x0023_default-content_ifr
    Click Element    id:tinymce
    Clear Element Text    id:tinymce
    Input Text    id:tinymce    ${vContenu}

    #Sortir du frame
    Unselect Frame

    #mettre le nom du tag qu'on veut lier a l'article
    Input text    ${text_tag}    ${vTags}

    #cliquer sur publier pour creer l'article
    Click Button    ${btn_publier_blog}
    Sleep    ${TIMEOUT}
    
    #On sassure que c'est une echec
    Wait Until Element Is Visible    ${txt_titre}

