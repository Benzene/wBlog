require 'dm-core'
require 'dm-validations'

require_relative 'commons'

DataMapper.setup( :default, "sqlite3://#{Dir.pwd}/blog.db" )

require_relative '../models/post'
require_relative '../models/comment'
require_relative '../models/categorization'
require_relative '../models/tag'

DataMapper.finalize

DataMapper::Model.raise_on_save_failure = true

