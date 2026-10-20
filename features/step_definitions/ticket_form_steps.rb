
Then('I open a new form') do
    expect(@ticket_form_page.open?).to be(true)
  end
  
  When('I leave the mandatory {string} field empty') do |field_name|
    case field_name
    when 'Title'
      @ticket_form_page.clear_title
      expect(@ticket_form_page.title_value).to eq('')
    else
      raise "Unsupported field: #{field_name}"
    end
  end
  
  When('I Save the form') do
    @ticket_form_page.save
  end
  
  Then('the form should not be submitted') do
    expect(@ticket_form_page.open?).to be(true)
  end
  
 
Then('a validation message should indicate that the field is required') do
    expect(@ticket_form_page.title_invalid?).to be(true)
  
    expect(@ticket_form_page.validation_message)
      .to eq('You have not filled in all the required fields.')
  end
  
  
  When('I fill the mandatory {string} field') do |field_name|
    case field_name
    when 'Title'
      @ticket_form_page.fill_title('Automation Test Ticket')
    else
      raise "Unsupported field: #{field_name}"
    end
  end
  
  Then('the form should be submitted successfully') do
    expect(@ticket_form_page.submitted_successfully?).to be(true)
  end

  When('I select the first Location option') do
    @ticket_form_page.select_first_location
  end

  When('I leave Location option empty') do
    @ticket_form_page.leave_location_empty
  end

  Then('a validation message should indicate that the dropdown is required') do
    expect(@ticket_form_page.open?).to be(true)
  end