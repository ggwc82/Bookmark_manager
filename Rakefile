require 'data_mapper'
require './app'

namespace :db do
  desc 'DataMapper functions' 
  task :upgrade do 
    DataMapper.auto_upgrade!
  end

  task :migrate do
    DataMapper.auto_migrate!
  end
end
