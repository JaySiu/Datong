Feature: When I want to contact the Da-tong group in some way
  As a visitor,
  Whenever I vist the Contact page
  I should be able to open the Facebook page from there
  and I should be able to view the QR code and account name for WeChat

  Scenario: visiting the page
    Given I am on the home page
    When I see FOLLOW US
    Then I should see Facebook
    And I should be able to see Facebook link on Contact page
    Then I follow wechat
    And I should see Official account name: 大同学社
    And I should see Done