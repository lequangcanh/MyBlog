class HomeController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @entries = @user.feed.paginate(page: params[:page])
    else
      @entries = Entry.paginate(page: params[:page])
    end
  end

end
