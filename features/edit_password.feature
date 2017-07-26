Feature: When I visit the people page, I should be able to update my profile and save changes.
    As a member, so I can change my account information,
    I want to be able to edit my password.
    #email=datongtest@datong.berkeley.edu; password=hunter2
    
Scenario: members can update their password with correct original password typed
  Given I am logged in
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Password" with "newpassword"
  And I fill in "Password confirmation" with "hunter2"
  And I press "Update"
  Then I have an account for datongtest@datong.berkeley.edu with password newpassword
  
Scenario: members cannot update their password with incorrect original password typed
  Given I am logged in
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Password" with "newpassword"
  And I fill in "Password confirmation" with "wrongpassword"
  And I press "Update"
  Then I dont have an account for datongtest@datong.berkeley.edu with password newpassword

Scenario: members cannot update their password with no original password typed
  Given I am logged in
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Password" with "newpassword"
  And I press "Update"
  Then I dont have an account for datongtest@datong.berkeley.edu with password newpassword
