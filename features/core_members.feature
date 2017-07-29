Feature: Core Members
  As any visitor of Da-tong
  I should be able to access the Core Members page
  And I should be able to see the Core Members listed

Scenario: Visiting the Core Members page
  Given I am on the Core Members page
  Then I should see Core Members
  And the page should have a ul element
  And the page should have a li element

Scenario: Visiting the Core Members page as an admin
  Given I am a core member
  And I am on the Core Members page
  Then I should see Core Members
  And the page should have a ul element
  And the page should have a li element