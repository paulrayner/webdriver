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
    
  Scenario: Bring an umbrella when it rains
    Given a master packing list with:
    | item      | when to bring   |
    | underwear | always          |
    | sandals   | dry, warm, hot  |
    | umbrella  | rainy           |
    When I filter my packing list for rainy weather
    Then the filtered packing list should contain only:
    | item      |
    | underwear |
    | umbrella  |

  Scenario: Leave the umbrella when it's dry
    Given a master packing list with:
    | item      | when to bring   |
    | underwear | always          |
    | sandals   | dry, warm, hot  |
    | umbrella  | rainy           |
    When I filter my packing list for dry weather
    Then the filtered packing list should contain only:
    | item      |
    | underwear |
    | sandals   |

  Scenario: Leave the sandals and umbrella when it's cold
    Given a master packing list with:
    | item      | when to bring   |
    | underwear | always          |
    | sandals   | dry, warm, hot  |
    | umbrella  | rainy           |
    When I filter my packing list for cold weather
    Then the filtered packing list should contain only:
    | item      |
    | underwear |

  Scenario: Bring sandals when it's warm
    Given a master packing list with:
    | item      | when to bring   |
    | underwear | always          |
    | sandals   | dry, warm, hot  |
    | umbrella  | rainy           |
    When I filter my packing list for warm weather
    Then the filtered packing list should contain only:
    | item      |
    | underwear |
    | sandals   |