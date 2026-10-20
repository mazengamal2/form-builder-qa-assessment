
class TicketsPage < BasePage
  CREATE_TICKET_BUTTON = [
    :css, '[data-testid="create-action-btn"]'
  ].freeze

  TICKETS_PAGE_MARKER = [
    :css, '[data-testid="tickets-list-container"]'
  ].freeze

  def page_loaded?
    visible?(TICKETS_PAGE_MARKER)
  end

  def click_create_ticket
    click(CREATE_TICKET_BUTTON)
  end
end
