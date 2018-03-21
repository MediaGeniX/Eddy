Feature: Scoreboard
  As a end-user of Eddy, I want to see the scoreboard

  Scenario: Viewing an empty scoreboard
    Given I am logged in
    And I go to the homepage
    When I click the scoreboard link
    Then I see an empty scoreboard

  Scenario: Viewing a scoreboard with some info
    Given I am logged in
    And some trips have been logged
    And I go to the homepage
    When I click the scoreboard link
    Then I see an scoreboard with the given trips
