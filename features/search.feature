Feature: Search
  In order to learn more
  As an information seeker
  I want to find more information

  # <em>Cucumber</em> itself
  #
  Scenario: Find what I'm looking for
    Given I am on the Google search page
    When I search for "virtual genius"
    Then I should see
      """
      AGILITY. CRAFT. ARCHITECTURE.
      """
