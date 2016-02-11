def fill_form
  visit('/') 
  click_button("Add Link")
    fill_in("Title", :with => "Google")
    fill_in("URL", :with => "www.google.com")
    click_button("Add")  
end
