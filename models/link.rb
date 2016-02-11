require 'data_mapper'

class Link
  include DataMapper::Resource
  
  property :url, String
  property :title, String
  property :id, Serial
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
