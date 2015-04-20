class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]

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
		params.require(:post).permit(:title, :content, :sub_id, :user_id)
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end

	def correct_user
		@post = Post.find(params[:id])
		@user = @post.user
		redirect_to root_url unless current_user?(@user)
	end
end
