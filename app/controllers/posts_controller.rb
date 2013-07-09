class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update]

  def index
  	@posts = Post.all
  end

  def show
  	@comment = Comment.new
 	end

 	def new
 		@post = Post.new 
 	end

 	def create
 		@post = Post.new(post_params)
 		if @post.save
 			redirect_to root_path, notice: "Successfully created"
 		else
 			render :new
 		end
 	end

 	def edit
 		
 	end

 	def update
 		if @post.update(post_params)
 			redirect_to root_path, notice: "Successfully updated"
 		else
 			render :edit
 		end
 	end

 	private

  def set_post
    @post = Post.find(params[:id])
  end

 	def post_params
 		params.require(:post).permit!
 	end
end
