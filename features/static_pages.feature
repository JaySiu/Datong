Feature: When I visit a static page, its content should match its counterpart on datong.berkeley.edu
  As a visitor
  Whenever I visit a static page
  I should be able to see the same as I did in datong.berkeley.edu

  Scenario: visiting the about us page
    Given I am on the home page
    Then I should see the nav bar
    And I should see Da-Tong Society of China Studies
    And I should see Sponsored by Center for Chinese Studies

  Scenario: visiting the people page
    Given I am on the people page
    Then I should see the nav bar
    And I should see Core Members

  Scenario: visiting the events page
    Given I am on the home page
    When I follow Events
    Then I should see Upcoming Events
    And I am on the events page

  Scenario: visiting the resources page
    Given I am on the home page
    And I am logged in
    When I follow Resources
    Then I should not see Upload Resource


  Scenario: visiting the contact us page
    Given I am on the contact us page
    Then I should see Contact Us

