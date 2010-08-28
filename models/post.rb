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

	# Runtime content formatting
	def print_content
		content
	end
	
	# Search functions
	def self.get_first_10
		all(:type => 'post', :order => [:date.desc], :limit => 10)
	end
	
	def self.newpost(uid, title, content)
		p = Post.new( :date => Time.now, 
			:author_id => uid, 
			:title => title, 
			:urltext => title.downcase.gsub(/[^[:alnum:]]/,'*'),
			:content => format_content(content),
			:type => 'post')
		begin
			p.save
		rescue
			puts "Save failed. Illegal blog contents"
		end
	end
end

