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

  def vote
    @comment = Comment.find(params[:id])
    if (Vote.find_by user_id: current_user.id, voteable: @comment) == nil
      Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    end
    respond_to do |format|
      format.html do 
        redirect_to :back, notice: "Your vote was counted"
      end
      format.js
    end
  end

	private

  def set_post
    @post = Post.find_by slug: params[:post_id]
  end

 	def post_params
 		params.require(:comment).permit!
 	end

end