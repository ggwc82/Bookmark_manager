
feature 'see a list of links on the homepage' do
  scenario 'displays a list of links' do
    Link.create(title: "Google", url: "http://www.google.co.uk")
    visit('/')
    expect(page).to have_content('Google')
  end
end

feature 'creating links' do
  scenario 'adds a new link with site address and title' do
    visit_and_add_news
    expect(page).to have_content('BBC News')
   end
 end

feature 'adding tags' do
  scenario 'adds a single tag to a link'do
    visit_and_add_news
    link = Link.first
    expect(link.tags.map(&:name)).to include('news') 
  end
end

feature 'view links sorted by tags' do
before(:each) do
  Link.create(url: 'http://twitch.tv', title: 'Twitch', tags: [Tag.first_or_create(name: 'streams')])
  Link.create(url: 'http://www.zombo.com', title: 'Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
end

scenario 'I can filter links by tag' do
  visit '/tags/bubbles'

  expect(page.status_code).to eq(200)
  within 'ul#links' do
    expect(page).not_to have_content('Twitch')
    expect(page).to have_content('Zombocom')
  end
end
end

