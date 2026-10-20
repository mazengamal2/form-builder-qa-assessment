Feature: Form Builder
  As a project administrator
  I want to create and configure forms
  So that users can submit accurate information

  Background:
    Given I am logged in to PlanRadar
    And an existing project is available

  Scenario: Create a form with different field types
    When I create a form named "Maintenance Inspection Form"
    And I add a text field named "Inspection Title"
    And I add a dropdown field named "Inspection Type"
    And I configure the dropdown options:
      | option     |
      | Electrical |
      | Plumbing   |
      | HVAC       |
    And I add a date field named "Inspection Date"
    And I save the form
    Then the form should be created successfully
    And the form should contain the configured fields
    And the dropdown should contain all configured options

  Scenario: Verify field configuration persists after reopening the form
    Given a form named "Maintenance Inspection Form" exists
    When I update the label of the "Inspection Title" field
    And I save the form
    And I reopen the form configuration
    Then the updated field label should be displayed
    And all previously configured fields should remain unchanged
