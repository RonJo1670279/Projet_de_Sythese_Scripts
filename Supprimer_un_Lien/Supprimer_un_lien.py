import time

from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import pytest
import logging


driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))

driver.maximize_window()
Timeout = driver.implicitly_wait(5)
url = 'http://localhost:8087/share/page/'
driver.get(url)

     # Login
        # Entrer le nom
Name = driver.find_element(By.NAME, "username")
Name.send_keys('1670279')

        # Entrer Le mot de passe
password = driver.find_element(By.NAME, "password")
password.send_keys('12345678')
        # cliquer sur connexion
connexion = driver.find_element(By.XPATH, "//button")
connexion.click()

        # Click sur le bouton
text_Heading = driver.find_element(By.XPATH, "//h1[@id='HEADER_TITLE']/span").text
print(text_Heading)

        # Confirme qu'on est sur la bonne adresse
assert text_Heading == 'Tableau de bord de Joseph Ronaldson Belizaire'
URL_attendu = "http://localhost:8087/share/page/user/admin/dashboard"
URL_actuel = driver.current_url
print(URL_actuel)

                                    # Creer un lien
        # On clique sur mes sites
lnk_sites = driver.find_element(By.XPATH, "//span[@id='HEADER_SITES_MENU_text']")
lnk_sites.click()
Timeout

        # On clique sur le site
btn_site_test = driver.find_element(By.XPATH, "//a[@title='Bois de boulogne']")
btn_site_test.click()
Timeout

        # Clique sur le bouton liens
btn_Lien = driver.find_element(By.XPATH, "//a[@title = 'Liens']")
btn_Lien.click()

element = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.XPATH, "//button[@type='button' and text()= 'Nouveau lien']"))
        )

        # cliquer sur le bouton Nouveau lien
btn_New_Lien = driver.find_element(By.XPATH, "//button[@type='button' and text()= 'Nouveau lien']")
btn_New_Lien.click()

        # Entrer le Titre
txt_titre = driver.find_element(By.XPATH,
                                        "//div/div[2]/input[@title='Une valeur doit être indiquée.'  and @name='title']")
txt_titre.send_keys("Lien de URL")

        # Entrer le Url
URL = driver.find_element(By.XPATH, "//div/div[2]/input[@title='Une valeur doit être indiquée.'  and @name='url']")
URL.send_keys("https://github.com/zidtalel/G1237")
Timeout

        # Entrer une description
Txt_Description = driver.find_element(By.XPATH, "//div/div[2]/textarea[@name='description']")
Txt_Description.send_keys("Ceci est une description du URL")

        # Cliquer sur le checkbox Interne
chk_box = driver.find_element(By.XPATH, "//div/div[2]/input[@name='internal' and  @type='checkbox']")
chk_box.click()
Timeout

        # On ajoute un tags
txt_tags = driver.find_element(By.XPATH, "//form/fieldset/div[5]/div[2]/div/child::input")
txt_tags.send_keys("URL")

        # On clique sur le bouton Ajouter
btn_Ajouter = driver.find_element(By.XPATH, "//button[@type='button' and @name='-']")
btn_Ajouter.click()
Timeout

        # Cliquer sur Enregistrer
btn_Enregistrer = driver.find_element(By.XPATH, "//form/fieldset/div[6]/div[2]/descendant::button[1]")
btn_Enregistrer.click()
Timeout
print("Lien Creer")

                                            # Supprimer Le lien

# Clique sur le bouton liens
btn_retour_Lien = driver.find_element(By.XPATH, "//a[text() = 'Liste des liens']")
btn_retour_Lien.click()

element = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.XPATH, "//input[@type = 'checkbox']"))
        )

        # On clique sur le checkbox
btn_check_box = driver.find_element(By.XPATH, "//input[@type = 'checkbox']")
btn_check_box.click()

        # On clique sur element selection
btn_el_Select = driver.find_element(By.XPATH, "//button[normalize-space()='Eléments sélectionnés']")
btn_el_Select.click()

        # Cliquer sur le bouton supprimer
btn_delete = driver.find_element(By.XPATH, "//span[@class = 'links-action-delete']")
btn_delete.click()

        # wait until btn supprimer est visible
element = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.XPATH, "//button[text() = 'Supprimer']"))
        )

        # Cliquer sur supprimer
btn_supprimer = driver.find_element(By.XPATH, "//button[text() = 'Supprimer']")
btn_supprimer.click()

        # On clique sur la barre de menu pop up
btn_header = driver.find_element(By.ID, "HEADER_USER_MENU_POPUP_text")
btn_header.click()
print("Lien Supprimer")



        # Deconnexion
# On clique sur le bouton deconnexion
btn_Deconnexion = driver.find_element(By.ID, "HEADER_USER_MENU_LOGOUT_text")
btn_Deconnexion.click()
Timeout
driver.close()
print("Test est un succes")