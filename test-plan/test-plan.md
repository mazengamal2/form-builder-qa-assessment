# Form Builder Test Plan

## Objective

Validate that project administrators can create, configure, and reuse forms in PlanRadar, and that field configuration (types, defaults, mandatory rules, and permissions) behaves correctly for end users.

## Scope

In scope:

- Creating a form with text, dropdown, and date fields
- Persisting field configuration after save and reopen
- Restricting field visibility and editability by role
- Applying default values on new form instances
- Enforcing mandatory fields on submit

## Test approach

Automated acceptance tests are written in Cucumber with a Page Object layer. Step definitions stay thin and delegate UI work to page classes under `features/pages/`.

| Page | Responsibility |
| --- | --- |
| `LoginPage` | Admin and restricted-user authentication |
| `ProjectPage` | Opening an existing project and forms area |
| `FormBuilderPage` | Creating forms, fields, defaults, permissions, and save/reopen |
| `FormInstancePage` | Filling, submitting, and asserting a form instance |

Scenarios are grouped by risk area:

| Feature | Focus |
| --- | --- |
| `form_builder.feature` | Form creation and configuration persistence |
| `field_permissions.feature` | Role-based view and edit restrictions |
| `default_values.feature` | Prepopulated values and user overrides |
| `mandatory_fields.feature` | Required-field validation on submit |

Manual exploratory testing should still cover UI layout, copy, localization, and edge cases not encoded in Gherkin.


