# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

require "spec_helper"

feature "display a list of links" do

  scenario "when one visits the homepage" do
    visit("/")
    fill_in("Title", :with => "Google")
    fill_in("URL", :with => "www.google.com")
    click_button("Add Link")
    expect(page).to have_content "Link added to www.google.com"
  end

end

