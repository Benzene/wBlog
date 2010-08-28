class Post
	include DataMapper::Resource
	
	property :id, Serial
	property :date, DateTime, :required => true
	property :author_id, Integer, :required => true
	property :title, String, :required => true, :unique => true
	property :urltext, String, :required => true, :unique => true
	property :content, Text, :required => true
	property :type, String, :required => true
	
	has n, :comments
	has n, :categorizations
	has n, :tags, :through => :categorizations
	
	# Get author_name from author_id
	def get_author
		# TODO
		author_id
	end

	# Format content *before* inserting it into database (interpreting bbcode, etc)
	def format_content
		content
	end
	
	# Runtime content formatting
	def print_content
		content
	end
	
	# Search functions
	def self.get_first_10
		all(:type => 'post', :order => [:date.desc], :limit => 10)
	end
end

