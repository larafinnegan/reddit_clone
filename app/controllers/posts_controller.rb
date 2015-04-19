class PostsController < ApplicationController
	def index
		@posts = Post.all 
	end

	def new
		@post = Post.new
		@subs = Sub.all
	end

	def create
		@subs = Sub.all
		@post = Post.new(post_params)
		if @post.save
			redirect_to root_url
		else
			render 'new'
		end
	end


	private

	def post_params
		params.require(:post).permit(:title, :content, :sub_id)
	end
end
