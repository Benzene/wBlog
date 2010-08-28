class Comment
	include DataMapper::Resource
	
	property :id, Serial
	property :date, DateTime, :required => true
	property :author_id, Integer
	property :name, String, :length => (1..50)
	property :content, Text, :required => true, :length => (1..600)
	
	belongs_to :post
	
	# If user is authed, we need his userid, else he has to put a name.
	validates_presence_of :author_id, :if => is_authed?
	validates_presence_of :name, :if => !is_authed?
	
	# Returns the author name, whatever the case
	def get_author
		if author_id != nil then
			#TODO
			author_id.to_s
		elsif name != nil then
			name
		else
			''
		end
	end
	
	# Format content *before* inserting it into database (interpreting bbcode, etc)
	def format_content
		content
	end
	
	# Runtime content formatting
	def print_content
		content
	end
end

