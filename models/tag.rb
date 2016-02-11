require 'data_mapper'

class Tag
  include DataMapper::Resource

  property :tag, String
  property :id, Serial
end
