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
  Then I fill in "Img url" with "http://www.freeiconspng.com/uploads/login-icon-png-27.png"
  And I press "Update"
  Then I should have the profile picture "http://www.freeiconspng.com/uploads/login-icon-png-27.png"
  
Scenario: profile picture is not updated if empty
  Given I am on the home page
  And I am a core member
  Then I should see Edit profile
  When I follow Edit profile
  Then I should be on the edit profile page
  And I should see Edit User
  And I should see Cancel my account
  Then I fill in "Img url" with ""
  And I press "Update"
  Then I should have the profile picture "http://www.freeiconspng.com/uploads/profile-picture-icon-png-people-person-profile--4.png"

Scenario: event admin cannot update their profile picture
  Given I am on the home page
  And I am an event admin
  Then I should see Edit profile
  When I follow Edit profile
  Then I should be on the edit profile page
  And I should see Edit User
  And I should see Cancel my account
  And I should not see "Img url"

Scenario: account admin cannot update their profile picture
  Given I am on the home page
  And I am an account admin
  Then I should see Edit profile
  When I follow Edit profile
  Then I should be on the edit profile page
  And I should see Edit User
  And I should see Cancel my account
  And I should not see "Img url"
  
Scenario: admin can update their profile picture
  Given I am on the home page
  And I am a admin
  And I am logged in
  Then I should see Edit profile

Scenario: visitors cannot update their profile picture
  Given I am on the home page
  And I am a visitor
  Then I should not see Edit profile