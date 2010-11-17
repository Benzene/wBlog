#encoding: UTF-8

require 'sinatra'
require 'haml'

require_relative 'lib/config'
require_relative 'lib/db-config'
require_relative 'lib/links'

class Blog < Sinatra::Application 

	set :root, File.dirname(__FILE__)

        before do
                if @env['rack.session']['groups'] && ( @env['rack.session']['groups']['Admins'] || @env['rack.session']['groups']['BlogAdmins'] ) then
			@isadmin = true
		else
			@isadmin = false
                end
        end


	get "/" do
		posts = Post.get_first_10
		haml :blog_layout, :locals => { :posts => posts }
	end

	get "/add" do
		if !@isadmin then
			redirect '/blog/'
		else
			@edit = false
			haml :addpost_layout, :locals => { :post => nil, :edit => false }
		end
	
	end

	post "/add" do
		if @isadmin then
			params['title'].force_encoding("UTF-8")
			params['content'].force_encoding("UTF-8")
			Post.newpost(@env['rack.session']['uid'],params['title'],params['content'])	
		end
		redirect '/blog/'
	end

	get "/del/:id" do
		if @isadmin then
			Post.get(params[:id]).destroy
		end
		redirect '/blog/'
	end

	get "/edit/:id" do
		if !@isadmin then
			redirect '/blog/'
		else
			@post = Post.get(params[:id])
			@edit = true
			haml :addpost_layout, :locals => { :post => @post, :edit => true }
		end
	end

	post "/edit/:id" do
		if @isadmin then
			post = Post.get(params[:id])
			post.title=params['title']
			post.content=params['content']
			post.save
		end
		redirect '/blog/'
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

