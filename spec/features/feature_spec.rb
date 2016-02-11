
describe 'see a list of links on the homepage' do
  it 'displays a list of links' do
    Link.create(title: "Google", url: "http://www.google.co.uk")
    visit('/')
    expect(page).to have_content('Google')
  end
end

describe 'creating links' do
  it 'adds a new link with site address and title' do
    visit_and_add
    expect(page).to have_content('BBC News')
   end
 end
describe 'adding tags' do
  it 'adds a single tag to a link'do
  visit_and_add_tag
  expect(page).to have_content('Tags: news')
  end
end

describe 'visits /tags/bubbles' do
  it 'checks that only Links tagged with bubbles are present' do
    visit_and_add_tag_bubbles
    visit_and_add_tag
    click_link('Tags with bubbles') 
    expect(page).to have_content('soap.com')
    expect(page).to_not have_content('bbc.news.co.uk')
  end
end

