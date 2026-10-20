Feature: Form Field Default Values
  As a project administrator
  I want to configure default field values
  So that forms are prepopulated with the expected information

  Background:
    Given I am logged in to PlanRadar
    And a form is assigned to an existing project

  Scenario: Populate a field with its configured default value
    Given a field supports default values
    And the field has a configured default value
    When I open a new instance of the form
    Then the field should contain the configured default value

  Scenario: Populate a dropdown with its configured default option
    Given the dropdown field supports default values
    And its default option is configured
    When I open a new instance of the form
    Then the configured dropdown option should be selected

  Scenario: Override a default value before submission
    Given a field has a configured default value
    When I open a new instance of the form
    And I replace the default value with a different valid value
    And I submit the form
    Then the form should be saved successfully
    And the saved field should contain the updated value