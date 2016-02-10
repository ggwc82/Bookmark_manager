require 'sinatra/base'
require './models/link.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/' do 
    @last_link = params['URL'] 
    Link.create(url: params['URL'], title: params['Title'])
    erb :index
  end

  get '/links' do
   @links = Link.all 
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
