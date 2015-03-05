class CommentsController < ApplicationController
  def index
  	@comments = Post.find(params[:post_id]).comments
  end

  def new
  	@post = Post.find(params[:post_id])
  	@comment = Comment.new
  end

  def create
  	@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
  	@comment = current_user.comments.build(comment_params)
    @comment.post = @post
    #authorize @comment
  	if @comment.save
  		flash[:notice] = "Your comment was saved."
  		redirect_to [@topic, @post]
  	else
  		flash[:error] = "There was an error saving that comment. Please try again."
  		redirect_to [@topic, @post]
  	end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
