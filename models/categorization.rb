class Categorization
	include DataMapper::Resource
	
	property :id, Serial
	property :author_id, Integer, :required => true
	property :date, DateTime, :required => true
	
	belongs_to :post, :key => true
	belongs_to :tag, :key => true
	
end

