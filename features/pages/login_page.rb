
class LoginPage < BasePage
  URL = 'https://www.planradar.com/login/'

  EMAIL_FIELD = [
    :css, '[data-testid="Login_Input_Email"]'
  ].freeze

  CONTINUE_BUTTON = [
    :css, '[data-id="Login_Button_Continue"]'
  ].freeze

  PASSWORD_FIELD = [
    :css, '[data-testid="Login_Input_Password"]'
  ].freeze

  LOGIN_BUTTON = [
    :css, '[data-id="Login_Button_Login"]'
  ].freeze

  def open
    @driver.navigate.to(URL)
  end

  def enter_email(email)
    fill(EMAIL_FIELD, email)
  end

  def click_continue
    click(CONTINUE_BUTTON)
  end

  def enter_password
    fill(PASSWORD_FIELD, ENV.fetch('PLANRADAR_PASSWORD'))
  end

  def click_login
    click(LOGIN_BUTTON)
  end
end
