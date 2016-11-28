class EntriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_or_author, only: :destroy

  def index
    @entries = Entry.paginate(page: params[:page])
  end

  def show
    @entry = Entry.find(params[:id])
    @comment = @entry.comments.build
    @comments = @entry.comments.paginate(page: params[:page])
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if (@entry.save)
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    Entry.find_by(id: params[:id]).destroy
    redirect_to request.referrer || root_url
  end

  private
  def entry_params
    params.require(:entry).permit(:user_id, :title, :content)
  end

  def author?
    @entry = Entry.find_by(id: params[:id])
    @entry.user == current_user
  end

  def admin_user?
    current_user.admin?
  end

  def admin_or_author
    redirect_to root_url unless admin_user? || author?
  end
end
