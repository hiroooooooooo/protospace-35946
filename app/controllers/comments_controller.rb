class CommentsController < ApplicationController

  def create
    comment = Comment.create(strong_params)
    if comment.valid?
      comment.save
      redirect_to "/prototypes/#{comment.prototype.id}"
    else
      # render "#{comment.prototype.show}"
      render "/prototypes/#{comment.prototype.id}"
    end
  end

  private

  def strong_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
