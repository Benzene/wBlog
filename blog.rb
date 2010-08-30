require 'sinatra'
require 'haml'

require_relative 'lib/config'
require_relative 'lib/db-config'
require_relative 'lib/links'

class Blog < Sinatra::Application 

	get "#{$app_root}/" do
		posts = Post.get_first_10
		haml :blog_layout, :locals => { :posts => posts }
	end

	get "#{$app_root}/n/:id" do
		post = Post.get(params[:id])
		haml :post_layout, :locals => { :post => post, :show_comments => true }
	end
	
	get "#{$app_root}/:title" do
		post = Post.first( :urltext => params[:title])
		haml :post_layout, :locals => { :post => post, :show_comments => true }
	end
end

