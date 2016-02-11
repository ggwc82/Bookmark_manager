ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './models/link.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/links' do
    link = Link.new(url: params['URL'], title: params['Title'])
    tag = Tag.create(tag: params['Tag'])
    link.tags << tag
    p link.tags
    link.save
    redirect '/links'
  end
  
  get '/links/new' do 
    erb :new
  end

  get '/links' do
   @links = Link.all 
   erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
