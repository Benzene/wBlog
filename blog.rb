require 'sinatra'
require 'haml'

require_relative 'lib/db-config'

class Blog < Sinatra::Application 

	get '/' do
		posts = Post.get_first_10
		haml :blog_layout, :locals => { :posts => posts }
	end

	get '/:id' do
		post = Post.get(10)
		haml :post_layout, :locals => { :post => post, :show_comments => true }
	end

end

