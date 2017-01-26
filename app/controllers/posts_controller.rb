class PostsController < ApplicationController

	def index
		@posts=Post.order("created_at DESC").all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new()
	end

	def create
		@post = Post.new(post_params)		
     if @post.save 
  		flash[:notice]= "Transaction details saved successfully"
  		redirect_to(@post)
  	else
        render(new_post_path)
  	end


	end

	private
	  def post_params
	     	params.require(:post).permit(:post_title, :post_body)
	  end
end
