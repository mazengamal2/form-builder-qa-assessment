# Recommendations

## Product

- Surface a clear validation message per field type when a mandatory field is empty, including dropdowns and dates, not only text inputs.
- Preview permissions as the target role before saving, so administrators can confirm hidden and read-only fields without switching accounts.
- Make default values visible in the form builder itself, including which dropdown option is the default.
- Prevent silent loss of configuration: warn if a user leaves the builder with unsaved field changes.
- Keep field identifiers stable when labels are renamed so existing tickets do not lose mapped values.

## Test automation

- Replace the placeholder `data-testid` locators in `features/pages/` with real PlanRadar selectors.
- Isolate test data: create a unique form per scenario, or reset fixtures between runs.
- Cover additional field types (checkbox, number, user picker) and combinations of mandatory + permission + default on the same field.
- Add negative permission cases for administrators versus restricted roles, including users with view but no edit access.
- Tag scenarios (`@smoke`, `@permissions`, `@validation`) so CI can run a fast subset on every build.
- Store credentials and base URLs in environment variables, not in step files.

## Process

- Trace each Gherkin scenario to a requirement or ticket ID.
- Capture screenshots on failure in the Cucumber `After` hook.
- Review flaky waits and replace implicit waits with explicit waits on key builder and submit states.
