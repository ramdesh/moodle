@core @core_course
Feature: Create/Delete course sections
  In order to edit content available for a course
  As a teacher
  I need to create or delete sections

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email |
      | teacher1 | Teacher | 1 | teacher1@example.com |
    And the following "courses" exist:
      | fullname | shortname | format | coursedisplay | numsections |
      | Course 1 | C1 | topics | 0 | 5 |
    And the following "course enrolments" exist:
      | user | course | role |
      | teacher1 | C1 | editingteacher |
    And I log in as "teacher1"
    And I follow "Course 1"
    And I turn editing mode on
    And I navigate to "Edit settings" node in "Course administration"
    And I set the field "Number of sections" to "4"
    And I press "Save and display"
    And I add a "Forum" to section "1" and I fill the form with:
      | Forum name | Test forum 1 |
      | Description | Test forum 1 description |
    And I add a "Forum" to section "2" and I fill the form with:
      | Forum name | Test forum 2 |
      | Description | Test forum 2 description |
    And I add a "Forum" to section "3" and I fill the form with:
      | Forum name | Test forum 3 |
      | Description | Test forum 3 description |
    And I add a "Forum" to section "4" and I fill the form with:
      | Forum name | Test forum 4 |
      | Description | Test forum 4 description |

  Scenario: Delete Topic sections
    Given I edit the section "1" and I fill the form with:
      | Use default section name ||
      | &nbsp; | A |
    And I edit the section "2" and I fill the form with:
      | Use default section name ||
      | &nbsp; | B |
    And I edit the section "3" and I fill the form with:
      | Use default section name ||
      | &nbsp; | C |
    And I edit the section "4" and I fill the form with:
      | Use default section name ||
      | &nbsp; | D |
    And I delete section "4"
    And "D" "section" should not exist
    When I click on "Increase the number of sections" "link"
    Then "Topic 4" "section" should exist
    And "Test forum 4" "activity" should not exist in the "Topic 4" "section"