Feature: On veut dupliquer un element
  Scenario: Dupliquer un element valide
    Given On est connecter avec des donnés valides sur Alfresco
    When On clique sur le repertoire sites
    And On clique sur le site a tester
    And On clique sur la liste des données
    And On clique sur Nouvelle Liste
    And On rempli le formulaire NL
    And On clique sur Enregistrer
    And On clique sur la liste créer
    And On clique sur nouvel Element
    And On rempli le formulaire NE
    And On clique sur Enregistrer
    And On coche L'element
    And On clique sur le bouton Element selectionner
    And On clique sur dupliquer
    And On supprime lelement
    Then On se deconnecte




