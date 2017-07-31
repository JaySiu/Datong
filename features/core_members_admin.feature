Feature: Core Members admin control
  As a Core Member of Da-tong
  So that I can decide which users are and are not core members
  I should be able to access a page that allows me to edit who the core members are

Scenario: Visiting the Core Members edit page without admin permissions
  Given I am on the Edit Core Members page
  Then I should not see Edit core members

Scenario: Visiting the Core Members edit page with admin permissions
  Given I am an account admin
  And I follow Edit
  Then the page should have a label element

Scenario: Removing a Core Member
  Given I am an account admin
  And I am on the Edit Core Members page
  And the "" checkbox should not be checked
  And I check ""
  And I press "Update"
  Then I should see Success
  And I am on the Edit Core Members page
  Then the "" checkbox should be checked

Scenario: Adding a Core Member
  Given I am an account admin
  And I am on the Edit Core Members page
  And I uncheck ""
  And I press "Update"
  And I am on the Edit Core Members page
  And the "" checkbox should not be checked
  And I check ""
  And I press "Update"
  Then I should see Success
  And I am on the Edit Core Members page
  And the "" checkbox should be checked

Scenario: Cancelling addition of Core Member
  Given I am an account admin
  And I am on the Edit Core Members page
  And the "" checkbox should not be checked
  And I check ""
  And I follow Cancel
  Then I should not see Success
  And I am on the Edit Core Members page
  And the "" checkbox should not be checked

Scenario: Cancelling removal of Core Member
  Given I am an account admin
  And I am on the Edit Core Members page
  And the "" checkbox should not be checked
  And I check ""
  And I follow Cancel
  Then I should not see Success
  And I am on the Edit Core Members page
  And the "" checkbox should not be checked