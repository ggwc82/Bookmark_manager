# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

require "spec_helper"

feature "display a list of links" do
  
  before do
    visit("/")
    fill_in("Title", :with => "Google")
    fill_in("URL", :with => "www.google.com")
    click_button("Add Link")
  end

  after do 
    Link.last.destroy  
  end

  scenario "when one visits the homepage" do

    expect(page).to have_content "Link added to www.google.com"
  end

  scenario "when one clicks on display links" do

    click_button('Display Links')
      Link.all
     expect(page).to have_content "Google - www.google.com"
  end

end

