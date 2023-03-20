from behave import *
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager


@given(u'On est connecter avec des donnés valides sur Alfresco')
def login(context):
    context.driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))
    context.driver.maximize_window()
    context.driver.implicitly_wait(10)
    context.driver.get("http://localhost:8087/share/page/")
    context.driver.find_element(By.NAME, "username").send_keys("1670279")
    context.driver.find_element(By.NAME, "password").send_keys("12345678")
    context.driver.find_element(By.XPATH, "//button[text()='Connexion']").click()


@when(u'On clique sur le repertoire sites')
def click_sites(context):
    context.driver.find_element(By.ID, "HEADER_SITES_MENU_text").click()

@when(u'On clique sur le site a tester')
def click_sur_site(context):
    context.driver.find_element(By.XPATH,"//a[@title='Bois de boulogne']").click()

@when(u'On clique sur la liste des données')
def liste_donner(context):
    context.driver.find_element(By.XPATH,"//a[@title='Listes de données']").click()

@when(u'On clique sur Nouvelle Liste')
def nouvelle_liste(context):
      context.driver.find_element(By.XPATH, "//button[text() ='Nouvelle liste' ]").click()

@when(u'On rempli le formulaire NL')
def Formulaire_nl(context):
    context.driver.find_element(By.XPATH, "//a[./text()=\"Liste de tâches\"]").click()
    context.driver.find_element(By.XPATH, "//input[@name ='prop_cm_title']").send_keys("Test Cucumber")
    context.driver.find_element(By.XPATH, "//textarea[@name ='prop_cm_description']").send_keys("Cucumber Test")

@when(u'On clique sur Enregistrer')
def click_save(context):
    context.driver.find_element(By.XPATH,"//button[normalize-space()='Enregistrer']").click()

@when(u'On clique sur la liste créer')
def click_list(context):
    context.driver.find_element(By.XPATH, "//a[@title='Cucumber Test']").click()
    context.driver.implicitly_wait(10)


@when(u'On clique sur nouvel Element')
def nvl_element(context):
    context.driver.find_element(By.ID,'template_x002e_toolbar_x002e_data-lists_x0023_default-newRowButton-button').click()
    context.driver.find_element(By.XPATH, "//span[@class= 'first-child']//button[text()='Nouvel élément']").click()
    context.driver.implicitly_wait(10)

@when(u'On rempli le formulaire NE')
def formulaire_E(context):
    context.driver.find_element(By.XPATH, "//input[@name='prop_dl_todoTitle']").send_keys("Test Cucumber")
    context.driver.find_element(By.XPATH, "//input[@class='date-entry']").send_keys("20/03/2023")
    context.driver.find_element(By.XPATH, "//input[@class='time-entry']").send_keys("18:20")
    context.driver.find_element(By.XPATH, "//input[@class='number']").send_keys("5")
    context.driver.find_element(By.XPATH, "//button[text()='Enregistrer']").click()

@when(u'On coche L\'element')
def chekcbox(context):
    context.driver.find_element(By.XPATH, "//input[@type='checkbox']").click()

@when(u'On clique sur le bouton Element selectionner')
def btn_element(context):
    context.driver.find_element(By.XPATH, "//button[text()='Eléments sélectionnés...']").click()

@when(u'On clique sur dupliquer')
def dupliquer(context):
    context.driver.find_element(By.XPATH, "//span[@class='onActionDuplicate']").click()
    context.driver.implicitly_wait(10)

@when(u'On supprime lelement')
def delete(context):
    context.driver.implicitly_wait(10)
    context.driver.find_element(By.XPATH, "//button[text()='Sélectionner']").click()
    context.driver.find_element(By.XPATH, "//span[@class='selectAll']").click()
    context.driver.implicitly_wait(10)
    context.driver.find_element(By.XPATH, "//button[normalize-space()='Eléments sélectionnés...']").click()
    context.driver.implicitly_wait(10)
    context.driver.find_element(By.XPATH, "//span[@class='onActionDelete']").click()
    context.driver.find_element(By.XPATH, "//button[text()='Supprimer']").click()

@then(u'On se deconnecte')
def step_impl(context):
    context.driver.find_element(By.ID, "HEADER_USER_MENU_POPUP_text").click()
    context.driver.find_element(By.ID, "HEADER_USER_MENU_LOGOUT_text").click()
    pass


