class Tag
  include DataMapper::Resource

  property :tag, String
  property :id, Serial
  has n, :links, through: Resource
end
