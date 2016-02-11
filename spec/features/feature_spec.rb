
describe 'see a list of links on the homepage' do
  it 'displays a list of links' do
    Link.create(title: "Google", url: "http://www.google.co.uk")
    visit('/')
    expect(page).to have_content('Google')
  end
end

describe 'creating links' do
  it 'adds a new link with site address and title' do
    visit('/')
    click_link('Add Bookmark')
    fill_in 'title', with: 'BBC News'
    fill_in 'url', with: 'http://news.bbc.co.uk'
    click_button 'Submit'
    expect(page).to have_content('BBC News')
   end
 end
