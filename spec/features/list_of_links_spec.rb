# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

require "spec_helper"

feature "Bookmark Manager:" do
  
  before do
    visit("/")
    
  end

  after(:all) do 
    Link.last.destroy  
  end
  
  scenario "User can choose to display or add links" do
    expect(page).to have_selector(:button, count: 2)
  end
  
  scenario "User can add a new link" do
    click_button("Add Link")
    fill_in("Title", :with => "Google")
    fill_in("URL", :with => "www.google.com")
    click_button("Add")  
    expect(page).to have_content "Google - www.google.com"
  end


   scenario "User can see a list of stored links" do
    
    click_button('Display Links')  
    expect(page).to have_content "Google - www.google.com"
  end


end

