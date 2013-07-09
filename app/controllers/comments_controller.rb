class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(post_params)
 		if @comment.save
 			redirect_to posts_path, notice: "Successfully created"
 		else
 			render :new
 		end
	end

	private

 	def post_params
 		params.require(:comment).permit!
 	end
end