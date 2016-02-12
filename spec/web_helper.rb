
def visit_and_add_news
  visit('/')
  click_link('Add Bookmark')
  fill_in 'title', with: 'BBC News'
  fill_in 'url', with: 'http://news.bbc.co.uk'
  fill_in 'tags', with: 'news'
  click_button 'Create link'
end

def visit_and_add_bubbles
  visit('/')
  click_link('Add Bookmark')
  fill_in 'title', with: 'Soap'
  fill_in 'url', with: 'soap.com'
  fill_in 'tags', with: 'bubbles'
  click_button 'Create link'
end
