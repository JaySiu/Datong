Feature: User Authentication with Devise
  As a user of da-tong
  so that I can sign in and sign up
  I should be able to sign up for an account or sign into an account that
  already exists

  Scenario: Seeing Login In buttons
    Given I am on the home page
    Then I should see Login
    And I should not see Log Out

  Scenario: Seeing a Log Out button
    Given I am logged in
    Then I should see Log Out
    And I should not see Login

  Scenario: Signing up for an account
    Given I am on the home page
    And I should see Login
    When I follow Login
    Then I follow Sign up
    Then I should see Sign up for Datong
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I fill in "user_password_confirmation" with "hunter2"
    And I fill in "user_fname" with "User"
    And I fill in "user_lname" with "Lastname"
    And I press "Sign up"
    Then I should see A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.

  Scenario: Signing up with existing email
    Given I have an account for datongtest@datong.berkeley.edu and confirmed my email
    And I am on the home page
    Then I follow Login
    Then I follow Sign up
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I fill in "user_password_confirmation" with "hunter2"
    And I press "Sign up"
    Then I should see Email has already been taken

  Scenario: Signing in to an existing account without confirmation
    Given I have an account for datongtest@datong.berkeley.edu without confirming
    And I am on the home page
    And I follow Login
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I press "Log in"
    Then I should see You have to confirm your email address before continuing.

  Scenario: Signing in to an existing account with confirmation
    Given I have an account for datongtest@datong.berkeley.edu and confirmed my email
    And I am on the home page
    And I follow Login
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I press "Log in"
    Then I should see Signed in successfully


  Scenario: Signing in with an incorrect password
    Given I have an account for datongtest@datong.berkeley.edu and confirmed my email
    And I am on the home page
    When I follow Login
    And I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2wrong"
    And I press "Log in"
    Then I should see Invalid Email or password

  Scenario: Signing in with a nonexisting email
    Given I am on the home page
    And I follow Login
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I press "Log in"
    Then I should see Invalid Email or password

  Scenario: Signing out
    Given I am logged in
    And I follow Log Out
    Then I should see Login
    And I should see Signed out successfully.

  Scenario: Creating an account with a Berkeley email
    Given I am on the home page
    Then I follow Login
    Then I follow Sign up
    When I fill in "user_email" with "datongtest@datong.berkeley.edu"
    And I fill in "user_password" with "hunter2"
    And I fill in "user_password_confirmation" with "hunter2"
    And I fill in "user_fname" with "User"
    And I fill in "user_lname" with "Lastname"
    And I press "Sign up"
    Then I should see A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.

  Scenario: Creating an account with a non-Berkeley email
    Given I am on the home page
    Then I follow Login
    Then I follow Sign up
    When I fill in "user_email" with "datongtest@sdfsdf.com"
    And I fill in "user_password" with "hunter2"
    And I fill in "user_password_confirmation" with "hunter2"
    And I fill in "user_fname" with "User"
    And I fill in "user_lname" with "Lastname"
    And I press "Sign up"
    Then I should see A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.
