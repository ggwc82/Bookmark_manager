
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
