Feature: Form Field Permissions
  As a project administrator
  I want to control field visibility and editability
  So that users can access only the fields permitted for their roles

  Background:
    Given I am logged in to PlanRadar as an administrator
    And a form with configurable field permissions exists
    And users with different roles are available

  Scenario: Restrict field visibility by user role
    When I configure a field to be visible only to an authorized role
    And I save the form configuration
    And I log in as a user without view permission
    And I open the form
    Then the restricted field should not be visible

  Scenario: Restrict field editing by user role
    When I configure a field to be editable only by an authorized role
    And I save the form configuration
    And I log in as a user without edit permission
    And I open the form
    Then the field should remain visible
    But the field should not be editable

  Scenario: Verify field permissions persist after saving
    When I configure the field permissions
    And I save the form configuration
    And I reopen the form configuration
    Then the configured permissions should remain unchanged