Feature: When I visit a page with a navbar, the links should be clickable and lead me to the correct page
  As a visitor,
  Whenever I see a navbar
  I should be able to click on any of the links and be taken to the corresponding page

  Scenario: visiting the home page
    Given I am on the home page
    When I follow People
    Then I should see Core Members

  Scenario: visiting the home page from the people page
    Given I am on the people page
    When I follow Datong
    Then I should see Hosted by OCF
    And I should see Sponsor
    And I should see Passion
    And I should see 积极的学术热情，无私的学术精神
    And I should see Integrity
    And I should see 优良的学术品质，独立的学术能力
    And I should see Open-mindedness
    And I should see 持重的学术态度，包容的学术胸怀
    And I should not see Core Members

Scenario: visiting the events page from a different page
  Given I am on the people page
  When I follow Events
  Then I should see Upcoming Events
  And I should not see Core Members
#
  Scenario: visiting the resources page when not logged in
    Given I am on the home page
    Then I should not see Resources
    
  Scenario: visiting the resources page when logged in
    Given I am on the home page
    And I am logged in
    When I follow Resources
    Then I should see Resources

  # Scenario: Signing up
  #   Given I am on the home page
  #   When I follow Sign Up
  #   Then I should see Email
  #   And I should see Password confirmation
  #   And I should not see Log Out

  Scenario: Login
    Given I am on the home page
    When I follow Login
    Then I should see Email
    And I should see Password
    And I should not see Log Out

  Scenario: Logging out
    Given I am logged in
    Then I should not see Sign Up
    And I should not see Sign In
    And I should see Log Out

  # Scenario: seeing contact tab
  #   Given I am on the people page
  #   Then I should see Contact
  #   And I should not see Contact Us

#  Scenario: Seeing account dropdown from homepage
#    Given I am on the home page
#    And I am logged in
#    Then I should see Hello
#    And I should not see Edit profile
#    And I should not see Log Out
#    When I follow Logged in as
#    Then I should see Logged in as
#    And I should see Edit profile
#    And I should see Log Out
#    When I follow Logged in as
#    Then I should see Logged in as
#    And I should not see Edit profile
#    And I should not see Log Out
