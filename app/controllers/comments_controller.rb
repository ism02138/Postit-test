class CommentsController < ApplicationController
  before_action :set_post
  before_action :require_user, only: [:create]

	def create
		@comment = @post.comments.build(post_params)
 		if @comment.save
      current_user.comments << @comment
 			redirect_to post_path(params[:post_id]), notice: "Comment created"
 		else
 			render 'posts/show'
 		end
	end

	private

  def set_post
    @post = Post.find(params[:post_id])
  end

 	def post_params
 		params.require(:comment).permit!
 	end

end