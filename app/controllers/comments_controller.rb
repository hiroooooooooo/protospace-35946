class CommentsController < ApplicationController

  def create
    comment = Comment.create(strong_params)
    if comment.valid?
      comment.save
      redirect_to "/prototypes/#{comment.prototype.id}"
    else  

      @prototype = Prototype.find(params[:prototype_id])
      @comment = Comment.new
      @comment_list = @prototype.comments

      render "prototypes/show"
    end
  end

  private

  def strong_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
