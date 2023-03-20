import time

from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))

driver.maximize_window()
Timeout = driver.implicitly_wait(5)
url = 'http://localhost:8087/share/page/'
driver.get(url)


                         #Login
#Entrer le nom
Name = driver.find_element(By.NAME, "username")
Name.send_keys('1670279')

#Entrer Le mot de passe
password = driver.find_element(By.NAME, "password")
password.send_keys('12345678')
#cliquer sur connexion
connexion =  driver.find_element(By.XPATH, "//button")
connexion.click()

#Click sur le bouton
text_Heading = driver.find_element(By.XPATH, "//h1[@id='HEADER_TITLE']/span").text
print(text_Heading)

#Confirme qu'on est sur la bonne adresse
assert text_Heading == 'Tableau de bord de Joseph Ronaldson Belizaire'
URL_attendu="http://localhost:8087/share/page/user/admin/dashboard"
URL_actuel= driver.current_url
print(URL_actuel)




                                    #Creer un sujet
#on click sur le site
btn_site = driver.find_element(By.XPATH, "//span[@id='HEADER_SITES_MENU_text']")
btn_site.click()
Timeout

#Clique sur le site "bois-de-boulogne"
btn_site_test = driver.find_element(By.XPATH, "//a[@title='Bois de boulogne']")
btn_site_test.click()
Timeout

#cliquer sur discussion
btn_discussion = driver.find_element(By.XPATH, "//a[normalize-space()='Discussions']")
btn_discussion.click()
Timeout

#cliquer sur nouveau sujet
btn_nouveau_sujet = driver.find_element(By.XPATH, "//button[normalize-space()='Nouveau sujet']")
btn_nouveau_sujet.click()
Timeout

#on ecrit un titre
txt_titre = driver.find_element(By.XPATH , "//input[@name='title']")
txt_titre.send_keys("Titre 1")
Timeout



#On attend que l'element soit present
element = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.XPATH, "//div[@id='mceu_36']"))
)


#On va se le frame
iframe = driver.find_element(By.XPATH, "//iframe[@allowtransparency='true']")
driver._switch_to.frame(iframe)
#on ecrit notre texte
txt_frame = driver.find_element(By.XPATH,"//html/body/p")
txt_frame.send_keys("Mon description est tres grandes")
Timeout
driver.switch_to.default_content()


print("Texte Present")

#On Ecrit la tags
tags = driver.find_element(By.XPATH, "//input[@name='-']")
tags.send_keys("Quick")

#On clique sur ajouter
btn_Aujouter = driver.find_element(By.XPATH, "//button[text() = 'Ajouter']")
btn_Aujouter.click()
Timeout

btn_Enregistrer = driver.find_element(By.XPATH, "//button[normalize-space()='Enregistrer']")
btn_Enregistrer.click()


                            #Afficher le sujet
#On clique le back link
btn_back = driver.find_element(By.XPATH, "//span[@class='backLink']")
btn_back.click()

#On clique sur le bouton Afficher
btn_Afficher = driver.find_element(By.XPATH, "//a[text() ='Afficher']")
btn_Afficher.click()
Timeout
print("Sujet Afficher avec succes")
                        #Supprimer Le sujet

#On va supprimer Le sujet
#On clique sur le bouton supprimer
btn_Supprimer_1 = driver.find_element(By.XPATH, "//a[text() = 'Supprimer']")
btn_Supprimer_1.click()

#On confirme la suppression
btn_Supprimer_2 = driver.find_element(By.XPATH, "//button[text() = 'Supprimer']")
btn_Supprimer_2.click()
Timeout
print("Le sujet est supprimer avec succes")



                                        #Deconnexion
#On clique sur la barre de menu pop up
btn_header = driver.find_element(By.ID, "HEADER_USER_MENU_POPUP_text")
btn_header.click()

#On clique sur le bouton deconnexion
btn_Deconnexion = driver.find_element(By.ID, "HEADER_USER_MENU_LOGOUT_text")
btn_Deconnexion.click()
Timeout
driver.close()
print("Test Reussi")