Feature: When I visit the people page, I should be able to update my profile and save changes.
  As a core user, so that I can customize my profile.
  I want to be able to edit my profile picture.
  
Scenario: Core members can get onto the edit profile page
  Given I am on the home page
  And I am logged in
  When I follow Edit profile
  Then I should be on the edit profile page
  And I should see Edit User
  And I should see Cancel my account
  
Scenario: Core members can change their profile picture
  Given I am on the home page
  And I am logged in
  When I follow Edit profile
  And I fill in the image url with "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Mallard2.jpg/1200px-Mallard2.jpg"
  And I press "Update"
  Then The image url "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Mallard2.jpg/1200px-Mallard2.jpg" should be in the HTML