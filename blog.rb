require 'sinatra'
require 'haml'

require_relative 'lib/config'
require_relative 'lib/db-config'
require_relative 'lib/links'

set :root, File.dirname(__FILE__)

class Blog < Sinatra::Application 

	get "/" do
		posts = Post.get_first_10
		haml :blog_layout, :locals => { :posts => posts }
	end

	get "/n/:id" do
		post = Post.get(params[:id])
		haml :post_layout, :locals => { :post => post, :show_comments => true }
	end
	
	get "/:title" do
		post = Post.first( :urltext => params[:title])
		haml :post_layout, :locals => { :post => post, :show_comments => true }
	end
end

