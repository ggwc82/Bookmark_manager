class Link
  include DataMapper::Resource
  
  property :url, String
  property :title, String
  property :id, Serial
  has n, :tags, through: Resource
end

