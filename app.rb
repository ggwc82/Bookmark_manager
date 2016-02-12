ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post '/links' do
    link = Link.new(url: params['URL'], title: params['Title'])
    tag = Tag.create(tag: params['Tag'])
    link.tags << tag
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

  get '/tags/:tag' do
    @prelinks = Link.all
    @links = []
    @prelinks.each do |link|
      if link.tags.map(&:tag).include?(params[:tag])
        @links << link
      end
    end
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
