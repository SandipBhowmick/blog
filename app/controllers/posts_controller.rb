class PostsController < ApplicationController
 
before_action :confirm_logged_in, :only => [:new,:create,:edit,:update,:destroy]	

 layout 'admin'
 
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
	  		render 'new'
	    end    
  	end

  	def edit
  		@post = Post.find(params[:id])
  	end

  	def update
  		@post = Post.find(params[:id])
  		if @post.update_attributes(post_params)
	  		flash[:notice]= "Post updated successfully"
	  		redirect_to(post_path)	
	  	else
	  		render(edit_post_path(:id))
	  	end
	end

	def destroy
	  	post = Post.find(params[:id]).destroy
	  	flash[:notice]=" Post destroy successfully"	  	 
	    redirect_to(post)
  	end


	private
	  def post_params
	     	params.require(:post).permit(:title, :body)
	  end
end
