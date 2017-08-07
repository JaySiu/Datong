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
  And I am on the Edit Core Members page
  And the "event" checkbox should not be checked
  And I check "event"
  And I press "Update"
  Then I should see Success
  And I am on the Edit Core Members page
  And the "event" checkbox should be checked

Scenario: Cancelling addition of event admin
  Given I am an account admin
  And I am on the Edit Core Members page
  And the "event" checkbox should not be checked
  And I check "event"
  And I follow Cancel
  Then I should not see Success
  And I am on the Edit Core Members page
  And the "event" checkbox should not be checked

Scenario: Cancelling removal of event admin
  Given I am an account admin
  And I am on the Edit Core Members page
  And the "event" checkbox should not be checked
  And I check "event"
  And I follow Cancel
  Then I should not see Success
  And I am on the Edit Core Members page
  And the "event" checkbox should not be checked
  
Scenario: Multiple selection where account admin promote both members
  Given I made an account for test@berkeley.edu with password testpassword
  And I follow Log Out
  Given I am an account admin
  When I follow People
  And I follow Edit Members
  Then I should be on the Edit Core Members page
  When I check "Tong"
  And I check "admin"
  And I press "Update"
  Then I should see Success
  And I am on the Edit Core Members page
  And the "Tong" checkbox should be checked
  And the "admin" checkbox should be checked
  
Scenario: Multiple selection where account admin promotes one and demotes another
  Given I made an account for test@berkeley.edu with password testpassword
  And I follow Log Out
  Given I am an account admin
  When I follow People
  And I follow Edit Members
  Then I should be on the Edit Core Members page
  When I check "Tong"
  And I uncheck "admin"
  And I press "Update"
  Then I should see Success
  And I am on the Edit Core Members page
  And the "Tong" checkbox should be checked
  And the "admin" checkbox should not be checked
  
Scenario: Multiple demote members
  Given I made an account for test@berkeley.edu with password testpassword
  And I follow Log Out
  Given I am an account admin
  When I follow People
  And I follow Edit Members
  Then I should be on the Edit Core Members page
  When I uncheck "Tong"
  And I uncheck "admin"
  And I press "Update"
  Then I should see Success
  And I am on the Edit Core Members page
  And the "Tong" checkbox should not be checked
  And the "admin" checkbox should not be checked