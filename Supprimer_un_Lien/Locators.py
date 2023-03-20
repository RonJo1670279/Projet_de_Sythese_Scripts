class Login:
    url= 'http://localhost:8087/share/page/'
    Name_name= "username"
    password_name= "password"
    connexion= "//button"

class Lien:
    lnk_sites_xpath = "//span[@id='HEADER_SITES_MENU_text']"
    lnk_sites_test_xpath = "//a[@title='Bois de boulogne']"
    btn_Lien_xpath = "//a[@title = 'Liens']"
    btn_New_Lien_xpath = "//button[@type='button' and text()= 'Nouveau lien']"
    txt_titre_xpath = "//div/div[2]/input[@title='Une valeur doit être indiquée.'  and @name='title']"
    URL_x = "//div/div[2]/input[@title='Une valeur doit être indiquée.'  and @name='url']"
    txt_description_xpath = "//div/div[2]/textarea[@name='description']"

