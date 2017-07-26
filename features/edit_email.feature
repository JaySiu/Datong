Feature: When I visit the people page, I should be able to update my profile and save changes.
    As a member, so I can change my account information,
    I want to be able to edit my email.
    
Scenario: members can update their email
  Given I made an account for testemail@berkeley.edu with password password
  When I follow Edit profile
  Then I should be on the edit profile page
  When I fill in "Email" with "newemail@berkeley.edu"
  And I press "Update"
  Then I have an account for newemail@berkeley.edu with password password