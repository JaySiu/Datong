Feature: When I visit the people page, I should be able to update my profile and save changes.
  As a core user, so that I can customize my profile.
  I want to be able to edit my profile picture.
  
Scenario: core members can update their profile picture
  Given I am on the home page
  And I am a core member
  Then I should see Edit profile
  When I follow Edit profile
  Then I should be on the edit profile page
  And I should see Edit User
  And I should see Cancel my account

Scenario: visitors cannot update their profile picture
  Given I am on the home page
  And I am a visitor
  Then I should not see Edit profile