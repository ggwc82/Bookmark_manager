ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/data_mapper_setup'
# require 'data_mapper'
# require 'dm-postgres-adapter'

class Bookmark < Sinatra::Base
  get '/' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_link)
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(tag: params[:tag])
    link.tags << tag
    link.save
    redirect '/'
  end

  #get '/tags' do
    #erb(:tags)
  #end

 #post '/tags'do


    #Link.get()
 #end

 #start the server if ruby file executed directly
  run! if app_file == $0
end
