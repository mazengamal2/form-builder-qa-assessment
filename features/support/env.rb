
require 'selenium-webdriver'
require 'rspec/expectations'

require_relative '../pages/base_page'
require_relative '../pages/login_page'
require_relative '../pages/dashboard_page'
require_relative '../pages/tickets_page'
require_relative '../pages/ticket_form_page'

World(RSpec::Matchers)

Before do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--start-maximized')

  @driver = Selenium::WebDriver.for(:chrome, options: options)
  @wait = Selenium::WebDriver::Wait.new(timeout: 15)

  @login_page = LoginPage.new(@driver, @wait)
  @dashboard_page = DashboardPage.new(@driver, @wait)
  @tickets_page = TicketsPage.new(@driver, @wait)
  @ticket_form_page = TicketFormPage.new(@driver, @wait)
end

After do
  @driver&.quit
end
