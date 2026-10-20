Feature: Mandatory Form Fields
  As a project administrator
  I want to enforce mandatory fields
  So that users cannot submit incomplete forms

  Background:
  Given I open the login page
    And I enter email "mazen.gamal625@gmail.com"
    And I click on the login continue button
    And I enter password from the environment
    And I click on the login button
    Then the dashboard should be displayed
       When I dismiss the timezone mismatch modal
       When I expand the sidebar
    And I click on "Tickets" from the side menu
    And I click on "Create Ticket"
    



  Scenario: Prevent submission when a mandatory text field is empty
    Then I open a new form
    When I leave the mandatory "Title" field empty
    And I Save the form
    Then the form should not be submitted
    And a validation message should indicate that the field is required


  Scenario: Submit the form when all mandatory fields are completed
    Then I open a new form
    When I select the first Location option
    When I fill the mandatory "Title" field 
    And I Save the form
    Then the form should be submitted successfully


  Scenario: Prevent submission when a mandatory dropdown is not selected
    Then I open a new form
     When I leave Location option empty
    When I fill the mandatory "Title" field 
    And I Save the form
    And a validation message should indicate that the dropdown is required
