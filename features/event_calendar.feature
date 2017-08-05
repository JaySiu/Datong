Feature: When I visit the events page, I should see all the events
  Whenever I visit the events page
  I should see a calendar of new events
  When I visit the events page
  And I am logged in
  I should also be able to add/delete events
  
  Scenario:
    Given I am an event admin
    And I am on the events page
    When I follow New Event
    Then I should see New Event

  Scenario: visiting the events page
    Given I am on the home page
    When I follow Events
    Then I should see Upcoming Events
    And I should see Past Events
    And the page should have a div#calendar element
    And I should not see New Event

  Scenario: Creating a new event
    Given I am an event admin
    And I am on the events page
    When I follow New Event
    Then I should see New Event
    When I create the event Test Event
    Then I am on the events page
    Then I should see Test Event

  Scenario: Creating a new event incorrectly
    Given I am an event admin
    And I am on the events page
    When I follow New Event
    Then I should see New Event
    When I fill in "Title" with ""
    And I press "Create Event"
    Then I should see error

  Scenario: Visiting the certain events page without access
    When I am on the new events page
    Then I should see You do not have access to this page.

  Scenario: Editing an existing event correctly
    Given I am an event admin
    And I am on the events page
    Given I create the event Test Event
    And I'm on the edit page for Test Event
    Then I should see Editing Event
    And I fill in "Title" with "Updated Test Event"
    And I press "Update Event"
    Then I should see Updated Test Event


  Scenario: Editing an existing event incorrectly
    Given I am an event admin
    And I am on the events page
    Given I create the event Test Event
    And I'm on the edit page for Test Event
    Then I should see Editing Event
    And I fill in "Title" with ""
    And I press "Update Event"
    Then I should see error


  Scenario: Deleting an existing event
    Given I am an event admin
    And I am on the events page
    Given I create the event Test Event
    And I am on the events page
    Then I should see Test Event
    When I follow Delete
    Then I should not see Test Event



