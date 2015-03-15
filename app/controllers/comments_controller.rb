class CommentsController < ApplicationController
  def index
  	@comments = Post.find(params[:post_id]).comments
  end

  def new
  	@post = Post.find(params[:post_id])
  	@comment = Comment.new
  	authorize @comment
  end

  def create
  	@topic = Post.find(params[:post_id]).topic
    @post = Post.find(params[:post_id])
  	@comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment
  	if @comment.save
  		flash[:notice] = "Your comment was saved."
      redirect_to [@topic, @post]
  	else
  		flash[:error] = "There was an error saving that comment. Please try again."
      redirect_to [@topic, @post]
  	end
  end

  def destroy
    @topic = Post.find(params[:post_id]).topic
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment could not be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
