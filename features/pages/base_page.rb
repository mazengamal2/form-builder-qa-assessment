
class BasePage
  def initialize(driver, wait = nil)
    @driver = driver
    @wait = wait || Selenium::WebDriver::Wait.new(timeout: 15)
  end

  def visit(path)
    @driver.navigate.to("#{base_url}#{path}")
  end

  def find(locator)
    @wait.until do
      @driver.find_element(*locator)
    end
  end

  def find_all(locator)
    @driver.find_elements(*locator)
  end

  def click(locator)
    find(locator).click
  end

  def type(locator, text)
    element = find(locator)
    element.clear
    element.send_keys(text)
  end

  alias fill type

  def visible?(locator)
    find(locator).displayed?
  rescue Selenium::WebDriver::Error::NoSuchElementError,
         Selenium::WebDriver::Error::TimeoutError
    false
  end

  def enabled?(locator)
    find(locator).enabled?
  end

  def text_of(locator)
    find(locator).text
  end

  def value_of(locator)
    find(locator).attribute('value')
  end

  def selected_option(locator)
    Selenium::WebDriver::Support::Select
      .new(find(locator))
      .first_selected_option.text
  end

  private

  def base_url
    ENV.fetch('PLANRADAR_BASE_URL', 'https://www.planradar.com')
  end
end
