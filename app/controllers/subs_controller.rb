class SubsController < ApplicationController

	def index
		@subs = Sub.all 
	end

	def show
		@sub = Sub.find(params[:id])
	end

	def new
		@sub = Sub.new 
	end

	def create
		@sub = Sub.new(params.require(:sub).permit(:name))
		if @sub.save
			redirect_to root_url
		else
			render 'new'
		end
	end
end
