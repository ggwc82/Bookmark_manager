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
    fill_form
    expect(page).to have_content "Google - www.google.com - Search"
  end

  scenario "User can filter links by tags" do
   fill_form
   fill_form_bubbles
   visit('/tags/Bubbles')
   expect(page).not_to have_content "Search"
   expect(page).to have_content "Bubbles"
  end

  scenario "User can add multiple tags to links" do
    fill_form
    click_button("Google")
    fill_in 'tag', with: 'bananas'
    click_button 'Submit'
    expect(page).to have_content "Google - www.google.com - Search, bananas"
  end
end

