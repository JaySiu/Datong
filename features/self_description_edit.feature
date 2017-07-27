Feature: Core members can update their blurb (self description)

Scenario: core memebers can update blurb
  Given I am a core member
  And I am on the people page
  Then I should see No blurb available.
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Blurb" with "Testing"
  And I press "Update"
  Then I should be on the edit profile page
  When I follow People
  Then I should be on the people page
  And I should see Testing
  
Scenario: account admin cannot update blurb
  Given I am an account admin
  And I am on the home page
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Blurb" with "Testing"
  And I press "Update"
  Then I should be on the edit profile page
  And I should not see Testing
  
Scenario: event admin cannot update blurb
  Given I am an event admin
  And I am on the home page
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Blurb" with "Testing"
  And I press "Update"
  Then I should be on the edit profile page
  And I should not see Testing