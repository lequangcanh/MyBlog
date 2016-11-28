class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :user_can_comment, only: :create
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to entry_path(@comment.entry)
    else
      redirect_to entry_path(@comment.entry)
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to request.referrer || root_url
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :entry_id, :content)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end

  def user_can_comment
    @entry = Entry.find_by(id: params[:comment][:entry_id]) 
    redirect_to root_url unless current_user?(@entry.user) || current_user.following?(@entry.user)
  end
end
