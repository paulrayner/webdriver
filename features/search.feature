Feature: Packing List Filtered by Weather
  In order to pack efficiently
  As a traveller
  I want to filter my packing list by weather conditions I supply
    
  Scenario: Filter packing list by weather conditions
    Given a master packing list with:
    | item      |
    | underwear |
    | sandals   |
    When I filter my packing list for cold weather
    Then the list should contain only:
    | item      |
    | underwear |