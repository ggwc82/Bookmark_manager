require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/' do
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
