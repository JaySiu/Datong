Feature: When I visit the people page, I should be able to update my profile and save changes.
    As a member, so I can change my account information,
    I want to be able to edit my password.

Scenario: members can update their password with correct original password typed
  Given I made an account for testEmail@berkeley.edu with password oldPassword
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Password" with "newPassword"
  And I fill in "Password confirmation" with "newPassword"
  And I fill in "Current password" with "oldPassword"
  And I press "Update"
  Then I should see You need to sign in or sign up before continuing.
  And I fill in "user_email" with "testEmail@berkeley.edu"
  And I fill in "user_password" with "oldPassword"
  And I press "Log in"
  Then I should see Invalid Email or password.
  Then I fill in "user_email" with "testEmail@berkeley.edu"
  And I fill in "user_password" with "newPassword"
  And I press "Log in"
  Then I should be on the edit profile page
  And I should see Signed in successfully.
  
Scenario: members cannot update their password with incorrect original password typed
  Given I made an account for testEmail@berkeley.edu with password oldPassword
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Password" with "newPassword"
  And I fill in "Password confirmation" with "newPassword"
  And I fill in "Current password" with "wrongPassword"
  And I press "Update"
  Then I should be on the edit profile page
  #And I should see Signed in successfully.

Scenario: members cannot update their password with no original password typed
  Given I made an account for testEmail@berkeley.edu with password oldPassword
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Password" with "newPassword"
  And I fill in "Password confirmation" with "newPassword"
  And I fill in "Current password" with ""
  And I press "Update"
  Then I should be on the edit profile page

Scenario: members cannot update their password with no password typed
  Given I made an account for testEmail@berkeley.edu with password oldPassword
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Password" with ""
  And I fill in "Password confirmation" with "newPassword"
  And I fill in "Current password" with "oldPassword"
  And I press "Update"
  Then I should be on the edit profile page

Scenario: members cannot update their password with no confirmation password typed
  Given I made an account for testEmail@berkeley.edu with password oldPassword
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Password" with ""
  And I fill in "Password confirmation" with "newPassword"
  And I fill in "Current password" with "oldPassword"
  And I press "Update"
  Then I should be on the edit profile page