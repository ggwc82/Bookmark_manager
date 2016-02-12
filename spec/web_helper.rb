def fill_form
  visit('/') 
  click_button("Add Link")
    fill_in("Title", :with => "Google")
    fill_in("URL", :with => "www.google.com")
    fill_in :Tag, with: "Search"
    click_button("Add")  
end

def fill_form_bubbles
  visit('/') 
  click_button("Add Link")
    fill_in("Title", :with => "Bubbles")
    fill_in("URL", :with => "www.buuble.com")
    fill_in :Tag, with: "Bubbles"
    click_button("Add")  
end
