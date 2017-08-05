Feature: Event Admin admin control
  As an account admin of Da-tong
  So that I can decide which users are and are not event admins
  I should be able to access a page that allows me to edit who the event admins are
  
Scenario: Visiting the Core Members edit page with admin permissions
  Given I am an account admin
  And I am on the Edit Core Members page
  And the "event" checkbox should not be checked
  And I check "event"
  And I press "Update"
  Then I should see Success
  And I am on the Edit Core Members page
  Then the "event" checkbox should be checked
  
Scenario: Adding an event admin
  Given I am an account admin
  And I am on the Edit Core Members page
  And I uncheck "event"
  And I press "Update"
  And I should see Success
  And I am on the Edit Core Members page
  And the "event" checkbox should not be checked
  Then I follow Events
  And I am on the events page
  And I should not see New Event
  Then I follow People
  And I follow Edit
  And I check "event"
  And I press "Update"
  Then I should see Success
  And I am on the Edit Core Members page
  And the "event" checkbox should be checked
  Then I follow Events
  And I am on the events page
  And I should see New Event

Scenario: Cancelling addition of event admin
  Given I am an account admin
  And I am on the Edit Core Members page
  And the "event" checkbox should not be checked
  And I check "event"
  And I follow Cancel
  Then I should not see Success
  And I am on the Edit Core Members page
  And the "event" checkbox should not be checked
