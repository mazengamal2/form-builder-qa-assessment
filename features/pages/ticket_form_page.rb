
class TicketFormPage < BasePage
    FORM_HEADER = [
      :xpath, "//p[normalize-space()='Create new ticket']"
    ].freeze
  
    TITLE_FIELD = [
      :css, '[data-testid="ticket-form-field-subject"]'
    ].freeze
  
    SAVE_BUTTON = [
      :xpath, "//button[normalize-space(.)='Save']"
    ].freeze

    TITLE_ERROR = [
  :xpath,
  "//div[contains(@class,'ui-input-container')]" \
  "[.//input[@data-testid='ticket-form-field-subject']]" \
  "//div[contains(@class,'invalid-hint')]//p"
].freeze

LOCATION_DROPDOWN = [
  :css,
  '[data-testid="component-selector-input-group"][data-id="tickets_details_location_selector"]'
].freeze

LOCATION_OPTIONS = [
  :css,
  '[data-testid^="plan-tree-selector-node-"][data-id="tickets_details_location_row"]'
].freeze

TICKET_DETAILS_MODAL = [
  :css,
  '[data-testid="ticket-details-fullscreen-dropzone"]'
].freeze

  
    def open?
      visible?(FORM_HEADER)
    end
  
    def clear_title
      type(TITLE_FIELD, '')
    end
  
    def save
      click(SAVE_BUTTON)
    end
  
    def title_value
      value_of(TITLE_FIELD)
    end

    def title_invalid?
        find(TITLE_FIELD).attribute('class').include?('ui-input-invalid')
      end
      
      def validation_message
        text_of(TITLE_ERROR)
      end

      def fill_title(value)
        fill(TITLE_FIELD, value)
      end
      
      def submitted_successfully?
        !open?
      end

      def select_first_location
        click(LOCATION_DROPDOWN)
      
        @wait.until do
          find_all(LOCATION_OPTIONS).any?(&:displayed?)
        end
      
        first_option = find_all(LOCATION_OPTIONS).find(&:displayed?)
        first_option.click
      end

      def submitted_successfully?
        @wait.until do
          @driver.find_elements(*TICKET_DETAILS_MODAL).any?(&:displayed?)
        end
      end

      def leave_location_empty
        location = find(LOCATION_DROPDOWN)
      
        raise 'Location dropdown is not empty' unless location.text.strip == 'Select...'
      end

  end
  