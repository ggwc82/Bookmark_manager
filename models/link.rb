require 'data_mapper'
require_relative 'tag'

class Link
  include DataMapper::Resource
  
  property :url, String
  property :title, String
  property :id, Serial
  has n, :tags, through: Resource
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
