Feature: When I visit the resources page as a core member, I would like to update resources
  As a user with proper permissions
  Whenever I visit the resources page
  I should be able to upload resources
  As a user without proper permissions
  I should not be able to upload resources

  Scenario: uploading resource as core member correctly
    Given I am a core member
    And I am on the resources page
    Then I should see Upload Resource
    When I follow upload
    And I fill in "resource_title" with "Resource1"
    And I upload "test_file.txt"
    When I press "Save"
    Then I should see Resource1
    
  Scenario: deleting resource as core member correctly
    Given The "Resource1" file exists
    And I am on the resources page
    And I am a core member
    When I press "Delete" 
    Then I should see The resource Resource1 has been deleted.
    And I should see There are no resources uploaded currently
    
  Scenario: uploading resource as core member incorrectly without title
    Given I am a core member
    And I am on the resources page
    When I follow upload
    And I upload "test_file.txt"
    When I press "Save"
    Then I should see Title can't be blank
    
  Scenario: uploading resource as core member incorrectly without attachment
    Given I am on the resources page
    And I am a core member
    When I follow upload
    When I fill in "resource_title" with "Resource1"
    And I press "Save"  
    Then I should see Attachment can't be blank
  
  Scenario: downloading resource as logged in member
    Given The "Resource1" file exists
    And I am on the resources page
    And I am logged in
    Then I should see Download Resource
    
  Scenario: not seeing resource in navbar as visitor
    Given I am on the home page
    Then I should not see Resources
  