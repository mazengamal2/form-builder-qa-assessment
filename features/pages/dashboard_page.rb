class DashboardPage < BasePage
    DASHBOARD_MARKER = [
      :css, '[data-testid="dashboard-page"]'
    ].freeze
  
    TICKETS_MENU = [
      :css, '[data-testid="navigation_tickets"] a[data-id="navigation_tickets"]'
    ].freeze
  
    SIDEBAR_TOGGLE = [
      :css, '[data-testid="sidebar-toggle"]'
    ].freeze
  
    def page_loaded?
      visible?(DASHBOARD_MARKER)
    end
  
    def open_sidebar
      click(SIDEBAR_TOGGLE)
    end
  
    def open_tickets
      click(TICKETS_MENU)
    end
  end