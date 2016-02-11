# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

feature "Bookmark Manager:" do
  
  scenario "User can choose to display or add links" do
    visit('/')
    expect(page).to have_selector(:button, count: 2)
  end
  
  scenario "User can add a new link" do
    fill_form
    expect(page).to have_content "Google - www.google.com"
  end


   scenario "User can see a list of stored links" do
    fill_form
    expect(page).to have_content "Google - www.google.com"
  end

  scenario "User can add a tag to stored links" do
    visit('/')
    click_button "Add Link"
    fill_in :Title, with: "Google"
    fill_in :URL, with: "www.google.com"
    fill_in :Tag, with: "Search"
    click_button "Add"
    expect(page).to have_content "Google - www.google.com - Search"
  end
end

