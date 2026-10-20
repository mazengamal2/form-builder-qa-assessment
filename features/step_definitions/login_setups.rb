
Given('I open the login page') do
    @login_page.open
  end
  
  Given('I enter email {string}') do |email|
    @login_page.enter_email(email)
  end
  
  Given('I click on the login continue button') do
    @login_page.click_continue
  end
  
  Given('I enter password from the environment') do
    @login_page.enter_password
  end
  
  Given('I click on the login button') do
    @login_page.click_login
  end

  

  When('I dismiss the timezone mismatch modal') do
    backdrop = '.ui-modal-v2-backdrop'
    modal = '[data-testid="confirm-modal"]'
    cancel_button = '[data-id="Timezone_mismatch_modal_cancel"]'
    close_button = '[data-id="Timezone_mismatch_modal_close"]'
  
    modal_visible = @driver.find_elements(:css, modal).any? do |element|
      element.displayed?
    rescue Selenium::WebDriver::Error::StaleElementReferenceError
      false
    end
  
    if modal_visible
      button = @driver.find_elements(:css, cancel_button)
                       .find { |element| element.displayed? }
  
      button ||= @driver.find_elements(:css, close_button)
                        .find { |element| element.displayed? }
  
      raise 'Timezone modal is visible, but no close button was found' unless button
  
      button.click
  
      @wait.until do
        @driver.find_elements(:css, backdrop).none? do |element|
          begin
            element.displayed?
          rescue Selenium::WebDriver::Error::StaleElementReferenceError
            false
          end
        end
      end
    end
  
    puts 'Timezone modal dismissal check completed.'
  end
  
  
  
  
  Then('the dashboard should be displayed') do
    expect(@dashboard_page.page_loaded?).to be(true)
  end
  
  
  
  

  When('I expand the sidebar') do
    backdrop = '.ui-modal-v2-backdrop'
  
    visible_backdrops = @driver.find_elements(:css, backdrop)
                               .select(&:displayed?)
  
    puts "DEBUG: Visible backdrops before sidebar click: #{visible_backdrops.size}"
  
    visible_backdrops.each do |element|
      puts "DEBUG: Backdrop class: #{element.attribute('class')}"
    end
  
    dialogs = @driver.find_elements(:css, '[role="dialog"]')
                     .select(&:displayed?)
  
    dialogs.each do |dialog|
      puts "DEBUG: Dialog text: #{dialog.text}"
    end
  
    @dashboard_page.open_sidebar
  end
  
  
  
  When('I click on {string} from the side menu') do |menu_item|
    case menu_item
    when 'Tickets'
      @dashboard_page.open_tickets
    else
      raise "Unsupported side menu item: #{menu_item}"
    end
  end
  

  
When('I click on {string}') do |element|
    case element
    when 'Create Ticket'
      @wait.until do
        @driver.find_elements(
          :css, '[data-testid="create-action-btn"]'
        ).any?(&:displayed?)
      end
  
      @tickets_page.click_create_ticket
    else
      raise "Unsupported element: #{element}"
    end
  end
  
  
  