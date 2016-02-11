ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './models/link.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/links' do
    Link.create(url: params['URL'], title: params['Title'])  
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
