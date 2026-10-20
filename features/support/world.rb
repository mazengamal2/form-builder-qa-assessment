module Pages
  def login_page
    @login_page ||= LoginPage.new(@driver)
  end

  def project_page
    @project_page ||= ProjectPage.new(@driver)
  end

  def form_builder_page
    @form_builder_page ||= FormBuilderPage.new(@driver)
  end

  def form_instance_page
    @form_instance_page ||= FormInstancePage.new(@driver)
  end

  def reset_pages
    @login_page = nil
    @project_page = nil
    @form_builder_page = nil
    @form_instance_page = nil
  end
end

World(Pages)
